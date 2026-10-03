// Pure viewport tests; no browser, database, network or data-entry mutations.
const fs = require('node:fs');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const source = fs.readFileSync('apexlang/shared-components/static-files/hspl-detail-scroll.js', 'utf8');
const sizing = source.slice(source.indexOf('  function compactRows('), source.indexOf('  function place('));
function run(heights, total, expected) {
  const values = new Map();
  let resizeCalls = 0;
  const rows = heights.map(height => ({ getBoundingClientRect: () => ({ height }) }));
  const body = { querySelectorAll: selector => selector.includes('.a-GV-row') ? rows : [] };
  const view = { querySelector: () => null, contains: () => false };
  const model = { getTotalRecords: () => total, subscribe: () => 'test-observer', unSubscribe: () => {} };
  const view$ = { grid: method => {
    if (method === 'getModel') return model;
    if (method === 'resize') { resizeCalls++; return; }
    throw new Error('Unexpected grid mutation: ' + method);
  } };
  const grid = {
    getBoundingClientRect: () => ({ width: 100 }),
    querySelectorAll: () => [body], querySelector: () => view,
    classList: { add: () => {} },
    style: { getPropertyValue: key => values.get(key), setProperty: (key, value) => values.set(key, value) }
  };
  const context = { window: { apex: true }, apex: { jQuery: () => view$ }, doc: {}, schedule: () => {} };
  vm.createContext(context);
  vm.runInContext(sizing, context);
  const state = { grid };
  context.compactRows(state);
  assert.equal(values.get('--hspl-detail-row-height'), expected + 'px');
  assert.equal(resizeCalls, 1);
  context.compactRows(state);
  assert.equal(resizeCalls, 1, 'unchanged height must not trigger another resize');
}
run([40], 1, 42);
run([40, 40], 2, 82);
run([32, 32, 40], 3, 106);
run([32, 32, 32, 32, 32, 40], 6, 202);
run([32, 32, 32, 32, 32, 32, 40], 7, 202);
run([40], 3, 122); // virtual-rendered one row, three actual model rows
run([40.4, 40.4, 0], 3, 83); // hidden legacy aggregate must not add empty space
console.log('PASS: content-sized 1/2/3 rows, six-row cap, virtualization, hidden totals, resize only on change');
