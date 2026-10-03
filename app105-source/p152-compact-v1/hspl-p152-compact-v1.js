/* HSPL_P152_COMPACT_LAYOUT_V1
 * Purchase Bill Pass Page 152 presentation only.
 * Existing APEX items/widgets are moved as intact DOM cells; no values,
 * validations, actions or business rules are changed or submitted.
 */
(function () {
  'use strict';

  var PAGE_CLASS = 'page-152';
  var GRID_CLASS = 'hspl-p152-v1-grid';
  var scheduled = false;
  var observer;
  var resizeObserver;
  var observedNodes = new WeakSet();

  var regions = [
    {
      id: 'R604542234807679970',
      key: 'general',
      columns: 4,
      itemIds: [
        'P152_LOCATIONCODE',
        'P152_DOCTYPECODE',
        'P152_PBPASSDATE',
        'P152_PBPASSNO',
        'P152_PARTYCODE'
      ],
      wideItemIds: ['P152_PARTYCODE']
    },
    {
      id: 'R604542269232679971',
      key: 'purchase-bill',
      columns: 2,
      itemIds: [
        'P152_PURCHASEBILLTNO',
        'P152_PBPASSONCODE',
        'P152_FOOTERFROMPURCHASEBILL',
        'P152_REVERSECHARGEIFAPPLICABLE',
        'P152_TAXINROUND',
        'P152_BILLINROUNDFIGURE'
      ]
    },
    {
      id: 'R604542367957679972',
      key: 'currency',
      columns: 2,
      itemIds: ['P152_CURRENCYUNITCODE', 'P152_CURRENCYVALUE']
    },
    {
      id: 'R604542504299679973',
      key: 'nature',
      columns: 2,
      itemIds: ['P152_TDSNATURECODE', 'P152_TRANSACTIONTYPECODE', 'P152_NATUREOFSUPPLY'],
      wideItemIds: ['P152_NATUREOFSUPPLY']
    }
  ];

  function isPage152() {
    return document.documentElement.classList.contains(PAGE_CLASS);
  }

  function fieldCell(itemId) {
    var item = document.getElementById(itemId);
    var field = item && item.closest('.t-Form-fieldContainer');
    var cell = field && field.parentElement;
    return cell && cell.classList.contains('col') ? cell : null;
  }

  function removeEmptyRows(container) {
    Array.prototype.forEach.call(container.children, function (child) {
      if (!child.classList.contains('row')) return;
      if (!child.querySelector(':scope > .col')) child.remove();
    });
  }

  function updateResponsiveState(grid, definition, width) {
    if (!width || width < 1) return;
    grid.classList.toggle('is-medium', definition.columns === 4 && width < 900 && width >= 520);
    grid.classList.toggle('is-narrow', width < (definition.columns === 4 ? 520 : 360));
  }

  function observe(region) {
    if (!resizeObserver || !region || observedNodes.has(region)) return;
    resizeObserver.observe(region);
    observedNodes.add(region);
  }

  function arrangeRegion(definition) {
    var region = document.getElementById(definition.id);
    var container = region && region.querySelector('.t-Region-body > .container');
    var cells = definition.itemIds.map(function (itemId) {
      return { id: itemId, cell: fieldCell(itemId) };
    });

    if (!container || cells.some(function (entry) { return !entry.cell; })) return false;

    var grid = container.querySelector(':scope > .' + GRID_CLASS);
    if (!grid) {
      grid = document.createElement('div');
      grid.className = GRID_CLASS + ' ' + GRID_CLASS + '--' + definition.columns + ' ' + GRID_CLASS + '--' + definition.key;
      container.insertBefore(grid, container.firstElementChild);
    }

    cells.forEach(function (entry, index) {
      var isWide = (definition.wideItemIds || []).indexOf(entry.id) >= 0;
      entry.cell.classList.add('hspl-p152-v1-field');
      entry.cell.classList.toggle('hspl-p152-v1-field--wide', isWide);
      if (grid.children[index] !== entry.cell) grid.appendChild(entry.cell);
    });

    removeEmptyRows(container);
    updateResponsiveState(grid, definition, region.getBoundingClientRect().width);
    observe(region);
    return true;
  }

  function applyLayout() {
    scheduled = false;
    if (!isPage152()) return;
    regions.forEach(arrangeRegion);
    document.documentElement.classList.add('hspl-p152-compact-v1-ready');
  }

  function schedule(delay) {
    if (delay) {
      window.setTimeout(function () { schedule(0); }, delay);
      return;
    }
    if (scheduled) return;
    scheduled = true;
    window.requestAnimationFrame(applyLayout);
  }

  function startObserver() {
    if (observer || !document.body) return;
    observer = new MutationObserver(function (changes) {
      if (changes.some(function (change) { return change.type === 'childList' && change.addedNodes.length > 0; })) {
        schedule(0);
      }
    });
    observer.observe(document.body, { childList: true, subtree: true });

    if (window.ResizeObserver) {
      resizeObserver = new ResizeObserver(function (entries) {
        if (entries.some(function (entry) { return entry.contentRect.width > 0; })) schedule(0);
      });
    }
  }

  function start() {
    if (!isPage152()) return;
    startObserver();
    [0, 80, 250, 700, 1400, 2600, 4200].forEach(schedule);
    document.addEventListener('apexafterrefresh', function () { schedule(0); }, true);
    document.addEventListener('apexreadyend', function () { schedule(0); }, { once: true });
    document.addEventListener('click', function (event) {
      if (event.target.closest && event.target.closest('.t-Tabs-link')) {
        schedule(160);
        schedule(420);
        schedule(900);
      }
    }, true);
    window.addEventListener('resize', function () { schedule(0); }, { passive: true });
  }

  window.HSPL_P152_COMPACT_V1 = {
    version: '1.0.0',
    apply: applyLayout
  };

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start, { once: true });
  else start();
})();
