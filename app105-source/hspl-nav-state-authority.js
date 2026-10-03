/* One authoritative visual state for the Universal Theme navigation shell.
   The legacy theme controller still exists for unrelated navigation behavior,
   but it must never be allowed to replace the dedicated sidebar preference
   during a document handoff. */
(function () {
  'use strict';

  var html = document.documentElement;
  var stateKey = 'imart.sidebar.state.v1';
  var desired = 'closed';
  var applying = false;

  try {
    var saved = window.localStorage.getItem(stateKey);
    if (saved === 'open' || saved === 'closed') desired = saved;
  } catch (ignore) {}

  function paint() {
    applying = true;
    html.classList.remove(desired === 'open' ? 'hspl-nav-target-closed' : 'hspl-nav-target-open');
    html.classList.add(desired === 'open' ? 'hspl-nav-target-open' : 'hspl-nav-target-closed');
    applying = false;
  }

  function save(next) {
    desired = next;
    try { window.localStorage.setItem(stateKey, next); } catch (ignore) {}
    try { window.sessionStorage.setItem('hspl-nav-preferred-state', next); } catch (ignore) {}
    paint();
  }

  /* Run while parser-loaded application scripts are evaluated, before APEX
     initializes the body classes. */
  paint();

  new MutationObserver(function () {
    if (!applying) paint();
  }).observe(html, { attributes: true, attributeFilter: ['class'] });

  /* A real hamburger press is the only thing that may change the preference.
     Capture it before Universal Theme changes its body classes so both the
     canvas and rail are already using the destination geometry. */
  document.addEventListener('click', function (event) {
    if (!event.target.closest || !event.target.closest('#t_Button_navControl')) return;
    save(desired === 'open' ? 'closed' : 'open');
  }, true);
})();
