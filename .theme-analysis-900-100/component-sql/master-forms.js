/* Reference-style master forms; native APEX values, LOVs, tabs and DML unchanged. */
(function(){
"use strict";
var pages={"4":"Company Master","8":"City Master","22":"Doctype master","25":"Location Master","28":"Financialyear Master","30":"TDS Nature Master","32":"TDS Tax Category Master","34":"TDS Payee Category Master","37":"Item Group Master","39":"Employee Master","42":"Code Scheme Master","47":"HSN Master","49":"Account Master","51":"Measuring Unit Master","53":"Item Characteristics Master","55":"Item Category Master","57":"Industry Sector Master","59":"Item Master","61":"Item Class Master","65":"Item Nature Master","71":"Party Type Master","73":"Packing Type Master","75":"Module Doc Type Master","77":"Module Location Master","79":"Freight Type Master","81":"BOSS User Master","83":"Department Master","85":"Employee Master","87":"Designation Master","89":"Vehicle Type Master","91":"Company Vehicle Master","93":"Footer Account Master","95":"Service Type Master","97":"Group Of Party Master","99":"Service Type Account Master","102":"Footer Head Master","104":"Employee Master","106":"Item Make Master","110":"My Parameter Master","112":"Quality Master","114":"Quality Type Master","116":"Item Quality Master","120":"Cost Centre Master","122":"Currency Unit Master","124":"Bank Master","128":"Storage Location Master","130":"Requisition Master","150":"Issue Return Master","188":"Item Type Master","266":"PT Slab Master","287":"Zone Master","313":"location master","320":"Footer Formula Master","326":"SAC Master","355":"Task Master","356":"Task Assignment Master","367":"Item Grade Master","369":"Item Length Master","371":"Item Width Master","373":"Item Thickness Master","602":"Staff Type Master","604":"Salary Head Master","606":"Leave Master","608":"Loan Category Master","610":"Loan Type Master","616":"Attendence Head Master","618":"Qualification Master","668":"Asset Category Master","716":"Process Routing Master","718":"Process TAT Master"};
function init(){
 var m=document.documentElement.className.match(/(?:^|\s)page-(\d+)/);
 var p=m?Number(m[1]):Number(document.getElementById("pFlowStepId")&&document.getElementById("pFlowStepId").value);
 if(!pages[p] || document.documentElement.classList.contains("hspl-master-form"))return;
 var root=document.querySelector(".t-Body-contentInner")||document.querySelector(".t-Dialog-body");
 if(!root)return;
 var modal=!!document.querySelector(".t-Dialog-body");
 document.documentElement.classList.add("hspl-master-form");
 if(modal)document.documentElement.classList.add("hspl-mf-modal");
 function el(tag,cls,text){var n=document.createElement(tag);if(cls)n.className=cls;if(text)n.textContent=text;return n;}
 var fields=Array.prototype.filter.call(root.querySelectorAll(".t-Form-fieldContainer"),function(f){return !f.closest(".a-IG,.a-IRR,.hspl-drawer,.ui-dialog") && !!f.querySelector("input:not([type=hidden]),select,textarea,.apex-item-display-only");});
 fields.forEach(function(f){
  f.classList.add("hspl-mf-field");
  if(f.querySelector("textarea"))f.classList.add("hspl-mf-wide");
  var col=f.parentElement,row=col&&col.parentElement,container=row&&row.parentElement;
  if(col&&col.classList.contains("col")&&row.classList.contains("row")&&container.classList.contains("container")){
   col.classList.add("hspl-mf-col");row.classList.add("hspl-mf-row");container.classList.add("hspl-mf-fields");
  }
  var region=f.closest(".t-Region");
  if(region)region.classList.add("hspl-mf-card");
  else if(container&&container.parentElement&&/^R[0-9]+$/.test(container.parentElement.id)){container.parentElement.classList.add("hspl-mf-card","hspl-mf-plain-card");}
 });

 // Location forms retain their native region/item IDs while matching the reference groups.
 if(p===25||p===313){
  var groups=[
   ["Basic Information",["location code","location name","short name","parent location","gst no"]],
   ["Coordinates & Accounts",["latitude","longitude","petty cash acc","petty cash account","branch account","is division"]],
   ["Remark",["remark"]]
  ];
  var locationField=fields.find(function(f){var l=f.querySelector("label");return l&&l.textContent.trim().toLowerCase()==="location name";});
  var general=locationField&&locationField.closest(".t-Region");
  var holder=general&&general.querySelector(".hspl-mf-fields");
  if(holder){
   holder.classList.add("hspl-mf-grouped");
   general.classList.add("hspl-mf-grouped-card");
   var anchor=holder.firstChild;
   groups.forEach(function(group){
    var selected=[];
    group[1].forEach(function(name){fields.forEach(function(f){var l=f.querySelector("label");if(l&&l.textContent.trim().toLowerCase()===name&&f.closest(".t-Region")===general)selected.push(f);});});
    if(!selected.length)return;
    var section=el("section","hspl-mf-section");
    section.appendChild(el("h2","",group[0]));
    var grid=el("div","hspl-mf-fields");
    section.appendChild(grid);
    holder.insertBefore(section,anchor);
    selected.forEach(function(f){grid.appendChild(f);});
   });
  }
 }
 var heading=el("header","hspl-mf-heading");
 heading.appendChild(el("p","hspl-mf-eyebrow","Masters / "+pages[p]));
 heading.appendChild(el("h1","",pages[p]));
 heading.appendChild(el("p","","Create and manage "+pages[p].replace(/\s*master\s*/ig," ").trim().toLowerCase()+" records"));
 var content=el("div","hspl-mf-content");
 while(root.firstChild)content.appendChild(root.firstChild);
 root.appendChild(heading);
 root.appendChild(content);
 if(!modal)root.classList.add("hspl-mf-layout");
 var summary=el("aside","hspl-mf-summary");
 summary.setAttribute("aria-label","Record summary");
 // Informational content must not become an automatic keyboard tab stop.
 // In particular, Chromium makes overflowing lists focusable by default.
 summary.setAttribute("tabindex","-1");
 summary.appendChild(el("h2","","Record Summary"));
 var stat=el("div","hspl-mf-stat");stat.appendChild(el("span","","Required fields filled"));
 var count=el("span","hspl-mf-count");stat.appendChild(count);summary.appendChild(stat);
 var progress=el("progress");progress.max=100;progress.setAttribute("tabindex","-1");progress.setAttribute("aria-label","Required fields filled");summary.appendChild(progress);
 var missingTitle=el("h3");summary.appendChild(missingTitle);
 var list=el("ul");list.setAttribute("tabindex","-1");summary.appendChild(list);
 summary.appendChild(el("p","hspl-mf-note","Complete the required fields, then use the form's save action. Standard validation still applies."));
 root.appendChild(summary);
 function updateSummary(){
  var required=fields.filter(function(f){return f.classList.contains("is-required") && !f.hidden && f.style.display!=="none";});
  var missing=[];
  required.forEach(function(f){
   var label=f.querySelector("label[for]"),id=label&&label.htmlFor,node=id&&document.getElementById(id),value="";
   if(!node||node.disabled)return;
   try{value=window.apex&&apex.item?apex.item(id).getValue():node.value;}catch(e){value=node.value;}
   if(Array.isArray(value))value=value.join("");
   if(node.type==="checkbox"&&!node.checked)value="";
   if(value===null||value===undefined||String(value).trim()==="")missing.push((label.textContent||"Required field").trim());
  });
  var total=required.length,filled=total-missing.length;
  count.textContent=filled+" / "+total;
  progress.value=total?Math.round(filled/total*100):100;
  missingTitle.textContent=missing.length?missing.length+" required fields remaining":"Required fields complete";
  while(list.firstChild)list.removeChild(list.firstChild);
  missing.forEach(function(label){list.appendChild(el("li","",label));});
  if(!total)missingTitle.textContent="No required fields marked";
 }
 root.addEventListener("input",updateSummary);root.addEventListener("change",updateSummary);
 if(window.apex&&apex.jQuery)apex.jQuery(document).on("apexafterrefresh.hsplMaster",updateSummary);
 updateSummary();
 // Move on only after a user LOV selection and the popup's focus restoration.
 // Ignore cascading/programmatic changes outside an open LOV interaction.
 if(window.apex&&apex.jQuery){
  apex.jQuery(root).on("change.hsplLovAdvance",".hspl-mf-field input.apex-item-popup-lov",function(){
   var source=this,active=document.activeElement;
   var popupActive=active&&active.closest(".ui-dialog-popuplov");
   if(source.getAttribute("aria-expanded")!=="true"&&!popupActive&&active!==source)return;
   var attempts=0;
   function advance(){
    if(!source.isConnected)return;
    if(source.getAttribute("aria-expanded")==="true"){
     if(++attempts<40)window.setTimeout(advance,50);
     return;
    }
    var focused=document.activeElement;
    if(focused&&focused!==source&&focused!==document.body&&!focused.closest(".ui-dialog-popuplov")&&!source.closest(".hspl-mf-field").contains(focused))return;
    var items=Array.prototype.filter.call(root.querySelectorAll(".hspl-mf-field input,.hspl-mf-field select,.hspl-mf-field textarea"),function(n){
     return n.type!=="hidden"&&!n.disabled&&(!n.readOnly||n.classList.contains("apex-item-popup-lov"))&&n.tabIndex>=0&&n.getClientRects().length&&getComputedStyle(n).visibility!=="hidden"&&!n.closest("[inert],.a-IG,.a-IRR");
    });
    var index=items.indexOf(source);
    if(index>=0&&index+1<items.length)items[index+1].focus();
   }
   window.setTimeout(advance,0);
  });
 }
 // Handle closed LOVs before the legacy input Enter-to-next handler runs.
 // Keep popup selection, multiline input, and ordinary field navigation native.
 var pendingLovInput=null;
 // Enter-only workflow: empty popup search -> first result -> native selection.
 // Nonempty search keeps its normal Enter-to-search behavior.
 var pendingLovSearch=null;
 document.addEventListener("keydown",function(e){
  if((e.key!=="Enter"&&e.keyCode!==13&&e.which!==13)||e.isComposing||e.ctrlKey||e.altKey||e.metaKey||e.shiftKey)return;
  var search=e.target;
  if(!search.matches(".ui-dialog-popuplov input.a-PopupLOV-search")||search.value.trim())return;
  var popup=search.closest(".ui-dialog-popuplov");
  var option=popup.querySelector('.a-IconList-item[role="option"]:not([aria-disabled="true"])');
  if(!option||!option.getClientRects().length)return;
  e.preventDefault();e.stopImmediatePropagation();pendingLovSearch=search;
 },true);
 document.addEventListener("keyup",function(e){
  if((e.key!=="Enter"&&e.keyCode!==13&&e.which!==13)||!pendingLovSearch)return;
  var search=pendingLovSearch;pendingLovSearch=null;
  e.preventDefault();e.stopImmediatePropagation();
  if(search.isConnected&&document.activeElement===search&&window.apex&&apex.jQuery){
   apex.jQuery(search).trigger(apex.jQuery.Event("keydown",{key:"ArrowDown",keyCode:40,which:40}));
  }
 },true);
 root.addEventListener("keyup",function(e){
  if((e.key!=="Enter"&&e.keyCode!==13&&e.which!==13)||!pendingLovInput)return;
  var input=pendingLovInput;pendingLovInput=null;
  e.preventDefault();e.stopImmediatePropagation();
  // Use the LOV's native Arrow Down opening path; a synthetic button click
  // does not open the popup in this APEX version.
  if(input.isConnected&&!input.disabled&&window.apex&&apex.jQuery){
   apex.jQuery(input).trigger(apex.jQuery.Event("keydown",{key:"ArrowDown",keyCode:40,which:40}));
  }
 },true);
 root.addEventListener("keydown",function(e){
  if((e.key!=="Enter"&&e.keyCode!==13&&e.which!==13)||e.isComposing||e.ctrlKey||e.altKey||e.metaKey||e.shiftKey)return;
  var target=e.target;
  if(!target.matches("input.apex-item-popup-lov,select")||!target.closest(".hspl-mf-field")||target.disabled)return;
  if(target.closest(".ui-dialog,.a-IG,.a-IRR")||target.getAttribute("aria-expanded")==="true")return;
  if(target.tagName==="SELECT"){
   if(typeof target.showPicker!=="function")return;
   try{target.showPicker();}catch(ignore){return;}
  }else{
   var group=target.closest(".apex-item-group--popup-lov");
   var button=group&&group.querySelector(".a-Button--popupLOV");
   if(!button||button.disabled)return;
   e.preventDefault();e.stopImmediatePropagation();
   pendingLovInput=target;return;
  }
  e.preventDefault();e.stopImmediatePropagation();
 },true);
 var actions=document.querySelector('[aria-label="FlowButtons"]');
 if(actions&&!modal){actions.classList.add("hspl-mf-actions");root.appendChild(actions);}

 if(modal&&!actions){
  var tables=Array.prototype.filter.call(root.querySelectorAll('table[role="presentation"]'),function(t){
   return t.querySelector('button[aria-label="Create"],button[aria-label="Apply Changes"],button[aria-label="Cancel"]')&&!t.querySelector("input,select,textarea");
  });
  if(tables.length===1){
   actions=el("div","hspl-mf-actions");root.appendChild(actions);actions.appendChild(tables[0]);
  }
 }
 if(!actions){var footerActions=document.querySelector(".t-Dialog-footer .t-ButtonRegion");if(footerActions&&footerActions.querySelector("button"))actions=footerActions;}
 if(actions&&actions.querySelector("button")){
  var headingCopy=el("div","hspl-mf-heading-copy");
  while(heading.firstChild)headingCopy.appendChild(heading.firstChild);
  heading.appendChild(headingCopy);
  heading.classList.add("hspl-mf-heading-with-actions");
  actions.classList.add("hspl-mf-actions","hspl-mf-actions-top");
  heading.appendChild(actions);
 }
 Array.prototype.forEach.call(document.querySelectorAll(".hspl-mf-actions button,.t-Dialog-footer button"),function(b){
  var label=b.getAttribute("aria-label")||b.getAttribute("title")||b.textContent.trim();
  if(/^(create|save|apply changes)$/i.test(label))b.classList.add("hspl-mf-primary");
  if(/^delete$/i.test(label))b.classList.add("hspl-mf-danger");
  if(b.classList.contains("t-Button--noLabel")&&label){b.appendChild(el("span","hspl-mf-action-label",label));b.classList.remove("t-Button--noLabel");}
 });
 // Initial focus only: never steal it after the user starts interacting.
 var focusStopped=false,focusTimers=[];
 function stopInitialFocus(){
  focusStopped=true;focusTimers.forEach(window.clearTimeout);
  document.removeEventListener("pointerdown",noteInteraction,true);
  document.removeEventListener("keydown",noteInteraction,true);
  document.removeEventListener("visibilitychange",focusFirstField);
  window.removeEventListener("focus",focusFirstField);
 }
 function noteInteraction(e){if(e.isTrusted)stopInitialFocus();}
 document.addEventListener("pointerdown",noteInteraction,true);
 document.addEventListener("keydown",noteInteraction,true);
 function focusFirstField(){
   if(focusStopped||document.visibilityState==="hidden")return;
   var errors=Array.prototype.some.call(document.querySelectorAll(".apex-page-item-error,.t-Alert--danger"),function(n){return n.getClientRects().length;});
   if(errors){stopInitialFocus();return;} // Preserve APEX validation/error focus.
   var first=Array.prototype.find.call(root.querySelectorAll(".hspl-mf-field input,.hspl-mf-field select,.hspl-mf-field textarea"),function(n){
    return !/^(hidden|button|submit|reset|image)$/.test(n.type)&&!n.disabled&&(!n.readOnly||n.classList.contains("apex-item-popup-lov"))&&n.tabIndex>=0&&n.getClientRects().length&&getComputedStyle(n).visibility!=="hidden"&&!n.closest("[inert],.a-IG,.a-IRR");
   });
   var active=document.activeElement;
   if(first&&(active===document.body||active===document.documentElement||active===first||!active))first.focus();
 }
 function scheduleInitialFocus(){
  if(focusStopped)return;
  [0,150,500,1200,2500,5000].forEach(function(delay){focusTimers.push(window.setTimeout(focusFirstField,delay));});
 }
 document.addEventListener("visibilitychange",focusFirstField);
 window.addEventListener("focus",focusFirstField);
 if(window.apex&&apex.jQuery)apex.jQuery(document).one("apexreadyend.hsplInitialFocus",scheduleInitialFocus);
 scheduleInitialFocus();
 if(document.readyState!=="complete")window.addEventListener("load",scheduleInitialFocus,{once:true});
}
if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",init);else init();
})();
