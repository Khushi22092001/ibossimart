const fs = require("fs");

const source = fs.readFileSync(process.argv[2], "utf8");
const start = source.indexOf(",p_javascript_code=>");
if (start < 0) throw new Error("p_javascript_code not found");
let end = source.indexOf(",p_inline_css=>", start);
if (end < 0) end = source.indexOf("wwv_flow_imp_page.create_page_plug(", start);
const exportFragment = source.slice(start, end);
const strings = [...exportFragment.matchAll(/'((?:''|[^'])*)'/g)]
  .map(match => match[1].replace(/''/g, "'"));
const javascript = strings.join("");
new Function(javascript);
console.log(`JavaScript syntax OK; ${javascript.length} characters checked`);
