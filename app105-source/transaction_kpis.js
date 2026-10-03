(function () {
  'use strict';
  if (window.IMARTTransactionKpis) return;
  var currentRequest = null;
  var skipGrnCardRefresh = false;
  function section(page) { return document.getElementById('tx-register-kpis-' + page); }
  function reportId(root) {
    var id = root.dataset.reportRegion;
    if (id && document.getElementById(id) && apex.region(id)) return id;
    var reports = Array.from(document.querySelectorAll('main .js-apex-region')).filter(function (el) {
      return el.querySelector('.a-IRR,.a-IG') && apex.region(el.id);
    });
    var named = reports.filter(function (el) { return el.getAttribute('aria-label') === root.dataset.reportLabel; });
    return named.length === 1 ? named[0].id : reports.length === 1 ? reports[0].id : null;
  }
  function load(page) {
    var root = section(page);
    if (!root) return;
    if (currentRequest) currentRequest.abort();
    var content = root.querySelector('[data-kpi-content]');
    if (!content.querySelector('button')) content.textContent = 'Loading KPIs…';
    root.setAttribute('aria-busy', 'true');
    currentRequest = apex.server.process('IMART_TRANSACTION_KPIS', {x01: String(page)}, {
      dataType: 'json', timeout: 15000,
      success: function (data) {
        root.dataset.reportRegion = reportId(root) || data.region;
        root.querySelector('[data-kpi-scope]').textContent = data.scope;
        content.replaceChildren();
        var total = Number(String(data.cards[0].value).replace(/[^0-9.-]/g, ''));
        data.cards.forEach(function (card) {
          if (card.mode === 'STATUS' && (card.status == null || /^NO[ _-]?STATUS$/i.test(String(card.label).trim()))) return;
          var el = document.createElement('button'), label = document.createElement('span'),
            value = document.createElement('strong'), share = document.createElement('span'),
            top = document.createElement('span'), icon = document.createElement('span'),
            bottom = document.createElement('span'), action = document.createElement('span'), arrow = document.createElement('span'),
            body = document.createElement('span'), details = document.createElement('span'), wave = document.createElement('span');
          var status = String(card.label).toUpperCase(), tone = 'info', iconName = 'fa-circle-o';
          if (card.mode === 'ALL') { tone = 'total'; iconName = 'fa-th-large'; }
          else if (card.mode === 'RECENT') { tone = 'info'; iconName = 'fa-calendar'; }
          else if (card.mode === 'MINE') { tone = 'total'; iconName = 'fa-user'; }
          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT|OVERDUE/.test(status)) { tone = 'danger'; iconName = 'fa-ban'; }
          else if (/^ACTIVE$|CLOSED|COMPLETE|FULLY ORDERED|AUTHORI/.test(status)) { tone = 'success'; iconName = 'fa-check-circle-o'; }
          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = 'warning'; iconName = 'fa-clock-o'; }
          else if (/NO STATUS/.test(status)) { tone = 'neutral'; iconName = 'fa-minus-circle'; }
          if (card.status === 'DONE') { tone = 'success'; iconName = 'fa-check-circle-o'; } else if (card.status === 'APPROVAL' || card.status === 'PENDING' || card.status === 'PARTIAL') { tone = 'warning'; iconName = 'fa-clock-o'; } el.className = 'mr-inline-kpi'; el.dataset.tone = tone;
          label.className = 'mr-kpi-status'; label.textContent = card.mode === 'ALL' ? 'Total records' : card.label.replace(/[_-]/g, ' ').toLowerCase().replace(/\b\w/g, function (s) { return s.toUpperCase(); }).replace(/\bPo\b/g, 'PO').replace(/\bGrn\b/g, 'GRN');
          top.className = 'mr-kpi-card-top'; icon.className = 'mr-kpi-card-icon fa ' + (card.mode === 'ALL' ? 'fa-file-text-o' : iconName); icon.setAttribute('aria-hidden', 'true');
          el.type = 'button'; el.setAttribute('aria-pressed', String(card.selected));
          el.setAttribute('aria-label', card.label + ': ' + card.value);
          value.textContent = card.value; share.className = 'mr-kpi-share';
          var count = Number(String(card.value).replace(/[^0-9.-]/g, ''));
          share.textContent = card.note || (card.mode === 'ALL' ? 'All records in this scope' : (total ? (count / total * 100).toFixed(1) : '0') + '% of total records');
          bottom.className = 'mr-kpi-card-bottom'; action.innerHTML = '<span class="mr-kpi-unselected">View records</span><span class="mr-kpi-selected">Showing records</span>';
          arrow.className = 'fa fa-arrow-right'; arrow.setAttribute('aria-hidden', 'true'); bottom.append(action, arrow);
          el.addEventListener('click', function () {
            var buttons = content.querySelectorAll('button');
            buttons.forEach(function (b) { b.disabled = true; });
            apex.server.process('IMART_TX_KPI_FILTER', {x01: String(page), x02: card.mode, x03: card.status}, {
              dataType: 'json', timeout: 15000,
              success: function () {
                buttons.forEach(function (b) { b.setAttribute('aria-pressed', String(b === el)); });
                var id = reportId(root), report = id && apex.region(id);
                if (id) root.dataset.reportRegion = id;
                if (report) { if(page===145)skipGrnCardRefresh=true;report.refresh(); }
                else apex.message.alert('The register could not be refreshed. Please reload this page.');
              },
              error: function () { apex.message.alert('KPI filter could not be applied. Please retry.'); },
              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }
            });
          });
          details.className = 'mr-kpi-card-details'; details.append(label, value, share);
          body.className = 'mr-kpi-card-body'; body.append(icon, details);
          wave.className = 'mr-kpi-wave'; wave.setAttribute('aria-hidden', 'true');
          wave.innerHTML = '<svg viewBox="0 0 120 44" fill="none" focusable="false"><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72 9 84 19 S98 26 119 13" stroke="currentColor" stroke-width="1.2"/><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72 9 84 19 S98 26 119 13 V44 H1 Z" fill="currentColor" opacity=".06"/></svg>';
          body.append(wave); el.append(body, bottom); content.append(el);
        });
      },
      error: function (request, status) {
        if (status !== 'abort' && !content.querySelector('.mr-inline-kpi')) {
          content.textContent = 'KPIs could not be loaded. ';
          var retry = document.createElement('button');
          retry.type = 'button'; retry.textContent = 'Retry';
          retry.addEventListener('click', function () { load(page); });
          content.append(retry);
        }
      },
      complete: function () { currentRequest = null; root.removeAttribute('aria-busy'); }
    });
  }
  function listen() {
    var initial = document.querySelector('.tx-register-kpis');
    if (initial) load(Number(initial.id.replace('tx-register-kpis-', '')));
    apex.jQuery(document).on('apexafterrefresh.imartMasterKpis', '.js-apex-region', function () {
    var root = document.querySelector('.tx-register-kpis');
    if (!root) return;
    var page = Number(root.id.replace('tx-register-kpis-', ''));
    if(page===145 && skipGrnCardRefresh && root.dataset.reportRegion===this.id){skipGrnCardRefresh=false;return;}
    if (root.dataset.reportRegion === this.id) load(page);
  }); }
  window.IMARTTransactionKpis = {reload: load};
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', listen, {once: true});
  else listen();
})();

