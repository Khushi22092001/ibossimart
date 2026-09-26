(function () {
  'use strict';
  var observedTree = null;
  var paintFrame = 0;
  function tree() { return document.getElementById('t_TreeNav'); }
  function paint() {
    var host = tree();
    if (!host) return;
    host.querySelectorAll('[aria-level]').forEach(function (item) {
      var level = parseInt(item.getAttribute('aria-level'), 10);
      if (!level) return;
      var node = item.classList.contains('a-TreeView-node') ? item : item.closest('.a-TreeView-node') || item;
      for (var i = 1; i <= 5; i++) node.classList.remove('hspl-nav-level-' + i);
      node.classList.add('hspl-nav-level-' + Math.min(level, 5));
      var content = item.matches('.a-TreeView-content') ? item : node.querySelector(':scope>.a-TreeView-content') || item.parentElement && item.parentElement.querySelector(':scope>.a-TreeView-content');
      if (content) {
        for (var c = 1; c <= 5; c++) content.classList.remove('hspl-nav-content-level-' + c);
        content.classList.add('hspl-nav-content-level-' + Math.min(level, 5));
      }
      var row = item.matches('.a-TreeView-row') ? item : node.querySelector(':scope>.a-TreeView-row') || item.parentElement && item.parentElement.querySelector(':scope>.a-TreeView-row');
      if (row) {
        for (var r = 1; r <= 5; r++) row.classList.remove('hspl-nav-row-level-' + r);
        row.classList.add('hspl-nav-row-level-' + Math.min(level, 5));
      }
      if (item.hasAttribute('aria-expanded') || node.querySelector(':scope>[aria-expanded]')) node.classList.add('hspl-nav-has-children');
    });
  }
  function schedulePaint() {
    if (paintFrame) return;
    paintFrame = requestAnimationFrame(function () {
      paintFrame = 0;
      paint();
    });
  }
  function install() {
    var host = tree();
    if (!host || host === observedTree) { schedulePaint(); return; }
    observedTree = host;
    try {
      new MutationObserver(schedulePaint).observe(host, {
        childList: true,
        subtree: true
      });
    } catch (ignore) {}
    schedulePaint();
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', install, { once:true });
  else install();
  document.addEventListener('apexreadyend', install);
})();
