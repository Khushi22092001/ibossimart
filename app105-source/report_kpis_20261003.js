(function () {
  'use strict';
  if (window.IMARTReportKpis) return;
  var requests = {};
  function report(root) {
    var id = root.dataset.reportRegion;
    if (id && document.getElementById(id) && apex.region(id)) return apex.region(id);
    var matches = Array.from(document.querySelectorAll('main .js-apex-region')).filter(function (el) {
      return el.getAttribute('aria-label') === root.dataset.reportLabel && el.querySelector('.a-IRR,.a-IG,.t-Report') && apex.region(el.id);
    });
    if (matches.length === 1) { root.dataset.reportRegion = matches[0].id; return apex.region(matches[0].id); }
    return null;
  }
  function pageValues(root) {
    var names = [], values = [];
    (root.dataset.pageItems || '').split(',').forEach(function (selector) {
      var name = selector.replace(/^#/, ''), item, node, value;
      if (!name) return;
      node = document.getElementById(name + '_input') || document.getElementById(name) || document.querySelector('[name="' + name + '"]');
      if (!node) return;
      item = apex.item(name);
      value = 'value' in node ? node.value : null;
      if ((value === null || value === undefined) && item) {
        try { value = item.getValue(); } catch (ignore) { value = null; }
      }
      if (Array.isArray(value)) value = value.join(':');
      names.push(name);
      values.push(value === null || value === undefined || value === '' ? '__IMART_NULL__' : String(value));
    });
    return {names: names, values: values};
  }
  function load(root) {
    var key = root.dataset.kpiRegion, content = root.querySelector('[data-kpi-content]'), payload = {x01: key}, filters = pageValues(root);
    if (filters.names.length) { payload.f01 = filters.names; payload.f02 = filters.values; }
    if (requests[key]) requests[key].abort();
    root.setAttribute('aria-busy', 'true');
    if (!content.querySelector('.mr-inline-kpi')) content.textContent = 'Loading KPIs…';
    requests[key] = apex.server.process('IMART_REPORT_KPIS', payload, {
      dataType: 'json', timeout: 15000,
      success: function (data) {
        root.querySelector('[data-kpi-scope]').textContent = data.scope;
        content.replaceChildren();
        data.cards.forEach(function (card) {
          if (card.mode === 'STATUS' && (!card.status || /^NO[ _-]?STATUS$/i.test(card.label))) return;
          var el = document.createElement('button'), body = document.createElement('span'), icon = document.createElement('span'),
            details = document.createElement('span'), label = document.createElement('span'), value = document.createElement('strong'),
            note = document.createElement('span'), bottom = document.createElement('span'), action = document.createElement('span'), arrow = document.createElement('span');
          var tone = 'info', fa = 'fa-circle-o', status = String(card.label).toUpperCase();
          if (card.mode === 'ALL') { tone = 'total'; fa = 'fa-file-text-o'; }
          else if (card.mode === 'MINE') { tone = 'total'; fa = 'fa-user'; }
          else if (card.mode === 'RECENT') fa = 'fa-calendar';
          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT|OVERDUE|LOSS|^NO$/.test(status)) { tone = 'danger'; fa = 'fa-ban'; }
          else if (/ACTIVE|CLOSED|COMPLETE|AUTHORI|^YES$|WIN/.test(status)) { tone = 'success'; fa = 'fa-check-circle-o'; }
          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = 'warning'; fa = 'fa-clock-o'; }
          el.type = 'button'; el.className = 'mr-inline-kpi'; el.dataset.tone = tone;
          el.setAttribute('aria-pressed', String(card.selected)); el.setAttribute('aria-label', card.label + ': ' + card.value);
          body.className = 'mr-kpi-card-body'; icon.className = 'mr-kpi-card-icon fa ' + fa; icon.setAttribute('aria-hidden', 'true');
          details.className = 'mr-kpi-card-details'; label.className = 'mr-kpi-status'; label.textContent = card.label;
          value.textContent = card.value; note.className = 'mr-kpi-share'; note.textContent = card.note;
          details.append(label, value, note); body.append(icon, details);
          bottom.className = 'mr-kpi-card-bottom'; action.textContent = card.selected ? 'Showing records' : 'View records';
          arrow.className = 'fa fa-arrow-right'; arrow.setAttribute('aria-hidden', 'true'); bottom.append(action, arrow); el.append(body, bottom);
          el.addEventListener('click', function () {
            var api = report(root);
            if (!api) { apex.message.alert('Report region unavailable. Please reload this page.'); return; }
            var buttons = Array.from(content.querySelectorAll('button'));
            buttons.forEach(function (b) { b.disabled = true; });
            apex.server.process('IMART_REPORT_KPI_FILTER', {x01: key, x02: card.mode, x03: card.status}, {
              dataType: 'json', timeout: 15000,
              success: function () {
                buttons.forEach(function (b) { b.setAttribute('aria-pressed', String(b === el)); b.querySelector('.mr-kpi-card-bottom span').textContent = b === el ? 'Showing records' : 'View records'; });
                api.refresh();
              },
              error: function () { apex.message.alert('KPI filter could not be applied. Please retry.'); },
              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }
            });
          });
          content.append(el);
        });
      },
      error: function (request, status) {
        if (status === 'abort') return;
        if (!content.querySelector('.mr-inline-kpi')) {
          content.textContent = 'KPIs unavailable. ';
          var retry = document.createElement('button'); retry.type = 'button'; retry.textContent = 'Retry';
          retry.addEventListener('click', function () { load(root); }); content.append(retry);
        }
      },
      complete: function () { delete requests[key]; root.removeAttribute('aria-busy'); }
    });
  }
  function listen() {
    var roots = Array.from(document.querySelectorAll('.coverage-register-kpis'));
    roots.forEach(load);
    apex.jQuery(document).on('apexafterrefresh.imartReportCoverage', '.js-apex-region', function () {
      var region = this.id;
      roots.forEach(function (root) {
        if (root.dataset.reportRegion !== region) return;
        var key = root.dataset.kpiRegion;
        load(root);
      });
    });
  }
  window.IMARTReportKpis = {reload: function () { document.querySelectorAll('.coverage-register-kpis').forEach(load); }};
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', listen, {once: true}); else listen();
})();
