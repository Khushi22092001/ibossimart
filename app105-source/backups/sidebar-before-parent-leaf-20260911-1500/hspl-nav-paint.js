(function () {
  'use strict';
  function paint() {
    document.querySelectorAll('.t-Body-nav [aria-level]').forEach(function (item) {
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
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', paint);
  else paint();
  document.addEventListener('apexreadyend', paint);
  new MutationObserver(paint).observe(document.documentElement, {
    childList: true,
    subtree: true,
    attributes: true,
    attributeFilter: ['aria-level', 'aria-expanded']
  });
})();
