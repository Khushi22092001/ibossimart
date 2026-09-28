const fs = require("fs");

const file = process.argv[2];
if (!file) throw new Error("Usage: node build-indent-sanction-copy.js <page-export.sql>");

let sql = fs.readFileSync(file, "utf8");

const oldFinish = [
  "'      model.setValue(job.record, job.field, job.raw);',",
  "'      var qty = job.field === \"INDENTQUANTITY1\" ? n(job.raw) : job.qtySnapshot;',",
].join("\n");

const newFinish = [
  "'      model.setValue(job.record, job.field, job.raw);',",
  "'      if (job.field === \"INDENTQUANTITY1\" && Math.abs(n(model.getValue(job.record, \"QUANTITY1\")) - n(job.raw)) > 0.0000001) {',",
  "'        model.setValue(job.record, \"QUANTITY1\", job.raw);',",
  "'      }',",
  "'      var qty = job.field === \"INDENTQUANTITY1\" ? n(job.raw) : job.qtySnapshot;',",
].join("\n");

if (!sql.includes(oldFinish)) throw new Error("Pending edit finish insertion point not found");
sql = sql.replace(oldFinish, newFinish);

const eventId = "38685850495424873";
const pattern = new RegExp(
  `(wwv_flow_imp_page\\.create_page_da_event\\(\\r?\\n p_id=>wwv_flow_imp\\.id\\(${eventId}\\)[\\s\\S]*?,p_bind_event_type=>'change'\\r?\\n)(\\);)`
);
const match = sql.match(pattern);
if (!match) throw new Error("Set Sanctioned event not found");
if (match[1].includes("p_display_when_type")) throw new Error("Set Sanctioned event already has a display condition");
sql = sql.replace(pattern, `$1,p_display_when_type=>'NEVER'\n$2`);

fs.writeFileSync(file, sql, "utf8");
console.log(`Patched ${file}`);
console.log("Primary sanctioned quantity now copies only after an actual indent quantity edit; the old AJAX copy is disabled.");
