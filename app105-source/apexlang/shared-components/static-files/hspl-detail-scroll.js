/* HSPL_DETAIL_SCROLL_V1
 * The compact totals dock can clip APEX's native scrollbar below the region.
 * Expose a native scroll track at the region level and drive the actual grid
 * scroll owner. Never set table/column widths or touch the APEX data model. */
(function () {
  'use strict';
  var doc = document, states = new Map(), rowStates = new Map(), pending = false;

  function detailPanel(panel) {
    if (!panel) return false;
    if (/detail/i.test(panel.id || '')) return true;
    var labelled = (panel.getAttribute('aria-labelledby') || '').split(/\s+/);
    return labelled.some(function (id) {
      var label = doc.getElementById(id);
      return label && /detail/i.test(label.textContent || '');
    });
  }

  function eligible(grid) {
    var panel = grid.closest('.a-Tabs-panel,[role="tabpanel"]');
    var region = regionFor(grid);
    var heading = region && region.querySelector('.t-Region-title,.t-IRR-title');
    var standaloneDetail = heading && /detail/i.test(heading.textContent || '') &&
      !!doc.querySelector('.t-Form-fieldContainer,[id$="_FORMSTATUS"]');
    return !!grid.closest('#tabcontainer,.hspl-form-tabs') || detailPanel(panel) ||
      standaloneDetail ||
      grid.classList.contains('hspl-detail-grid') ||
      (/detail/i.test(grid.id || '') &&
       !!doc.querySelector('.t-Form-fieldContainer,[id$="_FORMSTATUS"]'));
  }

  function range(node) {
    return node ? Math.max(0, node.scrollWidth - node.clientWidth) : 0;
  }

  function owner(grid) {
    var candidates = Array.prototype.slice.call(grid.querySelectorAll('.a-GV-w-scroll,.a-GV-bdy'));
    candidates.sort(function (a, b) { return range(b) - range(a); });
    return candidates[0] || null;
  }

  function regionFor(grid) {
    return grid.closest('.js-apex-region:not(.a-IG)') || grid.parentElement;
  }

  function totalsDocks(region) {
    // Older form-specific totals use a page prefix; newer ones use hspl.
    return Array.prototype.filter.call(region.querySelectorAll('[class*="live-total-dock"]'), function (node) {
      return Array.prototype.some.call(node.classList, function (name) {
        return /-live-total-dock$/.test(name);
      });
    });
  }

  function styleDetailSummary(state) {
    var panel = state.grid.closest('.a-Tabs-panel,[role="tabpanel"]');
    if (!detailPanel(panel) && !/detail/i.test(state.region.id || '')) return;
    (panel || state.region).querySelectorAll('.t-Form-fieldContainer').forEach(function (field) {
      var control = field.querySelector('input.apex-item-number,input.number_field');
      if (!control || control.type === 'hidden' || field.closest('.a-IG,.a-GV') ||
          !(state.grid.compareDocumentPosition(field) & Node.DOCUMENT_POSITION_FOLLOWING)) return;
      // Presentation classes only: keep the original item, value, read-only
      // state, label, validation placeholder and all APEX event handlers.
      field.classList.add('hspl-summary-card');
      var key = (control.id || '').toUpperCase();
      var tone = /FOOTER|TAX|ROUND/.test(key) && !/BEFORE/.test(key) ? 'tax' : 'base';
      if (!/SUMOF|BEFORE|ROUND/.test(key) && /AMOUNT|TOTAL/.test(key)) tone = 'final';
      field.setAttribute('data-summary-tone', tone);
    });
    (panel || state.region).querySelectorAll('.t-Region').forEach(function (region) {
      if (region.contains(state.grid) || !region.querySelector('.hspl-summary-card') ||
          !(state.grid.compareDocumentPosition(region) & Node.DOCUMENT_POSITION_FOLLOWING)) return;
      var fields = Array.prototype.slice.call(region.querySelectorAll('.t-Form-fieldContainer'));
      // Only flatten amount-summary regions; leave mixed form sections alone.
      if (!fields.length || fields.some(function (field) {
        return !field.classList.contains('hspl-summary-card');
      })) return;
      var container = fields[0].closest('.container');
      if (!container || fields.some(function (field) { return !container.contains(field); })) return;
      region.classList.add('hspl-detail-summary-wide');
      container.classList.add('hspl-summary-flow');
      var column = region.parentElement, row = column && column.parentElement;
      if (column && column.classList.contains('col') && row && row.classList.contains('row')) {
        // APEX inserts empty offset columns. Remove only the empty spacer,
        // never a sibling field/region, and retain the original DOM and events.
        Array.prototype.forEach.call(row.children, function (sibling) {
          if (sibling !== column && sibling.classList.contains('col') &&
              sibling.querySelector('.apex-grid-nbsp') &&
              !sibling.querySelector('.t-Form-fieldContainer,.t-Region,button,input,select,textarea')) {
            sibling.classList.add('hspl-summary-empty-offset');
          }
        });
        column.classList.add('hspl-summary-full-column');
        row.classList.add('hspl-summary-layout-row');
      }
    });
  }

  function compactRows(state) {
    var grid = state.grid;
    if (!grid.getBoundingClientRect().width) return;
    var bodies = Array.prototype.slice.call(grid.querySelectorAll('.a-GV-bdy'));
    var height = 0, rowHeight = 0, renderedCount = 0, hiddenCount = 0;
    bodies.forEach(function (body) {
      hiddenCount = Math.max(hiddenCount, Array.prototype.filter.call(
        body.querySelectorAll('tbody .a-GV-row[data-id]'), function (row) {
          return row.getBoundingClientRect().height === 0;
        }).length);
      var rows = Array.prototype.filter.call(body.querySelectorAll('tbody .a-GV-row[data-id]'), function (row) {
        return row.getBoundingClientRect().height > 0;
      });
      renderedCount = Math.max(renderedCount, rows.length);
      var measuredRows = rows.map(function (row) { return row.getBoundingClientRect().height; });
      // Include the active editor's height in the six-row cap even when it
      // moves past row six. Sort measurements only, never DOM/data rows.
      var visibleHeight = 0;
      measuredRows.sort(function (a, b) { return b - a; }).slice(0, 6).forEach(function (measured) {
        rowHeight = Math.max(rowHeight, measured);
        visibleHeight += measured;
      });
      height = Math.max(height, visibleHeight);
      body.querySelectorAll('.a-GV-altMessage').forEach(function (message) {
        height = Math.max(height, message.getBoundingClientRect().height);
      });
    });
    var view = grid.querySelector('.a-IG-gridView.a-GV'), view$ = null, model = null;
    if (view && window.apex && apex.jQuery) {
      view$ = apex.jQuery(view);
      try { model = view$.grid('getModel'); } catch (ignore) { /* Not initialized yet. */ }
    }
    if (state.model !== model) {
      if (state.model && state.subscription) state.model.unSubscribe(state.subscription);
      state.model = model;
      state.subscription = model ? model.subscribe({ onChange: function (type) {
        if (/^(insert|delete|refresh|refreshRecords|addData|clearChanges|revert|metaChange|destroy)$/.test(type)) schedule();
      } }) : null;
    }
    // The old initial-capacity cap could be one row forever. Count model rows
    // as well as rendered rows: APEX virtual rendering may only render the
    // current tiny viewport. Read only; never fetch/insert/update model data.
    var count = renderedCount;
    if (model && rowHeight) {
      var total = model.getTotalRecords(true);
      // Some legacy grids retain a hidden aggregate record behind their
      // external totals dock. Never reserve an extra data-row slot for it.
      if (total >= 0) count = Math.max(count, Math.min(6, total - hiddenCount));
    }
    // Use the measured sum when rows are rendered (the active editor can be
    // taller than inactive rows). Estimate only rows not yet virtual-rendered.
    if (rowHeight && renderedCount < Math.min(6, count)) {
      height += (Math.min(6, count) - renderedCount) * rowHeight;
    }
    if (!height) return;
    var target = Math.ceil(height + 2);
    grid.classList.add('hspl-detail-content-height');
    if (grid.style.getPropertyValue('--hspl-detail-row-height') !== target + 'px') {
      grid.style.setProperty('--hspl-detail-row-height', target + 'px');
      // Resize only after a real height change. No resizeColumns, refresh,
      // stretch setting, focus movement or keyboard-event interception.
      if (view$ && model) view$.grid('resize');
    }
    // APEX still owns selection/editing. Only correct vertical clipping of
    // its active row after Tab/model insertion or after the six-row cap.
    var active = view && view.querySelector('.a-GV-bdy .a-GV-row.is-active');
    if (active && view.contains(doc.activeElement)) {
      var scroll = active.closest('.a-GV-w-scroll,.a-GV-w-frozen,.a-GV-bdy');
      if (scroll) {
        var rect = active.getBoundingClientRect(), bounds = scroll.getBoundingClientRect();
        if (rect.bottom > bounds.bottom) scroll.scrollTop += rect.bottom - bounds.bottom;
        else if (rect.top < bounds.top) scroll.scrollTop -= bounds.top - rect.top;
      }
    }
  }

  function place(state) {
    var region = regionFor(state.grid);
    if (!region) return;
    state.region = region;
    var dock = totalsDocks(region)[0];
    totalsDocks(region).forEach(function (node) { node.classList.add('hspl-detail-total-plain'); });
    var anchor = dock || state.grid;
    // Keep the bar outside the height-clipped IG and inside its Detail region.
    if (anchor.parentElement && anchor.nextElementSibling !== state.bar) {
      anchor.parentElement.insertBefore(state.bar, anchor.nextSibling);
    }
    // The legacy totals dock reclaims APEX's unused footer with a negative
    // margin. Its old grid frame must not paint through the following summary.
    // Clip only that unused slot, never the scroll viewport or any data row.
    var gap = dock && state.owner ? Math.max(0, state.grid.getBoundingClientRect().bottom -
      Math.max(dock.getBoundingClientRect().top, state.owner.getBoundingClientRect().bottom)) : 0;
    state.grid.classList.toggle('hspl-detail-docked-grid', gap > 1);
    state.grid.style.setProperty('--hspl-unused-footer-slot', Math.floor(gap) + 'px');
  }

  function cacheScrollTargets(state) {
    // Geometry/DOM discovery belongs to refresh/resize, not the gesture path.
    state.targets = [state.bar].concat(Array.prototype.slice.call(
      state.grid.querySelectorAll('.a-GV-w-hdr')));
    if (state.region) totalsDocks(state.region).forEach(function (dock) {
      var views = [dock].concat(Array.prototype.slice.call(
        dock.querySelectorAll('[class*="live-total-dock-scroll"]')));
      views.forEach(function (view) {
        if (range(view) > 1) state.targets.push(view);
      });
    });
  }

  function writeScroll(state, node, value) {
    if (node.scrollLeft === value) return;
    // Native scroll notifications are asynchronous. A synchronous `syncing`
    // flag alone cannot distinguish their echoes from a fresh user gesture.
    node.scrollLeft = value;
    state.echoPositions.set(node, node.scrollLeft);
  }

  function sync(state, value, fromBar) {
    if (!state.owner || state.syncing) return;
    state.syncing = true;
    try {
      if (fromBar) writeScroll(state, state.owner, value);
      var actual = state.owner.scrollLeft;
      state.targets.forEach(function (target) {
        writeScroll(state, target, actual);
      });
    } finally {
      state.syncing = false;
    }
  }

  function queueScroll(state, source) {
    if (!state.owner || state.syncing) return;
    var value = source.scrollLeft;
    if (state.echoPositions.has(source)) {
      var expected = state.echoPositions.get(source);
      state.echoPositions.delete(source);
      if (value === expected) return;
    }
    // Keep the latest real gesture; don't let an older owner echo pull a
    // moving thumb backwards. One commit per paint, with no artificial delay,
    // animation, wheel scaling, or replacement of native drag/momentum.
    state.pendingScroll = { value: value, fromBar: source === state.bar };
    if (state.scrollFrame !== null) return;
    state.scrollFrame = window.requestAnimationFrame(function () {
      state.scrollFrame = null;
      var intent = state.pendingScroll;
      state.pendingScroll = null;
      if (intent && state.grid.isConnected) sync(state, intent.value, intent.fromBar);
    });
  }

  function update(state) {
    if (!state.grid.isConnected) return;
    var nextOwner = owner(state.grid);
    if (state.owner !== nextOwner) {
      if (state.owner) state.owner.removeEventListener('scroll', state.onOwnerScroll);
      if (state.scrollFrame !== null) window.cancelAnimationFrame(state.scrollFrame);
      state.scrollFrame = null;
      state.pendingScroll = null;
      state.echoPositions = new WeakMap();
      state.owner = nextOwner;
      if (state.owner) {
        state.owner.addEventListener('scroll', state.onOwnerScroll, { passive: true });
        if (state.resize) state.resize.observe(state.owner);
      }
    }
    place(state);
    cacheScrollTargets(state);
    styleDetailSummary(state);
    if (!state.owner || !state.grid.getBoundingClientRect().width) {
      state.bar.hidden = true;
      return;
    }
    var overflow = range(state.owner);
    state.bar.hidden = overflow <= 1;
    // Hide redundant tracks only while the replacement has a real owner.
    // Keep APEX's scroll containers and their event handlers intact.
    state.grid.classList.toggle('hspl-detail-scroll-managed', overflow > 1);
    var panel = state.grid.closest('.a-Tabs-panel,[role="tabpanel"]') || state.region;
    panel.querySelectorAll('.mi-detail-hscroll').forEach(function (track) {
      track.classList.toggle('hspl-detail-legacy-track', overflow > 1);
    });
    if (overflow <= 1) return;
    // The bar's travel exactly matches the real container's scroll range.
    var width = Math.ceil(state.bar.clientWidth + overflow);
    if (state.space.style.width !== width + 'px') state.space.style.width = width + 'px';
    state.bar.setAttribute('data-scroll-owner', state.owner.className);
    // A scan must not rewind a gesture waiting for this frame's commit.
    if (state.scrollFrame === null) sync(state, state.owner.scrollLeft, false);
  }

  function bind(grid) {
    if (states.has(grid)) return states.get(grid);
    var bar = doc.createElement('div'), space = doc.createElement('div');
    bar.className = 'hspl-detail-scrollbar';
    bar.tabIndex = 0;
    bar.setAttribute('role', 'region');
    bar.setAttribute('aria-label', 'Scroll Detail columns horizontally');
    bar.hidden = true;
    if (grid.id) bar.setAttribute('aria-controls', grid.id);
    space.className = 'hspl-detail-scrollbar-space';
    space.setAttribute('aria-hidden', 'true');
    bar.appendChild(space);
    var state = { grid: grid, bar: bar, space: space, owner: null, syncing: false,
      targets: [], echoPositions: new WeakMap(), scrollFrame: null, pendingScroll: null };
    state.onOwnerScroll = function () { queueScroll(state, state.owner); };
    bar.addEventListener('scroll', function () { queueScroll(state, bar); }, { passive: true });
    if (window.ResizeObserver) {
      state.resize = new ResizeObserver(schedule);
      state.resize.observe(grid);
      grid.querySelectorAll('.a-GV-table').forEach(function (table) { state.resize.observe(table); });
    }
    states.set(grid, state);
    return state;
  }

  function scan() {
    pending = false;
    doc.querySelectorAll('.a-IG').forEach(function (grid) {
      var rowState = rowStates.get(grid);
      if (!rowState) {
        rowState = { grid: grid };
        if (window.ResizeObserver) {
          rowState.resize = new ResizeObserver(schedule);
          rowState.resize.observe(grid);
        }
        rowStates.set(grid, rowState);
      }
      if (rowState.resize) grid.querySelectorAll('.a-GV-table').forEach(function (table) {
        rowState.resize.observe(table);
      });
      compactRows(rowState);
      if (eligible(grid)) update(bind(grid));
    });
    rowStates.forEach(function (state, grid) {
      if (!grid.isConnected) {
        if (state.resize) state.resize.disconnect();
        if (state.model && state.subscription) state.model.unSubscribe(state.subscription);
        rowStates.delete(grid);
      }
    });
    states.forEach(function (state, grid) {
      if (!grid.isConnected) {
        if (state.resize) state.resize.disconnect();
        if (state.owner) state.owner.removeEventListener('scroll', state.onOwnerScroll);
        if (state.scrollFrame !== null) window.cancelAnimationFrame(state.scrollFrame);
        state.bar.remove();
        states.delete(grid);
      }
    });
  }

  function schedule() {
    if (pending) return;
    pending = true;
    window.requestAnimationFrame(scan);
  }

  function start() {
    scan();
    new MutationObserver(function (records) {
      if (records.some(function (record) {
        return record.removedNodes.length || Array.prototype.some.call(record.addedNodes, function (node) {
          return node.nodeType === 1 && !node.classList.contains('hspl-detail-scrollbar') &&
            !node.classList.contains('hspl-detail-scrollbar-space');
        });
      })) schedule();
    }).observe(doc.body, { childList: true, subtree: true });
    if (window.apex && apex.jQuery) apex.jQuery(doc).on(
      'apexafterrefresh.hsplDetailScroll apexreadyend.hsplDetailScroll atabsactivate.hsplDetailScroll interactivegridviewmodelcreate.hsplDetailScroll gridpagechange.hsplDetailScroll gridcurrentcellchange.hsplDetailScroll gridmodechange.hsplDetailScroll', schedule);
  }
  doc.addEventListener('focusin', function (event) {
    if (event.target.closest && event.target.closest('.a-IG')) schedule();
  });
  doc.addEventListener('click', function (event) {
    if (event.target.closest && event.target.closest('[role="tab"],.t-Tabs-link,.apex-rds a')) schedule();
  }, true);
  window.addEventListener('resize', schedule, { passive: true });
  window.addEventListener('load', schedule, { once: true });
  if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', start, { once: true });
  else start();
}());
