/* Dashboard fast interaction runtime.
 * Page 668 is the read-only reference implementation and owns its own runtime.
 * Page 120 is the excluded legacy Purchase Dashboard.
 */
(function (window, document) {
  'use strict';

  if (!window.apex || !apex.util || !apex.jQuery) return;

  var pageId = Number((apex.env && apex.env.APP_PAGE_ID) ||
    (document.getElementById('pFlowStepId') || {}).value || 0);
  var included = {
    53: 1, 81: 1, 82: 1, 87: 1, 114: 1, 115: 1,
    116: 1, 117: 1, 118: 1, 122: 1, 127: 1, 186: 1, 190: 1, 192: 1,
    194: 1, 340: 1, 652: 1, 653: 1, 654: 1, 655: 1, 656: 1, 657: 1,
    669: 1, 675: 1, 676: 1, 677: 1, 679: 1, 680: 1, 681: 1, 682: 1,
    683: 1, 684: 1, 685: 1, 686: 1, 687: 1, 688: 1, 690: 1, 691: 1,
    692: 1, 693: 1, 694: 1, 695: 1, 696: 1, 697: 1, 699: 1, 700: 1,
    701: 1, 702: 1, 710: 1, 711: 1, 712: 1, 713: 1, 714: 1, 715: 1,
    716: 1, 717: 1, 719: 1, 720: 1, 721: 1, 722: 1, 730: 1, 731: 1,
    732: 1, 733: 1, 734: 1, 735: 1, 737: 1, 738: 1
  };

  if (!included[pageId] || pageId === 668 || pageId === 120) return;

  var util = apex.util;
  var $ = apex.jQuery;
  var itemPrefix = 'P' + pageId + '_';
  var userInteracted = false;
  var lovPriorityUntil = 0;
  var startupQueueUntil = Date.now() + 15000;
  var filterRefreshGuard = false;
  var filterRefreshScrollX = 0;
  var filterRefreshScrollY = 0;
  var filterRefreshToken = 0;

  /* Dashboards always open at their header. Browser/APEX scroll restoration can
   * otherwise make a late lazy report look as if it stole focus on reload. */
  if ('scrollRestoration' in window.history) window.history.scrollRestoration = 'manual';

  /* APEX Popup LOV uses 400 ms internally. Scope the override to this page's
   * Popup LOV construction so every live type-ahead request uses exactly 300 ms.
   */
  if (!util.__dashboardPopup300) {
    var openPopupLov = util.openPopupLov;
    util.openPopupLov = function () {
      var config = arguments[3] || {};
      var target = String(config.itemId || '').indexOf(itemPrefix) === 0;
      if (!target) return openPopupLov.apply(this, arguments);

      var originalDebounce = util.debounce;
      util.debounce = function (fn, wait, immediate) {
        return originalDebounce(fn, wait === 400 ? 300 : wait, immediate);
      };
      try {
        return openPopupLov.apply(this, arguments);
      } finally {
        util.debounce = originalDebounce;
      }
    };
    util.__dashboardPopup300 = true;
  }

  if (!document.getElementById('dashboard-fast-popup-lov-css')) {
    var style = document.createElement('style');
    style.id = 'dashboard-fast-popup-lov-css';
    style.textContent =
      'body:not(.t-PageBody--login) .ui-dialog.ui-dialog-popuplov ' +
      '.a-PopupLOV-search.apex-item-text{' +
      'padding-left:40px!important;padding-right:12px!important;' +
      'box-sizing:border-box!important}' +
      '.dashboard-fast-direct-rows{display:inline-flex;align-items:center;gap:6px;' +
      'margin-left:8px;white-space:nowrap;color:#334155;font-size:12px;font-weight:700}' +
      '.dashboard-fast-direct-rows-select{min-width:66px;height:36px;padding:0 28px 0 10px;' +
      'border:1px solid #d8deea;border-radius:7px;background:#fff;color:#172554;font:inherit}' +
      '.dashboard-fast-direct-rows-select:focus{outline:2px solid #5b5bf7;outline-offset:1px}' +
      /* APEX can render its own Rows selector when show_rows_per_page is on.
       * Keep one unambiguous control only: the dashboard selector deliberately
       * placed immediately to the right of Actions. */
      '.a-IRR-toolbar .a-IRR-rowSelector{display:none!important}' +
      /* Normalise Popup LOV hover across dashboard themes. Keyboard/selected
       * rows remain clearly marked, while a pointer hover is not a dark block. */
      '.ui-dialog-popuplov .a-IconList-item:hover,' +
      '.ui-dialog-popuplov .a-PopupLOV-results .a-IconList-item:hover{' +
      'background:#eef2ff!important;color:#172554!important}' +
      '.ui-dialog-popuplov .a-IconList-item:hover *{' +
      'color:#172554!important}';
    document.head.appendChild(style);
  }

  function focusPopupLovSearch() {
    window.setTimeout(function () {
      var dialogs = document.querySelectorAll('.ui-dialog-popuplov');
      for (var i = dialogs.length - 1; i >= 0; i -= 1) {
        var dialog = dialogs[i];
        if (!dialog.offsetWidth && !dialog.offsetHeight) continue;
        var input = dialog.querySelector('.a-PopupLOV-search');
        if (input) {
          input.focus({ preventScroll: true });
          if (input.setSelectionRange) {
            input.setSelectionRange(input.value.length, input.value.length);
          }
        }
        break;
      }
    }, 40);
  }

  $(document)
    .off('click.dashboardFastLov dialogopen.dashboardFastLov')
    .on('click.dashboardFastLov', '.a-Button--popupLOV,.apex-item-popup-lov', focusPopupLovSearch)
    .on('dialogopen.dashboardFastLov', '.ui-dialog-popuplov', focusPopupLovSearch);

  /* A dashboard can initialise many lazy charts and reports at once. Letting
   * every region start its own ORDS request produces request spikes (Page 684
   * was observed at 15 requests in one second), which can starve a Popup LOV or
   * trigger HTTP 429. Queue same-origin ORDS XHRs at two concurrent requests.
   * The Popup LOV opened by the user receives a short priority window and is
   * sent immediately; no click is cancelled or synthesised here. */
  if (window.XMLHttpRequest && !window.XMLHttpRequest.prototype.__dashboardFastQueued) {
    var xhrProto = window.XMLHttpRequest.prototype;
    var nativeXhrOpen = xhrProto.open;
    var nativeXhrSend = xhrProto.send;
    var nativeXhrAbort = xhrProto.abort;
    var requestQueue = [];
    var activeRequests = 0;
    var maxConcurrentRequests = 2;

    function isDashboardOrdsRequest(url) {
      try {
        var parsed = new URL(String(url || ''), window.location.href);
        return parsed.origin === window.location.origin && /\/ords\//i.test(parsed.pathname);
      } catch (ignore) {
        return false;
      }
    }

    function drainRequestQueue() {
      while (activeRequests < maxConcurrentRequests && requestQueue.length) {
        var entry = requestQueue.shift();
        if (!entry || entry.cancelled) continue;
        activeRequests += 1;
        entry.started = true;
        entry.xhr.addEventListener('loadend', function () {
          activeRequests = Math.max(0, activeRequests - 1);
          window.setTimeout(drainRequestQueue, 80);
        }, { once: true });
        try {
          nativeXhrSend.call(entry.xhr, entry.body);
        } catch (error) {
          activeRequests = Math.max(0, activeRequests - 1);
          window.setTimeout(drainRequestQueue, 0);
          throw error;
        }
      }
    }

    xhrProto.open = function (method, url, async) {
      this.__dashboardFastUrl = url;
      this.__dashboardFastAsync = async !== false;
      this.__dashboardFastQueueEntry = null;
      return nativeXhrOpen.apply(this, arguments);
    };
    xhrProto.send = function (body) {
      var prioritizeLov = Date.now() < lovPriorityUntil;
      var startupRequest = Date.now() < startupQueueUntil;
      if (this.__dashboardFastAsync && startupRequest && !prioritizeLov &&
          isDashboardOrdsRequest(this.__dashboardFastUrl)) {
        var entry = { xhr: this, body: body, started: false, cancelled: false };
        this.__dashboardFastQueueEntry = entry;
        requestQueue.push(entry);
        drainRequestQueue();
        return;
      }
      return nativeXhrSend.call(this, body);
    };
    xhrProto.abort = function () {
      var entry = this.__dashboardFastQueueEntry;
      if (entry && !entry.started) entry.cancelled = true;
      return nativeXhrAbort.apply(this, arguments);
    };
    xhrProto.__dashboardFastQueued = true;
  }

  document.addEventListener('pointerdown', function (event) {
    var button = event.target && event.target.closest &&
      event.target.closest('.a-Button--popupLOV,.apex-item-popup-lov');
    if (button) lovPriorityUntil = Date.now() + 2500;
  }, true);

  /* The global APEX Notification Menu is configured to poll every 10 seconds.
   * On data-heavy dashboards that background request competes with region and
   * Popup LOV Ajax work and can push ORDS into 429 responses. Preserve the
   * initially rendered notification menu, but suppress its automatic refresh
   * condition on these scoped pages. Other application pages are untouched.
   */
  function suppressNotificationAutoPoll() {
    var menu = document.getElementById('notification-menu');
    if (!menu) return false;
    if (menu.querySelector('.dashboard-fast-notification-poll-guard')) return true;
    var guard = document.createElement('span');
    guard.className = 'dashboard-fast-notification-poll-guard';
    guard.hidden = true;
    guard.setAttribute('aria-hidden', 'true');
    menu.appendChild(guard);
    return true;
  }

  /* The notification plug-in is initialised by a Global Page ready action and
   * its first Ajax response may complete well after this file has executed.
   * A few fixed delays therefore miss the menu on exactly the slow pages that
   * need the guard. Observe DOM creation for the first 30 seconds and install
   * the marker as soon as the plug-in creates (or recreates) its host. */
  suppressNotificationAutoPoll();
  if (window.MutationObserver) {
    var notificationPollObserver = new MutationObserver(function () {
      suppressNotificationAutoPoll();
    });
    var notificationObserverRoot = document.body || document.documentElement;
    if (notificationObserverRoot) {
      notificationPollObserver.observe(notificationObserverRoot, {
        childList: true,
        subtree: true
      });
      window.setTimeout(function () {
        suppressNotificationAutoPoll();
        notificationPollObserver.disconnect();
      }, 30000);
    }
  } else {
    [50, 500, 1500, 5000, 10000].forEach(function (delay) {
      window.setTimeout(suppressNotificationAutoPoll, delay);
    });
  }

  /* Filter Apply/Refresh buttons on the legacy dashboards were server-submit
   * buttons. A submit reconstructs the whole page, resets scroll, and can race
   * the chart/report Ajax traffic. On a dashboard filter region, keep the page
   * in place and refresh only query-backed APEX regions. Every report already
   * declares the page items it submits; the startup queue is reopened for this
   * refresh wave so ORDS sees at most two concurrent dashboard requests. */
  function dashboardQueryRegions(filterRegion) {
    var seen = {};
    return Array.prototype.filter.call(document.querySelectorAll('.js-apex-region[id]'), function (node) {
      if (filterRegion && (node === filterRegion || node.contains(filterRegion))) return false;
      if (!node.querySelector('.a-IRR,.a-Report,.t-Report-report,.ds-fast-chart')) return false;
      if (seen[node.id]) return false;
      seen[node.id] = true;
      return true;
    });
  }

  function refreshDashboardFromFilters(button, filterRegion) {
    if (apex.page && typeof apex.page.validate === 'function' && !apex.page.validate()) return;
    var regions = dashboardQueryRegions(filterRegion);
    if (!regions.length) return;

    startupQueueUntil = Date.now() + 60000;
    filterRefreshGuard = true;
    filterRefreshToken += 1;
    var refreshToken = filterRefreshToken;
    filterRefreshScrollX = window.scrollX;
    filterRefreshScrollY = window.scrollY;
    button.disabled = true;
    button.setAttribute('aria-busy', 'true');
    var remaining = regions.length;
    var preserveFilterPosition = function () {
      if (!filterRefreshGuard) return;
      releaseUnexpectedReportFocus(true);
      if (window.scrollX !== filterRefreshScrollX || window.scrollY !== filterRefreshScrollY) {
        window.scrollTo(filterRefreshScrollX, filterRefreshScrollY);
      }
    };
    var release = function () {
      preserveFilterPosition();
      remaining -= 1;
      if (remaining > 0) return;
      button.disabled = false;
      button.removeAttribute('aria-busy');
      [0, 250, 1000, 2500].forEach(function (delay) {
        window.setTimeout(function () {
          if (filterRefreshToken === refreshToken) preserveFilterPosition();
        }, delay);
      });
      window.setTimeout(function () {
        if (filterRefreshToken === refreshToken) filterRefreshGuard = false;
      }, 3000);
    };
    window.setTimeout(function () {
      if (filterRefreshToken !== refreshToken) return;
      button.disabled = false;
      button.removeAttribute('aria-busy');
      preserveFilterPosition();
      filterRefreshGuard = false;
    }, 120000);

    regions.forEach(function (node) {
      $(node).one('apexafterrefresh.dashboardFastApply apexrefresherror.dashboardFastApply', release);
      try {
        apex.region(node.id).refresh();
      } catch (ignore) {
        $(node).trigger('apexrefresh');
      }
    });
  }

  document.addEventListener('click', function (event) {
    var button = event.target && event.target.closest && event.target.closest('button,a.t-Button');
    if (!button) return;
    var filterRegion = button.closest('.ds-dash-filters,.ds-filter-panel,.go-filter,.ds-filterdrawer');
    if (!filterRegion) return;
    var action = String(button.getAttribute('data-otel-label') || button.id || button.textContent || '')
      .replace(/[^A-Z0-9]+/gi, '_').toUpperCase();
    if (!/(^|_)(APPLY|APPLY_FILTERS|REFRESH|UPDATEVIEW|SUBMIT)(_|$)/.test(action)) return;
    event.preventDefault();
    event.stopImmediatePropagation();
    refreshDashboardFromFilters(button, filterRegion);
  }, true);

  /* Page 730 drill state is server-owned. Its hidden focus items stay protected;
   * a small allow-listed Ajax process changes session state before the target
   * region refreshes. Capture phase prevents the legacy handler from submitting
   * protected items and triggering a session-state-protection page redirect.
   */
  if ((String(pageId) === '730' || String(pageId) === '721') && window.apex && apex.server) {
    var drillSelector = '.ds-slc-register-drill,.ds-slc-drill,.ds-exception-count,.ds-vehicle-kpi,.ds-cflow-drill';

    function showDrillError(message) {
      if (apex.message && apex.message.showErrors) {
        apex.message.clearErrors();
        apex.message.showErrors([{ type: 'error', location: 'page', message: message || 'The selected result could not be opened.', unsafe: false }]);
      }
    }

    function refreshAndScroll(regionId) {
      try { apex.region(regionId).refresh(); } catch (ignore) {}
      var target = document.getElementById(regionId);
      if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }

    function setProtectedDrillState(kind, value, value2, success) {
      apex.server.process('SET_DASHBOARD_FOCUS', {
        x01: kind,
        x02: value || '',
        x03: value2 || ''
      }, {
        dataType: 'json',
        success: function (data) {
          if (data && data.success) success();
          else showDrillError(data && data.message);
        },
        error: function (_xhr, _status, error) { showDrillError(error); }
      });
    }

    function handleProtectedDrill(element) {
      if (element.classList.contains('ds-slc-register-drill')) {
        var registerFocus = element.getAttribute('data-focus') || 'SC';
        var registerId = element.getAttribute('data-reg') || 'p730ScRegister';
        setProtectedDrillState('REGISTER', registerFocus, '', function () {
          document.querySelectorAll('.ds-slc-kpireg').forEach(function (node) {
            node.classList.toggle('ds-reg-hidden', node.id !== registerId);
          });
          document.querySelectorAll('.ds-slc-register-drill.is-active').forEach(function (node) { node.classList.remove('is-active'); });
          element.classList.add('is-active');
          refreshAndScroll(registerId);
        });
      } else if (element.classList.contains('ds-slc-drill')) {
        setProtectedDrillState('STAGE', element.getAttribute('data-k') || '', '', function () {
          document.querySelectorAll('.ds-slc-stage.is-active').forEach(function (node) { node.classList.remove('is-active'); });
          if (element.classList.contains('ds-slc-stage')) element.classList.add('is-active');
          refreshAndScroll('p730StageDetail');
        });
      } else if (element.classList.contains('ds-exception-count')) {
        setProtectedDrillState('EXCEPTION', element.getAttribute('data-exc') || '', '', function () { refreshAndScroll('p730Exceptions'); });
      } else if (element.classList.contains('ds-vehicle-kpi')) {
        setProtectedDrillState('VEHICLE', element.getAttribute('data-v') || 'INSIDE', '', function () { refreshAndScroll('p730LiveVehicles'); });
      } else {
        setProtectedDrillState('CFLOW', element.getAttribute('data-c') || '', element.getAttribute('data-o') || '', function () { refreshAndScroll('p730CatFlowDetail'); });
      }
    }

    document.addEventListener('click', function (event) {
      var drill = event.target && event.target.closest && event.target.closest(drillSelector);
      if (!drill) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      handleProtectedDrill(drill);
    }, true);
  }

  /* Match the Page 668 register UX: a direct Rows selector immediately to the
   * right of Actions, capped at 100. Page exports set the initial size to 20;
   * this control changes it with the native IR Ajax pull and never reloads the page.
   */
  var rowsStoreKey = 'dashboard-fast-ir-rows-' + pageId;
  var rowsMemory = {};
  try { rowsMemory = JSON.parse(window.sessionStorage.getItem(rowsStoreKey) || '{}'); } catch (ignore) {}

  function changeRows(select) {
    var id = select.getAttribute('data-region');
    var value = Number(select.value || 20);
    var node = document.getElementById(id + '_ir');
    var widget = node ? $.data(node, 'apex-interactiveReport') : null;
    select.disabled = true;
    rowsMemory[id] = String(value);
    try { window.sessionStorage.setItem(rowsStoreKey, JSON.stringify(rowsMemory)); } catch (ignore) {}
    try {
      if (widget && typeof widget._pull === 'function') {
        widget.options.currentRowsPerPage = value;
        widget._pull({ pReportId: widget.reportId, pData: { f01: [], f02: [] } });
        return;
      }
    } catch (error) {
      select.title = error.message || String(error);
    }
    select.disabled = false;
  }

  function installDirectRows() {
    document.querySelectorAll('.a-IRR-toolbar').forEach(function (toolbar) {
      var action = toolbar.querySelector('.a-IRR-button--actions');
      if (!action || toolbar.querySelector('.dashboard-fast-direct-rows')) return;
      var id = action.id.replace(/_actions_button$/, '');
      var node = document.getElementById(id + '_ir');
      var widget = node ? $.data(node, 'apex-interactiveReport') : null;
      var remembered = rowsMemory[id];
      var current = remembered || String(widget && widget.options.currentRowsPerPage || 20);
      var wrap = document.createElement('label');
      var select = document.createElement('select');
      wrap.className = 'dashboard-fast-direct-rows';
      wrap.appendChild(document.createTextNode('Rows'));
      select.className = 'dashboard-fast-direct-rows-select';
      select.setAttribute('data-region', id);
      select.setAttribute('aria-label', 'Rows per page');
      ['10', '20', '25', '50', '100'].forEach(function (value) {
        var option = document.createElement('option');
        option.value = value;
        option.textContent = value;
        select.appendChild(option);
      });
      select.value = ['10', '20', '25', '50', '100'].indexOf(current) >= 0 ? current : '20';
      wrap.appendChild(select);
      action.insertAdjacentElement('afterend', wrap);
    });
  }

  $(document)
    .off('change.dashboardFastRows apexafterrefresh.dashboardFastRows')
    .on('change.dashboardFastRows', '.dashboard-fast-direct-rows-select', function () { changeRows(this); })
    .on('apexafterrefresh.dashboardFastRows', function () {
      window.setTimeout(function () {
        installDirectRows();
        releaseUnexpectedReportFocus();
        keepInitialDashboardTop();
        window.requestAnimationFrame(keepInitialDashboardTop);
      }, 20);
    });
  installDirectRows();

  /* Initial lazy report construction must not steal focus or scroll the page.
   * Once the user deliberately clicks or types, normal focus behavior resumes.
   */
  function noteUserInteraction() {
    userInteracted = true;
    restoreReportFocus();
    /* A deliberate interaction after Apply owns the viewport; stop restoring
     * the pre-refresh position immediately. The Apply pointerdown itself runs
     * before refreshDashboardFromFilters enables this guard. */
    if (filterRefreshGuard) filterRefreshGuard = false;
  }
  var nativeFocus = window.HTMLElement && window.HTMLElement.prototype.focus;
  var guardedFocus;
  function restoreReportFocus() {
    if (nativeFocus && window.HTMLElement.prototype.focus === guardedFocus) {
      window.HTMLElement.prototype.focus = nativeFocus;
    }
  }
  if (nativeFocus) {
    guardedFocus = function (options) {
      if ((!userInteracted || filterRefreshGuard) && this.closest && this.closest('.a-IRR,.a-GV,.a-IRR-toolbar,.a-Toolbar')) {
        return nativeFocus.call(this, Object.assign({}, options || {}, { preventScroll: true }));
      }
      return nativeFocus.call(this, options);
    };
    // Lazy reports can finish after eight seconds. Keep their initial focus
    // scroll-free until the user takes control, rather than a fixed deadline.
    window.HTMLElement.prototype.focus = guardedFocus;
  }
  document.addEventListener('pointerdown', noteUserInteraction, true);
  document.addEventListener('keydown', noteUserInteraction, true);
  document.addEventListener('wheel', noteUserInteraction, { capture: true, passive: true });
  document.addEventListener('touchstart', noteUserInteraction, { capture: true, passive: true });
  document.addEventListener('focusin', function (event) {
    if ((userInteracted && !filterRefreshGuard) || !event.target || !event.target.closest) return;
    if (event.target.closest('.a-IRR,.a-GV,.a-IRR-toolbar,.a-Toolbar')) {
      event.target.blur();
    }
  }, true);

  function releaseUnexpectedReportFocus(force) {
    if (userInteracted && !force) return;
    var active = document.activeElement;
    if (active && active.closest && active.closest('.a-IRR,.a-GV,.a-IRR-toolbar,.a-Toolbar')) active.blur();
  }
  function keepInitialDashboardTop() {
    if (userInteracted || window.location.hash) return;
    if (window.scrollX || window.scrollY) window.scrollTo(0, 0);
  }
  [0, 50, 250, 800, 1600, 2600, 4000, 6000, 8000, 9500].forEach(function (delay) {
    window.setTimeout(function () {
      installDirectRows();
      releaseUnexpectedReportFocus();
      keepInitialDashboardTop();
    }, delay);
  });
}(window, document));
