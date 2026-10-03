/* HSPL_P118_COMPACT_LAYOUT_V2
 * Purchase Order Page 118 presentation only.
 * Reuses the existing APEX items and regions; no values, actions or business
 * rules are created, replaced or submitted by this script.
 */
(function () {
  'use strict';

  var PAGE_CLASS = 'page-118';
  var HEADER_GRID_CLASS = 'hspl-p118-v2-header-grid';
  var CARD_GRID_CLASS = 'hspl-p118-v2-card-grid';
  var INNER_GRID_CLASS = 'hspl-p118-v2-inner-grid';
  var scheduled = false;
  var observer;
  var resizeObserver;
  var observedResizeNodes = new WeakSet();

  var headerFields = [
    { id: 'P118_LOCATIONCODE', key: 'location' },
    { id: 'P118_DOCTYPECODE', key: 'doctype' },
    { id: 'P118_PURCHASEORDERDATE', key: 'po-date' },
    { id: 'P118_DELIVERYDATE', key: 'delivery-date' },
    { id: 'P118_PURCHASEORDERNO', key: 'po-number' },
    { id: 'P118_PARTYCODE', key: 'party' },
    { id: 'P118_QUANTITY', key: 'quantity' },
    { id: 'P118_ISOPENSPEC', key: 'open-spec' }
  ];

  var cardRegions = [
    { id: 'R275990603573701561', key: 'ship-to' },
    { id: 'R667376656749376113', key: 'currency' },
    { id: 'R667376419227376111', key: 'texts' },
    { id: 'R667376750619376114', key: 'select-indent' },
    { id: 'OTHER', key: 'other-information' },
    { id: 'R667376949381376116', key: 'gst' },
    { id: 'POAMENDMENTDETAIL', key: 'po-amendment', wide: true }
  ];

  var innerRegions = [
    {
      id: 'R667376656749376113',
      key: 'currency',
      itemIds: ['P118_CURRENCYUNITCODE', 'P118_CURRENCYVALUE']
    },
    {
      id: 'R667376419227376111',
      key: 'texts',
      itemIds: ['P118_SUBJECTTEXT', 'P118_REFERENCETEXT', 'P118_LETTERTEXT', 'P118_TITLETEXT']
    },
    {
      id: 'R667376750619376114',
      key: 'select-indent',
      itemIds: ['P118_RATECONTRACTTNO', 'P118_COMPARATIVESTATEMENTTNO', 'P118_QUOTATIONTNO', 'P118_INDENTTNO']
    },
    {
      id: 'R667376949381376116',
      key: 'gst',
      itemIds: ['P118_TRANSACTIONTYPECODE', 'P118_NATUREOFSUPPLYCODE']
    },
    {
      id: 'OTHER',
      key: 'other-information',
      itemIds: [
        'P118_EMPLOYEECODE',
        'P118_AGENTCODE',
        'P118_CREDITDAYS',
        'P118_COMMISSIONRATE',
        'P118_FREIGHTTYPECODE',
        'P118_REMARK'
      ]
    },
    {
      id: 'POAMENDMENTDETAIL',
      key: 'po-amendment',
      itemIds: ['P118_POAMENDMENTNO', 'P118_POAMENDMENTAMOUNT']
    }
  ];

  function isPage118() {
    return document.documentElement.classList.contains(PAGE_CLASS);
  }

  function fieldCell(itemId) {
    var item = document.getElementById(itemId);
    var field = item && item.closest('.t-Form-fieldContainer');
    var cell = field && field.parentElement;
    return cell && cell.classList.contains('col') ? cell : null;
  }

  function regionCell(regionId) {
    var region = document.getElementById(regionId);
    return region && region.closest('.col');
  }

  function setResponsiveClass(grid, width) {
    if (!width || width < 1) return;
    grid.classList.toggle('is-medium', width < 960 && width >= 620);
    grid.classList.toggle('is-narrow', width < 620);
  }

  function setInnerResponsiveClass(grid, width) {
    if (!width || width < 1) return;
    grid.classList.toggle('is-narrow', width < 360);
  }

  function observeResize(node) {
    if (!resizeObserver || !node || observedResizeNodes.has(node)) return;
    resizeObserver.observe(node);
    observedResizeNodes.add(node);
  }

  function removeEmptyNativeRows(container, protectedRow) {
    Array.prototype.forEach.call(container.children, function (child) {
      if (child === protectedRow || !child.classList.contains('row')) return;
      if (!child.querySelector(':scope > .col')) child.remove();
    });
  }

  function arrangeHeader() {
    var general = document.getElementById('R667376559217376112');
    var bodyContainer = general && general.querySelector('.t-Region-body > .container');
    var cells = headerFields.map(function (field) {
      return { meta: field, cell: fieldCell(field.id) };
    });

    if (!bodyContainer || cells.some(function (entry) { return !entry.cell; })) return false;

    var grid = bodyContainer.querySelector(':scope > .' + HEADER_GRID_CLASS);
    if (!grid) {
      grid = document.createElement('div');
      grid.className = HEADER_GRID_CLASS;
      bodyContainer.insertBefore(grid, bodyContainer.firstElementChild);
    }

    cells.forEach(function (entry, index) {
      entry.cell.classList.add('hspl-p118-v2-field', 'hspl-p118-v2-field--' + entry.meta.key);
      if (grid.children[index] !== entry.cell) grid.appendChild(entry.cell);
    });

    removeEmptyNativeRows(bodyContainer, null);
    setResponsiveClass(grid, general.getBoundingClientRect().width);
    return true;
  }

  function arrangeCards() {
    var general = document.getElementById('R667376559217376112');
    var generalCell = general && general.closest('.col');
    var mainRow = generalCell && generalCell.parentElement;
    var outerContainer = mainRow && mainRow.parentElement;
    var cards = cardRegions.map(function (region) {
      return { meta: region, cell: regionCell(region.id) };
    });

    if (!outerContainer || !mainRow || cards.some(function (entry) { return !entry.cell; })) return false;

    generalCell.classList.add('hspl-p118-v2-general-cell');
    mainRow.classList.add('hspl-p118-v2-general-row');

    var grid = outerContainer.querySelector(':scope > .' + CARD_GRID_CLASS);
    if (!grid) {
      grid = document.createElement('div');
      grid.className = CARD_GRID_CLASS;
      mainRow.insertAdjacentElement('afterend', grid);
    }

    cards.forEach(function (entry, index) {
      entry.cell.classList.add('hspl-p118-v2-card', 'hspl-p118-v2-card--' + entry.meta.key);
      entry.cell.classList.toggle('hspl-p118-v2-card--wide', !!entry.meta.wide);
      if (grid.children[index] !== entry.cell) grid.appendChild(entry.cell);
    });

    Array.prototype.forEach.call(outerContainer.querySelectorAll(':scope > .hspl-p118-compact-board'), function (legacyBoard) {
      if (!legacyBoard.querySelector('.t-Region')) legacyBoard.remove();
    });
    removeEmptyNativeRows(outerContainer, mainRow);
    setResponsiveClass(grid, outerContainer.getBoundingClientRect().width);
    return true;
  }

  function arrangeInnerCards() {
    var allReady = true;

    innerRegions.forEach(function (definition) {
      var region = document.getElementById(definition.id);
      var bodyContainer = region && region.querySelector('.t-Region-body > .container');
      var cells = definition.itemIds.map(function (itemId) { return fieldCell(itemId); });

      if (!bodyContainer || cells.some(function (cell) { return !cell; })) {
        allReady = false;
        return;
      }

      var grid = bodyContainer.querySelector(':scope > .' + INNER_GRID_CLASS);
      if (!grid) {
        grid = document.createElement('div');
        grid.className = INNER_GRID_CLASS + ' ' + INNER_GRID_CLASS + '--' + definition.key;
        bodyContainer.insertBefore(grid, bodyContainer.firstElementChild);
      }

      cells.forEach(function (cell, index) {
        cell.classList.add('hspl-p118-v2-inner-field');
        if (grid.children[index] !== cell) grid.appendChild(cell);
      });

      removeEmptyNativeRows(bodyContainer, null);
      setInnerResponsiveClass(grid, region.getBoundingClientRect().width);
      observeResize(region);
    });

    return allReady;
  }

  function applyLayout() {
    scheduled = false;
    if (!isPage118()) return;
    arrangeHeader();
    arrangeCards();
    arrangeInnerCards();
    document.documentElement.classList.add('hspl-p118-compact-v2-ready');
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
      var needsLayout = changes.some(function (change) {
        return change.type === 'childList' && change.addedNodes.length > 0;
      });
      if (needsLayout) schedule(0);
    });
    observer.observe(document.body, { childList: true, subtree: true });

    if (window.ResizeObserver) {
      resizeObserver = new ResizeObserver(function (entries) {
        if (entries.some(function (entry) { return entry.contentRect.width > 0; })) schedule(0);
      });
      var general = document.getElementById('R667376559217376112');
      var generalTab = document.getElementById('General');
      if (general) resizeObserver.observe(general);
      if (generalTab) resizeObserver.observe(generalTab);
    }
  }

  function start() {
    if (!isPage118()) return;
    startObserver();
    [0, 80, 250, 700, 1400, 2600, 4200, 5600, 6800].forEach(schedule);
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

  window.HSPL_P118_COMPACT_V2 = {
    version: '2.2.0',
    apply: applyLayout
  };

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start, { once: true });
  else start();
})();
