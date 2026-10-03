// Isolated scroll-event regression tests, not a substitute for a live UI test.
const fs = require('node:fs');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const source = fs.readFileSync('apexlang/shared-components/static-files/hspl-detail-scroll.js', 'utf8');
const functions = source.slice(source.indexOf('  function writeScroll('), source.indexOf('  function update('));
const frames = [];
const context = { window: { requestAnimationFrame: callback => { frames.push(callback); return frames.length; } } };
vm.createContext(context);
vm.runInContext(functions, context);
function node(max = 1000) {
  let left = 0;
  return { get scrollLeft() { return left; }, set scrollLeft(value) { left = Math.max(0, Math.min(max, value)); } };
}
function setup() {
  frames.length = 0;
  const owner = node(), bar = node(), header = node(), dock = node();
  const state = { owner, bar, targets: [bar, header, dock], grid: {
    isConnected: true, querySelectorAll: () => { throw Error('DOM discovery during gesture'); }
  }, syncing: false, echoPositions: new WeakMap(), scrollFrame: null, pendingScroll: null };
  return { state, owner, bar, header, dock };
}
function flush() { while (frames.length) frames.shift()(); }
function aligned(test, expected) {
  for (const key of ['owner', 'bar', 'header', 'dock']) assert.equal(test[key].scrollLeft, expected, key);
}
{
  const t = setup();
  for (let i = 1; i <= 100; i++) { t.bar.scrollLeft = i; context.queueScroll(t.state, t.bar); }
  assert.equal(frames.length, 1, 'coalesce gesture burst into one animation frame');
  flush(); aligned(t, 100);
  context.queueScroll(t.state, t.owner); // asynchronous programmatic echo
  assert.equal(frames.length, 0, 'owner echo must not schedule another commit');
}
{
  const t = setup();
  t.bar.scrollLeft = 100; context.queueScroll(t.state, t.bar); flush();
  t.bar.scrollLeft = 200; context.queueScroll(t.state, t.bar);
  context.queueScroll(t.state, t.owner); // stale 100px owner echo arrives late
  assert.equal(t.bar.scrollLeft, 200, 'thumb must not be rewound to the old owner position');
  flush(); aligned(t, 200);
}
{
  const t = setup();
  t.owner.scrollLeft = 400; context.queueScroll(t.state, t.owner); flush(); aligned(t, 400);
  context.queueScroll(t.state, t.bar); assert.equal(frames.length, 0, 'bar echo ignored');
  t.bar.scrollLeft = 250; context.queueScroll(t.state, t.bar); flush(); aligned(t, 250);
  context.queueScroll(t.state, t.owner);
  t.owner.scrollLeft = 600; context.queueScroll(t.state, t.owner); flush(); aligned(t, 600);
}
{
  const t = setup();
  t.bar = t.state.bar = node(1500); t.state.targets[0] = t.bar;
  t.bar.scrollLeft = 1400; context.queueScroll(t.state, t.bar); flush(); aligned(t, 1000);
  context.queueScroll(t.state, t.owner); context.queueScroll(t.state, t.bar);
  assert.equal(frames.length, 0, 'clamped owner/bar echoes ignored');
}
{
  const t = setup(); t.bar.scrollLeft = 12.5; context.queueScroll(t.state, t.bar); flush(); aligned(t, 12.5);
  t.state.grid.isConnected = false;
  t.bar.scrollLeft = 20; context.queueScroll(t.state, t.bar); flush();
  assert.equal(t.owner.scrollLeft, 12.5, 'detached grid must not receive stale queued writes');
}
console.log('PASS: latest-gesture coalescing, stale-echo suppression, bidirectional sync, clamping, fractional positions, detached-grid guard; no gesture DOM queries');
