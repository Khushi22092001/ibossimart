/* HSPL register first-paint lifecycle gate.  Presentation only. */
(function () {
  'use strict';

  function tone(text) {
    var value = String(text || '').toUpperCase();
    if (!value) return null;
    if (/\b(PENDING|REJECT|CANCEL|FAIL|DECLIN|EXPIR|OVERDUE|UNPAID|UNAPPROV|CRITICAL|STOCK[\s-]?OUT|NEGATIVE|DEAD\b|BELOW[\s-]?MIN|STILL[\s-]?NO|SHORTAGE)/.test(value)) return 'is-danger';
    if (/\b(HOLD|PARTIAL|PARTLY|IN[\s-]?PROCESS|PROCESSING|IN[\s-]?PROGRESS|AWAIT|DRAFT|OPEN|SLOW|NON[\s-]?MOV|LOW[\s-]?RATIO|LOW\b|EXCESS|OVERSTOCK|IDLE|STUCK|NO[\s-]?OUTPUT|NO[\s-]?INPUT|NOT[\s-]?ISSUED|SHORT[\s-]?ISSUED|BELOW[\s-]?REORDER|NOT[\s-]?COSTED|DELAY|OUT.?IN)/.test(value)) return 'is-warn';
    if (/\b(PREPAR|APPROV|COMPLET|PASS|DISPATCH|DELIVER|DONE|SUCCESS|ACTIVE|ISSUED|RECEIV|CLOSED|PAID|VERIFIED|ACCEPT|CONFIRM|BALANCED|HEALTHY|WITHIN|COVERED|ADEQUATE|MOVING|NORMAL|FAST|FULLY|COSTED|CLEAN)/.test(value)) return 'is-ok';
    return 'is-info';
  }

  function reports(root) {
    var found = [];
    if (root && root.nodeType === 1 && root.matches('.a-IRR')) found.push(root);
    if (root && root.querySelectorAll) found = found.concat(Array.prototype.slice.call(root.querySelectorAll('.a-IRR')));
    return found;
  }

  function decorate(report) {
    var statusHeaders = {}, dayHeaders = {};
    Array.prototype.forEach.call(report.querySelectorAll('th[id]'), function (header) {
      var label = (header.textContent || '').toUpperCase();
      if (label.indexOf('STATUS') !== -1) statusHeaders[header.id] = true;
      if (/DAY/.test(label) && /(REMAINING|OVERDUE)/.test(label)) dayHeaders[header.id] = true;
    });

    Array.prototype.forEach.call(report.querySelectorAll('td[headers]'), function (cell) {
      if (cell.querySelector('.hspl-status-pill') || cell.querySelector('a,button,input,select,textarea,img')) return;
      var headers = (cell.getAttribute('headers') || '').split(/\s+/);
      if (headers.join(' ').toUpperCase().indexOf('STATUS') === -1 && !headers.some(function (id) { return statusHeaders[id]; })) return;
      var text = (cell.textContent || '').trim();
      if (!text || text.length > 40) return;
      var pill = document.createElement('span');
      pill.className = 'hspl-status-pill ' + tone(text);
      pill.textContent = text;
      cell.textContent = '';
      cell.appendChild(pill);
    });

    Array.prototype.forEach.call(report.querySelectorAll('td[headers]'), function (cell) {
      if (cell.querySelector('.hspl-num-pill') || cell.querySelector('a,button,input,select,textarea')) return;
      var headers = (cell.getAttribute('headers') || '').split(/\s+/);
      if (!headers.some(function (id) { return dayHeaders[id]; })) return;
      var text = (cell.textContent || '').trim(), number = parseFloat(text.replace(/,/g, ''));
      if (!text || isNaN(number) || number >= 0) return;
      var pill = document.createElement('span');
      pill.className = 'hspl-num-pill is-danger';
      pill.textContent = text;
      cell.textContent = '';
      cell.appendChild(pill);
    });
  }

  function prepare(root) {
    reports(root || document).forEach(function (report) {
      decorate(report);
      report.classList.add('hspl-register-paint-ready');
    });
  }

  function start() {
    if (!(window.apex && apex.jQuery)) return;
    apex.jQuery(document)
      .one('apexreadyend.hsplRegisterFirstPaint', function () { prepare(document); })
      /* Keep the old, styled report visible while its request is pending.
         A replacement IR starts without our ready class; APEX dispatches
         afterrefresh synchronously after inserting its new DOM. */
      .on('apexafterrefresh.hsplRegisterFirstPaint', function (event) { prepare(event.target); });
  }

  /* Application JavaScript is evaluated before APEX initializes its widgets.
     Bind now: DOM ready alone does not mean fixed headings/LOVs are ready. */
  start();
}());
