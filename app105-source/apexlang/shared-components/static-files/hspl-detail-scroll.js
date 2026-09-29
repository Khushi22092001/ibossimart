/* HSPL_DETAIL_SCROLL_V1
 * The compact totals dock can clip APEX's native scrollbar below the region.
 * Expose a native scroll track at the region level and drive the actual grid
 * scroll owner. Never set table/column widths or touch the APEX data model. */
(function () {
  'use strict';
  var doc = document, states = new Map(), pending = false;

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
    return !!grid.closest('#tabcontainer,.hspl-form-tabs') || detailPanel(panel) ||
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
  }

  function sync(state, value, fromBar) {
    if (!state.owner || state.syncing) return;
    state.syncing = true;
    if (fromBar) state.owner.scrollLeft = value;
    var actual = state.owner.scrollLeft;
    if (state.bar.scrollLeft !== actual) state.bar.scrollLeft = actual;
    state.grid.querySelectorAll('.a-GV-w-hdr').forEach(function (header) {
      if (header.scrollLeft !== actual) header.scrollLeft = actual;
    });
    if (state.region) totalsDocks(state.region).forEach(function (dock) {
      // Depending on the existing layout, either the dock or its inner
      // viewport owns scrolling. Synchronize only containers with a range.
      var views = [dock].concat(Array.prototype.slice.call(dock.querySelectorAll('[class*="live-total-dock-scroll"]')));
      views.forEach(function (view) {
        if (range(view) > 1 && view.scrollLeft !== actual) view.scrollLeft = actual;
      });
    });
    state.syncing = false;
  }

  function update(state) {
    if (!state.grid.isConnected) return;
    var nextOwner = owner(state.grid);
    if (state.owner !== nextOwner) {
      if (state.owner) state.owner.removeEventListener('scroll', state.onOwnerScroll);
      state.owner = nextOwner;
      if (state.owner) {
        state.owner.addEventListener('scroll', state.onOwnerScroll, { passive: true });
        if (state.resize) state.resize.observe(state.owner);
      }
    }
    place(state);
    styleDetailSummary(state);
    if (!state.owner || !state.grid.getBoundingClientRect().width) {
      state.bar.hidden = true;
      return;
    }
    var overflow = range(state.owner);
    state.bar.hidden = overflow <= 1;
    if (overflow <= 1) return;
    // The bar's travel exactly matches the real container's scroll range.
    var width = Math.ceil(state.bar.clientWidth + overflow);
    if (state.space.style.width !== width + 'px') state.space.style.width = width + 'px';
    state.bar.setAttribute('data-scroll-owner', state.owner.className);
    sync(state, state.owner.scrollLeft, false);
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
    var state = { grid: grid, bar: bar, space: space, owner: null, syncing: false };
    state.onOwnerScroll = function () { sync(state, state.owner.scrollLeft, false); };
    bar.addEventListener('scroll', function () { sync(state, bar.scrollLeft, true); }, { passive: true });
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
      if (eligible(grid)) update(bind(grid));
    });
    states.forEach(function (state, grid) {
      if (!grid.isConnected) {
        if (state.resize) state.resize.disconnect();
        if (state.owner) state.owner.removeEventListener('scroll', state.onOwnerScroll);
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
        return Array.prototype.some.call(record.addedNodes, function (node) {
          return node.nodeType === 1 && !node.classList.contains('hspl-detail-scrollbar') &&
            !node.classList.contains('hspl-detail-scrollbar-space');
        });
      })) schedule();
    }).observe(doc.body, { childList: true, subtree: true });
    if (window.apex && apex.jQuery) apex.jQuery(doc).on(
      'apexafterrefresh.hsplDetailScroll apexreadyend.hsplDetailScroll atabsactivate.hsplDetailScroll', schedule);
  }
  doc.addEventListener('click', function (event) {
    if (event.target.closest && event.target.closest('[role="tab"],.t-Tabs-link,.apex-rds a')) schedule();
  }, true);
  window.addEventListener('resize', schedule, { passive: true });
  window.addEventListener('load', schedule, { once: true });
  if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', start, { once: true });
  else start();
}());
