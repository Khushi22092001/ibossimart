// Build the reviewed import from a fresh local APEX export; never commit that export.
const fs = require('fs');
const path = require('path');
const input = process.argv[2];
if (!input) throw new Error('Usage: node prepare-page.cjs <fresh-page197.sql>');
const page = fs.readFileSync(input, 'utf8').replace(/\r\n/g, '\n');
if (!page.includes("p_default_application_id=>105") || !page.includes("p_default_workspace_id=>4744311978888504"))
 throw new Error('Expected application 105 in the verified workspace.');
const marker = 'wwv_flow_imp_page.create_page_da_action(\n p_id=>wwv_flow_imp.id(443390428449794154)';
const start = page.indexOf(marker);
const end = page.indexOf('\nwwv_flow_imp_page.', start + marker.length);
if (start < 0 || end < 0 || page.indexOf(marker, start + 1) !== -1) throw new Error('Pass action target is missing/ambiguous.');
const old = page.slice(start, end);
const pos = old.indexOf("  'plsql_code',");
const finish = old.indexOf("  'show_processing'", pos);
if (pos < 0 || finish < 0) throw new Error('Unexpected APEX export attribute format.');
const code = fs.readFileSync(path.join(__dirname, 'pass-action.sql'), 'utf8').trim();
let patched = old.slice(0, pos) + "  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(\n" +
 code.split(/\r?\n/).map(line => "    '" + line.replace(/'/g, "''") + "'").join(',\n') + ")),\n" + old.slice(finish);
for (const [from,to] of [
 ["'items_to_return', 'P197_IMART_STATUS_DONE'", "'items_to_return', 'P197_IMART_STATUS_DONE,P197_STATUS'"],
 ["'items_to_submit', 'P197_TNO,P197_COMPANYCODE,P197_IMART_SAVE_OP_ID,P197_IMART_WORKFLOW_START'", "'items_to_submit', 'P197_TNO,P197_COMPANYCODE,P197_IMART_SAVE_OP_ID,P197_IMART_WORKFLOW_START,P197_PASSFAILREMARK'"]
]) {
 if (!patched.includes(from)) throw new Error('Unexpected original Pass item contract; inspect drift.');
 patched = patched.replace(from,to);
}
const zeroOffset = s => s.replace(/p_default_id_offset=>\d+/, 'p_default_id_offset=>0');
fs.writeFileSync(path.join(__dirname, 'page197.sql'), zeroOffset(page.slice(0,start)+patched+page.slice(end)));
fs.writeFileSync(path.join(__dirname, 'rollback-page197.sql'), zeroOffset(page));
console.log('Prepared page197.sql and rollback-page197.sql locally. Review before deployment.');
