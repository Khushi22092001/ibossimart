const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const source = fs.readFileSync(__dirname + '/report-column-sizing.js', 'utf8');
const sandbox = {
  window: { addEventListener() {} },
  document: { readyState: 'loading', addEventListener() {}, createElement() { return { getContext() { return { measureText(v) { return { width: v.length * 6 }; } }; } }; } },
  getComputedStyle(c) { return c.style || { font: '12px sans-serif', paddingLeft: '12px', paddingRight: '12px', letterSpacing: '0px' }; },
};
vm.runInNewContext(source.replace('window.IMARTReportSizing={refresh:schedule};', 'window.IMARTReportSizing={category,preferred};'), sandbox);
const { category, preferred } = sandbox.window.IMARTReportSizing;
for (const label of ['GRN NO','PO NO','SO NO','QUOTATION NO','INDENT NO','INVOICE NO','MATERIALIN NO','LOADING ADVICE NO','LR NO','BILTY NO','VOUCHER NO','REFERENCE NO']) {
  assert.equal(category(label, [])[0], 'document', label);
  assert.equal(category(label, [])[1], 210, label);
}
for (const label of ['VENDOR NAME','CUSTOMER NAME','ACCOUNT NAME','MATERIAL NAME','ITEM NAME','PARTY NAME']) assert.equal(category(label, [])[0], 'name', label);
for (const label of ['ADDRESS','DESCRIPTION','REMARKS','NARRATION']) assert.equal(category(label, [])[0], 'long', label);
for (const label of ['DOC STATUS','QTY','UOM','PIN','GST TYPE']) assert.equal(category(label, [])[0], 'small', label);
function cell(text, badgeWidth = 0) { return { textContent: text, querySelectorAll() { return badgeWidth ? [{getBoundingClientRect() {return {width:badgeWidth};}}] : []; } }; }
const doc = preferred('GRN NO', [cell('IMPL/GRN/PUR/26-27/001244')], '12px sans-serif');
assert.ok(doc.width >= 210 && doc.width <= 300);
const name = preferred('VENDOR NAME', [cell('AAYUM ENGINEERING PRIVATE LIMITED (RAIPUR)')], '12px sans-serif');
assert.ok(name.width >= 260 && name.width <= 400);
const normal = Array.from({length:20}, () => cell('Normal Supplier Name'));
const withOutlier = preferred('PARTY NAME', normal.concat(cell('X'.repeat(500))), '12px sans-serif');
assert.equal(withOutlier.width, preferred('PARTY NAME', normal, '12px sans-serif').width);
assert.ok(preferred('DOC STATUS', [cell('ACTIVE',77)], '12px sans-serif').width >= 105, 'badge plus cell padding');
const heading = { style: {font:'13px sans-serif',letterSpacing:'1px'}, querySelector() {return null;}, querySelectorAll() {return [];} };
assert.ok(preferred('ACCOUNT NAME',[cell('Short')],'12px sans-serif',heading).width >= 220);
console.log('PASS: document/name/long/compact categories, real badge chrome, bounds, outlier sampling and header measurement');
