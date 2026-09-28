const fs = require("fs");
const path = require("path");

// Always build from the just-exported live page.  This keeps unrelated, later
// Page 118 fixes (including the final-save reconciliation) intact.
const root = path.resolve(__dirname, "..", "..", "backups", "po-crud-v4-before-20260928", "live-before");
const outDir = path.join(__dirname, "staged");
const input = path.join(root, "f105_page_118.sql");
const output = path.join(outDir, "f105_page_118.sql");
fs.mkdirSync(outDir, { recursive: true });
let source = fs.readFileSync(input, "utf8");

function sqlLines(text) {
  return text.split(/\r?\n/).map((line) => `'${line.replace(/'/g, "''")}',`).join("\n") + "\n";
}

function disableEvent(name) {
  const marker = "wwv_flow_imp_page.create_page_da_event(";
  const starts = [];
  let at = 0;
  while ((at = source.indexOf(marker, at)) >= 0) { starts.push(at); at += marker.length; }
  for (let i = 0; i < starts.length; i++) {
    const end = i + 1 < starts.length ? starts[i + 1] : source.length;
    const block = source.slice(starts[i], end);
    const headEnd = block.indexOf("\n);");
    if (headEnd < 0) continue;
    let head = block.slice(0, headEnd);
    const found = (head.match(/,p_name=>'((?:''|[^'])*)'/) || [])[1];
    if ((found || "").replace(/''/g, "'") !== name) continue;
    if (head.includes(",p_display_when_type=>")) {
      head = head.replace(/,p_display_when_type=>'[^']*'/, ",p_display_when_type=>'NEVER'");
    } else {
      head += "\n,p_display_when_type=>'NEVER'";
    }
    source = source.slice(0, starts[i]) + head + block.slice(headEnd) + source.slice(end);
    return;
  }
  throw new Error(`Dynamic Action not found: ${name}`);
}

for (const name of ["Set Quantity2", "Set page item sno"]) disableEvent(name);

// Keep the native IG column-change event as the reliable trigger, but disable
// its three old asynchronous actions. One synchronous action below owns the row.
{
  const start = source.indexOf("wwv_flow_imp_page.create_page_da_event(\n p_id=>wwv_flow_imp.id(169434279699939455)");
  const end = source.indexOf("wwv_flow_imp_page.create_page_da_event(", start + 1);
  if (start < 0 || end < 0) throw new Error("Purchase Order set amount event not found");
  let block = source.slice(start, end);
  block = block.replace(/p_client_condition_expression=>'window\.hsplPhase2CellChanged\(this\.triggeringElement\)'/g, "p_client_condition_expression=>'false'");
  // The legacy PL/SQL action, its summary action, and its region refresh all
  // react to the same column change.  They race the client-side owner below
  // and are the reason an edit looked correct only after leaving the row.
  for (const id of ["169434784590939455", "169435321455939455", "169435787963939455"]) {
    const actionStart = block.indexOf(`p_id=>wwv_flow_imp.id(${id})`);
    const actionEnd = block.indexOf("wwv_flow_imp_page.create_page_da_action(", actionStart + 1);
    const tail = actionEnd < 0 ? block.length : actionEnd;
    if (actionStart < 0) throw new Error(`Set amount action not found: ${id}`);
    const actionBlock = block.slice(actionStart, tail).replace("p_client_condition_expression=>'true'", "p_client_condition_expression=>'false'");
    block = block.slice(0, actionStart) + actionBlock + block.slice(tail);
  }
  const action = `wwv_flow_imp_page.create_page_da_action(\n p_id=>wwv_flow_imp.id(90011820260927002)\n,p_event_id=>wwv_flow_imp.id(169434279699939455)\n,p_event_result=>'TRUE'\n,p_action_sequence=>1\n,p_execute_on_page_init=>'N'\n,p_name=>'HSPL single row calculation owner'\n,p_static_id=>'hspl-single-row-calculation-owner'\n,p_action=>'NATIVE_JAVASCRIPT_CODE'\n,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(\n  'js_code', 'window.hsplP118DaChange(this);')).to_clob\n);\n`;
  block = block.replace(/(\n\);\n)(?=wwv_flow_imp_page\.create_page_da_action\()/, `$1${action}`);
  source = source.slice(0, start) + block + source.slice(end);
}

// The Get Item action populates Detail on the server and then refreshes the
// grid.  Attach this listener before that refresh, so every loaded line gets
// its current tax footer and total as soon as the refreshed model is ready.
{
  const eventId = "wwv_flow_imp.id(169442227170939458)";
  const refreshId = "wwv_flow_imp_page.create_page_da_action(\n p_id=>wwv_flow_imp.id(169443683153939460)";
  const at = source.indexOf(refreshId);
  if (at < 0) throw new Error("Get Item detail refresh action not found");
  const action = `wwv_flow_imp_page.create_page_da_action(\n p_id=>wwv_flow_imp.id(90011820260928003)\n,p_event_id=>${eventId}\n,p_event_result=>'TRUE'\n,p_action_sequence=>35\n,p_execute_on_page_init=>'N'\n,p_name=>'Recalculate loaded Purchase Order rows'\n,p_static_id=>'hspl-recalculate-loaded-purchase-order-rows'\n,p_action=>'NATIVE_JAVASCRIPT_CODE'\n,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(\n  'js_code', 'apex.jQuery("#detail").off("apexafterrefresh.hsplP118GetItem").one("apexafterrefresh.hsplP118GetItem",function(){window.setTimeout(window.hsplP118RecalculateLoadedItems,0);});')).to_clob\n);\n`;
  source = source.slice(0, at) + action + source.slice(at);
}

// Get Item/CS used an unrelated IG bind (:AMOUNT), which is null in a button DA.
const footerAction = source.indexOf("p_id=>wwv_flow_imp.id(41295236305955065)");
const footerActionEnd = source.indexOf("wwv_flow_imp_page.create_page_da_event(", footerAction);
if (footerAction < 0 || footerActionEnd < 0) throw new Error("Get Item footer action not found");
let footerBlock = source.slice(footerAction, footerActionEnd);
if (!footerBlock.includes("(:AMOUNT * B.TAXrATE) /100 AS FooterValue")) {
  throw new Error("Expected Get Item tax expression not found");
}
footerBlock = footerBlock.replace("(:AMOUNT * B.TAXrATE) /100 AS FooterValue", "(vdet.amount * B.TAXrATE) /100 AS FooterValue");
source = source.slice(0, footerAction) + footerBlock + source.slice(footerActionEnd);

// This legacy PO dialog must retain its region initialization, but its query
// is still controlled exclusively by P118_TNO/P118_SNO (as in quotation).
{
  const footerStart = source.indexOf("wwv_flow_imp_page.create_page_plug(\n p_id=>wwv_flow_imp.id(654125604639489980)");
  const footerEnd = source.indexOf("wwv_flow_imp_page.create_page_plug(", footerStart + 1);
  if (footerStart < 0 || footerEnd < 0) throw new Error("FooterDetail region not found");
  let footerRegion = source.slice(footerStart, footerEnd);
  const master = ",p_master_region_id=>wwv_flow_imp.id(651062500031082203)";
  if (!footerRegion.includes(master)) throw new Error("FooterDetail master binding not found");
  source = source.slice(0, footerStart) + footerRegion + source.slice(footerEnd);

  const footerGridStart = source.indexOf(
    "wwv_flow_imp_page.create_interactive_grid(\n p_id=>wwv_flow_imp.id(654125732239489981)"
  );
  if (footerGridStart < 0) throw new Error("FooterDetail interactive grid not found");
  const footerGridEnd = source.indexOf("wwv_flow_imp_page.create_ig_report(", footerGridStart);
  if (footerGridEnd < 0) throw new Error("FooterDetail interactive grid end not found");
  let footerGrid = source.slice(footerGridStart, footerGridEnd);
  footerGrid = footerGrid
    .replace(",p_show_total_row_count=>false", ",p_show_total_row_count=>true")
    .replace(",p_show_toolbar=>false", ",p_show_toolbar=>true")
    .replace(",p_toolbar_buttons=>null", ",p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'");
  source = source.slice(0, footerGridStart) + footerGrid + source.slice(footerGridEnd);
}

// Dedicated dialog keys must not share the legacy detail-selection items.
// Those items are intentionally cleared by existing PO Dynamic Actions.
{
  const at = source.indexOf("wwv_flow_imp_page.create_page_item(\n p_id=>wwv_flow_imp.id(654027006949289333)");
  if (at < 0) throw new Error("P118_SNO item insertion point not found");
  // Hidden items must belong to rendered regions.  Without p_item_plug_id APEX
  // creates metadata but no browser item node, so the FooterDetail refresh
  // submits blank TNO/SNO and waits until the readiness timeout.  Mirror the
  // working quotation ownership: document key on the form, row key on Detail.
}

source = source.replace(
  ",p_link_target=>'javascript:hsplP118OpenFd(this)'\n,p_link_text=>'&FD.'",
  ",p_link_target=>'javascript:void(0)'\n,p_link_text=>'&FD.'"
);
source = source.replace(
  ",p_link_attributes=>'class=\"t-Button t-Button--simple t-Button--hot t-Button--stretch\"'",
  ",p_link_attributes=>'class=\"t-Button t-Button--simple t-Button--hot t-Button--stretch\" onclick=\"return window.hsplP118OpenFd(this,event);\"'"
);
source = source.replace(
  "<a href=\"javascript:hsplP118OpenFd(this)\">",
  "<a href=\"#\" onclick=\"return window.hsplP118OpenFd(this,event);\">"
);

const pageEngine = `
/* HSPL_P118_CRUD_ENGINE_V4 */
(function(){
"use strict";
if(window.hsplP118CrudEngineV4)return;
window.hsplP118CrudEngineV4=true;
var state={seq:0,rows:{},applying:false,fdSeq:0,fdContext:null,fdLoading:false,tries:0};
function raw(v){return v&&typeof v==="object"&&Object.prototype.hasOwnProperty.call(v,"v")?v.v:v;}
function num(v){v=Number(String(raw(v)==null?0:raw(v)).replace(/,/g,""));return Number.isFinite(v)?v:0;}
function blank(v){v=raw(v);return v===null||v===undefined||String(v).trim()==="";}
function grid(id){try{var key=String(id||""),r=apex.region(key)||apex.region(key.charAt(0).toUpperCase()+key.slice(1)),w=r&&r.widget&&r.widget(),v=w&&w.interactiveGrid("getViews","grid"),m=v&&v.model;return m?{r:r,v:v,m:m}:null;}catch(e){return null;}}
function set(m,r,f,v){if(!m.getFieldKey(f))return;var old=raw(m.getValue(r,f));if(String(old==null?"":old)!==String(v==null?"":v))m.setValue(r,f,v);}
function each(m,fn){m.forEach(function(r,i,id){var x=m.getRecordMetadata(id)||{};if(!x.deleted&&!x.agg)fn(r,id,x);});}
function item(id,v){var x=apex.item(id);if(x&&x.node&&Math.abs(num(x.getValue())-num(v))>.000001)x.setValue(v,null,true);}
function summary(b){var a=0,f=0,t=0;each(b.m,function(r){a+=num(b.m.getValue(r,"AMOUNT"));f+=num(b.m.getValue(r,"FOOTERAMOUNT"));t+=num(b.m.getValue(r,"TOTALAMOUNT"));});item("P118_SUMOFAMOUNT",a);item("P118_SUMOFFOOTERAMOUNT",f);item("P118_PURCHASEORDERAMOUNT",t);}
function rowCalc(b,r,field,queue){var m=b.m,base=num(m.getValue(r,"WITHOUTDISCOUNTRATE")),pct=num(m.getValue(r,"DISCOUNTPERCENTAGE")),entered=num(m.getValue(r,"RATE")),disc,after,rate;if(field==="RATE"){base=entered;pct=0;disc=0;after=entered;rate=entered;}else{disc=base*pct/100;after=base-disc;rate=after;}var q1=num(m.getValue(r,"QUANTITY1")),q2=num(m.getValue(r,"QUANTITY2")),rmu=String(raw(m.getValue(r,"RATEMEASURINGUNITCODE"))||""),u2=String(raw(m.getValue(r,"UNIT2"))||""),qty=(u2&&rmu===u2)?q2:q1,amount=rate*qty;
state.applying=true;set(m,r,"WITHOUTDISCOUNTRATE",base);set(m,r,"DISCOUNTPERCENTAGE",pct);set(m,r,"DISCOUNTRATE",disc);set(m,r,"RATEAFTERDISCOUNT",after);set(m,r,"RATE",rate);set(m,r,"AMOUNT",amount);set(m,r,"TOTALAMOUNT",amount+num(m.getValue(r,"FOOTERAMOUNT")));state.applying=false;summary(b);if(queue!==false)serverCalc(b,r);}
function serverCalc(b,r){var m=b.m,id=m.getRecordId(r),s=state.rows[id]||{};if(blank(m.getValue(r,"TNO"))||blank(m.getValue(r,"SNO"))||blank(m.getValue(r,"ITEMCODE"))||blank(m.getValue(r,"ITEMSPECIFICATIONCODE")))return;if(s.timer)clearTimeout(s.timer);s.rev=++state.seq;state.rows[id]=s;var rev=s.rev;s.timer=setTimeout(function(){var rec=m.getRecord(id);if(!rec||!state.rows[id]||state.rows[id].rev!==rev)return;apex.server.process("P118_CALCULATE_DETAIL",{x01:raw(m.getValue(rec,"TNO")),x02:raw(m.getValue(rec,"SNO")),x03:raw(m.getValue(rec,"ITEMCODE")),x04:raw(m.getValue(rec,"ITEMSPECIFICATIONCODE")),x05:raw(m.getValue(rec,"QUANTITY1")),x06:raw(m.getValue(rec,"RATE")),x07:raw(m.getValue(rec,"WITHOUTDISCOUNTRATE")),x08:raw(m.getValue(rec,"DISCOUNTPERCENTAGE")),x09:raw(m.getValue(rec,"RATEMEASURINGUNITCODE")),x10:rev,pageItems:"#P118_PARTYCODE,#P118_TRANSACTIONTYPECODE"},{dataType:"json",queue:{name:"p118_calc_"+String(id).replace(/[^a-zA-Z0-9_]/g,"_"),action:"replace"}}).done(function(d){var st=state.rows[id],row=m.getRecord(id);if(!st||st.rev!==rev||!row)return;if(!d||d.success!==true){apex.message.showErrors([{type:"error",location:"page",message:(d&&d.message)||"Purchase order row calculation failed.",unsafe:false}]);return;}state.applying=true;set(m,row,"QUANTITY2",d.quantity2);if(blank(m.getValue(row,"RATEMEASURINGUNITCODE")))set(m,row,"RATEMEASURINGUNITCODE",d.rmu);set(m,row,"DISCOUNTRATE",d.discountRate);set(m,row,"RATEAFTERDISCOUNT",d.rateAfterDiscount);set(m,row,"RATE",d.rate);set(m,row,"AMOUNT",d.amount);set(m,row,"FOOTERAMOUNT",d.footerAmount);set(m,row,"TOTALAMOUNT",d.totalAmount);state.applying=false;summary(b);}).fail(function(jq,status,error){apex.message.showErrors([{type:"error",location:"page",message:"Purchase order row calculation could not complete ("+(error||status||"network error")+"). The row was not replaced by stale data.",unsafe:false}]);});},160);}
function inputField(el){return String((el&&((el.dataset&&el.dataset.column)||el.getAttribute&&el.getAttribute("data-column")))||"").toUpperCase();}
function allowed(f){return ["QUANTITY1","QUANTITY2","WITHOUTDISCOUNTRATE","DISCOUNTPERCENTAGE","RATE","RATEMEASURINGUNITCODE"].indexOf(f)>=0;}
function onChange(b,t,c){if(state.applying)return;var r=c&&(c.record||(c.recordId&&b.m.getRecord(c.recordId))),f=String((c&&c.field)||"").toUpperCase(),id=r&&b.m.getRecordId(r),meta=id&&b.m.getRecordMetadata(id);if(t==="set"&&r&&!(meta&&meta.agg)&&!(meta&&meta.deleted)&&allowed(f)){rowCalc(b,r,f,true);return;}summary(b);}
window.hsplP118DaChange=function(ctx){var m=ctx&&ctx.data&&ctx.data.model,r=ctx&&ctx.data&&ctx.data.record,b=m?{r:apex.region("detail"),m:m}:grid("detail"),f=inputField(ctx&&ctx.triggeringElement);if(!r&&b&&b.v&&b.v.getContextRecord&&ctx&&ctx.triggeringElement){try{r=b.v.getContextRecord(ctx.triggeringElement)[0];}catch(e){}}if(!r&&b&&b.v&&b.v.getSelectedRecords)r=b.v.getSelectedRecords()[0];if(b&&r&&!state.applying)rowCalc(b,r,f,true);};
window.hsplP118RecalculateLoadedItems=function(){var b=grid("detail");if(!b)return;each(b.m,function(r){rowCalc(b,r,"",true);});summary(b);};
function bind(){var b=grid("detail");if(!b){if(state.tries++<30)setTimeout(bind,200);return;}if(!b.m.hsplP118CrudV4){b.m.hsplP118CrudV4=true;b.m.subscribe({viewId:"hsplP118CrudV4",onChange:function(t,c){onChange(b,t,c);}});}summary(b);}
function fdError(message){apex.message.clearErrors();apex.message.showErrors([{type:"error",location:"page",message:message,unsafe:false}]);}
function recordFromAnchor(b,a){if(!b||!a)return null;var n=a,records;for(var i=0;n&&i<5;i++,n=n.parentElement){try{records=b.v&&b.v.getContextRecord&&b.v.getContextRecord(n);if(records&&typeof records.length==="number"){if(records.length)return records[0];}else if(records)return records;}catch(e){}try{records=b.v&&b.v.view$&&b.v.view$.grid&&b.v.view$.grid("getRecords",n);if(records&&records.length)return records[0];}catch(e){}}var row=a.closest&&a.closest("[data-id]"),id=row&&(row.getAttribute("data-id")||row.getAttribute("data-record-id"));try{return id&&b.m.getRecord(id);}catch(e){return null;}}
window.hsplP118OpenFd=function(anchor,event){anchor=(event&&(event.currentTarget||event.target))||anchor||document.activeElement;var token=++state.fdSeq,b=grid("detail"),rec=recordFromAnchor(b,anchor);if(!rec){fdError("The selected Purchase Order row is not available. Refresh the Detail grid and try its FD button again.");return false;}var m=b.m,id=m.getRecordId(rec),sno=raw(m.getValue(rec,"SNO")),tno=raw(m.getValue(rec,"TNO"));if(blank(tno)||blank(sno)){fdError("Clicked Purchase Order row has no TNO/SNO. Save or reload it and retry.");return false;}var pending=state.rows[id];if(pending&&pending.timer)clearTimeout(pending.timer);var rev=++state.seq;state.rows[id]={rev:rev};apex.server.process("P118_CALCULATE_DETAIL",{x01:tno,x02:sno,x03:raw(m.getValue(rec,"ITEMCODE")),x04:raw(m.getValue(rec,"ITEMSPECIFICATIONCODE")),x05:raw(m.getValue(rec,"QUANTITY1")),x06:raw(m.getValue(rec,"RATE")),x07:raw(m.getValue(rec,"WITHOUTDISCOUNTRATE")),x08:raw(m.getValue(rec,"DISCOUNTPERCENTAGE")),x09:raw(m.getValue(rec,"RATEMEASURINGUNITCODE")),x10:rev,pageItems:"#P118_PARTYCODE,#P118_TRANSACTIONTYPECODE"},{dataType:"json",queue:{name:"p118_calc_"+String(id).replace(/[^a-zA-Z0-9_]/g,"_"),action:"replace"}}).done(function(d){if(token!==state.fdSeq||!d||d.success!==true){if(token===state.fdSeq)fdError((d&&d.message)||"FD tax calculation failed for the clicked Purchase Order row.");return;}var current=m.getRecord(id);if(!current)return;state.applying=true;set(m,current,"QUANTITY2",d.quantity2);set(m,current,"RATEMEASURINGUNITCODE",d.rmu);set(m,current,"DISCOUNTRATE",d.discountRate);set(m,current,"RATEAFTERDISCOUNT",d.rateAfterDiscount);set(m,current,"RATE",d.rate);set(m,current,"AMOUNT",d.amount);set(m,current,"FOOTERAMOUNT",d.footerAmount);set(m,current,"TOTALAMOUNT",d.totalAmount);state.applying=false;summary(b);state.fdContext={token:token,recordId:id,sno:String(sno)};apex.item("P118_TNO").setValue(tno,null,true);apex.item("P118_SNO").setValue(sno,null,true);apex.item("P118_DFAMOUNT").setValue(d.amount,null,true);openModal("FooterDetail");var tries=0;function refresh(){if(token!==state.fdSeq)return;var f=grid("FooterDetail");if(!f){if(tries++<40){setTimeout(refresh,50);return;}fdError("FD dialog opened, but its detail region did not initialize.");return;}var el=f.r.element&&f.r.element[0],body=el&&el.querySelector(".a-IG");if(body)body.style.visibility="hidden";apex.jQuery(el).one("apexafterrefresh.hsplP118Fd",function(){if(token===state.fdSeq){var x=el.querySelector(".a-IG");if(x)x.style.visibility="";bindFooter();}});try{f.r.refresh();}catch(e){if(body)body.style.visibility="";fdError("FD refresh failed for the clicked Purchase Order row: "+(e.message||e));}}setTimeout(refresh,0);}).fail(function(jq,status,error){if(token===state.fdSeq)fdError("FD tax calculation could not complete ("+(error||status||"network error")+").");});return false;};
/* Use the quotation-style prepare step: resolve the immutable clicked row, rebuild only that row's HSN tax lines, persist the exact dialog keys, then refresh the modal. */
function refreshPreparedFd(b,tno,sno,token){var tries=0;function refresh(){if(token!==state.fdSeq)return;var f=grid("FooterDetail");if(!f){if(tries++<40){setTimeout(refresh,50);return;}fdError("FD dialog opened, but its detail region did not initialize.");return;}var el=f.r.element&&f.r.element[0],body=el&&el.querySelector(".a-IG");if(body)body.style.visibility="hidden";apex.jQuery(el).one("apexafterrefresh.hsplP118Fd",function(){if(token===state.fdSeq){var x=el.querySelector(".a-IG");if(x)x.style.visibility="";bindFooter();}});try{f.r.refresh();}catch(e){if(body)body.style.visibility="";fdError("FD refresh failed for the clicked Purchase Order row: "+(e.message||e));}}setTimeout(refresh,0);}
window.hsplP118OpenFd=function(anchor,event){anchor=(event&&(event.currentTarget||event.target))||anchor||document.activeElement;var token=++state.fdSeq,b=grid("Detail"),rec=recordFromAnchor(b,anchor);if(!rec){fdError("The selected Purchase Order row is not available. Refresh the Detail grid and try its FD button again.");return false;}var m=b.m,id=m.getRecordId(rec),tno=raw(m.getValue(rec,"TNO")),sno=raw(m.getValue(rec,"SNO")),spec=raw(m.getValue(rec,"ITEMSPECIFICATIONCODE")),amount=num(m.getValue(rec,"AMOUNT")),rowid=raw(m.getValue(rec,"ROWID"));if(blank(tno)||blank(sno)){fdError("Clicked Purchase Order row has no TNO/SNO. Save or reload it and retry.");return false;}apex.server.process("P118_PREPARE_FD",{x01:tno,x02:sno,x03:spec,x04:amount,x05:rowid,pageItems:"#P118_PARTYCODE,#P118_TRANSACTIONTYPECODE"},{dataType:"json",queue:{name:"p118_fd_open",action:"replace"}}).done(function(d){if(token!==state.fdSeq)return;if(!d||d.success!==true){fdError((d&&d.message)||"FD could not be prepared for the clicked Purchase Order row.");return;}var resolved=String(d.sno==null?"":d.sno).trim();if(blank(resolved)){fdError("FD preparation returned no row key. No tax data was changed.");return;}if(Number(d.footerRows||0)<1){fdError("No FD tax row is configured for this item, party and transaction type. No other row was changed.");return;}var current=m.getRecord(id);if(!current)return;state.applying=true;set(m,current,"SNO",resolved);set(m,current,"FOOTERAMOUNT",d.footerAmount);set(m,current,"TOTALAMOUNT",amount+num(d.footerAmount));state.applying=false;summary(b);state.fdContext={token:token,recordId:id,sno:resolved};apex.item("P118_TNO").setValue(tno,null,true);apex.item("P118_SNO").setValue(resolved,null,true);apex.item("P118_DFAMOUNT").setValue(amount,null,true);openModal("FooterDetail");refreshPreparedFd(b,tno,resolved,token);}).fail(function(jq,status,error){if(token===state.fdSeq)fdError("FD could not open ("+(error||status||"network error")+"). No row data was changed.");});return false;};
/* Mirror the quotation FD lifecycle: open a fast shell, cover stale content
   with APEX's spinner, then uncover only after the exact clicked row arrives. */
function p118SetFdItem(id,v){var value=v==null?"":v,it=null,node=document.getElementById(id);try{it=apex.item(id);if(it&&typeof it.setValue==="function")it.setValue(value,null,true);}catch(e){}if(node&&String(node.value)!==String(value))node.value=value;}
function p118FdRegion(){try{return apex.region("footerdetail")||apex.region("FooterDetail");}catch(e){return null;}}
function p118FdMask(token,region){if(token!==state.fdSeq)return;var el=region&&region.element;if(!el)return;var old=state.fdMask;if(old&&old.spinner&&old.spinner.remove)old.spinner.remove();var mask=el.find(".a-IG"),spinner=null;if(mask&&mask.length)mask.css("visibility","hidden");try{spinner=apex.util.showSpinner(el);}catch(e){}state.fdMask={token:token,mask:mask,spinner:spinner};}
function p118FdUnmask(token){var x=state.fdMask;if(!x||x.token!==token)return;if(x.mask&&x.mask.length)x.mask.css("visibility","");if(x.spinner&&x.spinner.remove)x.spinner.remove();state.fdMask=null;state.fdLoading=false;}
function p118FdFail(token,message){state.fdLoading=false;p118FdUnmask(token);try{apex.theme.closeRegion("footerdetail");}catch(e){try{apex.theme.closeRegion("FooterDetail");}catch(ignore){}}fdError(message);}
function p118FdOpenShell(tno,sno,amount,token){p118SetFdItem("P118_TNO",tno);p118SetFdItem("P118_SNO",sno);p118SetFdItem("P118_DFAMOUNT",amount);p118FdMask(token,p118FdRegion());openModal("FooterDetail");setTimeout(function(){p118FdMask(token,p118FdRegion());},0);}
function p118FdShowExact(tno,sno,amount,token,refreshNow){var probes=0,deadline=Date.now()+7000,timer=null;function check(){if(token!==state.fdSeq)return;var f=grid("FooterDetail"),ctx=state.fdContext,count=0,total=0;if(f&&ctx&&ctx.token===token){each(f.m,function(r){count++;total+=num(f.m.getValue(r,"FOOTERVALUE"));});if(count===Number(ctx.footerRows||0)&&Math.abs(total-num(ctx.footerAmount))<=.01){if(timer)clearTimeout(timer);p118FdUnmask(token);bindFooter();return;}}if(Date.now()<deadline){timer=setTimeout(check,50);return;}p118FdFail(token,"FD data did not finish loading for the clicked Purchase Order row. No other row was changed.");}function probe(){if(token!==state.fdSeq)return;p118SetFdItem("P118_TNO",tno);p118SetFdItem("P118_SNO",sno);p118SetFdItem("P118_DFAMOUNT",amount);var f=grid("FooterDetail");if(!f||!f.r||typeof f.r.refresh!=="function"){if(++probes<30){setTimeout(probe,40);return;}p118FdFail(token,"FD dialog opened but its detail region did not initialize. Refresh once and retry.");return;}p118FdMask(token,f.r);if(refreshNow){try{f.r.refresh();}catch(e){p118FdFail(token,"FD refresh failed for the clicked Purchase Order row: "+(e.message||e));return;}}timer=setTimeout(check,50);}setTimeout(probe,0);}
window.hsplP118OpenFd=function(anchor,event){anchor=(event&&(event.currentTarget||event.target))||anchor||document.activeElement;var token=++state.fdSeq,b=grid("Detail"),rec=recordFromAnchor(b,anchor);if(!rec){fdError("The selected Purchase Order row is not available. Refresh the Detail grid and try its FD button again.");return false;}var m=b.m,id=m.getRecordId(rec),tno=raw(m.getValue(rec,"TNO")),sno=raw(m.getValue(rec,"SNO")),spec=raw(m.getValue(rec,"ITEMSPECIFICATIONCODE")),amount=num(m.getValue(rec,"AMOUNT")),rowid=raw(m.getValue(rec,"ROWID"));if(blank(tno)||blank(sno)){fdError("Clicked Purchase Order row has no TNO/SNO. Save or reload it and retry.");return false;}state.fdLoading=true;state.fdContext={token:token,recordId:id,sno:String(sno),footerRows:0,footerAmount:0};p118FdOpenShell(tno,sno,amount,token);apex.server.process("P118_PREPARE_FD",{x01:tno,x02:sno,x03:spec,x04:amount,x05:rowid,pageItems:"#P118_PARTYCODE,#P118_TRANSACTIONTYPECODE"},{dataType:"json",queue:{name:"p118_fd_open",action:"replace"}}).done(function(d){if(token!==state.fdSeq)return;if(!d||d.success!==true){p118FdFail(token,(d&&d.message)||"FD could not be prepared for the clicked Purchase Order row.");return;}var resolved=String(d.sno==null?"":d.sno).trim();if(blank(resolved)||Number(d.footerRows||0)<1){p118FdFail(token,blank(resolved)?"FD preparation returned no row key. No tax data was changed.":"No FD tax row is configured for this item, party and transaction type. No other row was changed.");return;}var current=m.getRecord(id);if(!current){p118FdFail(token,"The clicked Purchase Order row was refreshed before FD finished loading. Retry once.");return;}state.applying=true;set(m,current,"SNO",resolved);set(m,current,"FOOTERAMOUNT",d.footerAmount);set(m,current,"TOTALAMOUNT",amount+num(d.footerAmount));state.applying=false;summary(b);state.fdContext={token:token,recordId:id,sno:resolved,footerRows:Number(d.footerRows||0),footerAmount:num(d.footerAmount)};p118SetFdItem("P118_TNO",tno);p118SetFdItem("P118_SNO",resolved);var selected=false;try{var sr=b.v&&b.v.getSelectedRecords?b.v.getSelectedRecords():[];selected=!!(sr&&sr.length&&m.getRecordId(sr[0])===id);}catch(e){}try{if(!selected&&b.v&&b.v.setSelectedRecords)b.v.setSelectedRecords([current],false,false);}catch(e){}p118FdShowExact(tno,resolved,amount,token,selected);}).fail(function(jq,status,error){if(token===state.fdSeq)p118FdFail(token,"FD could not open ("+(error||status||"network error")+"). No row data was changed.");});return false;};
function bindFooter(){var f=grid("FooterDetail");if(!f||f.m.hsplP118FooterV3)return;f.m.hsplP118FooterV3=true;f.m.subscribe({viewId:"hsplP118FooterV3",onChange:function(){var ctx=state.fdContext,b=grid("detail"),total=0;if(state.fdLoading||!ctx||!b)return;each(f.m,function(r){total+=num(f.m.getValue(r,"FOOTERVALUE"));});var parent=b.m.getRecord(ctx.recordId);if(parent&&String(raw(b.m.getValue(parent,"SNO")))===ctx.sno){state.applying=true;set(b.m,parent,"FOOTERAMOUNT",total);set(b.m,parent,"TOTALAMOUNT",num(b.m.getValue(parent,"AMOUNT"))+total);state.applying=false;summary(b);}}});}
var held=false;document.addEventListener("keydown",function(e){if(e.key!=="Tab")return;if(!e.repeat){held=!!(e.target&&e.target.closest&&e.target.closest("#detail"));return;}if(held){e.preventDefault();e.stopImmediatePropagation();}},true);document.addEventListener("keyup",function(e){if(e.key==="Tab")held=false;},true);window.addEventListener("blur",function(){held=false;});
apex.jQuery(bind);apex.jQuery(document).on("interactivegridviewmodelcreate.hsplP118Crud apexafterrefresh.hsplP118Crud","#Detail,#detail",function(){state.tries=0;setTimeout(bind,0);});
})();
`;
const normalizedPageEngine = pageEngine.replace(
  "try{if(b.v&&b.v.setSelectedRecords)b.v.setSelectedRecords([rec],true);}catch(e){}",
  "try{if(b.v&&b.v.setSelectedRecords)b.v.setSelectedRecords([rec],false,false);}catch(e){}"
).replace("set(m,row,\"QUANTITY2\",d.quantity2);", "");

const oldStart = source.indexOf("'/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */',");
const jsClose = source.indexOf("''))\n,p_css_file_urls", oldStart);
if (oldStart < 0 || jsClose < 0) throw new Error("Old Page 118 helper block not found");
source = source.slice(0, oldStart) + sqlLines(normalizedPageEngine) + source.slice(jsClose);

const processSql = `wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90011820260927001)
,p_process_sequence=>5
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'P118_CALCULATE_DETAIL'
,p_static_id=>'p118-calculate-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
${sqlLines(`declare
    l_tno number; l_sno number; l_q1 number; l_q2 number; l_rate number;
    l_base number; l_pct number; l_disc number; l_after number; l_amount number;
    l_footer number := 0; l_total number; l_factor number := 1;
    l_unit1 varchar2(30); l_unit2 varchar2(30); l_rmu varchar2(30); l_hsn varchar2(30);
    function n(p varchar2) return number is begin return to_number(replace(nvl(trim(p),'0'),',','')); exception when others then return 0; end;
begin
    l_tno:=n(apex_application.g_x01); l_sno:=n(apex_application.g_x02);
    l_q1:=n(apex_application.g_x05); l_rate:=n(apex_application.g_x06);
    l_base:=n(apex_application.g_x07); l_pct:=n(apex_application.g_x08);
    select max(measuringunitcode1),max(measuringunitcode2) into l_unit1,l_unit2 from item where itemcode=apex_application.g_x03;
    select nvl(max(multiplyingfactor),1),max(trim(hsncode)) into l_factor,l_hsn from itemspecification where itemspecificationcode=apex_application.g_x04;
    l_q1:=round(l_q1,getuomdecimal(GetMeasuringUnitCodeFromItem(apex_application.g_x03)));
    l_q2:=round(l_q1*l_factor,3); l_disc:=(l_pct/100)*l_base; l_after:=l_base-l_disc;
    l_rate:=l_after;
    l_rmu:=nvl(trim(apex_application.g_x09),l_unit1);
    if l_unit2 is not null and l_rmu=l_unit2 then l_amount:=l_rate*l_q2; else l_amount:=l_rate*l_q1; end if;
    if l_tno>0 and l_sno>0 and :P118_PARTYCODE is not null and :P118_TRANSACTIONTYPECODE is not null and l_hsn is not null then
        delete from purchaseorderdetailfooter where tno=l_tno and sno=l_sno;
        for r in (
            select rownum slno,a.legendscode,c.footerheadcode,b.taxrate footerpercent,(l_amount*b.taxrate)/100 footervalue
              from taxruledetail a join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno
              join footerhead c on c.footerheadcode=b.footerheadcode join taxrule d on d.tno=a.tno
              join taxrulehsn e on e.tno=d.tno join party f on f.taxregistrationtypecode=d.taxregistrationtypecode
             where f.partycode=:P118_PARTYCODE and d.transactiontypecode=:P118_TRANSACTIONTYPECODE and e.hsncode=l_hsn
        ) loop
            insert into purchaseorderdetailfooter(tno,sno,footerheadcode,footerpercent,footervalue,serialno,legendscode)
            values(l_tno,l_sno,r.footerheadcode,r.footerpercent,r.footervalue,r.slno,r.legendscode);
        end loop;
        select nvl(sum(footervalue),0) into l_footer from purchaseorderdetailfooter where tno=l_tno and sno=l_sno;
    end if;
    l_total:=nvl(l_amount,0)+nvl(l_footer,0);
    apex_json.open_object; apex_json.write('success',true); apex_json.write('revision',apex_application.g_x10);
    apex_json.write('quantity2',l_q2); apex_json.write('rmu',l_rmu); apex_json.write('rate',l_rate);
    apex_json.write('discountRate',l_disc); apex_json.write('rateAfterDiscount',l_after);
    apex_json.write('amount',l_amount); apex_json.write('footerAmount',l_footer); apex_json.write('totalAmount',l_total); apex_json.close_object;
exception when others then rollback; apex_json.open_object; apex_json.write('success',false); apex_json.write('message',sqlerrm); apex_json.close_object;
end;`).replace(/,\n$/, "")}
))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>90011820260927001
);
`;

const prepareFdProcess = `wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90011820260928004)
,p_process_sequence=>6
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'P118_PREPARE_FD'
,p_static_id=>'p118-prepare-fd'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
${sqlLines(`declare
    l_tno number; l_sno number; l_requested_sno number; l_amount number;
    l_spec varchar2(60); l_db_spec varchar2(60); l_rowid varchar2(200); l_hsn varchar2(30);
    l_detail_count number := 0; l_expected_count number := 0; l_actual_count number := 0;
    l_expected_amount number := 0; l_actual_amount number := 0;
    function n(p varchar2) return number is begin return to_number(replace(nvl(trim(p),'0'),',','')); exception when others then return 0; end;
begin
    l_tno:=n(apex_application.g_x01); l_requested_sno:=n(apex_application.g_x02); l_sno:=l_requested_sno;
    l_amount:=n(apex_application.g_x04); l_rowid:=trim(apex_application.g_x05); l_spec:=trim(apex_application.g_x03);
    if l_tno is null or l_tno<=0 then raise_application_error(-20041,'Clicked Purchase Order number is missing.'); end if;
    /* Resolve the exact persisted row first; SNO remains only a fallback. */
    if l_rowid is not null then
        select count(*),max(d.sno),max(d.itemspecificationcode) into l_detail_count,l_sno,l_db_spec
          from purchaseorderdetail d where d.tno=l_tno and rowidtochar(d.rowid)=l_rowid;
    end if;
    if l_detail_count=0 and l_requested_sno>0 then
        select count(*),max(d.sno),max(d.itemspecificationcode) into l_detail_count,l_sno,l_db_spec
          from purchaseorderdetail d where d.tno=l_tno and d.sno=l_requested_sno;
    end if;
    if l_detail_count=0 then raise_application_error(-20042,'The clicked Purchase Order detail row no longer exists. Refresh and retry.'); end if;
    if l_spec is null then l_spec:=l_db_spec; end if;
    select max(trim(hsncode)) into l_hsn from itemspecification where itemspecificationcode=l_spec;
    select count(*),nvl(sum(footervalue),0) into l_actual_count,l_actual_amount
      from purchaseorderdetailfooter where tno=l_tno and sno=l_sno;
    l_expected_count:=l_actual_count; l_expected_amount:=l_actual_amount;
    if :P118_PARTYCODE is not null and :P118_TRANSACTIONTYPECODE is not null and l_hsn is not null then
        select count(*),nvl(sum((l_amount*b.taxrate)/100),0) into l_expected_count,l_expected_amount
          from taxruledetail a join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno
          join footerhead c on c.footerheadcode=b.footerheadcode join taxrule d on d.tno=a.tno
          join taxrulehsn e on e.tno=d.tno join party f on f.taxregistrationtypecode=d.taxregistrationtypecode
         where f.partycode=:P118_PARTYCODE and d.transactiontypecode=:P118_TRANSACTIONTYPECODE and e.hsncode=l_hsn;
        if l_actual_count<>l_expected_count or abs(l_actual_amount-l_expected_amount)>.005 then
            delete from purchaseorderdetailfooter where tno=l_tno and sno=l_sno;
            for r in (
                select rownum slno,a.legendscode,c.footerheadcode,b.taxrate footerpercent,(l_amount*b.taxrate)/100 footervalue
                  from taxruledetail a join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno
                  join footerhead c on c.footerheadcode=b.footerheadcode join taxrule d on d.tno=a.tno
                  join taxrulehsn e on e.tno=d.tno join party f on f.taxregistrationtypecode=d.taxregistrationtypecode
                 where f.partycode=:P118_PARTYCODE and d.transactiontypecode=:P118_TRANSACTIONTYPECODE and e.hsncode=l_hsn
            ) loop
                insert into purchaseorderdetailfooter(tno,sno,footerheadcode,footerpercent,footervalue,serialno,legendscode)
                values(l_tno,l_sno,r.footerheadcode,r.footerpercent,r.footervalue,r.slno,r.legendscode);
            end loop;
            l_actual_count:=l_expected_count; l_actual_amount:=l_expected_amount;
        end if;
    end if;
    apex_util.set_session_state('P118_TNO',l_tno);
    apex_util.set_session_state('P118_SNO',l_sno);
    apex_util.set_session_state('P118_DFAMOUNT',l_amount);
    commit;
    apex_json.open_object; apex_json.write('success',true); apex_json.write('sno',l_sno);
    apex_json.write('footerAmount',l_actual_amount); apex_json.write('footerRows',l_actual_count);
    apex_json.close_object;
exception when others then
    rollback; apex_json.open_object; apex_json.write('success',false); apex_json.write('message',sqlerrm); apex_json.close_object;
end;`).replace(/,\n$/, "")}
))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>90011820260928004
);
`;

const processAt = source.indexOf("wwv_flow_imp_page.create_page_process(");
if (processAt < 0) throw new Error("Page process insertion point not found");
source = source.slice(0, processAt) + processSql + prepareFdProcess + source.slice(processAt);

fs.writeFileSync(output, source, "utf8");
console.log(output);
