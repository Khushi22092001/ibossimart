const fs = require("fs");
const path = require("path");

const root = path.join(__dirname, "staged");
const marker = "wwv_flow_imp_page.create_page_da_event(";
const riskName = /amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency|hsn|item|record/i;
const businessFocusName = /^(?:set|calculate|check|validate|enable|disable|refresh|insert|get|party|new)\b/i;

function file(page) { return path.join(root, `f105_page_${page}.sql`); }
function read(page) { return fs.readFileSync(file(page), "utf8"); }
function write(page, source) { fs.writeFileSync(file(page), source, "utf8"); }
function value(block, property) {
  const match = block.match(new RegExp("," + property + "=>'((?:''|[^'])*)'"));
  return match ? match[1].replace(/''/g, "'") : "";
}
function sqlLines(text) {
  return text.split(/\r?\n/).map(line => `'${line.replace(/'/g, "''")}',`).join("\n") + "\n";
}
function injectPageJs(source, js, uniqueMarker) {
  if (source.includes(uniqueMarker)) return source;
  const start = source.indexOf(",p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(");
  if (start < 0) {
    const insertion = source.indexOf("\n,p_autocomplete_on_off=>");
    if (insertion < 0) throw new Error("Page JavaScript insertion point not found");
    const lineEnd = source.indexOf("\n", insertion + 1);
    return source.slice(0, lineEnd) + "\n,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(\n" +
      sqlLines(js).replace(/,\n$/, "\n") + "))" + source.slice(lineEnd);
  }
  const candidates = ["''))\n,p_css_file_urls", "''))\n,p_inline_css", "''))\n,p_step_template"];
  let close = -1;
  for (const candidate of candidates) {
    close = source.indexOf(candidate, start);
    if (close >= 0) break;
  }
  if (close < 0) throw new Error("Page JavaScript closing marker not found");
  return source.slice(0, close) + sqlLines(js) + source.slice(close);
}

function eventRanges(source) {
  const starts = [];
  let at = 0;
  while ((at = source.indexOf(marker, at)) >= 0) {
    starts.push(at);
    at += marker.length;
  }
  return starts.map((start, index) => ({ start, end: index + 1 < starts.length ? starts[index + 1] : source.length }));
}

function hardenRiskEvents(source) {
  const ranges = eventRanges(source).reverse();
  for (const range of ranges) {
    let block = source.slice(range.start, range.end);
    const headEnd = block.indexOf("\n);");
    if (headEnd < 0) continue;
    const head = block.slice(0, headEnd);
    const name = value(head, "p_name");
    if ((!riskName.test(name) && !businessFocusName.test(name)) || value(head, "p_display_when_type") === "NEVER") continue;

    block = block.replace(/,p_bind_event_type=>'(?:focusout|focusin|blur)'/, ",p_bind_event_type=>'change'");
    block = block.replace(/,p_wait_for_result=>'N'/g, ",p_wait_for_result=>'Y'");
    block = block.replace(/,p_stop_execution_on_error=>'N'/g, ",p_stop_execution_on_error=>'Y'");
    block = block.replace(/^\s*'\s*commit\s*;',?\s*$/gim, "");
    block = block
      .replace(/^(\s*)'setTimeout\(function\(\)\{',\r?\n/gm, "$1'(function(){',\n")
      .replace(/^(\s*)'\},\s*(?:[0-9]+)',\r?\n\s*'\);',\r?\n/gm, "$1'}());',\n");
    source = source.slice(0, range.start) + block + source.slice(range.end);
  }
  return source;
}

function disableEvent(source, name) {
  const ranges = eventRanges(source);
  for (const range of ranges) {
    const block = source.slice(range.start, range.end);
    const headEnd = block.indexOf("\n);");
    if (headEnd < 0 || value(block.slice(0, headEnd), "p_name") !== name) continue;
    let head = block.slice(0, headEnd);
    if (head.includes(",p_display_when_type=>")) {
      head = head.replace(/,p_display_when_type=>'[^']*'/, ",p_display_when_type=>'NEVER'");
    } else {
      head += "\n,p_display_when_type=>'NEVER'";
    }
    return source.slice(0, range.start) + head + block.slice(headEnd) + source.slice(range.end);
  }
  return source;
}

function eventToChange(source, name) {
  const ranges = eventRanges(source);
  for (const range of ranges) {
    const block = source.slice(range.start, range.end);
    const headEnd = block.indexOf("\n);");
    if (headEnd < 0 || value(block.slice(0, headEnd), "p_name") !== name) continue;
    const changed = block.replace(/,p_bind_event_type=>'(?:focusout|focusin|blur)'/, ",p_bind_event_type=>'change'");
    return source.slice(0, range.start) + changed + source.slice(range.end);
  }
  return source;
}

function disableFocusNavigation(source) {
  const ranges = eventRanges(source).reverse();
  for (const range of ranges) {
    const block = source.slice(range.start, range.end);
    const headEnd = block.indexOf("\n);");
    if (headEnd < 0) continue;
    let head = block.slice(0, headEnd);
    const name = value(head, "p_name");
    const eventType = value(head, "p_bind_event_type");
    if (!/focusout|focusin/i.test(eventType) || !/(?:move|next\s*tab|skip\s*focus|go\s+to\s+next|setfocus)/i.test(name)) continue;
    if (head.includes(",p_display_when_type=>")) head = head.replace(/,p_display_when_type=>'[^']*'/, ",p_display_when_type=>'NEVER'");
    else head += "\n,p_display_when_type=>'NEVER'";
    source = source.slice(0, range.start) + head + block.slice(headEnd) + source.slice(range.end);
  }
  return source;
}

function commonGuard(page, selector, fdCode = "") {
  return `
/* HSPL_DOWNSTREAM_DETAIL_INTEGRITY_V2 */
(function(){
  "use strict";
  if(Number(apex.env.APP_PAGE_ID||0)!==${page}||window.hsplDownstreamDetailIntegrityV2)return;
  window.hsplDownstreamDetailIntegrityV2=true;
  var heldFromDetail=false;
  function inDetail(target){return !!(target&&target.closest&&target.closest("${selector}"));}
  document.addEventListener("keydown",function(event){
    if(event.key!=="Tab")return;
    if(!event.repeat){heldFromDetail=inDetail(event.target);return;}
    if(heldFromDetail){event.preventDefault();event.stopImmediatePropagation();}
  },true);
  document.addEventListener("keyup",function(event){if(event.key==="Tab")heldFromDetail=false;},true);
  window.addEventListener("blur",function(){heldFromDetail=false;});
  ${fdCode}
})();
`;
}

function fdCode(page, documentName, modalName, footerStaticId) {
  return `
  var fdToken=0;
  window.hsplP${page}OpenFd=function(anchor){
    var token=++fdToken;
    try{
      var region=apex.region("detail"),grid=region.widget().interactiveGrid("getViews","grid"),model=grid.model;
      var row=anchor&&anchor.closest&&anchor.closest("tr[data-id]"),record=row&&model.getRecord(row.getAttribute("data-id"));
      function raw(v){return v&&typeof v==="object"&&Object.prototype.hasOwnProperty.call(v,"v")?v.v:v;}
      if(!record)throw new Error("Clicked ${documentName} row could not be identified.");
      var sno=raw(model.getValue(record,"SNO")),amount=raw(model.getValue(record,"AMOUNT"));
      if(sno===null||sno===undefined||String(sno).trim()==="")throw new Error("Clicked ${documentName} row has no SNO. Save/reload the row and retry.");
      apex.item("P${page}_SNO").setValue(sno,null,true);
      apex.item("P${page}_DFAMOUNT").setValue(amount||0,null,true);
      var footer=document.getElementById("${footerStaticId}"),footerGrid=footer&&footer.querySelector(".a-IG");
      if(footerGrid)footerGrid.style.opacity="0";
      openModal("${modalName}");
      var footerRegion=apex.region("${footerStaticId}");
      if(!footerRegion)throw new Error("FD region is unavailable for ${documentName}.");
      $("#${footerStaticId}").one("apexafterrefresh.hsplFd",function(){
        if(token===fdToken){var current=document.querySelector("#${footerStaticId} .a-IG");if(current)current.style.opacity="";}
      });
      footerRegion.refresh();
    }catch(error){
      apex.message.clearErrors();
      apex.message.showErrors([{type:"error",location:"page",message:error.message||"FD could not open for the clicked ${documentName} row.",unsafe:false}]);
    }
  };
`;
}

function replaceFdLink(source, oldName, newCall) {
  const escaped = oldName.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  return source.replace(new RegExp(`javascript:openModal\\(''${escaped}''\\)`, "g"), `javascript:${newCall}(this)`);
}

const pages = [69, 118, 140, 143, 146, 152, 155, 171, 175, 191, 274];
for (const page of pages) {
  let source = read(page);
  source = hardenRiskEvents(source);
  for (const eventName of ["Party_focus_2", "party_lose_focus_1", "New_1"]) source = eventToChange(source, eventName);
  source = source.replace(/(,p_name=>'make readonly based on LSA and LSD'[\s\S]*?,p_bind_event_type=>)'focusout'/, "$1'change'");
  source = disableFocusNavigation(source);
  source = disableEvent(source, "Calculate Detail Footer Total Amount value on get focus");
  source = disableEvent(source, "Calculate Detail Footer Total Amount value on get focus ");
  if ([171, 175, 274].includes(page)) {
    for (const eventName of ["move next", "move tab", "move tab1", "move tab2", "move tab next", "move to net tab", "Focus on reference text", "refresh"]) {
      source = disableEvent(source, eventName);
    }
  }
  if (page === 175) {
    source = disableEvent(source, "set amounts on loose focus");
    source = disableEvent(source, "set amounts selection change");
  }

  if (!source.includes("HSPL_CROSSFORM_DETAIL_INTEGRITY_V1") && !source.includes("HSPL_DOWNSTREAM_DETAIL_INTEGRITY_V2")) {
    let extra = "";
    if (page === 171) extra = fdCode(171, "sales order", "FooterDetail", "footerdetail");
    if (page === 175) extra = fdCode(175, "CC invoice", "Detail_Footer", "detail-footer");
    if (page === 274) extra = fdCode(274, "PO receipt", "Detail_Footer", "detail-footer");
    source = injectPageJs(source, commonGuard(page, "#detail,#Detail_ig,#item-detail,#item-detail_ig", extra), "HSPL_DOWNSTREAM_DETAIL_INTEGRITY_V2");
  }
  if (page === 118 && !source.includes("HSPL_P118_DOWNSTREAM_FD_V2")) {
    source = injectPageJs(source,
      `/* HSPL_P118_DOWNSTREAM_FD_V2 */\n(function(){${fdCode(118, "purchase order", "FooterDetail", "footerdetail")}\n})();`,
      "HSPL_P118_DOWNSTREAM_FD_V2");
  }

  if (page === 171) source = replaceFdLink(source, "FooterDetail", "hsplP171OpenFd");
  if (page === 175) source = replaceFdLink(source, "Detail_Footer", "hsplP175OpenFd");
  if (page === 274) source = replaceFdLink(source, "Detail_Footer", "hsplP274OpenFd");

  write(page, source);
}

console.log("Built downstream actual-change/FD fixes. Page 710 was neither read nor written.");
