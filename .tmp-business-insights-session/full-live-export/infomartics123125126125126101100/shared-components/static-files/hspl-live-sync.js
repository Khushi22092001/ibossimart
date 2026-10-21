(function () {
  if (window.hsplLiveSyncS) return;
  window.hsplLiveSyncS = true;

  function openRootWhenNavIsOpen() {
    if (!document.body || !document.body.classList.contains('js-navExpanded')) return;
    var root = document.querySelector('#t_TreeNav .a-TreeView-node--topLevel.is-expandable');
    var toggle = root && root.querySelector(':scope > .a-TreeView-toggle');
    if (toggle) toggle.click();
  }

  function itemValue(id) {
    var value = '';
    try { value = String(apex.item(id).getValue() || '').trim(); } catch (ignore) {}
    if (value) return value;
    var element = document.getElementById(id) || document.getElementById(id + '_input');
    return element ? String(element.value || element.textContent || '').trim() : '';
  }

  function syncMaterialCompletion() {
    if (!document.documentElement.classList.contains('page-69')) return;
    var ids = ['P69_LOCATIONCODE', 'P69_MATERIALINDATE', 'P69_DOCTYPECODE', 'P69_PARTYCODE', 'P69_REFDOCTYPECODE', 'P69_REFDOCNO'];
    var done = ids.filter(function (id) { return !!itemValue(id); }).length;
    var total = ids.length;
    var missing = total - done;
    var percent = Math.round(done / total * 100);
    var setText = function (selector, text) {
      var element = document.querySelector(selector);
      if (element) element.textContent = text;
    };
    setText('.mi-assistant .mi-percent', percent + '%');
    setText('.mi-assistant .mi-missing', missing);
    setText('.mi-required-panel h3 b', done + '/' + total);
    setText('#SR_General .mi-message-missing', missing);
    var assistantBar = document.querySelector('.mi-assistant .mi-progress i');
    var messageBar = document.querySelector('#SR_General .mi-completion em');
    var messagePercent = document.querySelector('#SR_General .mi-completion b');
    if (assistantBar) assistantBar.style.width = percent + '%';
    if (messageBar) messageBar.style.width = percent + '%';
    if (messagePercent) messagePercent.textContent = percent + '%';
    document.querySelectorAll('.mi-required-row').forEach(function (row, index) {
      var complete = !!itemValue(ids[index]);
      row.classList.toggle('is-complete', complete);
      var check = row.querySelector('.mi-required-check');
      var status = row.querySelector('small');
      if (check) check.innerHTML = complete ? '&#10003;' : '';
      if (status) status.textContent = complete ? 'Completed' : 'Required';
    });
  }

  function run() {
    setTimeout(openRootWhenNavIsOpen, 30);
    setTimeout(syncMaterialCompletion, 50);
    setTimeout(syncMaterialCompletion, 500);
  }

  function init() {
    run();
    document.addEventListener('input', syncMaterialCompletion, true);
    document.addEventListener('change', syncMaterialCompletion, true);
    document.addEventListener('apexafterrefresh', run, true);
    if (document.body) {
      new MutationObserver(run).observe(document.body, { attributes: true, attributeFilter: ['class'] });
    }
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
