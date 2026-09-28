const fs = require('fs');
const path = require('path');

const root = __dirname;

function file(page) {
  return path.join(root, `f105_page_${page}.sql`);
}

function read(page) {
  return fs.readFileSync(file(page), 'utf8');
}

function write(page, text) {
  fs.writeFileSync(file(page), text, 'utf8');
}

function sqlLines(text, indent = '') {
  return text.split(/\r?\n/).map(line => `${indent}'${line.replace(/'/g, "''")}',`).join('\n') + '\n';
}

function sqlLinesNoTrailing(text, indent = '') {
  const lines = text.split(/\r?\n/);
  return lines.map((line, index) => `${indent}'${line.replace(/'/g, "''")}'${index + 1 < lines.length ? ',' : ''}`).join('\n') + '\n';
}

function injectPageJs(text, js) {
  if (text.includes('HSPL_CROSSFORM_DETAIL_INTEGRITY_V1')) return text;
  const start = text.indexOf(',p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(');
  if (start < 0) throw new Error('Page JavaScript property not found');
  const close = text.indexOf("''))\n,p_css_file_urls", start);
  if (close < 0) throw new Error('Page JavaScript closing marker not found');
  return text.slice(0, close) + sqlLines(js) + text.slice(close);
}

function eventSection(text, name, occurrence = 0) {
  const marker = 'wwv_flow_imp_page.create_page_da_event(';
  let from = 0;
  let matchNo = 0;
  while (true) {
    const start = text.indexOf(marker, from);
    if (start < 0) break;
    const next = text.indexOf(marker, start + marker.length);
    const end = next < 0 ? text.length : next;
    const block = text.slice(start, end);
    const eventDefinitionEnd = block.indexOf('\n);');
    const eventDefinition = eventDefinitionEnd < 0 ? block : block.slice(0, eventDefinitionEnd);
    if (eventDefinition.includes(`,p_name=>'${name}'`)) {
      if (matchNo === occurrence) return { start, end };
      matchNo++;
    }
    from = end;
  }
  throw new Error(`Dynamic Action event ${name} not found`);
}

function editEvent(text, name, fn, occurrence = 0) {
  const { start, end } = eventSection(text, name, occurrence);
  return text.slice(0, start) + fn(text.slice(start, end)) + text.slice(end);
}

function eventToChange(text, name, occurrence = 0) {
  return editEvent(text, name, section => {
    if (!section.includes(",p_bind_event_type=>'focusout'")) return section;
    return section.replace(",p_bind_event_type=>'focusout'", ",p_bind_event_type=>'change'");
  }, occurrence);
}

function disableEvent(text, name, occurrence = 0) {
  return editEvent(text, name, section => {
    const eventEnd = section.indexOf('\n);');
    let head = section.slice(0, eventEnd);
    if (head.includes(',p_display_when_type=>')) {
      head = head.replace(/,p_display_when_type=>'[^']*'/, ",p_display_when_type=>'NEVER'");
    } else {
      head += "\n,p_display_when_type=>'NEVER'";
    }
    return head + section.slice(eventEnd);
  }, occurrence);
}

function makeImmediate(section) {
  return section
    .replace(/\s*'setTimeout\(function\(\)\{',\r?\n/g, "    '(function(){',\n")
    .replace(/\s*'\},400',\r?\n\s*'\);',\r?\n/g, "    '}());',\n");
}

function removeCellCommits(section) {
  return section.replace(/^\s*'\s*commit;',\r?\n/gm, '');
}

function addProcess(text, block) {
  const marker = '\nend;\n/\nprompt --application/end_environment';
  const at = text.lastIndexOf(marker);
  if (at < 0) throw new Error('Application end marker not found');
  return text.slice(0, at) + '\n' + block.trim() + '\n' + text.slice(at);
}

const heldTabJs = (page, detailSelector, extra = '') => `
/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */
(function(){
  "use strict";
  if(Number(apex.env.APP_PAGE_ID||0)!==${page}||window.hsplCrossformDetailIntegrityV1)return;
  window.hsplCrossformDetailIntegrityV1=true;
  var heldFromDetail=false;
  function inDetail(target){return !!(target&&target.closest&&target.closest("${detailSelector}"));}
  document.addEventListener("keydown",function(event){
    if(event.key!=="Tab")return;
    if(!event.repeat){heldFromDetail=inDetail(event.target);return;}
    if(heldFromDetail){event.preventDefault();event.stopImmediatePropagation();}
  },true);
  document.addEventListener("keyup",function(event){if(event.key==="Tab")heldFromDetail=false;},true);
  window.addEventListener("blur",function(){heldFromDetail=false;});
  ${extra}
})();
`;

const poFdJs = `
  window.hsplP118OpenFd=function(anchor){
    try{
      var region=apex.region("Detail"),model=region.widget().interactiveGrid("getViews","grid").model;
      var row=anchor&&anchor.closest&&anchor.closest("tr"),id=row&&row.getAttribute("data-id");
      var record=id&&model.getRecord(id);
      if(!record)throw new Error("Clicked purchase order row could not be identified.");
      function raw(v){return v&&typeof v==="object"&&"v" in v?v.v:v;}
      var sno=raw(model.getValue(record,"SNO")),amount=raw(model.getValue(record,"AMOUNT"));
      if(sno===null||sno===undefined||String(sno).trim()==="")throw new Error("Clicked row SNO is blank.");
      apex.item("P118_SNO").setValue(sno,null,true);
      apex.item("P118_DFAMOUNT").setValue(amount||0,null,true);
      openModal("FooterDetail");
      window.setTimeout(function(){apex.region("footerdetail").refresh();},0);
    }catch(error){
      apex.message.clearErrors();
      apex.message.showErrors([{type:"error",location:"page",message:error.message||"FD could not open for the clicked row.",unsafe:false}]);
    }
  };
`;

const pbFdJs = (page, prefix, region, gotoName) => `
  window.hsplP${page}OpenFd=function(anchor){
    try{
      var model=apex.region("${region}").widget().interactiveGrid("getViews","grid").model;
      var row=anchor&&anchor.closest&&anchor.closest("tr"),id=row&&row.getAttribute("data-id"),record=id&&model.getRecord(id);
      if(!record)throw new Error("Clicked detail row could not be identified.");
      function raw(v){return v&&typeof v==="object"&&"v" in v?v.v:v;}
      var sno=raw(model.getValue(record,"SNO")),amount=raw(model.getValue(record,"AMOUNT"));
      if(sno===null||sno===undefined||String(sno).trim()==="")throw new Error("Clicked row SNO is blank.");
      apex.item("${prefix}_SNO").setValue(sno,null,true);
      apex.item("${prefix}_DFAMOUNT").setValue(amount||0,null,true);
      ${gotoName}();
    }catch(error){
      apex.message.clearErrors();
      apex.message.showErrors([{type:"error",location:"page",message:error.message||"FD could not open for the clicked row.",unsafe:false}]);
    }
  };
`;

const verifyPo = `
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90011820260926095)
,p_process_sequence=>165
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify Purchase Order calculations before commit'
,p_static_id=>'verify-po-calculations-before-commit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
${sqlLinesNoTrailing(`declare
  l_errors varchar2(3000);
  l_count pls_integer := 0;
  l_discount number; l_after number; l_amount number; l_footer number;
  l_sum_amount number := 0; l_sum_footer number := 0; l_sum_total number := 0;
  procedure add_error(p_text varchar2) is begin
    l_count := l_count + 1;
    if l_count <= 8 then l_errors := l_errors || case when l_errors is null then null else ' | ' end || p_text; end if;
  end;
  function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;
begin
  for d in (
    select d.*, i.measuringunitcode1 unit1, i.measuringunitcode2 unit2,
           nvl((select sum(f.footervalue) from purchaseorderdetailfooter f where f.tno=d.tno and f.sno=d.sno),0) footer_sum
      from purchaseorderdetail d join item i on i.itemcode=d.itemcode
     where d.tno=:P118_TNO order by d.sno
  ) loop
    l_discount := nvl(d.withoutdiscountrate,0)*nvl(d.discountpercentage,0)/100;
    l_after := nvl(d.withoutdiscountrate,0)-l_discount;
    l_amount := nvl(d.rate,0) * case when d.unit2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(d.unit2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end;
    l_footer := d.footer_sum;
    if different(d.discountrate,l_discount,.01) then add_error('SNO '||d.sno||' Discount Amount is stale'); end if;
    if different(d.rateafterdiscount,l_after,.01) then add_error('SNO '||d.sno||' Rate After Discount expected '||to_char(l_after)||', found '||to_char(nvl(d.rateafterdiscount,0))); end if;
    if different(d.rate,l_after,.01) then add_error('SNO '||d.sno||' Rate expected '||to_char(l_after)||', found '||to_char(nvl(d.rate,0))); end if;
    if different(d.amount,l_amount,.01) then add_error('SNO '||d.sno||' Amount expected '||to_char(l_amount)||', found '||to_char(nvl(d.amount,0))); end if;
    if different(d.footeramount,l_footer,.01) then add_error('SNO '||d.sno||' FD/Other expected '||to_char(l_footer)||', found '||to_char(nvl(d.footeramount,0))); end if;
    if different(d.totalamount,l_amount+l_footer,.01) then add_error('SNO '||d.sno||' Total expected '||to_char(l_amount+l_footer)||', found '||to_char(nvl(d.totalamount,0))); end if;
    l_sum_amount:=l_sum_amount+nvl(d.amount,0); l_sum_footer:=l_sum_footer+nvl(d.footeramount,0); l_sum_total:=l_sum_total+nvl(d.totalamount,0);
  end loop;
  for h in (select sumofamount,sumoffooteramount,purchaseorderamount from purchaseorder where tno=:P118_TNO) loop
    if different(h.sumofamount,l_sum_amount,.01) then add_error('Summary Amount expected '||l_sum_amount||', found '||nvl(h.sumofamount,0)); end if;
    if different(h.sumoffooteramount,l_sum_footer,.01) then add_error('Summary Footer expected '||l_sum_footer||', found '||nvl(h.sumoffooteramount,0)); end if;
    if different(h.purchaseorderamount,l_sum_total,.01) then add_error('Purchase Order Amount expected '||l_sum_total||', found '||nvl(h.purchaseorderamount,0)); end if;
  end loop;
  if l_errors is not null then raise_application_error(-20051,'Save blocked - Purchase Order calculation mismatch: '||l_errors||'. No data from this save was committed.'); end if;
end;`, '  ')}))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''SAVE'',''CREATE'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
`;

const verifyPb = `
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90014320260926086)
,p_process_sequence=>86
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify Purchase Bill calculations before commit'
,p_static_id=>'verify-pb-calculations-before-commit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
${sqlLinesNoTrailing(`declare
  l_errors varchar2(3000); l_count pls_integer:=0; l_amount number; l_footer number;
  l_sa number:=0; l_sf number:=0; l_st number:=0;
  procedure add_error(p varchar2) is begin l_count:=l_count+1; if l_count<=8 then l_errors:=l_errors||case when l_errors is null then null else ' | ' end||p; end if; end;
  function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;
begin
  for d in (select d.*,i.measuringunitcode2 unit2,nvl((select sum(f.footervalue) from purchasebilldetailfooter f where f.tno=d.tno and f.sno=d.sno),0) fs from purchasebilldetail d join item i on i.itemcode=d.itemcode where d.tno=:P143_TNO order by d.sno) loop
    l_amount:=nvl(d.rate,0)*case when d.unit2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(d.unit2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end;
    l_footer:=d.fs;
    if different(d.amount,l_amount,.01) then add_error('SNO '||d.sno||' Amount expected '||l_amount||', found '||nvl(d.amount,0)); end if;
    if different(d.footeramount,l_footer,.01) then add_error('SNO '||d.sno||' FD/Other expected '||l_footer||', found '||nvl(d.footeramount,0)); end if;
    if different(d.totalamount,l_amount+l_footer,.01) then add_error('SNO '||d.sno||' Total expected '||(l_amount+l_footer)||', found '||nvl(d.totalamount,0)); end if;
    l_sa:=l_sa+nvl(d.amount,0); l_sf:=l_sf+nvl(d.footeramount,0); l_st:=l_st+nvl(d.totalamount,0);
  end loop;
  for h in (select sumofamount,sumoffooteramount,purchasebillamountbeforeround from purchasebill where tno=:P143_TNO) loop
    if different(h.sumofamount,l_sa,.01) then add_error('Summary Amount mismatch'); end if;
    if different(h.sumoffooteramount,l_sf,.01) then add_error('Summary Footer mismatch'); end if;
    if different(h.purchasebillamountbeforeround,l_st,.01) then add_error('Bill Amount Before Round mismatch'); end if;
  end loop;
  if l_errors is not null then raise_application_error(-20052,'Save blocked - Purchase Bill calculation mismatch: '||l_errors||'. No data from this save was committed.'); end if;
end;`, '  ')}))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''SAVE'',''CREATE'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
`;

const verifyPbPass = `
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90015220260926125)
,p_process_sequence=>125
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify Purchase Bill Pass calculations before commit'
,p_static_id=>'verify-pbpass-calculations-before-commit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
${sqlLinesNoTrailing(`declare
  l_errors varchar2(3000); l_count pls_integer:=0; l_amount number; l_footer number;
  l_sa number:=0; l_sf number:=0; l_st number:=0;
  procedure add_error(p varchar2) is begin l_count:=l_count+1; if l_count<=8 then l_errors:=l_errors||case when l_errors is null then null else ' | ' end||p; end if; end;
  function different(a number,b number,t number) return boolean is begin return abs(nvl(a,0)-nvl(b,0))>t; end;
begin
  for d in (select d.*,nvl((select sum(f.footervalue) from pbpassdetailfooter f where f.tno=d.tno and f.sno=d.sno),0) fs from pbpassdetail d where d.tno=:P152_TNO order by d.sno) loop
    l_amount:=nvl(d.quantity1,0)*nvl(d.rate,0); l_footer:=d.fs;
    if different(d.amount,l_amount,.01) then add_error('SNO '||d.sno||' Amount expected '||l_amount||', found '||nvl(d.amount,0)); end if;
    if different(d.footeramount,l_footer,.01) then add_error('SNO '||d.sno||' FD/Other expected '||l_footer||', found '||nvl(d.footeramount,0)); end if;
    if different(d.totalamount,l_amount+l_footer,.01) then add_error('SNO '||d.sno||' Total expected '||(l_amount+l_footer)||', found '||nvl(d.totalamount,0)); end if;
    l_sa:=l_sa+nvl(d.amount,0); l_sf:=l_sf+nvl(d.footeramount,0); l_st:=l_st+nvl(d.totalamount,0);
  end loop;
  for h in (select sumofamount,sumoffooteramount,pbpassamountbeforeround from pbpass where tno=:P152_TNO) loop
    if different(h.sumofamount,l_sa,.01) then add_error('Summary Amount expected '||l_sa||', found '||nvl(h.sumofamount,0)); end if;
    if different(h.sumoffooteramount,l_sf,.01) then add_error('Summary Footer expected '||l_sf||', found '||nvl(h.sumoffooteramount,0)); end if;
    if different(h.pbpassamountbeforeround,l_st,.01) then add_error('Bill Pass Amount Before Round expected '||l_st||', found '||nvl(h.pbpassamountbeforeround,0)); end if;
  end loop;
  if l_errors is not null then raise_application_error(-20053,'Save blocked - Purchase Bill Pass calculation mismatch: '||l_errors||'. No data from this save was committed.'); end if;
end;`, '  ')}))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''SAVE'',''CREATE'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
`;

// Pages already carrying Phase 1/2 calculation guards only receive the held-key protection.
for (const page of [108, 155]) {
  let text = read(page);
  text = injectPageJs(text, heldTabJs(page, '#detail,#Detail_ig,#item-detail,#item-detail_ig'));
  write(page, text);
}

// Purchase Order: clicked-row FD identity, row-filtered footer modal and final server verification.
{
  let text = read(118);
  text = injectPageJs(text, heldTabJs(118, '#detail,#Detail_ig', poFdJs));
  text = text.replace("p_link_target=>'javascript:openModal(''FooterDetail'')'", "p_link_target=>'javascript:hsplP118OpenFd(this)'");
  text = text.replace("'<a href=\"javascript:openModal(''FooterDetail'')\">'", "'<a href=\"javascript:hsplP118OpenFd(this)\">'");
  text = text.replace("'-- where tno = :P118_TNO',\n' --and sno = :P118_SNO'", "'  where tno = :P118_TNO',\n'    and sno = :P118_SNO'");
  text = addProcess(text, verifyPo);
  write(118, text);
}

// Purchase Bill: keep its reconciliation package, remove AJAX commit/race, fix new-row FD context and verify the reconciled result.
{
  let text = read(143);
  text = injectPageJs(text, heldTabJs(143, '#detail,#Detail_ig', pbFdJs(143, 'P143', 'Detail', 'GotoP321')));
  text = text.replace('javascript:GotoP321()', 'javascript:hsplP143OpenFd(this)');
  text = editEvent(text, 'set amount_1', section => makeImmediate(removeCellCommits(section)).replace(",p_wait_for_result=>'N'", ",p_wait_for_result=>'Y'"));
  text = addProcess(text, verifyPb);
  write(143, text);
}

// Purchase Bill Pass: actual-change events only, no transaction commit inside cell AJAX, immediate summaries, clicked-row FD context and save guard.
{
  let text = read(152);
  text = injectPageJs(text, heldTabJs(152, '#detail,#Detail_ig', pbFdJs(152, 'P152', 'Detail', 'GotoP323')));
  text = text.replace('javascript:GotoP323()', 'javascript:hsplP152OpenFd(this)');
  for (const name of ['set amount', 'set amount_3', 'set amount_2', 'set amount_1']) {
    text = eventToChange(text, name);
    text = editEvent(text, name, section => makeImmediate(removeCellCommits(section)));
  }
  text = addProcess(text, verifyPbPass);
  write(152, text);
}

// Payment Advice: remove duplicate focus calculation and fixed-delay total refresh.
{
  let text = read(140);
  text = injectPageJs(text, heldTabJs(140, '#detail,#Detail_ig'));
  text = disableEvent(text, 'Calculate Net Amount');
  text = eventToChange(text, 'Calculate total amount');
  text = editEvent(text, 'Calculate total amount', makeImmediate);
  text = eventToChange(text, 'set amount_');
  write(140, text);
}

// Material In and GRN: quantity/conversion calls run only after an actual edit; held Tab cannot auto-repeat out of the row.
{
  let text = read(69);
  text = injectPageJs(text, heldTabJs(69, '#detail,#Detail_ig'));
  for (const name of ['Check Pending Qty','Set Balance','set decimal qty1_1','Set Quantity2','Set Quantity1','Set Units']) text = eventToChange(text, name);
  write(69, text);
}
{
  let text = read(146);
  text = injectPageJs(text, heldTabJs(146, '#detail,#Detail_ig'));
  for (const name of ['Set Accepted Quantity1','Set ChalanQuantity2','Set detailqty1','Set DISCREPANCYTYPECODE','Set InspectedQuantity1','Set P146_RECEIVEDQTY1','set qty2','set qty2_2','set qty2_1','set qty2_1_1','Set ReceivedQuantity2','Set ReceivedQuantity1','Set sum of qty1']) text = eventToChange(text, name);
  write(146, text);
}

console.log('Cross-form calculation integrity deployment pages built. Page 710 was not read or modified.');
