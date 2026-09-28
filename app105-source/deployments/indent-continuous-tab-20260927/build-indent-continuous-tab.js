const fs = require("fs");

const file = process.argv[2];
if (!file) throw new Error("Usage: node build-indent-continuous-tab.js <page-export.sql>");

let sql = fs.readFileSync(file, "utf8");

const oldBlock = [
  "'/* HSPL_CROSSFORM_DETAIL_INTEGRITY_V1 */',",
  "'(function(){',",
  "'  \"use strict\";',",
  "'  if(Number(apex.env.APP_PAGE_ID||0)!==108||window.hsplCrossformDetailIntegrityV1)return;',",
  "'  window.hsplCrossformDetailIntegrityV1=true;',",
  "'  var heldFromDetail=false;',",
  "'  function inDetail(target){return !!(target&&target.closest&&target.closest(\"#detail,#Detail_ig,#item-detail,#item-detail_ig\"));}',",
  "'  document.addEventListener(\"keydown\",function(event){',",
  "'    if(event.key!==\"Tab\")return;',",
  "'    if(!event.repeat){heldFromDetail=inDetail(event.target);return;}',",
  "'    if(heldFromDetail){event.preventDefault();event.stopImmediatePropagation();}',",
  "'  },true);',",
  "'  document.addEventListener(\"keyup\",function(event){if(event.key===\"Tab\")heldFromDetail=false;},true);',",
  "'  window.addEventListener(\"blur\",function(){heldFromDetail=false;});',",
  "'  ',",
  "'})();',",
  "'',",
].join("\n");

const newBlock = [
  "'/* HSPL_INDENT_CONTINUOUS_TAB_V1 */',",
  "'// Repeated Tab is intentionally left to the Interactive Grid native focus order.',",
  "'',",
].join("\n");

if (!sql.includes(oldBlock)) throw new Error("Old Page 108 held-Tab blocker not found");
sql = sql.replace(oldBlock, newBlock);

fs.writeFileSync(file, sql, "utf8");
console.log(`Patched ${file}`);
console.log("Removed repeated-Tab prevention; Interactive Grid native column order remains authoritative.");
