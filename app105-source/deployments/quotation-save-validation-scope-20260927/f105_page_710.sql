prompt --application/pages/page_00710
begin
--   Manifest
--     PAGE: 00710
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>710
,p_name=>'Purchase Quotation'
,p_alias=>'PURCHASE-QUOTATION'
,p_step_title=>'Purchase Quotation'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/// Code for Next Item In Enter',
'// $(document).on(''keydown'', '':tabbable'', function(e) {',
'',
'//     if (e.key === "Enter") {',
'//         e.preventDefault();',
'',
'//         var $canfocus = $('':tabbable:visible'');',
'//         var index = $canfocus.index(document.activeElement) + 1;',
'',
'//         if (index >= $canfocus.length) index = 0;',
'//         $canfocus.eq(index).focus();',
'//     }',
'',
'// });',
'// End Code ',
'',
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P710_BIREPORTURL'').val()',
'  var reportName = ''PurchaseQuotation.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P710_TNO'').val() ',
'      ;',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P710_BIREPORTURL'').val()',
'  var reportName =  ''PurchaseQuotation.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P710_TNO'').val() ',
'      ;',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'/* WORKFLOW_LAYOUT_HORIZONTAL_HEADER_SYNC_V1 */',
'(function () {',
'  function bindGrid(grid) {',
'    var body = grid.querySelector(''.a-GV-bdy'');',
'    var header = grid.querySelector(''.a-GV-w-hdr'');',
'    if (!body || !header || body.dataset.workflowHorizontalSync === ''Y'') { return; }',
'',
'    body.dataset.workflowHorizontalSync = ''Y'';',
'    header.scrollLeft = body.scrollLeft;',
'    body.addEventListener(''scroll'', function () {',
'      header.scrollLeft = body.scrollLeft;',
'    }, { passive: true });',
'  }',
'',
'  function bindAll() {',
'    Array.prototype.forEach.call(document.querySelectorAll(''.a-IG''), bindGrid);',
'  }',
'',
'  function scheduleBinding() { window.setTimeout(bindAll, 0); }',
'  if (document.readyState === ''loading'') {',
'    document.addEventListener(''DOMContentLoaded'', scheduleBinding, { once: true });',
'  } else {',
'    scheduleBinding();',
'  }',
'  document.addEventListener(''click'', scheduleBinding);',
'  new MutationObserver(scheduleBinding).observe(document.documentElement, {',
'    childList: true,',
'    subtree: true',
'  });',
'}());',
'',
'',
'/* HSPL_PHASE1_FORM_CALC_SAFE_V1 */',
'(function(){',
'"use strict";',
'if(window.hsplPhase1SafeV1)return;window.hsplPhase1SafeV1=true;',
'var pid=Number(apex.env.APP_PAGE_ID||0),tries=0;',
'function raw(v){return v&&typeof v==="object"&&"v" in v?v.v:v;}',
'function n(v){if(v&&typeof v==="object"&&"v" in v)v=v.v;v=Number(String(v==null?0:v).replace(/,/g,""));return Number.isFinite(v)?v:0;}',
'function region(ids){var out=null;ids.some(function(id){try{var r=apex.region(id),m=r.widget().interactiveGrid("getViews","grid").model;if(m){out={r:r,m:m};return true;}}catch(e){}return false;});return out;}',
'function rows(m,fn){m.forEach(function(rec,i,id){var x=m.getRecordMetadata(id);if(!x.deleted&&!x.agg)fn(rec);});}',
'function sum(m,fields){var t={};fields.forEach(function(f){t[f]=0;});rows(m,function(r){fields.forEach(function(f){t[f]+=n(m.getValue(r,f));});});return t;}',
'function modelSet(m,r,f,v){if(m.getFieldKey(f)&&Math.abs(n(m.getValue(r,f))-n(v))>.0000001)m.setValue(r,f,v);}',
'function itemSet(id,v){var x=apex.item(id);if(x&&x.node&&Math.abs(n(x.getValue())-n(v))>.0000001)x.setValue(v,null,true);}',
'function summary(b,values){var h=b.r.element&&b.r.element[0];if(!h)return;var e=h.querySelector(".hspl-phase1-summary");if(!e){e=document.createElement("div");e.className="hspl-phase1-summary";e.setAttribute("role","status");e.style.cssText="display:'
||'flex;gap:18px;justify-content:flex-end;flex-wrap:wrap;padding:8px 12px;margin-top:6px;border:1px solid #d8dde6;border-radius:6px;background:#fff;font-variant-numeric:tabular-nums";h.appendChild(e);}e.innerHTML=values.map(function(x){return "<span>"+a'
||'pex.util.escapeHTML(x[0])+": <strong>"+n(x[1]).toLocaleString("en-IN",{minimumFractionDigits:2,maximumFractionDigits:3})+"</strong></span>";}).join("");}',
'function bind(b,key,fn){if(!b||b.m[key])return !!b;b.m[key]=true;b.m.subscribe({viewId:key,onChange:function(t,c){fn(b,t,c||{});}});fn(b,"refresh",{});return true;}',
'function indent(b,t,c){var f=c.field||c.fieldName;if(c.record&&(f==="INDENTQUANTITY1"||f==="RATE"))modelSet(b.m,c.record,"AMOUNT",n(b.m.getValue(c.record,"INDENTQUANTITY1"))*n(b.m.getValue(c.record,"RATE")));var x=sum(b.m,["INDENTQUANTITY1","QUANTITY'
||'1","AMOUNT"]);summary(b,[["Indent Qty",x.INDENTQUANTITY1],["Sanction Qty",x.QUANTITY1],["Amount",x.AMOUNT]]);}',
'function enquiry(b){var x=sum(b.m,["QUANTITY1","QUANTITY2"]);summary(b,[["Quantity 1",x.QUANTITY1],["Quantity 2",x.QUANTITY2]]);}',
'function blank(v){return v===null||v===undefined||String(v).trim()==="";}',
'var qcalc={seq:0,fdSeq:0,rows:{},applying:false};',
'function qstatus(){var bad=false,pending=false;Object.keys(qcalc.rows).forEach(function(k){bad=bad||qcalc.rows[k].state==="ERROR";pending=pending||qcalc.rows[k].state==="PENDING";});var v=bad?"ERROR":(pending?"PENDING":"READY");var x=apex.item("P710_'
||'CALCSTATUS");if(x&&x.node)x.setValue(v,null,true);}',
'function qprune(m){Object.keys(qcalc.rows).forEach(function(k){var r=m.getRecord(k),x=r&&m.getRecordMetadata(k);if(!r||(x&&x.deleted)){if(qcalc.rows[k].timer)clearTimeout(qcalc.rows[k].timer);delete qcalc.rows[k];}});qstatus();}',
'window.hsplP710OpenFD=function(sno,el){var b=region(["quotation-detail","QuotationDetail"]),m=b&&b.m,key=String(raw(sno)==null?"":raw(sno)).trim(),rec=null,click=++qcalc.fdSeq,tr,id;if(m&&el&&el.closest){tr=el.closest("tr[data-id]");id=tr&&tr.getAttr'
||'ibute("data-id");if(id!=null)rec=m.getRecord(id);}if(!rec&&m&&key)rows(m,function(r){var v=String(raw(m.getValue(r,"SNO"))==null?"":raw(m.getValue(r,"SNO"))).trim();if(!rec&&(v===key||(n(v)>0&&n(v)===n(key))))rec=r;});var si=apex.item("P710_SNO"),ai='
||'apex.item("P710_DFAMOUNT");if(rec)key=String(raw(m.getValue(rec,"SNO"))==null?key:raw(m.getValue(rec,"SNO"))).trim();if(si&&si.node)si.setValue(key,null,true);if(!rec){openModal("DetailFooter");setTimeout(function(){try{apex.region("detailfooter").re'
||'fresh();}catch(e){}},0);return;}var tno=raw(m.getValue(rec,"TNO")),spec=raw(m.getValue(rec,"ITEMSPECIFICATIONCODE")),amt=n(m.getValue(rec,"AMOUNT"));if(ai&&ai.node)ai.setValue(amt,null,true);apex.server.process("P710_PREPARE_FD",{x01:tno,x02:key,x03:'
||'spec,x04:amt,pageItems:"#P710_PARTYCODE,#P710_TRANSACTIONTYPECODE"},{dataType:"json",queue:{name:"p710_fd_open",action:"replace"}}).done(function(d){if(click!==qcalc.fdSeq)return;if(!d||d.success!==true||String(d.sno)!==key){apex.message.showErrors(['
||'{type:"error",location:"page",message:(d&&d.message)||"FD could not be prepared for the clicked row.",unsafe:false}]);return;}qcalc.applying=true;modelSet(m,rec,"FOOTERAMOUNT",d.footerAmount);modelSet(m,rec,"TOTALAMOUNT",amt+n(d.footerAmount));qcalc.'
||'applying=false;quotation(b,"fd",{});openModal("DetailFooter");setTimeout(function(){try{apex.region("detailfooter").refresh();}catch(e){}},0);}).fail(function(jq,textStatus,errorThrown){if(click!==qcalc.fdSeq)return;apex.message.showErrors([{type:"er'
||'ror",location:"page",message:"FD could not open ("+(errorThrown||textStatus||"network error")+"). No row data was changed.",unsafe:false}]);});};',
'function qserver(b,r){var m=b.m,id=m.getRecordId(r),s=qcalc.rows[id]||{};if(blank(raw(m.getValue(r,"TNO")))||blank(raw(m.getValue(r,"SNO")))||blank(raw(m.getValue(r,"ITEMCODE")))||blank(raw(m.getValue(r,"ITEMSPECIFICATIONCODE"))))return;if(s.timer)cl'
||'earTimeout(s.timer);s.rev=++qcalc.seq;s.state="PENDING";qcalc.rows[id]=s;qstatus();var rev=s.rev;s.timer=setTimeout(function(){var rec=m.getRecord(id);if(!rec||!qcalc.rows[id]||qcalc.rows[id].rev!==rev)return;apex.server.process("P710_CALCULATE_DETAI'
||'L",{x01:raw(m.getValue(rec,"TNO")),x02:raw(m.getValue(rec,"SNO")),x03:raw(m.getValue(rec,"ITEMCODE")),x04:raw(m.getValue(rec,"ITEMSPECIFICATIONCODE")),x05:raw(m.getValue(rec,"QUANTITY1")),x06:raw(m.getValue(rec,"RATE")),x07:raw(m.getValue(rec,"WITHOU'
||'TDISCOUNTRATE")),x08:raw(m.getValue(rec,"DISCOUNTPERCENTAGE")),x09:raw(m.getValue(rec,"RATEMEASURINGUNITCODE")),x10:rev,x11:raw(m.getValue(rec,"SERIALNO")),pageItems:"#P710_PARTYCODE,#P710_TRANSACTIONTYPECODE"},{dataType:"json",queue:{name:"p710_calc'
||'_"+String(id).replace(/[^a-zA-Z0-9_]/g,"_"),action:"replace"}}).done(function(d){var st=qcalc.rows[id],row=m.getRecord(id);if(!st||st.rev!==rev||!row)return;if(!d||d.success!==true){st.state="ERROR";qstatus();apex.message.showErrors([{type:"error",lo'
||'cation:"page",message:(d&&d.message)||"Detail calculation failed. Data was not saved.",unsafe:false}]);return;}qcalc.applying=true;modelSet(m,row,"QUANTITY2",d.quantity2);modelSet(m,row,"UNITCODE1",d.unit1);modelSet(m,row,"UNITCODE2",d.unit2);if(blan'
||'k(raw(m.getValue(row,"RATEMEASURINGUNITCODE"))))modelSet(m,row,"RATEMEASURINGUNITCODE",d.rmu);modelSet(m,row,"DISCOUNTRATE",d.discountRate);modelSet(m,row,"RATEAFTERDISCOUNT",d.rateAfterDiscount);modelSet(m,row,"AMOUNT",d.amount);modelSet(m,row,"FOOT'
||'ERAMOUNT",d.footerAmount);modelSet(m,row,"TOTALAMOUNT",d.totalAmount);modelSet(m,row,"HSNCODE",d.hsn);qcalc.applying=false;st.state="READY";qstatus();quotation(b,"server",{});try{var fr=apex.region("detailfooter"),fe=fr.element&&fr.element[0],fv=fr.w'
||'idget().interactiveGrid("getViews","grid"),fm=fv&&fv.model;if(fe&&!fe.contains(document.activeElement)&&!(fm&&fm.isChanged&&fm.isChanged()))fr.refresh();}catch(e){}}).fail(function(jq,textStatus,errorThrown){var st=qcalc.rows[id];if(!st||st.rev!==rev'
||')return;st.state="ERROR";qstatus();apex.message.showErrors([{type:"error",location:"page",message:"Detail calculation could not complete ("+(errorThrown||textStatus||"network error")+"). Correct data is retained; retry the field before saving.",unsaf'
||'e:false}]);});},180);}',
'function quotation(b,t,c){var f=c.field||c.fieldName,r=c.record,m=b.m,watched=["ITEMCODE","ITEMSPECIFICATIONCODE","QUANTITY1","RATE","WITHOUTDISCOUNTRATE","DISCOUNTPERCENTAGE","RATEMEASURINGUNITCODE"];qprune(m);if(r&&!qcalc.applying&&watched.indexOf('
||'f)>=0){var base=n(m.getValue(r,"WITHOUTDISCOUNTRATE")),pct=n(m.getValue(r,"DISCOUNTPERCENTAGE")),disc=base*pct/100,rad=base-disc,rawRate=raw(m.getValue(r,"RATE")),rate=(f==="WITHOUTDISCOUNTRATE"||f==="DISCOUNTPERCENTAGE"||blank(rawRate))?rad:n(rawRat'
||'e),q1=n(m.getValue(r,"QUANTITY1")),q2=n(m.getValue(r,"QUANTITY2")),rmu=String(raw(m.getValue(r,"RATEMEASURINGUNITCODE"))||""),u2=String(raw(m.getValue(r,"UNITCODE2"))||""),qty=(u2&&rmu===u2)?q2:q1,amt=rate*qty;qcalc.applying=true;modelSet(m,r,"DISCOU'
||'NTRATE",disc);modelSet(m,r,"RATEAFTERDISCOUNT",rad);if(f==="WITHOUTDISCOUNTRATE"||f==="DISCOUNTPERCENTAGE"||blank(rawRate))modelSet(m,r,"RATE",rate);modelSet(m,r,"AMOUNT",amt);modelSet(m,r,"TOTALAMOUNT",amt+n(m.getValue(r,"FOOTERAMOUNT")));qcalc.appl'
||'ying=false;qserver(b,r);}var x=sum(m,["AMOUNT","FOOTERAMOUNT","TOTALAMOUNT"]);itemSet("P710_SUMOFAMOUNT",x.AMOUNT);itemSet("P710_SUMOFFOOTERAMOUNT",x.FOOTERAMOUNT);itemSet("P710_QUOTATIONAMOUNT",x.TOTALAMOUNT);summary(b,[["Amount",x.AMOUNT],["Other /'
||' Footer",x.FOOTERAMOUNT],["Quotation Total",x.TOTALAMOUNT]]);}',
'function footer(b){var ft=sum(b.m,["FOOTERVALUE"]).FOOTERVALUE;itemSet("P710_DFTOTALAMOUNT",ft);itemSet("P710_FVALUE",ft);var d=region(["QuotationDetail","quotation-detail"]),s=String(apex.item("P710_SNO").getValue()||"");if(d&&s){rows(d.m,function(r'
||'){if(String(d.m.getValue(r,"SNO")||"")===s){var a=n(d.m.getValue(r,"AMOUNT"));modelSet(d.m,r,"FOOTERAMOUNT",ft);modelSet(d.m,r,"TOTALAMOUNT",a+ft);}});quotation(d,"footer",{});}}',
'function start(){var ok=false;if(pid===108)ok=bind(region(["Detail","item-detail"]),"hsplP108",indent);if(pid===708)ok=bind(region(["item-detail"]),"hsplP708",enquiry);if(pid===710){ok=bind(region(["QuotationDetail","quotation-detail"]),"hsplP710",qu'
||'otation);bind(region(["DetailFooter","detailfooter"]),"hsplP710Footer",footer);}if(!ok&&tries++<20)setTimeout(start,250);}',
'if(pid===708){document.addEventListener("click",function(ev){var b=ev.target.closest&&ev.target.closest("#GETITEM,#getitem");if(!b)return;if(b.dataset.hsplBusy==="Y"){ev.preventDefault();ev.stopImmediatePropagation();return;}b.dataset.hsplBusy="Y";se'
||'tTimeout(function(){b.disabled=true;b.setAttribute("aria-busy","true");},0);},true);apex.jQuery(document).on("apexafterrefresh.hsplP708 apexservererror.hsplP708","#item-detail",function(){var b=document.querySelector("#GETITEM,#getitem");if(b){b.disa'
||'bled=false;b.removeAttribute("aria-busy");delete b.dataset.hsplBusy;}});}',
'apex.jQuery(start);apex.jQuery(document).on("apexafterrefresh.hsplPhase1Safe",function(){tries=0;setTimeout(start,0);});',
'})();',
'',
'/* HSPL_P710_PRE_SUBMIT_CALC_GUARD_V1 */',
'(function(){',
'"use strict";',
'if(Number(apex.env.APP_PAGE_ID||0)!==710||window.hsplP710PreSubmitCalcGuardV1)return;',
'window.hsplP710PreSubmitCalcGuardV1=true;',
'function raw(v){return v&&typeof v==="object"&&"v" in v?v.v:v;}',
'function blank(v){v=raw(v);return v===null||v===undefined||String(v).trim()==="";}',
'function num(v){v=Number(String(raw(v)==null?0:raw(v)).replace(/,/g,""));return Number.isFinite(v)?v:0;}',
'function diff(a,b,t){return blank(a)||Math.abs(num(a)-num(b))>t;}',
'function grid(){var ids=["quotation-detail","QuotationDetail"],out=null;ids.some(function(id){try{var r=apex.region(id),m=r.widget().interactiveGrid("getViews","grid").model;if(m){out=m;return true;}}catch(e){}return false;});return out;}',
'function val(m,r,f){return raw(m.getValue(r,f));}',
'function money(v){return num(v).toLocaleString("en-IN",{minimumFractionDigits:2,maximumFractionDigits:2});}',
'apex.jQuery(document).on("apexbeforepagesubmit.hsplP710CalcGuard",function(ev,request){',
'var req=String(request||"").toUpperCase(),active=(document.activeElement&&document.activeElement.id||"").toUpperCase();',
'if(req==="DELETE"||active==="DELETE"||(req&&req!=="SAVE"&&req!=="CREATE"))return;',
'var m=grid(),errors=[],sums={a:0,f:0,t:0};if(!m)return;',
'if(String(apex.item("P710_CALCSTATUS").getValue()||"READY")!=="READY")errors.push("A detail calculation is still pending or failed; wait or correct that row before saving.");',
'm.forEach(function(r,i,id){var meta=m.getRecordMetadata(id),item=val(m,r,"ITEMCODE"),spec=val(m,r,"ITEMSPECIFICATIONCODE"),q1=val(m,r,"QUANTITY1"),q2=val(m,r,"QUANTITY2"),rate=val(m,r,"RATE"),base=val(m,r,"WITHOUTDISCOUNTRATE");if(meta.deleted||meta.'
||'agg)return;if(blank(item)&&blank(spec)&&blank(q1)&&blank(rate)&&blank(base))return;var sno=val(m,r,"SNO")||val(m,r,"SERIALNO")||(i+1),label="SNO "+sno,pct=num(val(m,r,"DISCOUNTPERCENTAGE")),u2=String(val(m,r,'
||'"UNITCODE2")||""),rmu=String(val(m,r,"RATEMEASURINGUNITCODE")||val(m,r,"UNITCODE1")||""),qty=(u2&&rmu===u2)?num(q2):num(q1),amt=num(rate)*qty,footer=val(m,r,"FOOTERAMOUNT"),total=val(m,r,"TOTALAMOUNT");',
'if(blank(item))errors.push(label+" Item is blank");if(blank(spec))errors.push(label+" Specification is blank");if(num(q1)<=0)errors.push(label+" Quantity must be greater than zero");if(blank(rate))errors.push(label+" Rate is blank");if(pct<0||pct>100)errors.push(label+" Discount % must be between 0 and 100");if(diff(val(m,r,"AMOUNT"),amt,.01))errors.push(label+" Amount expected "'
||'+money(amt)+", found "+money(val(m,r,"AMOUNT")));if(diff(footer,num(footer),.01))errors.push(label+" FD/Other Amount is blank or invalid");if(diff(total,num(val(m,r,"AMOUNT"))+num(footer),.01))errors.push(label+" Total expected "+money(num(val(m,r,"A'
||'MOUNT"))+num(footer))+", found "+money(total));sums.a+=num(val(m,r,"AMOUNT"));sums.f+=num(footer);sums.t+=num(total);});',
'if(diff(apex.item("P710_SUMOFAMOUNT").getValue(),sums.a,.01))errors.push("Summary Amount expected "+money(sums.a)+", found "+money(apex.item("P710_SUMOFAMOUNT").getValue()));if(diff(apex.item("P710_SUMOFFOOTERAMOUNT").getValue(),sums.f,.01))errors.pu'
||'sh("Summary Footer Amount expected "+money(sums.f)+", found "+money(apex.item("P710_SUMOFFOOTERAMOUNT").getValue()));if(diff(apex.item("P710_QUOTATIONAMOUNT").getValue(),sums.t,.01))errors.push("Quotation Amount expected "+money(sums.t)+", found "+mo'
||'ney(apex.item("P710_QUOTATIONAMOUNT").getValue()));',
'if(errors.length){ev.preventDefault();ev.stopImmediatePropagation();apex.message.clearErrors();apex.message.showErrors(errors.slice(0,10).map(function(x){return {type:"error",location:"page",message:"Save blocked: "+x,unsafe:false};}));return false;}',
'});',
'})();',
'',
'/* HSPL_P710_HELD_TAB_GUARD_V1 */',
'(function(){',
'"use strict";',
'if(Number(apex.env.APP_PAGE_ID||0)!==710||window.hsplP710HeldTabGuardV1)return;',
'window.hsplP710HeldTabGuardV1=true;',
'var heldFromDetail=false;',
'function inDetail(target){return !!(target&&target.closest&&target.closest("#quotation-detail"));}',
'document.addEventListener("keydown",function(event){',
'if(event.key!=="Tab")return;',
'if(!event.repeat){heldFromDetail=inDetail(event.target);return;}',
'if(heldFromDetail){event.preventDefault();event.stopImmediatePropagation();}',
'},true);',
'document.addEventListener("keyup",function(event){if(event.key==="Tab")heldFromDetail=false;},true);',
'window.addEventListener("blur",function(){heldFromDetail=false;});',
'})();',
'',
'',
'/* HSPL_PHASE1_UNCHANGED_FOCUS_GUARD_V2 */',
'(function () {',
'  "use strict";',
'  if (window.hsplPhase1UnchangedFocusGuardV2) { return; }',
'  window.hsplPhase1UnchangedFocusGuardV2 = true;',
'',
'  function elementFromContext(ctx) {',
'    var el = ctx && ctx.browserEvent && ctx.browserEvent.target;',
'    if (!el && ctx) { el = ctx.triggeringElement; }',
'    if (el && el.jquery) { el = el[0]; }',
'    return el || null;',
'  }',
'',
'  function valueOf(el) {',
'    if (!el) { return ""; }',
'    if (el.type === "checkbox" || el.type === "radio") {',
'      return el.checked ? String(el.value == null ? "" : el.value) : "";',
'    }',
'    return String(el.value == null ? "" : el.value);',
'  }',
'',
'  document.addEventListener("focusin", function (event) {',
'    var el = event.target;',
'    if (el && el.dataset && el.matches("input,select,textarea")) {',
'      el.dataset.hsplPhase1FocusStart = valueOf(el);',
'    }',
'  }, true);',
'',
'  window.hsplPhase1WasEdited = function (ctx) {',
'    var el = elementFromContext(ctx);',
'    if (!el || !el.dataset) { return false; }',
'    var before = el.dataset.hsplPhase1FocusStart;',
'    if (before === undefined) { return false; }',
'    return before !== valueOf(el);',
'  };',
'',
'  window.hsplPhase1FocusNumber = function (ctx) {',
'    var n = Number(valueOf(elementFromContext(ctx)).replace(/,/g, ""));',
'    return Number.isFinite(n) ? n : 0;',
'  };',
'',
'  window.hsplPhase1ContextValue = function (ctx, field) {',
'    try {',
'      var item = apex.item(field);',
'      if (item && item.node) { return item.getValue(); }',
'    } catch (ignoreItem) {}',
'    try {',
'      var el = elementFromContext(ctx);',
'      var row = el && el.closest("tr");',
'      var recordId = row && row.getAttribute("data-id");',
'      var pageId = Number(apex.env.APP_PAGE_ID || 0);',
'      var regionId = pageId === 108 ? "Detail" : "QuotationDetail";',
'      var model = apex.region(regionId).widget().interactiveGrid("getViews", "grid").model;',
'      var record = recordId && model.getRecord(recordId);',
'      return record ? model.getValue(record, field) : null;',
'    } catch (ignoreGrid) { return null; }',
'  };',
'',
'  window.hsplPhase1IsBlank = function (value) {',
'    return value === null || value === undefined || String(value).trim() === "";',
'  };',
'})();',
'',
'',
'/* HSPL_P710_QUOTATION_TAB_PARTY_OUTPUT_V1 */',
'(function ($) {',
'  "use strict";',
'  $(function () {',
'    $("#P710_QUOTATIONNO").attr("tabindex", "-1");',
'  });',
'})(apex.jQuery);',
'',
'',
'/* HSPL_P710_SKIP_VALIDITY_DATE_TAB_V1 */',
'(function ($) {',
'  "use strict";',
'  function removeFromTabOrder() {',
'    $("#P710_VALIDITYDATE, #P710_VALIDITYDATE_input, #P710_VALIDITYDATE_CONTAINER button").attr("tabindex", "-1");',
'  }',
'  $(removeFromTabOrder);',
'  $(document).on("apexafterrefresh.hsplP710ValidityTab", "#P710_VALIDITYDATE_CONTAINER", removeFromTabOrder);',
'})(apex.jQuery);',
'',
'',
'/* HSPL_P710_ENQUIRY_ROW_LOCK_V1 */',
'(function ($) {',
'  "use strict";',
'  function applySourceLock(data) {',
'    if (!data || !data.model || !data.record) { return; }',
'    var locked = String(data.model.getValue(data.record, "ENQUIRYSOURCE") || "N") === "Y";',
'    ["ITEMCODE", "ITEMSPECIFICATIONCODE"].forEach(function (name) {',
'      var item = apex.item(name);',
'      if (!item || !item.node) { return; }',
'      if (locked) { item.disable(); } else { item.enable(); }',
'      $(item.node).attr("aria-readonly", locked ? "true" : "false");',
'    });',
'  }',
'  $(document).on("apexbeginrecordedit.hsplP710EnquiryLock", "#quotation-detail", function (event, data) {',
'    applySourceLock(data);',
'  });',
'})(apex.jQuery);',
'',
'',
'/* HSPL_P710_FREIGHT_ASSISTANT_SYNC_V1 */',
'/* APEX Popup LOV can raise its first change event before its return value is',
'   committed. Pulse the existing Document Assistant after that commit; this',
'   changes no form data and only re-runs the assistant''s own status reader. */',
'(function ($) {',
'  "use strict";',
'  if (Number(apex.env.APP_PAGE_ID || 0) !== 710 || window.hsplP710FreightAssistantSyncV1) { return; }',
'  window.hsplP710FreightAssistantSyncV1 = true;',
'  function pulseAssistant() {',
'    [0, 80, 240].forEach(function (delay) {',
'      window.setTimeout(function () {',
'        var item = apex.item("P710_FREIGHTTYPECODE");',
'        if (!item || !item.node) { return; }',
'        item.node.dispatchEvent(new Event("input", { bubbles: true }));',
'      }, delay);',
'    });',
'  }',
'  $(document).on("change.hsplP710FreightAssistant", "#P710_FREIGHTTYPECODE", pulseAssistant);',
'  $(document).on("apexafterrefresh.hsplP710FreightAssistant", "#P710_FREIGHTTYPECODE_CONTAINER", pulseAssistant);',
'  $(pulseAssistant);',
'})(apex.jQuery);',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'/* WORKFLOW_LAYOUT_STANDARD_GAP_V1 */',
'/* Keep a clear separation between the title card and tabs/report content. */',
'#tabcontainer,',
'#MYID {',
'  margin-top: 16px !important;',
'}',
'',
'',
'/* WORKFLOW_LAYOUT_HORIZONTAL_GRID_SCROLL_V1 */',
'/* Wide entry grids retain their horizontal track and do not show an inner',
'   vertical scrollbar. */',
'.a-IG .a-GV-bdy,',
'.a-IG .a-GV-scrollBody,',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: scroll !important;',
'  overflow-y: hidden !important;',
'}',
'',
'',
'/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */',
'/* A track appears only when the grid columns exceed the available width. */',
'.a-IG .a-GV-bdy {',
'  overflow-x: auto !important;',
'}',
'',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(335738823662316262)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(346779425808431946)
,p_plug_name=>'Currency'
,p_static_id=>'currency'
,p_parent_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(365009205480953371)
,p_plug_name=>'DetailFooter'
,p_static_id=>'detailfooter'
,p_region_name=>'DetailFooter'
,p_region_css_classes=>'js-dialog-size900x500'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SERIALNO,',
'       SN,',
'       FOOTERHEADCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE,',
'       TAXFORMCODE,',
'       LEGENDS,',
'       LEGENDSCODE,',
'       CREDIT,',
'       TAXRULEFOOTERPERCENT,',
'       TAXRULEFOOTERHEADCODE',
'  from QUOTATIONDETAILFOOTER',
'  where tno = :P710_TNO',
'  and sno = :P710_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(364448803368967367)
,p_ajax_items_to_submit=>'P710_TNO,P710_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'DetailFooter'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010682373953386)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010838005953387)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010342435953382)
,p_name=>'CREDIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREDIT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Credit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365009672401953376)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Footer Head Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.FOOTERHEADNAME,',
'a.FOOTERHEADCODE',
'FROM FOOTERHEAD a'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365009816794953377)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Percent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365009933016953378)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly="readonly" tabindex="-1" aria-readonly="true"'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010083049953380)
,p_name=>'LEGENDS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Legends'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010177169953381)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'LEGENDSCODE d,',
'LEGENDSCODE r',
'FROM LEGENDS'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010634702953385)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365009569518953375)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(341644203219366576)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sn'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365009521709953374)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(364449400444967373)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010005434953379)
,p_name=>'TAXFORMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXFORMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tax Form Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010519935953384)
,p_name=>'TAXRULEFOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXRULEFOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Taxr Rule Footer Head Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365010440090953383)
,p_name=>'TAXRULEFOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXRULEFOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tax Rule Footer Percent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365009402314953373)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P710_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(365009288079953372)
,p_internal_uid=>332966771545543624
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(365048169923102752)
,p_interactive_grid_id=>wwv_flow_imp.id(365009288079953372)
,p_static_id=>'165552'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(365048421061102752)
,p_report_id=>wwv_flow_imp.id(365048169923102752)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(343353706891812584)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(341644203219366576)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365048937269102755)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(365009402314953373)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365049828285102760)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(365009521709953374)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365050681711102765)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(365009569518953375)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365051576616102771)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(365009672401953376)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365052472992102777)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(365009816794953377)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365053296672102783)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(365009933016953378)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365054217192102789)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(365010005434953379)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365055059399102794)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(365010083049953380)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365056008776102800)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(365010177169953381)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365056920653102806)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(365010342435953382)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365057848809102811)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(365010440090953383)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365058741713102818)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(365010519935953384)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365059610129102824)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(365010634702953385)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365062024440110018)
,p_view_id=>wwv_flow_imp.id(365048421061102752)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(365010682373953386)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(364452080099967400)
,p_plug_name=>'DetailQuality'
,p_static_id=>'detailquality'
,p_region_name=>'DetailQuality'
,p_region_css_classes=>'js-dialog-size900x300'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SERIALNO,',
'       QUALITYCODE,',
'       MINIMUMVALUE,',
'       MAXIMUMVALUE,',
'       TOLERANCE,',
'       REMARK,',
'       QUALITYVALUE',
'  from QUOTATIONDETAILQUALITY',
'  where tno = :P710_TNO',
'  and sno = :P710_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(364448803368967367)
,p_ajax_items_to_submit=>'P710_TNO,P710_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'DetailQuality'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365008260208953362)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365008407494953363)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365007768261953357)
,p_name=>'MAXIMUMVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAXIMUMVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Maximum Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365007692706953356)
,p_name=>'MINIMUMVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MINIMUMVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Minimum Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365007590466953355)
,p_name=>'QUALITYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quality Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365008122078953360)
,p_name=>'QUALITYVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUALITYVALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Quality Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365007991696953359)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365008174513953361)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364452482061967404)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364452389200967403)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(364449400444967373)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364452289899967402)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P710_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365007917214953358)
,p_name=>'TOLERANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOLERANCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tolerance'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(364452193780967401)
,p_internal_uid=>332409677246557653
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(365013469966958343)
,p_interactive_grid_id=>wwv_flow_imp.id(364452193780967401)
,p_static_id=>'165205'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(365013699575958343)
,p_report_id=>wwv_flow_imp.id(365013469966958343)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365014224638958347)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(364452289899967402)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365015128999958353)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(364452389200967403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365015962745958364)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(364452482061967404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365016871958958372)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(365007590466953355)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365017741251958378)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(365007692706953356)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365018609928958383)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(365007768261953357)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365019512444958387)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(365007917214953358)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365020413601958393)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(365007991696953359)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365021280556958398)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(365008122078953360)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365022245050958402)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(365008174513953361)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365024372581965652)
,p_view_id=>wwv_flow_imp.id(365013699575958343)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(365008260208953362)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(346779250701431945)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(335738933685316263)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(573879776706959559)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(346779716176431949)
,p_plug_name=>'Other details'
,p_static_id=>'other-details'
,p_parent_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(364558321585483094)
,p_plug_name=>'Quotation'
,p_static_id=>'quotation'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(335738933685316263)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       QUOTATIONNO,',
'       QUOTATIONDATE,',
'       PARTYCODE,',
'       VALIDITYDATE,',
'       CURRENCYUNITCODE,',
'       CURRENCYVALUE,',
'       ENQUIRYTNO,',
'       SUMOFAMOUNT,',
'       QUOTATIONAMOUNT,',
'       SUBJECTTEXT,',
'       REFERENCETEXT,',
'       LETTERTEXT,',
'       TITLETEXT,',
'       ITEMWISEFOOTER,',
'       REMARK,',
'       EMPLOYEECODE,',
'       SUMOFFOOTERAMOUNT,',
'       PARTYQUOTATIONNO,',
'       PARTYQUOTATIONDATE,',
'       CREATOR,',
'       FREIGHTTYPECODE,',
'       REVISIONQUOTATIONTNO,',
'       CONTACTPERSON,',
'       CONTACTNO,',
'       DESIGNATION,',
'       CREATIONTIME,',
'       MODULETNO,',
'       MODULECODE,',
'       TRANSACTIONTYPECODE,',
'       NATUREOFSUPPLYCODE,',
'       CREDITDAYS,',
'       VALIDITYDAYS,',
'       NVL(getdocumentstatuscode(''QUOTATION'',TNO),''STATUS'') AS Status',
'  from QUOTATION'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(364448803368967367)
,p_plug_name=>'Quotation Detail'
,p_static_id=>'quotation-detail'
,p_region_name=>'QuotationDetail'
,p_parent_plug_id=>wwv_flow_imp.id(335738933685316263)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       SERIALNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       DESCRIPTION,',
'       QUANTITY1,',
'       QUANTITY2,',
'       RATEMEASURINGUNITCODE,',
'       RATE,',
'       AMOUNT,',
'       FOOTERAMOUNT,',
'       TOTALAMOUNT,',
'       REMARK,',
'       WITHOUTDISCOUNTRATE,',
'       DISCOUNTPERCENTAGE,',
'       DISCOUNTRATE,',
'       nvl(qd.HSNCODE, (select max(trim(s.hsncode))',
'                          from itemspecification s',
'                         where s.itemspecificationcode = qd.itemspecificationcode)) as HSNCODE,',
'       ISRATEINCLUSIVETAX,',
'       RATEAFTERDISCOUNT,',
'       case when qd.SERIALNO is not null or exists (',
'              select 1',
'                from ENQUIRYITEMDETAIL eid',
'               where eid.tno = :P710_ENQUIRYTNO',
'                 and eid.itemcode = qd.itemcode',
'                 and nvl(eid.itemspecificationcode,''~'') = nvl(qd.itemspecificationcode,''~'')',
'            ) then ''Y'' else ''N'' end as ENQUIRYSOURCE,',
'       ''Q'' as Q,',
'       ''FD'' as FD,',
'       GetMeasuringUnitNameFromItem(ITEMCODE) as Unit1,',
'       GetMeasuringUnit2NameFromItem(ITEMCODE) as Unit2,',
'       (select max(i.measuringunitcode1) from item i where i.itemcode = qd.itemcode) as UNITCODE1,',
'       (select max(i.measuringunitcode2) from item i where i.itemcode = qd.itemcode) as UNITCODE2',
'  from QUOTATIONDETAIL qd',
'  where tno = :P710_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P710_TNO,P710_ENQUIRYTNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'QuotationDetail'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364452032976967399)
,p_heading=>'Discount'
,p_static_id=>'discount'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364451594844967395)
,p_heading=>'Material'
,p_static_id=>'material'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364451856234967397)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364451888659967398)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450321329967382)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly="readonly" tabindex="-1" aria-readonly="true"'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364448964465967369)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449127816967370)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449782918967377)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364451594844967395)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450783629967387)
,p_name=>'DISCOUNTPERCENTAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCOUNTPERCENTAGE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'%'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364452032976967399)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450899714967388)
,p_name=>'DISCOUNTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCOUNTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364452032976967399)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90071020260926001)
,p_name=>'ENQUIRYSOURCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ENQUIRYSOURCE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>255
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365011034141953389)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'FD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_link_target=>'#'
,p_link_text=>'&FD.'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch" onclick="window.hsplP710OpenFD(''&SNO.'',this);return false;"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<a href="#" onclick="window.hsplP710OpenFD(''&SNO.'',this);return false;"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450368626967383)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Other'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450972607967389)
,p_name=>'HSNCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HSNCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'HSN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364451594844967395)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364451070175967390)
,p_name=>'ISRATEINCLUSIVETAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISRATEINCLUSIVETAX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Inclusive Tax'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449570775967375)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364451594844967395)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select itemname , itemcode from item'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449743477967376)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364451594844967395)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ITEMSPECIFICATIONNAME , ITEMSPECIFICATIONCODE ',
'from ITEMSPECIFICATION',
'where tno in (select tno from item where itemcode = :ITEMCODE)'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365008851666953367)
,p_name=>'Q'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Q'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<a href="javascript:openModal(''DetailQuality'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">Q</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449899900967378)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364451856234967397)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449972337967379)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364451888659967398)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450224901967381)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364451203172967391)
,p_name=>'RATEAFTERDISCOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEAFTERDISCOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate After Discount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>240
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly="readonly" tabindex="-1" aria-readonly="true"'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450065270967380)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' Select MEASURINGUNITNAME, MEASURINGUNITCODE',
'  From Item A, MEASURINGUNIT B',
' Where a.measuringunitcode1 = b.measuringunitcode',
'   And A.itemcode = :ITEMCODE',
'Union All',
'Select MEASURINGUNITNAME, MEASURINGUNITCODE',
'  From Item A, MEASURINGUNIT B',
' Where a.measuringunitcode2 = b.measuringunitcode',
'   And A.itemcode = :ITEMCODE',
'  ;'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450583544967385)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364451300389967392)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449470060967374)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449400444967373)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364449336127967372)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P710_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450521056967384)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(344295468833945789)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364451856234967397)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(344295581346945790)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364451888659967398)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90071020260926002)
,p_name=>'UNITCODE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNITCODE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>256
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90071020260926003)
,p_name=>'UNITCODE2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNITCODE2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>257
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(364450668848967386)
,p_name=>'WITHOUTDISCOUNTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WITHOUTDISCOUNTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'W/O Discount Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(364448927956967368)
,p_internal_uid=>332406411422557620
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(364842794925804658)
,p_interactive_grid_id=>wwv_flow_imp.id(364448927956967368)
,p_static_id=>'163498'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(364843007526804658)
,p_report_id=>wwv_flow_imp.id(364842794925804658)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(331353253469654846)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(344295468833945789)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(331354179802654852)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(344295581346945790)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364843498870804661)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(364448964465967369)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364844783336804673)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(364449336127967372)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364845590643804680)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(364449400444967373)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364846533859804685)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(364449470060967374)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364847382177804690)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(364449570775967375)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364848264521804698)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(364449743477967376)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>510.99
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364849214627804706)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(364449782918967377)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364850146825804718)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(364449899900967378)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110.9883
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364851013414804729)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(364449972337967379)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364851952423804738)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(364450065270967380)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364852843573804744)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(364450224901967381)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364853705183804749)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(364450321329967382)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139.9922
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364854636121804754)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(364450368626967383)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148.99
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364855472930804761)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(364450521056967384)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364856419979804770)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(364450583544967385)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364857207197804779)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(364450668848967386)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364858069672804786)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(364450783629967387)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364858991045804793)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(364450899714967388)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128.0078
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364859927140804802)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(364450972607967389)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364860796408804808)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(364451070175967390)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364861726796804816)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(364451203172967391)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159.988
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(364862616419804822)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(364451300389967392)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365042545157988344)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(365008851666953367)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365069306377115945)
,p_view_id=>wwv_flow_imp.id(364843007526804658)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(365011034141953389)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(365094931707276699)
,p_plug_name=>'Summary'
,p_static_id=>'summary'
,p_parent_plug_id=>wwv_flow_imp.id(364448803368967367)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_column=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(365011122482953390)
,p_plug_name=>'Terms and Condition'
,p_static_id=>'terms-and-condition'
,p_parent_plug_id=>wwv_flow_imp.id(335738933685316263)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       SNO,',
'       TERMSANDCONDITIONHEADCODE,',
'       TERMSANDCONDITION',
'  from QUOTATIONTAC',
'  where tno = :P710_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P710_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Terms and Condition'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365011921606953398)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365011982579953399)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365012228565953401)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365011390406953393)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365011638703953395)
,p_name=>'TERMSANDCONDITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.termsandcondition a , a.termsandcondition b from TERMSANDCONDITIONHEADDETAIL a , TERMSANDCONDITIONHEAD b',
'where a.tno = b.tno',
'and b.tno = :TERMSANDCONDITIONHEADCODE'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_items_to_submit=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365011556230953394)
,p_name=>'TERMSANDCONDITIONHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITIONHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select TERMSANDCONDITIONHEADNAME , tno from TERMSANDCONDITIONHEAD'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365011332951953392)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P710_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(365011224507953391)
,p_internal_uid=>332968707973543643
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(365072659464176543)
,p_interactive_grid_id=>wwv_flow_imp.id(365011224507953391)
,p_static_id=>'165797'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(365072903179176543)
,p_report_id=>wwv_flow_imp.id(365072659464176543)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365073399966176545)
,p_view_id=>wwv_flow_imp.id(365072903179176543)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(365011332951953392)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365074258031176552)
,p_view_id=>wwv_flow_imp.id(365072903179176543)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(365011390406953393)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365075215656176557)
,p_view_id=>wwv_flow_imp.id(365072903179176543)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(365011556230953394)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>297
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365076099137176562)
,p_view_id=>wwv_flow_imp.id(365072903179176543)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(365011638703953395)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365084575263219371)
,p_view_id=>wwv_flow_imp.id(365072903179176543)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(365011921606953398)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(365087963569223029)
,p_view_id=>wwv_flow_imp.id(365072903179176543)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(365012228565953401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(346779557651431948)
,p_plug_name=>'Texts'
,p_static_id=>'texts'
,p_parent_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(346779457901431947)
,p_plug_name=>'Validity'
,p_static_id=>'validity'
,p_parent_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41053712682923772)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41108664753923796)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(364452080099967400)
,p_button_name=>'Back1'
,p_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41116967341923800)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(365009205480953371)
,p_button_name=>'Back'
,p_static_id=>'back-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41052037566923772)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41053224171923772)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_condition=>'P710_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41052456537923772)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P710_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41050494958923771)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P710_QUOTATIONNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41050845846923771)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P710_QUOTATIONNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41101954814923793)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(365011122482953390)
,p_button_name=>'GetDefault'
,p_static_id=>'getdefault'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Default'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41068258673923779)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(364448803368967367)
,p_button_name=>'GetItem'
,p_static_id=>'getitem'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41050109812923771)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P710_QUOTATIONNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41051685416923772)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P710_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41052838070923772)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_condition=>'P710_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41051261488923771)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(335738823662316262)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P710_STATUS.'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P710_QUOTATIONNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(41179546631923817)
,p_branch_name=>'Go To Page 709'
,p_branch_action=>'f?p=&APP_ID.:709:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(41052456537923772)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(139365791879651384)
,p_name=>'P710_BIREPORTURL'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(335738933685316263)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90071020260926004)
,p_name=>'P710_CALCSTATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(364448803368967367)
,p_source=>'READY'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365292773124276818)
,p_name=>'P710_CALLEDFROMPAGE'
,p_item_sequence=>70
,p_item_default=>'709'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364628880791483152)
,p_name=>'P710_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364679384253483198)
,p_name=>'P710_CONTACTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Contact No'
,p_source=>'CONTACTNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364678962106483197)
,p_name=>'P710_CONTACTPERSON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Contact Person'
,p_source=>'CONTACTPERSON'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364640525467483178)
,p_name=>'P710_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364638134486483172)
,p_name=>'P710_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364672306269483198)
,p_name=>'P710_CREDITDAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(346779457901431947)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Credit Days'
,p_source=>'CREDITDAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364658727096483169)
,p_name=>'P710_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(346779425808431946)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'1'
,p_prompt=>'Currency Unit'
,p_source=>'CURRENCYUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select CURRENCYUNITNAME , CURRENCYUNITCODE from currencyunit'
,p_cSize=>30
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364659117714483171)
,p_name=>'P710_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(346779425808431946)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Currency Value'
,p_source=>'CURRENCYVALUE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364679802791483198)
,p_name=>'P710_DESIGNATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Designation'
,p_source=>'DESIGNATION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365278706469276787)
,p_name=>'P710_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(365009205480953371)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(344332654156945810)
,p_name=>'P710_DFQUANTITY1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(364448803368967367)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365279291609276793)
,p_name=>'P710_DFTOTALAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(365009205480953371)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364646233136483163)
,p_name=>'P710_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.DocTypeName as d,',
'	a.DocTypeCode as r',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c, Module d',
'where a.DocTypeCode = b.DocTypeCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode',
'    and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364636472661483169)
,p_name=>'P710_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364649077254483167)
,p_name=>'P710_ENQUIRYTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Enquiry No'
,p_post_element_text=>'<a href="f?p=&APP_ID.:708:&SESSION.::NO:RP,708:P708_TNO,P708_CALLEDFROMPAGE,P708_FORMSTATUS,P708_CALLEDFROMTNO:&P710_ENQUIRYTNO.,710,CALLED,&P710_TNO."><span class="fa fa-magic"></span></a>'
,p_source=>'ENQUIRYTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P313_ENQUIRYTNO'
,p_lov_cascade_parent_items=>'P710_LOCATIONCODE'
,p_ajax_items_to_submit=>'P710_LOCATIONCODE,P710_DOCTYPECODE,P710_FORMSTATUS'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'PARTYCODE:P710_PARTYCODE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '700')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364629300867483154)
,p_name=>'P710_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365293260229276823)
,p_name=>'P710_FORMSTATUS'
,p_item_sequence=>130
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364678204001483195)
,p_name=>'P710_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Freight Type'
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'a.FreightTypeName,',
'a.FreightTypeCode',
'',
'from Freighttype a',
'where a.modulecode =''GRN''',
'order by a.FreightTypeName'))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365279658372276796)
,p_name=>'P710_FVALUE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(365009205480953371)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(344332551511945809)
,p_name=>'P710_HSNCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(364448803368967367)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364635737032483166)
,p_name=>'P710_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364668989675483182)
,p_name=>'P710_LETTERTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(346779557651431948)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Letter Text'
,p_source=>'LETTERTEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>2000
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364645820463483162)
,p_name=>'P710_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'RC'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select locationname , locationcode from location'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364641274884483180)
,p_name=>'P710_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365293194114276822)
,p_name=>'P710_MODULEFLOW'
,p_item_sequence=>120
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364640947153483179)
,p_name=>'P710_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364681781049483203)
,p_name=>'P710_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'1'
,p_prompt=>'Nature Of Supply'
,p_source=>'NATUREOFSUPPLYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.NatureOfSupplyName,',
'a.NatureOfSupplyCode',
'from NatureOfSupply a',
'order by 1'))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365293087581276821)
,p_name=>'P710_ONTHETABLE'
,p_item_sequence=>110
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364647442882483164)
,p_name=>'P710_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P313_PARTYCODE'
,p_lov_cascade_parent_items=>'P710_ENQUIRYTNO'
,p_ajax_items_to_submit=>'P710_ENQUIRYTNO,P710_TNO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364653889996483180)
,p_name=>'P710_PARTYQUOTATIONDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Party Quotation Date'
,p_source=>'PARTYQUOTATIONDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P710_QUOTATIONDATE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364653445597483178)
,p_name=>'P710_PARTYQUOTATIONNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Party Quotation No'
,p_source=>'PARTYQUOTATIONNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365292960151276820)
,p_name=>'P710_PASSFAILREMARK'
,p_item_sequence=>100
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364619878609483146)
,p_name=>'P710_QUOTATIONAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(365094931707276699)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Quotation Amount'
,p_format_mask=>'999999999.99'
,p_source=>'QUOTATIONAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364647061582483163)
,p_name=>'P710_QUOTATIONDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Quotation Date'
,p_source=>'QUOTATIONDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364646695272483163)
,p_name=>'P710_QUOTATIONNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(346779250701431945)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Quotation No'
,p_source=>'QUOTATIONNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364668592165483181)
,p_name=>'P710_REFERENCETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(346779557651431948)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Reference Text'
,p_source=>'REFERENCETEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364675819407483188)
,p_name=>'P710_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364678569036483195)
,p_name=>'P710_REVISIONQUOTATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Revision Quotation No'
,p_source=>'REVISIONQUOTATIONTNO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365059554423953405)
,p_name=>'P710_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(364448803368967367)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365163897719276748)
,p_name=>'P710_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365292873449276819)
,p_name=>'P710_STATUSRIGHT'
,p_item_sequence=>90
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364668145804483180)
,p_name=>'P710_SUBJECTTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(346779557651431948)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Subject Text'
,p_source=>'SUBJECTTEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364619408501483145)
,p_name=>'P710_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(365094931707276699)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Sum Of Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364622998450483154)
,p_name=>'P710_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(365094931707276699)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Sum Of Footer Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFFOOTERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364669363597483183)
,p_name=>'P710_TITLETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(346779557651431948)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Title Text'
,p_source=>'TITLETEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364628529865483152)
,p_name=>'P710_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364681415997483202)
,p_name=>'P710_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(346779716176431949)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Transaction Type'
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.TransactionTypeName,',
'a.TransactionTypeCode',
'from TransactionType a, DocumentStatusDetail dsd',
'where a.TNO = dsd.ModuleTNo',
'and dsd.DocumentStatusCode = ''ACTIVE''',
'order by 1'))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364661451967483172)
,p_name=>'P710_VALIDITYDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(346779457901431947)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Validity Date'
,p_source=>'VALIDITYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364672707835483199)
,p_name=>'P710_VALIDITYDAYS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(346779457901431947)
,p_item_source_plug_id=>wwv_flow_imp.id(364558321585483094)
,p_prompt=>'Validity Days'
,p_source=>'VALIDITYDAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(90071020260926020)
,p_validation_name=>'Detail calculation must be complete'
,p_static_id=>'detail-calculation-must-be-complete'
,p_validation_sequence=>5
,p_validation=>'return :REQUEST = ''DELETE'' or nvl(:P710_CALCSTATUS,''READY'') = ''READY'';'
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Detail calculation is pending or failed. Your entered values are retained; wait for calculation to finish or edit the row again before saving.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(41070180012923779)
,p_tabular_form_region_id=>wwv_flow_imp.id(364448803368967367)
,p_validation_name=>'New_1'
,p_static_id=>'new-2'
,p_validation_sequence=>20
,p_validation=>'WITHOUTDISCOUNTRATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Without Discount Rate must have a value.'
,p_associated_column=>'WITHOUTDISCOUNTRATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41132957840923805)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>120
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(365009205480953371)
,p_triggering_element=>'FOOTERPERCENT,LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41133498461923805)
,p_event_id=>wwv_flow_imp.id(41132957840923805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,FOOTERPERCENT,FOOTERVALUE,LEGENDSCODE,P710_DFAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare	',
    '    l_original_footer_value number := nvl(:FOOTERVALUE,0);',
    '	cursor cFooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.sno < c.sno ',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	vFooterSchemeDetail cFooterSchemeDetail%ROWTYPE;',
    '	',
    '	cursor c3FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v3FooterSchemeDetail c3FooterSchemeDetail%ROWTYPE;',
    '',
    '',
    '	cursor c2FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a',
    '		where a.Status = ''ACTIVE''',
    '			and a.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v2FooterSchemeDetail c2FooterSchemeDetail%ROWTYPE;',
    '	',
    '	myFormula varchar2(1000);',
    '	isFound varchar2(10);',
    '	fvalue number;',
    '    tTotalDetailAmount number;',
    '    tmp varchar2(100);',
    '	',
    'BEGIN',
    '  /*for vBookingDetail in',
    '        (',
    '        Select',
    '            sum(a.Amount) as TotalAmount',
    '        From BookingDetail a',
    '        Where a.Tno = :P93_Tno',
    '        )',
    '    loop',
    '        tTotalDetailAmount := vBookingDetail.TotalAmount;',
    '    end loop;*/',
    '    tTotalDetailAmount := :P710_DFAMOUNT;',
    '',
    '  open c2FooterSchemeDetail;',
    '  fetch c2FooterSchemeDetail into v2FooterSchemeDetail;',
    '  if c2FooterSchemeDetail%FOUND then',
    '  		if length(nvl(v2FooterSchemeDetail.Formula,''''))>0 then',
    '  				myFormula := v2FooterSchemeDetail.Formula;',
    '  				myFormula := replace(myFormula, ''.A.'', nvl(tTotalDetailAmount,0) );',
    '  				for vFooterSchemeDetail  in cFooterSchemeDetail ',
    '  				loop',
    '					if :FooterHeadCode = vFooterSchemeDetail.FooterHeadCode then',
    '							isFound := ''YES'';',
    '							myFormula := replace(myFormula, vFooterSchemeDetail.FooterHeadCode, nvl(:FooterValue,0) );',
    '							exit;',
    '					end if;',
    '  				end loop;',
    '  				',
    '  					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0) );',
    '  			',
    '  				for v3FooterSchemeDetail  in c3FooterSchemeDetail ',
    '  				loop',
    '  						myFormula := replace(myFormula, v3FooterSchemeDetail.FooterHeadCode, ''0'' );',
    '  				end loop;',
    '  				if (:legendscode is null and NVL(GetMYparametervalue(''LEGENDS''),''YES'') = ''NO'') then ',
    '					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '					:footervalue := getvalue(myformula);',
    '			    end if;',
    '',
    '                ',
    '',
    '		  		if (:Legendscode is not null and  NVL(GetMyparametervalue(''LEGENDS''),''NO'')= ''YES'') then ',
    '		  				select getvalue(myFormula) into  fvalue 	from dual;',
    '',
    '                          ',
    '                        --tmp := :legendscode;',
    '		  				if :legendscode = ''PRA'' then ',
    '		  					 	:footervalue := nvl(round(fvalue,0),0);',
    '		  						--message(myformula);',
    '',
    '                                 ',
    '                                ',
    '		  				end if;',
    '		  				',
    '		  				if :legendscode = ''PRD'' then ',
    '		  						:footervalue := (-1)* nvl(round(fvalue,0),0);',
    '		  						--message(myformula);',
    '		  				end if;',
    '							if :legendscode is null then ',
    '									myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '							end if;',
    '							if :legendscode = ''PAA'' then ',
    '		  						:footervalue := nvl(round(fvalue,2),0);',
    '							end if;',
    '							',
    '							if :legendscode = ''PAD'' then ',
    '		  						:footervalue := (-1)* nvl(round(fvalue,2),0);',
    '							end if;',
    '		  		END IF;',
    '		  		--raise_application_error(-20000,:footervalue);',
    '  			',
    '  		end if;',
    ' end if;',
    ' :FOOTERVALUE := nvl(:FOOTERVALUE,l_original_footer_value);',
    ' end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'Y')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41136144882923806)
,p_name=>'Calculate Detail Footer Total Amount value on get focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-get-focus'
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(365009205480953371)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41136655593923806)
,p_event_id=>wwv_flow_imp.id(41136144882923806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P710_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41134401336923805)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>130
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(365009205480953371)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41134826836923806)
,p_event_id=>wwv_flow_imp.id(41134401336923805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P710_DFTOTALAMOUNT", totalAmt);')))).to_clob
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41137064061923806)
,p_name=>'Calculate Footer Total'
,p_static_id=>'calculate-footer-total'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41116967341923800)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41137529958923806)
,p_event_id=>wwv_flow_imp.id(41137064061923806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P710_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41155014350923810)
,p_name=>'Calculate Sum of Amount Value on Loose focus'
,p_static_id=>'calculate-sum-of-amount-value-on-loose-focus'
,p_event_sequence=>270
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'AMOUNT,FOOTERAMOUNT,TOTALAMOUNT,FD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41155953535923811)
,p_event_id=>wwv_flow_imp.id(41155014350923810)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("QuotationDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("AMOUNT");',
    'var footerKey = model.getFieldKey("FOOTERAMOUNT");',
    'var grandtotalKey = model.getFieldKey("TOTALAMOUNT");',
    'var totalAmt = 0;',
    'var footerAmt = 0;',
    'var grandtotalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '  var footer = parseFloat(r[footerKey], 10);',
    '  var grandtotal = parseFloat(r[grandtotalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  if (!isNaN(footer)) {',
    '    footerAmt += footer;',
    '  }',
    '',
    '  if (!isNaN(grandtotal)) {',
    '    grandtotalAmt += grandtotal;',
    '  }',
    '});',
    '',
    '$s("P710_SUMOFAMOUNT", totalAmt);',
    '$s("P710_SUMOFFOOTERAMOUNT", footerAmt);',
    '$s("P710_QUOTATIONAMOUNT", grandtotalAmt);',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41156439154923811)
,p_event_id=>wwv_flow_imp.id(41155014350923810)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("QuotationDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var grandtotalKey = model.getFieldKey("TOTALAMOUNT");',
    '',
    'var grandtotalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  ',
    '  var grandtotal = parseFloat(r[grandtotalKey], 10);',
    '',
    '  if (!isNaN(grandtotal)) {',
    '    grandtotalAmt += grandtotal;',
    '  }',
    '});',
    '',
    '$s("P710_QUOTATIONAMOUNT", grandtotalAmt);',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41155437606923811)
,p_event_id=>wwv_flow_imp.id(41155014350923810)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_QUOTATIONAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TOTALAMOUNT',
  'plsql_expression', ':TOTALAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41174821491923816)
,p_name=>'close'
,p_static_id=>'close'
,p_event_sequence=>430
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41108664753923796)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41175343969923816)
,p_event_id=>wwv_flow_imp.id(41174821491923816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(364452080099967400)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41165279492923813)
,p_name=>'delete unsaved record from detail table'
,p_static_id=>'delete-unsaved-record-from-detail-table'
,p_event_sequence=>340
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41165727539923813)
,p_event_id=>wwv_flow_imp.id(41165279492923813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from Quotationdetail a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO; ',
    '',
    ' delete from quotationdetailfooter a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    '    ',
    'delete from quotationfn a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    '',
    'delete from quotationfooter a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    ' ',
    ' delete from quotationtac a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41166197605923813)
,p_name=>'delete unsaved record from detail table_1'
,p_static_id=>'delete-unsaved-record-from-detail-table-2'
,p_event_sequence=>350
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'unload'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41166692260923813)
,p_event_id=>wwv_flow_imp.id(41166197605923813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from Quotationdetail a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO; ',
    '',
    ' delete from quotationdetailfooter a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    '    ',
    'delete from quotationfn a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    '',
    'delete from quotationfooter a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    ' ',
    ' delete from quotationtac a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41150270339923809)
,p_name=>'Delete unsaved records'
,p_static_id=>'delete-unsaved-records'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41052037566923772)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41150752585923809)
,p_event_id=>wwv_flow_imp.id(41150270339923809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from Quotationdetail a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO; ',
    '',
    ' delete from quotationdetailfooter a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    '    ',
    'delete from quotationfn a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    '',
    'delete from quotationfooter a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ',
    ' ',
    ' delete from quotationtac a',
    '    where not exists (',
    '        select 1 from Quotation  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P710_TNO;  ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41178031605923816)
,p_name=>'Detail'
,p_static_id=>'detail'
,p_event_sequence=>460
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41068258673923779)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41178565993923817)
,p_event_id=>wwv_flow_imp.id(41178031605923816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P710_TNO,P710_ENQUIRYTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '',
    'if :P710_ENQUIRYTNO is not null then',
    '    delete from quotationdetail where tno = :P710_TNO;',
    '',
    'end if;',
    '    for vloop in (select ',
    '                    itemcode , ',
    '                    ITEMSPECIFICATIONCODE , ',
    '                    DESCRIPTION , ',
    '                    QUANTITY1 , ',
    '                    QUANTITY2, ',
    '                    (select max(trim(s.hsncode)) from itemspecification s',
    '                      where s.itemspecificationcode = eid.itemspecificationcode) HSNCODE, ',
    '                    SNO ',
    '                from ENQUIRYITEMDETAIL eid ',
    '                where tno = :P710_ENQUIRYTNO)',
    '    loop',
    '        insert into QUOTATIONDETAIL ',
    '        (tno,',
    '        sno,',
    '        serialno,',
    '        itemcode,',
    '        ITEMSPECIFICATIONCODE,',
    '        DESCRIPTION,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        HSNCODE',
    '        )',
    '        values (',
    '            :P710_TNO,',
    '            globaltno.nextval,',
    '            vloop.sno,',
    '            vloop.itemcode,',
    '            vloop.ITEMSPECIFICATIONCODE,',
    '            vloop.DESCRIPTION,',
    '            vloop.QUANTITY1,',
    '            vloop.QUANTITY2,',
    '            vloop.HSNCODE',
    '        );',
    '    end loop;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41179100238923817)
,p_event_id=>wwv_flow_imp.id(41178031605923816)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(364448803368967367)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41156861258923811)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>280
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41157856856923811)
,p_event_id=>wwv_flow_imp.id(41156861258923811)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41052456537923772)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41158405549923811)
,p_event_id=>wwv_flow_imp.id(41156861258923811)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41052456537923772)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P710_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41157327287923811)
,p_event_id=>wwv_flow_imp.id(41156861258923811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41052456537923772)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41162032559923812)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>310
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41163041207923813)
,p_event_id=>wwv_flow_imp.id(41162032559923812)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41162552226923812)
,p_event_id=>wwv_flow_imp.id(41162032559923812)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41158740187923811)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>290
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41159236028923812)
,p_event_id=>wwv_flow_imp.id(41158740187923811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41052838070923772)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''NO''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41160242175923812)
,p_event_id=>wwv_flow_imp.id(41158740187923811)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41052838070923772)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P710_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41159799763923812)
,p_event_id=>wwv_flow_imp.id(41158740187923811)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41052838070923772)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''YES''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41160652460923812)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>300
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41161677762923812)
,p_event_id=>wwv_flow_imp.id(41160652460923812)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41051261488923771)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41161141919923812)
,p_event_id=>wwv_flow_imp.id(41160652460923812)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41051261488923771)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41144570605923808)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41051261488923771)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41148096104923809)
,p_event_id=>wwv_flow_imp.id(41144570605923808)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P710_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41147587141923809)
,p_event_id=>wwv_flow_imp.id(41144570605923808)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41145606290923808)
,p_event_id=>wwv_flow_imp.id(41144570605923808)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P710_TNO,P710_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--SetDocumentStatusCode(''PURCHASEORDER'',13604,:P710_STATUS);',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P710_TNO,:P710_STATUS);')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41146111773923808)
,p_event_id=>wwv_flow_imp.id(41144570605923808)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P710_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41146523927923808)
,p_event_id=>wwv_flow_imp.id(41144570605923808)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41147041746923809)
,p_event_id=>wwv_flow_imp.id(41144570605923808)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41145108793923808)
,p_event_id=>wwv_flow_imp.id(41144570605923808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41151137878923810)
,p_name=>'Enable Disable Buttons Based On Module Flow'
,p_static_id=>'enable-disable-buttons-based-on-module-flow'
,p_event_sequence=>250
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41151708616923810)
,p_event_id=>wwv_flow_imp.id(41151137878923810)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41050109812923771)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P710_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41152177236923810)
,p_event_id=>wwv_flow_imp.id(41151137878923810)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41050494958923771)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P710_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41152630461923810)
,p_event_id=>wwv_flow_imp.id(41151137878923810)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41051261488923771)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P710_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41153182569923810)
,p_event_id=>wwv_flow_imp.id(41151137878923810)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41050845846923771)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P710_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41142185745923807)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41050494958923771)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41143207145923808)
,p_event_id=>wwv_flow_imp.id(41142185745923807)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P710_TNO,P710_COMPANYCODE,P710_PORECEIPTNO,P710_PASSFAILREMARK',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '		cursor cPassFail is',
    '				select',
    '						a.TNo,',
    '						a.TokenNo										',
    '				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '				where a.ModuleFlowTNo = b.TNo',
    '						and b.TNo = c.TNo',
    '						and a.BossUserCode = c.BossUserCode',
    '						and c.BossUserCode = d.BossUserCode',
    '						--and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '                        AND A.ModuleTno = :P710_TNO',
    '						--and d.LoginName = User',
    '						AND d.BossuserName = :APP_USER',
    '                        and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100) := :P710_TNO;',
    'begin',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = :P710_PASSFAILREMARK',
    '				where a.TNo = vPassFail.TNo;',
    '				COMMIT;',
    '				SendBackPassFail(tTokenNo , TMP );',
    '		    		',
    '				',
    '				commit;',
    '		else',
    '				close cPassFail;',
    '		end if;',
    '',
    '	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41143655370923808)
,p_event_id=>wwv_flow_imp.id(41142185745923807)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41144118419923808)
,p_event_id=>wwv_flow_imp.id(41142185745923807)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41142710875923808)
,p_event_id=>wwv_flow_imp.id(41142185745923807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41175723767923816)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>440
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41051685416923772)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41176305551923816)
,p_event_id=>wwv_flow_imp.id(41175723767923816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41137961044923806)
,p_name=>'Hide'
,p_static_id=>'hide'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41116967341923800)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41138462044923806)
,p_event_id=>wwv_flow_imp.id(41137961044923806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(365009205480953371)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41163454279923813)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>320
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41163988683923813)
,p_event_id=>wwv_flow_imp.id(41163454279923813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41124903852923803)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41125335170923803)
,p_event_id=>wwv_flow_imp.id(41124903852923803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41126635235923803)
,p_name=>'Initialize SNO Sequence_1'
,p_static_id=>'initialize-sno-sequence-2'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(365011122482953390)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41127130057923803)
,p_event_id=>wwv_flow_imp.id(41126635235923803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41176710578923816)
,p_name=>'Insert into tac'
,p_static_id=>'insert-into-tac'
,p_event_sequence=>450
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41101954814923793)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41177213883923816)
,p_event_id=>wwv_flow_imp.id(41176710578923816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P710_TNO,P710_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from quotationtac where tno = :P710_TNO;',
    'insert into quotationtac',
    '(',
    '    TNO, ',
    '    SNO, ',
    '    TERMSANDCONDITIONHEADCODE, ',
    '    TERMSANDCONDITION',
    ')',
    '(',
    '    SELECT',
    '        :P710_TNO,',
    '        globaltno.nextval,',
    '        termsandconditionheadcode,',
    '        termsandconditionvalue',
    '    FROM',
    '        moduledoctypewisetacdetail',
    '    WHERE',
    '        tno IN (',
    '            SELECT',
    '                tno',
    '            FROM',
    '                moduledoctypewisetac',
    '            WHERE',
    '                    modulecode = getModuleCodeForPageNo(:APP_PAGE_ID)',
    '                AND doctypecode = :P710_DOCTYPECODE',
    '        )',
    ');',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41177634816923816)
,p_event_id=>wwv_flow_imp.id(41176710578923816)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(365011122482953390)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41173040741923815)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>410
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P710_CONTACTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41173612658923815)
,p_event_id=>wwv_flow_imp.id(41173040741923815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41149409661923809)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41052037566923772)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41149843250923809)
,p_event_id=>wwv_flow_imp.id(41149409661923809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P710_CALLEDFROMPAGE'').getValue();',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41164414934923813)
,p_name=>'New'
,p_static_id=>'new-2'
,p_event_sequence=>330
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41164842672923813)
,p_event_id=>wwv_flow_imp.id(41164414934923813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'ui-dialog-titlebar-close .ui-icon')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41139745466923807)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41050109812923771)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41140804157923807)
,p_event_id=>wwv_flow_imp.id(41139745466923807)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P710_TNO,P710_COMPANYCODE,P710_PASSFAILREMARK,P710_PORECEIPTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) := :P710_PORECEIPTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P710_TNO --'':P''||:APP_PAGE_ID||''_TNo''',
    '				--and d.LoginName = User',
    '                AND D.BOSSUSERNAME = :APP_USER',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    /*select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '    */',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = :P710_PASSFAILREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(getModuleCodeForPageNo(:APP_PAGE_ID), :P710_TNO , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41141309035923807)
,p_event_id=>wwv_flow_imp.id(41139745466923807)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41141740161923807)
,p_event_id=>wwv_flow_imp.id(41139745466923807)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41140304366923807)
,p_event_id=>wwv_flow_imp.id(41139745466923807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41148495234923809)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41051261488923771)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41148960930923809)
,p_event_id=>wwv_flow_imp.id(41148495234923809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41130228590923804)
,p_name=>'Set Amount'
,p_static_id=>'set-amount'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41130732741923804)
,p_event_id=>wwv_flow_imp.id(41130228590923804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,QUANTITY1',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select (nvl(:WITHOUTDISCOUNTRATE,0) - (NVL(:WITHOUTDISCOUNTRATE,0)* (NVL(:DISCOUNTPERCENTAGE,0)/100)))',
    '    * nvl(:QUANTITY1,0)',
    'FROM DUAL')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41168016454923814)
,p_name=>'set amount'
,p_static_id=>'set-amount-2'
,p_event_sequence=>370
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'QUANTITY1,RATE,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,RATEMEASURINGUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41168478745923814)
,p_event_id=>wwv_flow_imp.id(41168016454923814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1,QUANTITY2,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT,RATE,AMOUNT,TOTALAMOUNT,FOOTERAMOUNT,P710_HSNCODE,P710_DFAMOUNT',
  'items_to_submit', 'QUANTITY1,QUANTITY2,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT,RATE,AMOUNT,TOTALAMOUNT,TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,RATEMEASURINGUNITCODE,P710_PARTYCODE,P710_TRANSACTIONTYPECODE,P710_HSNCODE,P710_FORMSTATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    '    unit1 varchar2(30);',
    '    unit2 varchar2(30);',
    '    tmp    number;',
    '    phsn varchar(30);',
    ' ',
    'begin',
    '    :Quantity1 := round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '    select nvl(max(MULTIPLYINGFACTOR),1) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;      ',
    '    :quantity2 := round(:QUANTITY1*mfactor,3);',
    '    ',
    '    :DISCOUNTRATE := (nvl(:DISCOUNTPERCENTAGE,0)/100)*nvl(:WITHOUTDISCOUNTRATE,0);',
    '        ',
    '    :RATEAFTERDISCOUNT := nvl(:WITHOUTDISCOUNTRATE,0) - nvl(:discountrate,0) ;',
    '    if :RATE is null then :RATE := :RATEAFTERDISCOUNT; end if;',
    '',
    '    select max(MEASURINGUNITCODE1), max(MEASURINGUNITCODE2)',
    '      into unit1, unit2',
    '      from item',
    '     where itemcode = :ITEMCODE;',
    '    ',
    '    if :RATEMEASURINGUNITCODE = unit2 then',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY2,0);',
    '    else ',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);',
    '    end if;',
    '    :P710_DFAMOUNT   := :Amount ;',
    '    :P710_DFQUANTITY1 := :Quantity1;',
    '    select max(trim(hsncode)) INTO :P710_HSNCODE from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   ---- INSERT INTO FOOTER DETAIL',
    '    ',
    '    if nvl(:Rate,0) > 0',
    '       and :TNO is not null',
    '       and :SNO is not null',
    '       and :P710_PARTYCODE is not null',
    '       and :P710_TRANSACTIONTYPECODE is not null',
    '       and :P710_HSNCODE is not null then',
    '    --raise_application_error(-20000,''100'');',
    '    --  RAISE_APPLICATION_ERROR(-20000,''party ''||:P710_PARTYCODE||''tr type ''||:P710_TRANSACTIONTYPECODE||'' hsn ''||:P710_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P710_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '           DELETE FROM QUOTATIONDETAILFOOTER WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    '    for vTaxRule',
    '		in (',
    '			/*select',
    '				rownum as slno,',
    '				b.TNo,',
    '				b.SNO,',
    '				a.LegendsCode,',
    '				c.FooterHeadCode,',
    '				c.FooterHeadName,',
    '				b.TaxRate as FooterPercent,',
    '                (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '			from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '			where a.TNO = b.TNo',
    '				and a.SNO = b.SNo',
    '				and b.FooterHeadCode = c.FooterHeadCode',
    '				and a.TNO = d.TNo',
    '                and d.tno = e.tno',
    '                and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                and f.PartyCode = :P710_PARTYCODE',
    '                And d.transactiontypecode = :P710_TRANSACTIONTYPECODE',
    '                and e.HSNCODE = :P710_HSNCODE',
    '            UNION ALL',
    '            */',
    '         select',
    '			rownum as slno,',
    '			b.TNo,',
    '			b.SNO,',
    '			a.LegendsCode,',
    '			c.FooterHeadCode,',
    '			c.FooterHeadName,',
    '			b.TaxRate as FooterPercent,',
    '            (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '		from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, vendor F',
    '		where a.TNO = b.TNo',
    '			and a.SNO = b.SNo',
    '			and b.FooterHeadCode = c.FooterHeadCode',
    '			and a.TNO = d.TNo',
    '            and d.tno = e.tno',
    '            and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '            and f.VendorCode = :P710_PARTYCODE',
    '            And d.transactiontypecode = :P710_TRANSACTIONTYPECODE',
    '            and e.HSNCODE = :P710_HSNCODE    ',
    '			--order by b.SNo',
    '		)',
    '	loop',
    '-- raise_application_error(-20000,phsn);	',
    '--if nvl(:rate,0) > 0 then',
    '--RAISE_APPLICATION_ERROR(-20000,''party ''||:P710_PARTYCODE||''tr type ''||:P710_TRANSACTIONTYPECODE||'' hsn ''||:P710_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P710_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRule.FooterVal'
||'ue);',
    '--end if;',
    '	    Insert into QUOTATIONDETAILFOOTER',
    '        (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '		values',
    '        (:TNO,:SNO,globaltno.nextval,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '	',
    '	end loop; -- for vTaxRule',
    '    commit;',
    'end if;',
    '',
    '   ----',
    '   SELECT SUM(FOOTERVALUE) INTO :footeramount from QUOTATIONDETAILFOOTER',
    '   where tno = :TNO',
    '     and sno = :SNO;',
    '   ',
    '   :Totalamount := nvl(:amount,0) + nvl(:footeramount,0);',
    '',
    'end;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41168971108923814)
,p_event_id=>wwv_flow_imp.id(41168016454923814)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'setTimeout(function(){',
    'let model = apex.region("QuotationDetail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let quantity1_total = 0;',
    'let quantity2_total = 0;',
    'let discountrate_total = 0;',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '    if (model.getValue(record, "QUANTITY2") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity2_total += Number(model.getValue(record, "QUANTITY2"));',
    '    }',
    '    if (model.getValue(record, "DISCOUNTRATE") !== "" && !meta.deleted && !meta.agg) {',
    '        discountrate_total += Number(model.getValue(record, "DISCOUNTRATE"));',
    '    }',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '$s(''P710_SUMOFAMOUNT'',amount_total);',
    '$s(''P710_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P710_QUOTATIONAMOUNT'',totalamount_total);',
    '',
    '},400',
    ');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41123942292923803)
,p_name=>'Set CurrValue'
,p_static_id=>'set-currvalue'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P710_CURRENCYUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41124459647923803)
,p_event_id=>wwv_flow_imp.id(41123942292923803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P710_CURRENCYUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CURRENCYVALUE from currencyunit',
    'where CURRENCYUNITCODE = :P710_CURRENCYUNITCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41153599299923810)
,p_name=>'set details'
,p_static_id=>'set-details'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P710_ENQUIRYTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41154102191923810)
,p_event_id=>wwv_flow_imp.id(41153599299923810)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P710_TNO,P710_ENQUIRYTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '',
    '    for vloop in (select ',
    '                    itemcode , ',
    '                    ITEMSPECIFICATIONCODE , ',
    '                    DESCRIPTION , ',
    '                    QUANTITY1 , ',
    '                    QUANTITY2, ',
    '                    (select max(trim(s.hsncode)) from itemspecification s',
    '                      where s.itemspecificationcode = eid.itemspecificationcode) HSNCODE, ',
    '                    SNO ',
    '                from ENQUIRYITEMDETAIL eid ',
    '                where tno = :P710_ENQUIRYTNO)',
    '    loop',
    '        insert into QUOTATIONDETAIL ',
    '        (tno,',
    '        sno,',
    '        serialno,',
    '        itemcode,',
    '        ITEMSPECIFICATIONCODE,',
    '        DESCRIPTION,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        HSNCODE',
    '        )',
    '        values (',
    '            :P710_TNO,',
    '            globaltno.nextval,',
    '            vloop.sno,',
    '            vloop.itemcode,',
    '            vloop.ITEMSPECIFICATIONCODE,',
    '            vloop.DESCRIPTION,',
    '            vloop.QUANTITY1,',
    '            vloop.QUANTITY2,',
    '            vloop.HSNCODE',
    '        );',
    '    end loop;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41154557817923810)
,p_event_id=>wwv_flow_imp.id(41153599299923810)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(364448803368967367)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41132076469923805)
,p_name=>'Set DFAMOUNT'
,p_static_id=>'set-dfamount'
,p_event_sequence=>110
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41132601405923805)
,p_event_id=>wwv_flow_imp.id(41132076469923805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_DFAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT',
  'sql_query', 'select :AMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41127574501923803)
,p_name=>'Set discount rate'
,p_static_id=>'set-discount-rate'
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41128025761923804)
,p_event_id=>wwv_flow_imp.id(41127574501923803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DISCOUNTRATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select NVL(:WITHOUTDISCOUNTRATE,0)* (NVL(:DISCOUNTPERCENTAGE,0)/100)',
    'FROM DUAL')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41173922492923815)
,p_name=>'set hsn'
,p_static_id=>'set-hsn'
,p_event_sequence=>420
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41174423387923816)
,p_event_id=>wwv_flow_imp.id(41173922492923815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', 'select trim(hsncode)  from itemspecification where itemspecificationcode = :itemspecificationcode;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41138890923923807)
,p_name=>'Set Other and Total Amount'
,p_static_id=>'set-other-and-total-amount'
,p_event_sequence=>180
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'FD,AMOUNT,FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41139353041923807)
,p_event_id=>wwv_flow_imp.id(41138890923923807)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERAMOUNT,TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P710_FVALUE,P710_DFAMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:P710_FVALUE,0) as A , nvl(:P710_FVALUE,0)+nvl(:P710_DFAMOUNT,0) as B',
    'from dual  ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41125811703923803)
,p_name=>'Set Page Item SNO'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41126221407923803)
,p_event_id=>wwv_flow_imp.id(41125811703923803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "SNO");',
    '',
    'apex.item( "P710_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41128435608923804)
,p_name=>'Set Rate After Discount'
,p_static_id=>'set-rate-after-discount'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41128984969923804)
,p_event_id=>wwv_flow_imp.id(41128435608923804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATEAFTERDISCOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:WITHOUTDISCOUNTRATE,0) - (NVL(:WITHOUTDISCOUNTRATE,0)* (NVL(:DISCOUNTPERCENTAGE,0)/100))',
    'FROM DUAL')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41129331503923804)
,p_name=>'Set Rate After Discount_1'
,p_static_id=>'set-rate-after-discount-2'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41129834342923804)
,p_event_id=>wwv_flow_imp.id(41129331503923804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:WITHOUTDISCOUNTRATE,0) - (NVL(:WITHOUTDISCOUNTRATE,0)* (NVL(:DISCOUNTPERCENTAGE,0)/100))',
    'FROM DUAL')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41131143603923805)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>100
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(365009205480953371)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41131656487923805)
,p_event_id=>wwv_flow_imp.id(41131143603923805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERHEADCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '      SNO',
    'From  FOOTERSCHEMEDETAIL',
    'Where FooterHeadCode = :FOOTERHEADCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41167021404923813)
,p_name=>'Set Sn'
,p_static_id=>'set-sn'
,p_event_sequence=>360
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(365009205480953371)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41167590808923814)
,p_event_id=>wwv_flow_imp.id(41167021404923813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SN',
  'plsql_expression', 'nvl(:sn , globaltno.nextval)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41171279119923815)
,p_name=>'set sno page item'
,p_static_id=>'set-sno-page-item'
,p_event_sequence=>390
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'SNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41171757658923815)
,p_event_id=>wwv_flow_imp.id(41171279119923815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_expression', ':sno',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41172172099923815)
,p_name=>'set transaction type code'
,p_static_id=>'set-transaction-type-code'
,p_event_sequence=>400
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P710_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41172626293923815)
,p_event_id=>wwv_flow_imp.id(41172172099923815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P710_PARTYCODE,P710_COMPANYCODE,P710_LOCATIONCODE,P710_DOCTYPECODE,P710_QUOTATIONDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    'GetTransactionTypeCodeFor(:P710_PARTYCODE , :P710_LOCATIONCODE , :P710_DOCTYPECODE , :P710_COMPANYCODE , :P710_QUOTATIONDATE) as A   ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41169860550923814)
,p_name=>'set uom'
,p_static_id=>'set-uom'
,p_event_sequence=>380
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(364448803368967367)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41170397466923815)
,p_event_id=>wwv_flow_imp.id(41169860550923814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATEMEASURINGUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', 'select MEASURINGUNITCODE1 from ITEM WHERE ITEMCODE = :ITEMCODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41170840219923815)
,p_event_id=>wwv_flow_imp.id(41169860550923814)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT1,UNIT2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', 'select GetMeasuringUnitNameFromItem(:ITEMCODE) as unit1, GetMeasuringUnit2NameFromItem(:ITEMCODE) as unit2 from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41123086526923802)
,p_name=>'Set Validity Date'
,p_static_id=>'set-validity-date'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P710_VALIDITYDAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41123588568923802)
,p_event_id=>wwv_flow_imp.id(41123086526923802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P710_VALIDITYDATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P710_VALIDITYDAYS,P710_PARTYQUOTATIONDATE',
  'sql_query', 'select TO_DATE(:P710_PARTYQUOTATIONDATE,''DD-MM-YYYY'') + nvl(TO_NUMBER(:P710_VALIDITYDAYS),0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41135242887923806)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(365009205480953371)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41135801765923806)
,p_event_id=>wwv_flow_imp.id(41135242887923806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("DetailFooter").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P710_FVALUE").setValue(n_totamt);')))).to_clob
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'window.hsplPhase1WasEdited(this)'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41121028265923802)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete details'
,p_static_id=>'delete-details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from QUOTATIONDETAILQUALITY where tno = :P710_TNO;',
'delete from QUOTATIONDETAILFOOTER where tno = :P710_TNO;',
'delete from QUOTATIONDETAIL where tno = :P710_TNO;',
'delete from QUOTATIONTAC where tno = :P710_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(41052456537923772)
,p_internal_uid=>9078511731514054
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41122706603923802)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Det Doc No'
,p_static_id=>'det-doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P710_TNO is null then',
'        Select GlobalTno.NextVal into :P710_TNO From Dual;',
'     end if;',
'    ----',
'    if :P710_QUOTATIONNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P710_LOCATIONCODE,',
'					:P710_DOCTYPECODE,',
'					NULL,',
'					TO_DATE(:P710_QUOTATIONDATE, ''DD-MM-RRRR'')',
'				);',
'        :P710_QUOTATIONNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P710_LOCATIONCODE,',
'                    :P710_DOCTYPECODE,',
'                    NULL,',
'                    TO_DATE(:P710_QUOTATIONDATE, ''DD-MM-RRRR'')',
'                    );',
'        if :P710_QUOTATIONNO is null then',
'            raise_application_error(-20001,',
'                ''Purchase Quotation number could not be generated. Configure numbering for company, financial year and location before saving.'');',
'        end if;',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9080190069514054
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41118346882923800)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(365009205480953371)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'DetailFooter - Save Interactive Grid Data'
,p_static_id=>'detailfooter-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9075830348514052
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41109215782923797)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(364452080099967400)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'DetailQuality - Save Interactive Grid Data'
,p_static_id=>'detailquality-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9066699248514049
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41121456136923802)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get on the table'
,p_static_id=>'get-on-the-table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P710_MODULEFLOW := ''YES'';',
'   else',
'       :P710_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P71_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P710_ONTHETABLE := ''YES'' ;',
'   else',
'       :P710_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9078939602514054
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41120715593923802)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Tno'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P710_TNO is null then',
'    select globaltno.nextval into :P710_TNO from dual;',
'    :P710_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P710_FORMSTATUS := ''EDITRECORD'';',
'end if; ',
':P710_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P710_TNO), ''Status'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9078199059514054
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41080407891923784)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(364558321585483094)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Quotation'
,p_static_id=>'initialize-form-quotation'
,p_internal_uid=>9037891357514036
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90071020260926030)
,p_process_sequence=>5
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'P710_CALCULATE_DETAIL'
,p_static_id=>'p710-calculate-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_tno number;',
'    l_sno number;',
'    l_source_serial number;',
'    l_detail_exists number;',
'    l_quantity1 number;',
'    l_quantity2 number;',
'    l_rate number;',
'    l_base_rate number;',
'    l_discount_percent number;',
'    l_discount_rate number;',
'    l_rate_after_discount number;',
'    l_amount number;',
'    l_footer_amount number := 0;',
'    l_total_amount number;',
'    l_factor number := 1;',
'    l_unit1 varchar2(30);',
'    l_unit2 varchar2(30);',
'    l_rate_unit varchar2(30);',
'    l_hsn varchar2(30);',
'    function num(p_value varchar2) return number is',
'    begin',
'        return to_number(replace(nvl(trim(p_value),''0''),'','',''''));',
'    exception when others then',
'        return 0;',
'    end;',
'begin',
'    l_tno := num(apex_application.g_x01);',
'    l_sno := num(apex_application.g_x02);',
'    l_source_serial := case when trim(apex_application.g_x11) is null then null else num(apex_application.g_x11) end;',
'    l_quantity1 := num(apex_application.g_x05);',
'    l_rate := num(apex_application.g_x06);',
'    l_base_rate := num(apex_application.g_x07);',
'    l_discount_percent := num(apex_application.g_x08);',
'',
'    select max(i.measuringunitcode1), max(i.measuringunitcode2)',
'      into l_unit1, l_unit2',
'      from item i',
'     where i.itemcode = apex_application.g_x03;',
'',
'    select nvl(max(s.multiplyingfactor),1), max(trim(s.hsncode))',
'      into l_factor, l_hsn',
'      from itemspecification s',
'     where s.itemspecificationcode = apex_application.g_x04;',
'',
'    l_quantity1 := round(l_quantity1, getuomdecimal(GetMeasuringUnitCodeFromItem(apex_application.g_x03)));',
'    l_quantity2 := round(l_quantity1 * l_factor, 3);',
'    l_discount_rate := (l_discount_percent / 100) * l_base_rate;',
'    l_rate_after_discount := l_base_rate - l_discount_rate;',
'    if trim(apex_application.g_x06) is null then',
'        l_rate := l_rate_after_discount;',
'    end if;',
'    l_rate_unit := nvl(trim(apex_application.g_x09), l_unit1);',
'    if l_unit2 is not null and l_rate_unit = l_unit2 then',
'        l_amount := l_rate * l_quantity2;',
'    else',
'        l_amount := l_rate * l_quantity1;',
'    end if;',
'',
'    select count(*) into l_detail_exists',
'      from quotationdetail',
'     where tno = l_tno and sno = l_sno;',
'    if l_detail_exists = 0 and l_source_serial is not null then',
'        select max(sno) into l_sno',
'          from quotationdetail',
'         where tno = l_tno and serialno = l_source_serial;',
'    end if;',
'',
'    if l_tno is not null and l_sno is not null and :P710_PARTYCODE is not null',
'       and :P710_TRANSACTIONTYPECODE is not null and l_hsn is not null then',
'        delete from quotationdetailfooter where tno = l_tno and sno = l_sno;',
'        for r in (',
'            select rownum slno, a.legendscode, c.footerheadcode,',
'                   b.taxrate footerpercent, (l_amount * b.taxrate) / 100 footervalue',
'              from taxruledetail a',
'              join taxruledetailfooter b on b.tno = a.tno and b.sno = a.sno',
'              join footerhead c on c.footerheadcode = b.footerheadcode',
'              join taxrule d on d.tno = a.tno',
'              join taxrulehsn e on e.tno = d.tno',
'              join vendor f on f.taxregistrationtypecode = d.taxregistrationtypecode',
'             where f.vendorcode = :P710_PARTYCODE',
'               and d.transactiontypecode = :P710_TRANSACTIONTYPECODE',
'               and e.hsncode = l_hsn',
'        ) loop',
'            insert into quotationdetailfooter',
'                (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
'            values',
'                (l_tno,l_sno,globaltno.nextval,r.footerheadcode,r.footerpercent,r.footervalue,r.slno,r.legendscode);',
'        end loop;',
'        select nvl(sum(footervalue),0)',
'          into l_footer_amount',
'          from quotationdetailfooter',
'         where tno = l_tno and sno = l_sno;',
'    end if;',
'',
'    l_total_amount := nvl(l_amount,0) + nvl(l_footer_amount,0);',
'    apex_json.open_object;',
'    apex_json.write(''success'', true);',
'    apex_json.write(''sno'', l_sno);',
'    apex_json.write(''revision'', apex_application.g_x10);',
'    apex_json.write(''quantity2'', l_quantity2);',
'    apex_json.write(''unit1'', l_unit1);',
'    apex_json.write(''unit2'', l_unit2);',
'    apex_json.write(''rmu'', l_rate_unit);',
'    apex_json.write(''discountRate'', l_discount_rate);',
'    apex_json.write(''rateAfterDiscount'', l_rate_after_discount);',
'    apex_json.write(''amount'', l_amount);',
'    apex_json.write(''footerAmount'', l_footer_amount);',
'    apex_json.write(''totalAmount'', l_total_amount);',
'    apex_json.write(''hsn'', l_hsn);',
'    apex_json.close_object;',
'exception when others then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''success'', false);',
'    apex_json.write(''message'', sqlerrm);',
'    apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>90071020260926030
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90071020260926031)
,p_process_sequence=>6
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'P710_PREPARE_FD'
,p_static_id=>'p710-prepare-fd'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_tno number;',
'    l_sno number;',
'    l_amount number;',
'    l_spec varchar2(60);',
'    l_hsn varchar2(30);',
'    l_expected_count number;',
'    l_expected_amount number;',
'    l_actual_count number;',
'    l_actual_amount number;',
'    function num(p_value varchar2) return number is',
'    begin',
'        return to_number(replace(nvl(trim(p_value),''0''),'','',''''));',
'    exception when others then',
'        return 0;',
'    end;',
'begin',
'    l_tno := num(apex_application.g_x01);',
'    l_sno := num(apex_application.g_x02);',
'    l_amount := num(apex_application.g_x04);',
'',
'    l_spec := trim(apex_application.g_x03);',
'    if l_spec is null then',
'        select max(itemspecificationcode) into l_spec',
'          from quotationdetail',
'         where tno = l_tno and sno = l_sno;',
'    end if;',
'    select max(trim(hsncode)) into l_hsn',
'      from itemspecification',
'     where itemspecificationcode = l_spec;',
'',
'    select count(*), nvl(sum(footervalue),0)',
'      into l_actual_count, l_actual_amount',
'      from quotationdetailfooter',
'     where tno = l_tno and sno = l_sno;',
'    l_expected_count := l_actual_count;',
'    l_expected_amount := l_actual_amount;',
'',
'    if :P710_PARTYCODE is not null and :P710_TRANSACTIONTYPECODE is not null',
'       and l_hsn is not null and l_tno is not null and l_sno is not null then',
'        select count(*), nvl(sum((l_amount * b.taxrate) / 100),0)',
'          into l_expected_count, l_expected_amount',
'          from taxruledetail a',
'          join taxruledetailfooter b on b.tno = a.tno and b.sno = a.sno',
'          join footerhead c on c.footerheadcode = b.footerheadcode',
'          join taxrule d on d.tno = a.tno',
'          join taxrulehsn e on e.tno = d.tno',
'          join vendor f on f.taxregistrationtypecode = d.taxregistrationtypecode',
'         where f.vendorcode = :P710_PARTYCODE',
'           and d.transactiontypecode = :P710_TRANSACTIONTYPECODE',
'           and e.hsncode = l_hsn;',
'',
'        if l_actual_count <> l_expected_count',
'           or abs(l_actual_amount - l_expected_amount) > .005 then',
'            delete from quotationdetailfooter where tno = l_tno and sno = l_sno;',
'            for r in (',
'                select rownum slno, a.legendscode, c.footerheadcode,',
'                       b.taxrate footerpercent, (l_amount * b.taxrate) / 100 footervalue',
'                  from taxruledetail a',
'                  join taxruledetailfooter b on b.tno = a.tno and b.sno = a.sno',
'                  join footerhead c on c.footerheadcode = b.footerheadcode',
'                  join taxrule d on d.tno = a.tno',
'                  join taxrulehsn e on e.tno = d.tno',
'                  join vendor f on f.taxregistrationtypecode = d.taxregistrationtypecode',
'                 where f.vendorcode = :P710_PARTYCODE',
'                   and d.transactiontypecode = :P710_TRANSACTIONTYPECODE',
'                   and e.hsncode = l_hsn',
'            ) loop',
'                insert into quotationdetailfooter',
'                    (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
'                values',
'                    (l_tno,l_sno,globaltno.nextval,r.footerheadcode,r.footerpercent,r.footervalue,r.slno,r.legendscode);',
'            end loop;',
'            l_actual_amount := l_expected_amount;',
'        end if;',
'    end if;',
'',
'    /* The FD dialog refresh is a separate APEX request. Persist the exact',
'       clicked-row footer rebuild before that request reads the IG source. */',
'    commit;',
'',
'    apex_json.open_object;',
'    apex_json.write(''success'', true);',
'    apex_json.write(''sno'', l_sno);',
'    apex_json.write(''footerAmount'', l_actual_amount);',
'    apex_json.write(''footerRows'', l_expected_count);',
'    apex_json.close_object;',
'exception when others then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''success'', false);',
'    apex_json.write(''sno'', l_sno);',
'    apex_json.write(''message'', sqlerrm);',
'    apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>90071020260926031
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41122263595923802)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_static_id=>'prepare-url'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(2000);',
'begin',
'   result:=apex_util.prepare_url(apex_application.g_x01);',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9079747061514054
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41080724252923784)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(364558321585483094)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Quotation'
,p_static_id=>'process-form-quotation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9038207718514036
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41070432871923780)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(364448803368967367)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'QuotationDetail - Save Interactive Grid Data'
,p_static_id=>'quotationdetail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into QUOTATIONDETAIL (                 ',
'                    TNO,',
'					SNO,',
'					SERIALNO,',
'					ITEMCODE,',
'					ITEMSPECIFICATIONCODE,',
'					DESCRIPTION,',
'					QUANTITY1,',
'					QUANTITY2,',
'					RATEMEASURINGUNITCODE,',
'					RATE,',
'					AMOUNT,',
'					FOOTERAMOUNT,',
'					TOTALAMOUNT,',
'					REMARK,',
'					WITHOUTDISCOUNTRATE,',
'					DISCOUNTPERCENTAGE,',
'					DISCOUNTRATE,',
'					HSNCODE,',
'					ISRATEINCLUSIVETAX,',
'					RATEAFTERDISCOUNT',
'',
'            )',
'            Values (',
'                :TNO,',
'				:SNO,',
'				:SERIALNO,',
'				:ITEMCODE,',
'				:ITEMSPECIFICATIONCODE,',
'				:DESCRIPTION,',
'				:QUANTITY1,',
'				:QUANTITY2,',
'				:RATEMEASURINGUNITCODE,',
'				:RATE,',
'				:AMOUNT,',
'				:FOOTERAMOUNT,',
'				:TOTALAMOUNT,',
'				:REMARK,',
'				:WITHOUTDISCOUNTRATE,',
'				:DISCOUNTPERCENTAGE,',
'				:DISCOUNTRATE,',
'				:HSNCODE,',
'				:ISRATEINCLUSIVETAX,',
'				:RATEAFTERDISCOUNT',
'              ',
'',
'            );',
'        ',
'        when ''U'' then',
'            update QUOTATIONDETAIL Set',
'                  TNO = :TNO,',
'				SNO = :SNO,',
'				SERIALNO = :SERIALNO,',
'				ITEMCODE = :ITEMCODE,',
'				ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE,',
'				DESCRIPTION = :DESCRIPTION,',
'				QUANTITY1 = :QUANTITY1,',
'				QUANTITY2 = :QUANTITY2,',
'				RATEMEASURINGUNITCODE = :RATEMEASURINGUNITCODE,',
'				RATE = :RATE,',
'				AMOUNT = :AMOUNT,',
'				FOOTERAMOUNT = :FOOTERAMOUNT,',
'				TOTALAMOUNT = :TOTALAMOUNT,',
'				REMARK = :REMARK,',
'				WITHOUTDISCOUNTRATE = :WITHOUTDISCOUNTRATE,',
'				DISCOUNTPERCENTAGE = :DISCOUNTPERCENTAGE,',
'				DISCOUNTRATE = :DISCOUNTRATE,',
'				HSNCODE = :HSNCODE,',
'				ISRATEINCLUSIVETAX = :ISRATEINCLUSIVETAX,',
'				RATEAFTERDISCOUNT = :RATEAFTERDISCOUNT           ',
'            WHERE TNO = :P710_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From QUOTATIONDETAILQUALITY',
'            Where TNo = :P710_TNO',
'              and SNO = :SNO;',
'            Delete From QUOTATIONDETAILFOOTER',
'            Where TNo = :P710_TNO',
'              and SNO = :SNO;',
'            Delete From QUOTATIONDETAIL',
'            Where TNo = :P710_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9027916337514032
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41121826993923802)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P710_TNO, :P710_QUOTATIONNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(41053224171923772)
,p_internal_uid=>9079310459514054
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41102438789923794)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(365011122482953390)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Terms and Condition - Save Interactive Grid Data'
,p_static_id=>'terms-and-condition-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9059922255514046
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90071020260926032)
,p_process_sequence=>75
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify quotation calculations before commit'
,p_static_id=>'verify-quotation-calculations-before-commit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_errors varchar2(2000);',
'    l_error_count pls_integer := 0;',
'    l_detail_count number;',
'    l_item_count number;',
'    l_spec_count number;',
'    l_unit1 varchar2(30);',
'    l_unit2 varchar2(30);',
'    l_rate_unit varchar2(30);',
'    l_hsn varchar2(30);',
'    l_factor number;',
'    l_q1 number;',
'    l_q2 number;',
'    l_discount number;',
'    l_rate_after_discount number;',
'    l_amount number;',
'    l_expected_footer number;',
'    l_actual_footer number;',
'    l_expected_footer_count number;',
'    l_actual_footer_count number;',
'    l_tax_line_bad number;',
'    l_sum_amount number;',
'    l_sum_footer number;',
'    l_sum_total number;',
'    l_header_amount number;',
'    l_header_footer number;',
'    l_header_total number;',
'    l_header_count number;',
'',
'    procedure add_error(p_message varchar2) is',
'    begin',
'        if l_error_count < 10 and nvl(length(l_errors),0) < 1750 then',
'            l_error_count := l_error_count + 1;',
'            l_errors := l_errors || case when l_errors is null then null else '' | '' end ||',
'                        substr(p_message,1,350);',
'        end if;',
'    end;',
'',
'    function different(p_actual number, p_expected number, p_tolerance number) return boolean is',
'    begin',
'        if p_actual is null or p_expected is null then',
'            return not (p_actual is null and p_expected is null);',
'        end if;',
'        return abs(p_actual-p_expected) > p_tolerance;',
'    end;',
'',
'    function amount_text(p_value number) return varchar2 is',
'    begin',
'        if p_value is null then return ''<blank>''; end if;',
'        return to_char(round(p_value,2),''FM999999999999990D00'',''NLS_NUMERIC_CHARACTERS=''''.,'''''');',
'    end;',
'begin',
'    if upper(nvl(:REQUEST,''?'')) not in (''SAVE'',''CREATE'') then',
'        return;',
'    end if;',
'',
'    if :P710_TNO is null then',
'        raise_application_error(-20020,''Save blocked: quotation key is missing. No data was saved.'');',
'    end if;',
'',
'    select count(*) into l_detail_count from quotationdetail where tno=:P710_TNO;',
'    if l_detail_count=0 then',
'        add_error(''Detail: at least one item/service row is required'');',
'    end if;',
'',
'    for d in (select sno, serialno, itemcode, itemspecificationcode, quantity1, quantity2,',
'                     ratemeasuringunitcode, rate, amount, footeramount, totalamount,',
'                     withoutdiscountrate, discountpercentage, discountrate, hsncode, rateafterdiscount',
'                from quotationdetail where tno=:P710_TNO order by nvl(serialno,sno),sno)',
'    loop',
'        if d.itemcode is null then',
'            add_error(''SNO ''||d.sno||'' Item is blank'');',
'            continue;',
'        end if;',
'        select count(*), max(measuringunitcode1), max(measuringunitcode2)',
'          into l_item_count, l_unit1, l_unit2 from item where itemcode=d.itemcode;',
'        if l_item_count=0 then',
'            add_error(''SNO ''||d.sno||'' Item ''||d.itemcode||'' does not exist in Item Master'');',
'            continue;',
'        end if;',
'',
'        if d.itemspecificationcode is null then',
'            add_error(''SNO ''||d.sno||'' Specification is blank'');',
'            continue;',
'        end if;',
'        select count(*), nvl(max(multiplyingfactor),1), max(trim(hsncode))',
'          into l_spec_count, l_factor, l_hsn',
'          from itemspecification where itemspecificationcode=d.itemspecificationcode;',
'        if l_spec_count=0 then',
'            add_error(''SNO ''||d.sno||'' Specification ''||d.itemspecificationcode||'' does not exist in Item Master'');',
'            continue;',
'        end if;',
'',
'        if nvl(d.quantity1,0)<=0 then',
'            add_error(''SNO ''||d.sno||'' Quantity must be greater than zero'');',
'        end if;',
'        if d.rate is null then',
'            add_error(''SNO ''||d.sno||'' Rate is blank'');',
'        elsif d.rate<0 then',
'            add_error(''SNO ''||d.sno||'' Rate cannot be negative'');',
'        end if;',
'        if nvl(d.discountpercentage,0)<0 or nvl(d.discountpercentage,0)>100 then',
'            add_error(''SNO ''||d.sno||'' Discount % must be between 0 and 100'');',
'        end if;',
'',
'        l_rate_unit := nvl(trim(d.ratemeasuringunitcode),l_unit1);',
'        if l_rate_unit is null then',
'            add_error(''SNO ''||d.sno||'' Rate UOM is missing in Item Master'');',
'        elsif l_rate_unit<>l_unit1 and (l_unit2 is null or l_rate_unit<>l_unit2) then',
'            add_error(''SNO ''||d.sno||'' Rate UOM ''||l_rate_unit||'' is not valid for item ''||d.itemcode);',
'        end if;',
'',
'        l_q1 := round(nvl(d.quantity1,0),getuomdecimal(GetMeasuringUnitCodeFromItem(d.itemcode)));',
'        l_q2 := round(l_q1*nvl(l_factor,1),3);',
'        /* Discount fields are optional. The save guard validates the final',
'           Rate, Amount, FD/Footer and Total, not optional display fields. */',
'        l_discount := (nvl(d.discountpercentage,0)/100)*nvl(d.withoutdiscountrate,d.rate);',
'        l_rate_after_discount := nvl(d.withoutdiscountrate,d.rate)-l_discount;',
'        if l_unit2 is not null and l_rate_unit=l_unit2 then',
'            l_amount := nvl(d.rate,0)*l_q2;',
'        else',
'            l_amount := nvl(d.rate,0)*l_q1;',
'        end if;',
'',
'        if different(d.quantity1,l_q1,.001) then',
'            add_error(''SNO ''||d.sno||'' Primary Quantity expected ''||l_q1||'', found ''||nvl(d.quantity1,0));',
'        end if;',
'        if different(d.quantity2,l_q2,.001) then',
'            add_error(''SNO ''||d.sno||'' Secondary Quantity expected ''||l_q2||'', found ''||nvl(d.quantity2,0));',
'        end if;',
'        if different(d.amount,l_amount,.01) then',
'            add_error(''SNO ''||d.sno||'' Amount expected ''||amount_text(l_amount)||'', found ''||amount_text(d.amount)||'' (Rate x ''||l_rate_unit||'' Quantity)'');',
'        end if;',
'',
'        if l_hsn is null then',
'            add_error(''SNO ''||d.sno||'' HSN/SAC is missing in Item Specification Master; FD tax cannot be verified'');',
'        elsif d.hsncode is not null and trim(d.hsncode)<>l_hsn then',
'            add_error(''SNO ''||d.sno||'' HSN expected ''||l_hsn||'', found ''||trim(d.hsncode));',
'        end if;',
'',
'        select count(*), nvl(sum((l_amount*b.taxrate)/100),0)',
'          into l_expected_footer_count, l_expected_footer',
'          from taxruledetail a',
'          join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno',
'          join footerhead c on c.footerheadcode=b.footerheadcode',
'          join taxrule tr on tr.tno=a.tno',
'          join taxrulehsn h on h.tno=tr.tno',
'          join vendor v on v.taxregistrationtypecode=tr.taxregistrationtypecode',
'         where v.vendorcode=:P710_PARTYCODE',
'           and tr.transactiontypecode=:P710_TRANSACTIONTYPECODE',
'           and h.hsncode=l_hsn;',
'',
'        select count(*), nvl(sum(footervalue),0)',
'          into l_actual_footer_count, l_actual_footer',
'          from quotationdetailfooter where tno=:P710_TNO and sno=d.sno;',
'',
'        select count(*) into l_tax_line_bad from (',
'            select footerheadcode, legendscode, footerpercent',
'              from (',
'                    select b.footerheadcode, nvl(a.legendscode,''~'') legendscode,',
'                           nvl(b.taxrate,-999999) footerpercent, 1 line_delta,',
'                           (l_amount*b.taxrate)/100 value_delta',
'                      from taxruledetail a',
'                      join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno',
'                      join footerhead c on c.footerheadcode=b.footerheadcode',
'                      join taxrule tr on tr.tno=a.tno',
'                      join taxrulehsn h on h.tno=tr.tno',
'                      join vendor v on v.taxregistrationtypecode=tr.taxregistrationtypecode',
'                     where v.vendorcode=:P710_PARTYCODE',
'                       and tr.transactiontypecode=:P710_TRANSACTIONTYPECODE',
'                       and h.hsncode=l_hsn',
'                    union all',
'                    select f.footerheadcode, nvl(f.legendscode,''~''),',
'                           nvl(f.footerpercent,-999999), -1, -nvl(f.footervalue,0)',
'                      from quotationdetailfooter f',
'                     where f.tno=:P710_TNO and f.sno=d.sno',
'                   )',
'             group by footerheadcode, legendscode, footerpercent',
'            having sum(line_delta)<>0 or abs(sum(value_delta))>.01',
'        );',
'',
'        if l_expected_footer_count<>l_actual_footer_count then',
'            add_error(''SNO ''||d.sno||'' FD tax rows expected ''||l_expected_footer_count||'', found ''||l_actual_footer_count);',
'        elsif l_tax_line_bad>0 then',
'            add_error(''SNO ''||d.sno||'' FD tax head, percentage or value is stale/wrong; expected FD ''||amount_text(l_expected_footer)||'', found ''||amount_text(l_actual_footer));',
'        end if;',
'        if different(d.footeramount,l_actual_footer,.01) then',
'            add_error(''SNO ''||d.sno||'' Other/FD Amount expected ''||amount_text(l_actual_footer)||'' from FD rows, found ''||amount_text(d.footeramount));',
'        end if;',
'        if different(d.totalamount,nvl(d.amount,0)+l_actual_footer,.01) then',
'            add_error(''SNO ''||d.sno||'' Total Amount expected ''||amount_text(nvl(d.amount,0)+l_actual_footer)||'', found ''||amount_text(d.totalamount));',
'        end if;',
'    end loop;',
'',
'    select nvl(sum(amount),0), nvl(sum(footeramount),0), nvl(sum(totalamount),0)',
'      into l_sum_amount, l_sum_footer, l_sum_total',
'      from quotationdetail where tno=:P710_TNO;',
'    select count(*), max(sumofamount), max(sumoffooteramount), max(quotationamount)',
'      into l_header_count, l_header_amount, l_header_footer, l_header_total',
'      from quotation where tno=:P710_TNO;',
'',
'    /* A new document can save its header after the detail region.  This is',
'       normal and must not become a generic ORA-01403 processing error. */',
'    if l_header_count > 0 then',
'        if different(l_header_amount,l_sum_amount,.01) then',
'            add_error(''Summary Amount expected ''||amount_text(l_sum_amount)||'', found ''||amount_text(l_header_amount));',
'        end if;',
'        if different(l_header_footer,l_sum_footer,.01) then',
'            add_error(''Summary Footer Amount expected ''||amount_text(l_sum_footer)||'', found ''||amount_text(l_header_footer));',
'        end if;',
'        if different(l_header_total,l_sum_total,.01) then',
'            add_error(''Quotation Amount expected ''||amount_text(l_sum_total)||'', found ''||amount_text(l_header_total));',
'        end if;',
'    end if;',
'',
'    if l_errors is not null then',
'        raise_application_error(-20020,''Save blocked - calculation verification failed: ''||l_errors||'' | No quotation data from this save was committed.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''SAVE'',''CREATE'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>90071020260926032
);
wwv_flow_imp.component_end;
end;
/
