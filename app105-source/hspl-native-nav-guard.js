/* Preserve the server-authored destination of sidebar links. This runs before
   the legacy theme handoff listener, which otherwise rewrites a normal route
   through a stale client-side navigation state. */
(function () {
  'use strict';
  window.addEventListener('click', function (event) {
    if (!event.target || !event.target.closest) return;
    var link = event.target.closest('#t_TreeNav a.a-TreeView-label[href]');
    if (!link || event.defaultPrevented || link.target === '_blank') return;
    var href = link.getAttribute('href');
    if (!href || href === '#' || /^javascript:/i.test(href)) return;
    event.preventDefault();
    event.stopImmediatePropagation();
    window.location.assign(link.href);
  }, true);
})();
