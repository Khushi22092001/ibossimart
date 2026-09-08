(function () {
"use strict";
var pages=[68,107,129,137,139,142,145,147,151,160,167,170,174,194,207,212,216,220,229,243,245,265,291,293,294,295,304,316,349,351,375,414,417,419,644,707,709,711];
function adapt(){
 var pageInput=document.getElementById("pFlowStepId");
 var page=pageInput ? Number(pageInput.value) : Number((document.documentElement.className.match(/(?:^|\s)page-(\d+)/)||[])[1]);
 if(pages.indexOf(page)===-1 || document.querySelector(".hspl-drawer,.js-filter-drawer"))return;
 var candidates=Array.prototype.filter.call(document.querySelectorAll(".t-Region"),function(r){
  var title=r.querySelector(".t-Region-title");
  return title && r.querySelector(".t-Form-fieldContainer") && !r.querySelector(".a-IRR,.a-IG") &&
   (/^filters?$/i.test(title.textContent.trim()) || /register/i.test(title.textContent));
 });
 if(candidates.length!==1)return;
 candidates[0].classList.add("hspl-drawer");
}
if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",adapt);
else adapt();
})();
