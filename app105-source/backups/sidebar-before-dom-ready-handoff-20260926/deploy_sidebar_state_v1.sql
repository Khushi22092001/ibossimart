whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_js constant clob := q'~(function () {
  'use strict';

  var STATE_KEY = 'imart.sidebar.state.v1';
  var SCROLL_KEY = 'imart.sidebar.scroll.v1';
  var CONTEXT_KEY = 'imart.sidebar.context.v1';
  /* v2 stores only a branch the user explicitly opened with its arrow.
     The old v1 value was inferred from the current page and caused unwanted
     auto-expansion during ordinary navigation. */
  var BRANCH_KEY = 'imart.sidebar.branch.v2';
  var RAIL_ID = 'hspl_CollapsedRail';
  var PREVIEW_ID = 'hspl_ExpandedPreview';
  var desired = null;
  var started = false;
  var toggleIntentCaptured = false;
  var correctingBodyState = false;
  var restoringScroll = false;
  var contextPath = null;
  var cleanManualOpen = false;
  var collapsedRailNavigating = false;
  var toggleSettleTimer = 0;

  document.documentElement.classList.add('hspl-sidebar-restoring');

  function body() { return document.body; }
  function toggle() { return document.getElementById('t_Button_navControl'); }
  function desktop() {
    return !window.matchMedia || window.matchMedia('(min-width: 768px)').matches;
  }
  function open() {
    return !!body() && body().classList.contains('js-navExpanded');
  }
  function closed() {
    return !!body() && body().classList.contains('js-navCollapsed') && !open();
  }
  function readState() {
    try {
      var value = window.localStorage.getItem(STATE_KEY);
      return value === 'open' || value === 'closed' ? value : null;
    } catch (ignore) { return null; }
  }
  function writeNativePreference(value) {
    /* Universal Theme owns a separate application-scoped ToggleCore value.
       If this stays `true`, every destination initializes expanded and our
       controller can only collapse it afterwards, producing the visible
       open/close flash. Synchronize the native preference before navigation
       so UT creates the destination in its final state. */
    try {
      if (window.apex && apex.storage && apex.storage.getScopedSessionStorage) {
        apex.storage.getScopedSessionStorage({
          prefix: 'ORA_WWV_apex.toggleCore.nav',
          usePageId: false,
          useAppId: true
        }).setItem('preferenceForExpanded', value === 'open');
      }
    } catch (ignore) {}
  }
  function writeState(value) {
    desired = value;
    try { window.localStorage.setItem(STATE_KEY, value); } catch (ignore) {}
    try { window.sessionStorage.setItem('hspl-nav-preferred-state', value); } catch (ignore) {}
    writeNativePreference(value);
    paintDesiredState(value);
  }

  function paintDesiredState(value) {
    /* Keep the requested width authoritative for the whole document, not only
       during startup.  Several legacy pages rewrite Universal Theme's body
       classes after ready; removing this guard allowed one expanded frame
       before the observer restored a user's closed preference. */
    var html = document.documentElement;
    html.classList.remove(
      value === 'open' ? 'hspl-nav-target-closed' : 'hspl-nav-target-open'
    );
    html.classList.add(
      value === 'open' ? 'hspl-nav-target-open' : 'hspl-nav-target-closed'
    );
  }

  function beginToggleWindow() {
    var html = document.documentElement;
    html.classList.add('hspl-sidebar-toggling');
    if (toggleSettleTimer) window.clearTimeout(toggleSettleTimer);
    toggleSettleTimer = window.setTimeout(function () {
      html.classList.remove('hspl-sidebar-toggling');
      toggleSettleTimer = 0;
    }, 110);
  }
  function readScrollTop() {
    try {
      var value = window.sessionStorage.getItem(SCROLL_KEY);
      if (value === null) return null;
      value = parseInt(value, 10);
      return isNaN(value) || value < 0 ? null : value;
    } catch (ignore) { return null; }
  }
  function pathFromHref(href) {
    try {
      var path = new URL(href, window.location.href).pathname.replace(/\/+$/, '');
      return (path || '/').toLowerCase();
    } catch (ignore) { return null; }
  }
  function readContextPath() {
    try { return window.sessionStorage.getItem(CONTEXT_KEY); }
    catch (ignore) { return null; }
  }
  function writeContextPath(href) {
    var path = pathFromHref(href);
    if (!path) return;
    contextPath = path;
    try { window.sessionStorage.setItem(CONTEXT_KEY, path); } catch (ignore) {}
  }
  function readBranchPath() {
    try { return window.sessionStorage.getItem(BRANCH_KEY); }
    catch (ignore) { return null; }
  }
  function writeBranchPath(href) {
    var path = pathFromHref(href);
    if (!path) return;
    try { window.sessionStorage.setItem(BRANCH_KEY, path); } catch (ignore) {}
  }
  function clearBranchPath(href) {
    var path = href ? pathFromHref(href) : null;
    try {
      if (!path || window.sessionStorage.getItem(BRANCH_KEY) === path) {
        window.sessionStorage.removeItem(BRANCH_KEY);
      }
    } catch (ignore) {}
  }
  function resetManualNavigationContext() {
    contextPath = null;
    try {
      window.sessionStorage.removeItem(SCROLL_KEY);
      window.sessionStorage.removeItem(CONTEXT_KEY);
      window.sessionStorage.removeItem(BRANCH_KEY);
    } catch (ignore) {}
  }
  function saveScrollTop() {
    var tree = document.getElementById('t_TreeNav');
    if (!open() || !tree || restoringScroll) return;
    try { window.sessionStorage.setItem(SCROLL_KEY, String(Math.max(0, tree.scrollTop))); } catch (ignore) {}
  }
  function restoreScrollTop(currentLink) {
    var tree = document.getElementById('t_TreeNav');
    if (!tree) return;
    var saved = readScrollTop();
    restoringScroll = true;
    if (saved !== null) {
      tree.scrollTop = Math.min(saved, Math.max(0, tree.scrollHeight - tree.clientHeight));
    }
    function keepCurrentVisible() {
      if (!currentLink) return;
      try {
        var currentTarget = currentLink.closest('li.a-TreeView-node') || currentLink;
        var treeRect = tree.getBoundingClientRect();
        var linkRect = currentTarget.getBoundingClientRect();
        if (linkRect.top < treeRect.top || linkRect.bottom > treeRect.bottom) {
          currentTarget.scrollIntoView({ block: 'nearest' });
        }
      } catch (ignore) {}
    }
    keepCurrentVisible();
    window.requestAnimationFrame(keepCurrentVisible);
    window.setTimeout(function () { restoringScroll = false; }, 80);
  }
  function reveal() {
    document.documentElement.classList.add('hspl-sidebar-state-ready');
    /* The target class remains as the page-lifetime visual contract. It is
       switched only by an explicit hamburger action, so a link click or a
       late page script cannot visibly open a rail whose preference is closed. */
    document.documentElement.classList.remove('hspl-sidebar-restoring');
  }

  function itemDescriptor(item, enhanced) {
    var link = enhanced
      ? item.querySelector(':scope > .a-TreeView-content > a.a-TreeView-label[href]')
      : item.querySelector(':scope > a[href]');
    if (!link) return null;
    var icon = enhanced
      ? item.querySelector(':scope > .a-TreeView-content > span.fa, :scope > .a-TreeView-content > .a-Icon')
      : null;
    return {
      href: link.href,
      label: (link.textContent || '').trim(),
      iconClass: icon ? icon.className : (item.getAttribute('data-icon') || 'fa fa-circle-o')
    };
  }

  function navigationItems() {
    var tree = document.getElementById('t_TreeNav');
    if (!tree) return [];
    var result = [];
    var rawRoot = tree.querySelector(':scope > ul > li');
    if (rawRoot && !rawRoot.classList.contains('a-TreeView-node')) {
      var home = itemDescriptor(rawRoot, false);
      if (home) result.push(home);
      Array.prototype.forEach.call(rawRoot.querySelectorAll(':scope > ul > li'), function (item) {
        var descriptor = itemDescriptor(item, false);
        if (descriptor) result.push(descriptor);
      });
      return result;
    }
    var root = tree.querySelector(':scope > ul > .a-TreeView-node--topLevel');
    if (!root) return result;
    var enhancedHome = itemDescriptor(root, true);
    if (enhancedHome) result.push(enhancedHome);
    Array.prototype.forEach.call(root.querySelectorAll(':scope > ul > .a-TreeView-node'), function (item) {
      var descriptor = itemDescriptor(item, true);
      if (descriptor) result.push(descriptor);
    });
    return result;
  }

  function previewNavigationItems() {
    var tree = document.getElementById('t_TreeNav');
    if (!tree) return [];
    var rawRoot = tree.querySelector(':scope > ul > li');
    var enhanced = !!(rawRoot && rawRoot.classList.contains('a-TreeView-node'));
    var root = enhanced
      ? tree.querySelector(':scope > ul > .a-TreeView-node--topLevel')
      : rawRoot;
    var result = [];

    var explicitBranchPath = readBranchPath();
    function append(item, depth) {
      var descriptor = itemDescriptor(item, enhanced);
      if (!descriptor) return;
      descriptor.depth = depth;
      descriptor.current = contextPage(descriptor.href);
      /* APEX gives the HOME tree node the application-root URL while the
         friendly landing page is /home. Treat the root as the permanent
         navigation branch so the loading preview always includes every
         module, even when those two canonical paths do not match. */
      descriptor.branch = depth === 0 || (
        depth === 1 && !!explicitBranchPath && pathFromHref(descriptor.href) === explicitBranchPath
      );
      result.push(descriptor);
      if (!descriptor.branch) return;
      var children = enhanced
        ? item.querySelectorAll(':scope > ul > .a-TreeView-node')
        : item.querySelectorAll(':scope > ul > li');
      Array.prototype.forEach.call(children, function (child) { append(child, depth + 1); });
    }

    if (root) append(root, 0);
    return result;
  }

  function samePage(href) {
    return pathFromHref(href) === pathFromHref(window.location.href);
  }

  function resolveContextPath() {
    var tree = document.getElementById('t_TreeNav');
    if (!tree) return contextPath || readContextPath();
    var links = tree.querySelectorAll('a[href]');
    var exact = Array.prototype.find.call(links, function (link) {
      return samePage(link.href);
    });
    if (exact) {
      writeContextPath(exact.href);
      return contextPath;
    }
    contextPath = contextPath || readContextPath();
    if (contextPath) return contextPath;
    var referrerPath = pathFromHref(document.referrer);
    var referred = referrerPath && Array.prototype.find.call(links, function (link) {
      return pathFromHref(link.href) === referrerPath;
    });
    if (referred) writeContextPath(referred.href);
    return contextPath;
  }

  function contextPage(href) {
    if (samePage(href)) return true;
    var saved = resolveContextPath();
    return !!saved && pathFromHref(href) === saved;
  }

  function buildRail() {
    var tree = document.getElementById('t_TreeNav');
    resolveContextPath();
    var items = navigationItems();
    var previewItems = previewNavigationItems();
    if (!tree || items.length < 2) return false;
    if (!document.getElementById(RAIL_ID)) {
      var rail = document.createElement('nav');
      rail.id = RAIL_ID;
      rail.className = 'hspl-collapsed-rail';
      rail.setAttribute('aria-label', 'Application modules');
      items.forEach(function (item) {
        var link = document.createElement('a');
        link.className = 'hspl-collapsed-rail-link';
        if (samePage(item.href)) link.classList.add('is-current');
        link.href = item.href;
        link.title = item.label;
        link.setAttribute('aria-label', item.label);
        var icon = document.createElement('span');
        icon.className = item.iconClass;
        icon.setAttribute('aria-hidden', 'true');
        link.appendChild(icon);
        rail.appendChild(link);
      });
      tree.parentNode.insertBefore(rail, tree);
    }
    var preview = document.getElementById(PREVIEW_ID);
    if (!preview) {
      preview = document.createElement('nav');
      preview.id = PREVIEW_ID;
      preview.className = 'hspl-expanded-preview';
      preview.setAttribute('aria-label', 'Application modules loading');
      tree.parentNode.insertBefore(preview, tree);
    }
    var previewItemsToRender = previewItems.length ? previewItems : items;
    var previewSignature = previewItemsToRender.map(function (item) {
      return [
        item.href,
        item.label,
        item.depth || 0,
        item.iconClass,
        item.current || contextPage(item.href) ? 1 : 0,
        item.branch ? 1 : 0
      ].join('|');
    }).join('||');
    if (preview.getAttribute('data-hspl-signature') !== previewSignature) {
      var previewTop = preview.scrollTop || readScrollTop();
      preview.textContent = '';
      previewItemsToRender.forEach(function (item) {
        var link = document.createElement('a');
        link.className = 'hspl-expanded-preview-link is-depth-' + (item.depth || 0);
        if (item.current || contextPage(item.href)) link.classList.add('is-current');
        if (item.branch) link.classList.add('is-active-branch');
        link.href = item.href;
        var icon = document.createElement('span');
        icon.className = item.iconClass;
        icon.setAttribute('aria-hidden', 'true');
        var label = document.createElement('span');
        label.className = 'hspl-expanded-preview-label';
        label.textContent = item.label;
        link.appendChild(icon);
        link.appendChild(label);
        preview.appendChild(link);
      });
      preview.setAttribute('data-hspl-signature', previewSignature);
      if (previewTop !== null) {
        preview.scrollTop = previewTop;
        window.requestAnimationFrame(function () { preview.scrollTop = previewTop; });
      }
    }
    return true;
  }

  function expandHomeRoot() {
    if (!open()) return false;
    var root = document.querySelector('#t_TreeNav > ul > .a-TreeView-node--topLevel');
    if (!root) return false;
    if (root.classList.contains('is-collapsible')) return true;
    var disclosure = root.querySelector(':scope > .a-TreeView-toggle');
    if (disclosure) disclosure.click();
    return root.classList.contains('is-collapsible');
  }

  function restoreExplicitBranch() {
    var tree = document.getElementById('t_TreeNav');
    if (!tree) return false;
    var branchPath = readBranchPath();
    var moduleLinks = tree.querySelectorAll(
      ':scope > ul > .a-TreeView-node--topLevel > ul > .a-TreeView-node > .a-TreeView-content > a.a-TreeView-label[href]'
    );
    var branchLink = branchPath && Array.prototype.find.call(
      moduleLinks,
      function (link) { return pathFromHref(link.href) === branchPath; }
    );
    var branchNode = branchLink && branchLink.closest('li.a-TreeView-node');
    if (branchPath && !branchNode) return false;

    /* Universal Theme expands the server-selected/current module on its own.
       Normalize that default first: only a branch explicitly opened through
       its disclosure arrow is allowed to remain open across navigation. */
    Array.prototype.forEach.call(moduleLinks, function (link) {
      var node = link.closest('li.a-TreeView-node');
      if (!node || node === branchNode || !node.classList.contains('is-collapsible')) return;
      var disclosure = node.querySelector(':scope > .a-TreeView-toggle');
      if (disclosure) disclosure.click();
    });
    if (branchNode && branchNode.classList.contains('is-expandable')) {
      var branchDisclosure = branchNode.querySelector(':scope > .a-TreeView-toggle');
      if (branchDisclosure) branchDisclosure.click();
    }
    if (branchNode && branchNode.classList.contains('is-expandable')) return false;

    Array.prototype.forEach.call(tree.querySelectorAll('.hspl-context-current'), function (node) {
      node.classList.remove('hspl-context-current');
    });
    var currentLink = Array.prototype.find.call(
      tree.querySelectorAll('a.a-TreeView-label[href]'),
      function (link) { return contextPage(link.href); }
    );
    var currentNode = currentLink && currentLink.closest('li.a-TreeView-node');
    if (currentNode && !samePage(currentLink.href)) {
      currentNode.classList.add('hspl-context-current');
    }
    restoreScrollTop(null);
    return true;
  }

  function ensureExpanded(attempt, done) {
    if (cleanManualOpen) {
      ensureParentModulesOnly(attempt, done);
      return;
    }
    if (!open()) {
      if (done) done(false);
      return;
    }
    /* The APEX navigation hierarchy hydrates after the page shell. Refresh the
       temporary preview on every retry so an early HOME-only snapshot never
       remains visible while the complete menu is already available. */
    var navigationReady = buildRail();
    if (expandHomeRoot()) {
      /* Expanding the APEX root is what hydrates its lazy child nodes. Check
         readiness again afterwards, then reveal only once those nodes exist. */
      navigationReady = buildRail() || navigationReady;
      if (navigationReady && restoreExplicitBranch()) {
        if (done) done(true);
        return;
      }
    }
    /* Several large form pages replace the raw navigation markup with the
       enhanced APEX tree late in their startup. Keep the native tree hidden
       until the root and any explicitly opened branch have been restored. */
    if (attempt >= 120) {
      if (done) done(false);
      return;
    }
    window.setTimeout(function () { ensureExpanded(attempt + 1, done); }, 50);
  }

  /* A deliberate close/open is a fresh navigation action, not a page
     handoff. Keep cross-page restoration for an already-open sidebar, but on
     a manual reopen show HOME plus the module cards only and start at the top. */
  function ensureParentModulesOnly(attempt, done) {
    if (!open()) {
      if (done) done(false);
      return;
    }
    buildRail();
    var rootReady = expandHomeRoot();
    var tree = document.getElementById('t_TreeNav');
    var root = tree && tree.querySelector(':scope > ul > .a-TreeView-node--topLevel');
    var modulesReady = !!(root && root.querySelectorAll(':scope > ul > .a-TreeView-node').length > 1);
    if ((!rootReady || !modulesReady) && attempt < 120) {
      window.setTimeout(function () { ensureParentModulesOnly(attempt + 1, done); }, 50);
      return;
    }
    if (root) {
      Array.prototype.slice.call(
        root.querySelectorAll(':scope > ul .a-TreeView-node.is-collapsible')
      ).reverse().forEach(function (node) {
        var disclosure = node.querySelector(':scope > .a-TreeView-toggle');
        if (disclosure) disclosure.click();
      });
    }
    if (tree) {
      Array.prototype.forEach.call(tree.querySelectorAll('.hspl-context-current'), function (node) {
        node.classList.remove('hspl-context-current');
      });
      tree.scrollTop = 0;
      window.requestAnimationFrame(function () { tree.scrollTop = 0; });
    }
    if (done) done(rootReady && modulesReady);
  }

  function restore(attempt) {
    buildRail();
    var button = toggle();
    if (!button || (!open() && !closed())) {
      if (attempt < 20) {
        window.setTimeout(function () { restore(attempt + 1); }, 50);
        return;
      }
      reveal();
      return;
    }
    if (desired === 'open' && !open()) button.click();
    else if (desired === 'closed' && !closed()) button.click();
    if (desired === 'open') {
      ensureExpanded(0, reveal);
      return;
    }
    reveal();
  }

  function enforceDesiredState() {
    if (!desktop() || !body() || body().classList.contains('t-PageBody--login')) return;
    var button = toggle();
    if (!button) return;
    if (desired === 'open' && !open()) button.click();
    else if (desired === 'closed' && !closed()) button.click();
    if (desired === 'open') ensureExpanded(0);
  }

  /* A few older pages mutate the Universal Theme navigation classes after
     ready. Correct those classes inside the mutation microtask so the wrong
     frame cannot be painted while the native button catches up. */
  function correctBodyStateBeforePaint() {
    var pageBody = body();
    var button = toggle();
    if (correctingBodyState || !pageBody) return;
    correctingBodyState = true;
    if (desired === 'open') {
      pageBody.classList.remove('js-navCollapsed');
      pageBody.classList.add('js-navExpanded');
      if (button) button.setAttribute('aria-expanded', 'true');
    } else if (desired === 'closed') {
      pageBody.classList.remove('js-navExpanded');
      pageBody.classList.add('js-navCollapsed');
      if (button) button.setAttribute('aria-expanded', 'false');
    }
    correctingBodyState = false;
  }

  function init() {
    if (started) return;
    started = true;
    if (!body() || body().classList.contains('t-PageBody--login') || !desktop()) {
      reveal();
      return;
    }
    buildRail();
    desired = readState();
    if (!desired) writeState(open() ? 'open' : 'closed');
    else paintDesiredState(desired);

    var navigationTree = document.getElementById('t_TreeNav');
    if (navigationTree) navigationTree.addEventListener('scroll', saveScrollTop, { passive: true });
    window.addEventListener('pagehide', saveScrollTop);

    /* Some legacy pages still run already-rendered collapse code after APEX
       ready. Observe only the body's state classes (never the navigation
       subtree) and restore the user's explicit preference before paint. */
    try {
      new MutationObserver(function () {
        if ((desired === 'open' && !open()) || (desired === 'closed' && !closed())) {
          correctBodyStateBeforePaint();
        }
      }).observe(body(), { attributes: true, attributeFilter: ['class'] });
    } catch (ignore) {}

    window.addEventListener('pointerdown', function (event) {
      if (!event.target.closest) return;
      var collapsedRailLink = event.target.closest('#hspl_CollapsedRail a[href]');
      var regularRailClick = collapsedRailLink && event.button === 0 &&
        !event.ctrlKey && !event.metaKey && !event.shiftKey && !event.altKey;
      if (regularRailClick) {
        /* The flattened icon rail lives inside #t_Body_nav. Universal Theme's
           delegated pointer handler otherwise treats its link like a native
           TreeView interaction and briefly opens the shell before navigation.
           Lock the user's closed intent before that handler can run. */
        cleanManualOpen = false;
        saveScrollTop();
        writeContextPath(collapsedRailLink.href);
        writeState('closed');
        document.documentElement.classList.remove('hspl-nav-target-open');
        document.documentElement.classList.add('hspl-nav-target-closed');
        beginToggleWindow();
        correctBodyStateBeforePaint();
        /* Navigate on the earliest primary-pointer phase.  Waiting for the
           later click leaves enough time for Universal Theme's delegated
           TreeView handler to expand the shell for a frame. */
        event.preventDefault();
        event.stopImmediatePropagation();
        if (!collapsedRailNavigating) {
          collapsedRailNavigating = true;
          window.location.assign(collapsedRailLink.href);
        }
        return;
      }
      var navLink = event.target.closest('#t_Body_nav a[href], #hspl_CollapsedRail a[href], #hspl_ExpandedPreview a[href]');
      if (navLink) {
        cleanManualOpen = false;
        saveScrollTop();
        writeContextPath(navLink.href);
        writeState(open() ? 'open' : 'closed');
        return;
      }
      if (!event.target.closest('#t_Button_navControl')) return;
      /* Only a user-operated shell toggle resets navigation context. Automatic
         open-state restoration never passes through this handler. */
      cleanManualOpen = closed();
      if (open() || cleanManualOpen) resetManualNavigationContext();
      beginToggleWindow();
      writeState(open() ? 'closed' : 'open');
      toggleIntentCaptured = true;
    }, true);

    window.addEventListener('click', function (event) {
      if (!event.target.closest) return;
      var collapsedRailLink = event.target.closest('#hspl_CollapsedRail a[href]');
      var regularRailClick = collapsedRailLink && event.button === 0 &&
        !event.ctrlKey && !event.metaKey && !event.shiftKey && !event.altKey;
      if (regularRailClick && event.isTrusted) {
        /* Own ordinary rail navigation completely. This prevents APEX's
           delegated tree click from toggling the native sidebar for one
           visible frame. Modified clicks retain normal browser behaviour. */
        event.preventDefault();
        event.stopImmediatePropagation();
        cleanManualOpen = false;
        writeContextPath(collapsedRailLink.href);
        writeState('closed');
        document.documentElement.classList.remove('hspl-nav-target-open');
        document.documentElement.classList.add('hspl-nav-target-closed');
        beginToggleWindow();
        correctBodyStateBeforePaint();
        if (!collapsedRailNavigating) {
          collapsedRailNavigating = true;
          window.location.assign(collapsedRailLink.href);
        }
        return;
      }
      var navLink = event.target.closest('#t_Body_nav a[href], #hspl_CollapsedRail a[href], #hspl_ExpandedPreview a[href]');
      if (navLink && event.isTrusted) {
        cleanManualOpen = false;
        saveScrollTop();
        writeContextPath(navLink.href);
        writeState(open() ? 'open' : 'closed');
        return;
      }
      if (!event.target.closest('#t_Button_navControl')) return;
      beginToggleWindow();
      if (!toggleIntentCaptured && event.isTrusted) writeState(open() ? 'closed' : 'open');
      toggleIntentCaptured = false;
      if (desired === 'open') {
        window.setTimeout(function () {
          if (cleanManualOpen) ensureParentModulesOnly(0);
          else ensureExpanded(0);
        }, 0);
      }
    }, true);

    /* APEX leaves synthetic is-hover classes on module rows after their child
       branch is collapsed. Those stale classes paint the TreeView's negative
       indentation and make previously touched parents appear shifted left.
       Real CSS :hover remains intact; remove only the synthetic residue after
       the native toggle handler has completed. */
    window.addEventListener('click', function (event) {
      if (!event.target.closest) return;
      var disclosure = event.target.closest(
        '#t_TreeNav > ul > .a-TreeView-node--topLevel > ul > .a-TreeView-node > .a-TreeView-toggle'
      );
      if (!disclosure) return;
      var module = disclosure.closest('.a-TreeView-node');
      window.setTimeout(function () {
        if (!module || !module.isConnected) return;
        module.classList.remove('is-hover');
        var row = module.querySelector(':scope > .a-TreeView-row');
        var content = module.querySelector(':scope > .a-TreeView-content');
        var moduleLink = module.querySelector(
          ':scope > .a-TreeView-content > a.a-TreeView-label[href]'
        );
        if (row) row.classList.remove('is-hover');
        if (content) content.classList.remove('is-hover');
        /* Branch persistence follows only the disclosure control. Clicking a
           page/label never writes this key and therefore cannot open children. */
        if (moduleLink) {
          if (module.classList.contains('is-collapsible')) writeBranchPath(moduleLink.href);
          else clearBranchPath(moduleLink.href);
        }
      }, 0);
    }, true);

    document.addEventListener('apexafterrefresh', function () {
      buildRail();
      if (open()) ensureExpanded(0);
    }, true);

    document.addEventListener('apexreadyend', function () {
      window.setTimeout(enforceDesiredState, 0);
    }, { once: true });

    restore(0);
    window.setTimeout(enforceDesiredState, 400);
    window.setTimeout(reveal, 6500);
  }

  buildRail();
  /* Application JavaScript is emitted after the navigation markup. Attach the
     rail interception now, in the same parser task, instead of leaving the
     generated icon links unowned until DOMContentLoaded. */
  init();
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init, { once: true });
})();~';
  l_css constant clob := q'~/* Stable collapsed navigation rail. The expanded tree remains native APEX. */
html:not(.hspl-sidebar-state-ready) body:not(.t-PageBody--login) #t_Body_nav,
html:not(.hspl-sidebar-state-ready) body:not(.t-PageBody--login) .t-Body-main,
html.hspl-sidebar-restoring body:not(.t-PageBody--login) #t_Body_nav,
html.hspl-sidebar-restoring body:not(.t-PageBody--login) .t-Body-main,
html.hspl-sidebar-toggling body:not(.t-PageBody--login) .t-Body-main,
html.hspl-sidebar-toggling body:not(.t-PageBody--login) .t-Body-title,
html.hspl-sidebar-toggling body:not(.t-PageBody--login) .t-Body-content,
html.hspl-sidebar-toggling body:not(.t-PageBody--login) .t-Footer {
  transition:none!important;
  animation:none!important;
}

/* APEX renders a fixed-heading register as two sibling scrollports and gives
   both of them the Universal Theme `transition: all`.  When the shell width
   changes Chrome may composite those siblings on adjacent frames, making the
   heading appear to move before the rows (or vice versa).  The register has no
   intentional animation of its own, so keep both native layers atomic while
   leaving all sizing, colours and scroll behaviour under APEX control. */
html.hspl-sidebar-state-ready body:not(.t-PageBody--login) .t-fht-wrapper > .t-fht-thead,
html.hspl-sidebar-state-ready body:not(.t-PageBody--login) .t-fht-wrapper > .t-fht-tbody,
html.hspl-sidebar-state-ready body:not(.t-PageBody--login) .t-fht-wrapper > .t-fht-thead > .a-IRR-table,
html.hspl-sidebar-state-ready body:not(.t-PageBody--login) .t-fht-wrapper > .t-fht-tbody > .a-IRR-table {
  transition:none!important;
  animation:none!important;
}

/* Animate only the navigation rail during an explicit hamburger action. The
   page canvas settles immediately, so registers/forms are never measured at an
   intermediate width and Universal Theme's 100ms child transitions cannot lag
   behind the shell. */
@media (min-width:768px) and (prefers-reduced-motion:no-preference) {
  html.hspl-sidebar-toggling body:not(.t-PageBody--login) #t_Body_nav {
    transition:width 80ms cubic-bezier(.22,.61,.36,1)!important;
  }
}

@media (prefers-reduced-motion:reduce) {
  html.hspl-sidebar-toggling body:not(.t-PageBody--login) #t_Body_nav {
    transition:none!important;
  }
}

#hspl_CollapsedRail,
#hspl_ExpandedPreview { display:none; }

/* The native tree contains only HOME at Universal Theme's collapsed top
   level. Never expose that incomplete frame while the flattened rail is
   being built. */
html.hspl-nav-target-closed:not(.hspl-sidebar-state-ready)
  body:not(.t-PageBody--login) #t_TreeNav {
  visibility:hidden!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) #t_TreeNav {
  display:none!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) #hspl_ExpandedPreview {
  display:flex!important;
  flex-direction:column!important;
  gap:0!important;
  width:100%!important;
  min-height:0!important;
  margin:0!important;
  padding:8px 12px 14px 7px!important;
  border:1px solid #e2e7f1!important;
  border-radius:18px!important;
  overflow-x:hidden!important;
  overflow-y:auto!important;
  box-sizing:border-box!important;
  background:#f1f5f9!important;
  box-shadow:0 10px 30px rgba(42,54,105,.08),0 2px 8px rgba(42,54,105,.04)!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link {
  display:flex!important;
  align-items:center!important;
  gap:0!important;
  width:auto!important;
  height:48px!important;
  min-height:48px!important;
  margin:2px!important;
  padding:0 8px!important;
  border:1px solid transparent!important;
  border-radius:8px!important;
  color:#34445d!important;
  text-decoration:none!important;
  background:transparent!important;
  box-shadow:none!important;
  box-sizing:border-box!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link > span:first-child {
  display:grid!important;
  place-items:center!important;
  flex:0 0 34px!important;
  width:34px!important;
  height:24px!important;
  margin:0 4px 0 0!important;
  border-radius:6px!important;
  color:#6b7b91!important;
  background:#f2f5fa!important;
  font-size:12px!important;
  font-weight:600!important;
  line-height:24px!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-label {
  overflow:hidden!important;
  font-size:14px!important;
  font-weight:650!important;
  line-height:16.8px!important;
  white-space:nowrap!important;
  text-overflow:ellipsis!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link.is-depth-2 {
  height:44px!important;
  min-height:44px!important;
  margin:2px 0 2px 22px!important;
  padding:0 8px!important;
  color:#53647c!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link.is-depth-2 .hspl-expanded-preview-label {
  font-size:13.25px!important;
  font-weight:530!important;
  line-height:15.9px!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link:hover,
html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link.is-active-branch,
html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link.is-current {
  border-color:#c9dcff!important;
  background:transparent!important;
  box-shadow:3px 0 0 #2563eb inset!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link.is-depth-2.is-current {
  color:#174ea6!important;
}

html.hspl-sidebar-restoring.hspl-nav-target-open body:not(.t-PageBody--login) .hspl-expanded-preview-link.is-depth-2.is-current .hspl-expanded-preview-label {
  font-weight:680!important;
}

html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #t_TreeNav {
  display:none!important;
}

html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #hspl_CollapsedRail {
  display:flex!important;
  flex:1 1 auto!important;
  flex-direction:column!important;
  align-items:center!important;
  justify-content:space-between!important;
  gap:0!important;
  width:100%!important;
  min-height:0!important;
  margin:0!important;
  padding:4px 0!important;
  overflow-x:hidden!important;
  overflow-y:auto!important;
  scrollbar-width:none!important;
  box-sizing:border-box!important;
  background:#f1f5f9!important;
}

html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #hspl_CollapsedRail::-webkit-scrollbar {
  width:0!important;
  height:0!important;
}

html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #hspl_CollapsedRail .hspl-collapsed-rail-link {
  display:flex!important;
  flex:0 0 40px!important;
  align-items:center!important;
  justify-content:center!important;
  width:40px!important;
  height:40px!important;
  min-width:40px!important;
  min-height:40px!important;
  max-width:40px!important;
  max-height:40px!important;
  margin:0!important;
  padding:3px!important;
  border:0!important;
  border-radius:10px!important;
  box-sizing:border-box!important;
  color:#1d3d7a!important;
  text-decoration:none!important;
  background:transparent!important;
  box-shadow:none!important;
}

html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #hspl_CollapsedRail .hspl-collapsed-rail-link > span {
  display:grid!important;
  place-items:center!important;
  width:34px!important;
  height:34px!important;
  margin:0!important;
  padding:0!important;
  border:0!important;
  background:transparent!important;
  color:inherit!important;
  box-shadow:none!important;
  font-size:17px!important;
  line-height:34px!important;
}

html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #hspl_CollapsedRail .hspl-collapsed-rail-link:hover,
html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #hspl_CollapsedRail .hspl-collapsed-rail-link:focus-visible,
html body.js-navCollapsed:not(.js-navExpanded):not(.t-PageBody--login) #hspl_CollapsedRail .hspl-collapsed-rail-link.is-current {
  color:#2563eb!important;
  background:#e8eef6!important;
  outline:none!important;
}

html body.js-navExpanded:not(.t-PageBody--login) #hspl_CollapsedRail {
  display:none!important;
}

/* Form pages are not navigation-list entries. Keep the register that opened
   the form visibly selected so its module remains an intelligible context. */
html body.js-navExpanded:not(.t-PageBody--login) #t_TreeNav
  .hspl-context-current > .a-TreeView-content {
  border-color:#c9dcff!important;
  background:transparent!important;
  box-shadow:3px 0 0 #2563eb inset!important;
}

html body.js-navExpanded:not(.t-PageBody--login) #t_TreeNav
  .hspl-context-current > .a-TreeView-content > .a-TreeView-label {
  color:#174ea6!important;
  font-weight:680!important;
}~';
  l_blob blob;
  procedure save_file(p_id number,p_name varchar2,p_mime varchar2,p_content clob) is
    l_offset integer:=1;l_chunk varchar2(32767);l_raw raw(32767);
  begin
    dbms_lob.createtemporary(l_blob,true);
    while l_offset<=dbms_lob.getlength(p_content) loop
      l_chunk:=dbms_lob.substr(p_content,16000,l_offset);
      l_raw:=utl_i18n.string_to_raw(l_chunk,'AL32UTF8');
      dbms_lob.writeappend(l_blob,utl_raw.length(l_raw),l_raw);
      l_offset:=l_offset+length(l_chunk);
    end loop;
    wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(p_id),p_file_name=>p_name,p_mime_type=>p_mime,p_file_charset=>'utf-8',p_file_content=>l_blob);
    dbms_lob.freetemporary(l_blob);
  end;
begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  delete from apex_260100.wwv_flow_processing where flow_id=105 and process_name in ('HSPL_SIDEBAR_STATE','HSPL_SIDEBAR_BOOT');
  save_file(7711000000002001,'hspl-sidebar-state.js','application/javascript',l_js);
  save_file(7711000000002002,'hspl-sidebar-state.css','text/css',l_css);
  wwv_flow_imp.component_end;
end;
/

declare
  l_js varchar2(32767);l_css varchar2(32767);l_nav varchar2(32767);
begin
  select javascript_file_urls,css_file_urls,nav_list_template_options into l_js,l_css,l_nav from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504 for update;
  l_js:=regexp_replace(l_js,'#APP_FILES#hspl-theme[.]js[^[:space:]]*','#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260925registernative2');
  l_js:=regexp_replace(l_js,'([[:space:]]*#APP_FILES#hspl-sidebar-state[.]js[^[:space:]]*)','');
  l_css:=regexp_replace(l_css,'([[:space:]]*#APP_FILES#hspl-sidebar-state[.]css[^[:space:]]*)','');
  l_nav:=replace(l_nav,'js-navCollapsed--hidden','js-navCollapsed--icons');
  if instr(l_nav,'js-navCollapsed--icons')=0 then l_nav:=rtrim(l_nav,':')||':js-navCollapsed--icons'; end if;
  update apex_260100.wwv_flows set javascript_file_urls=rtrim(l_js)||chr(10)||'#APP_FILES#hspl-sidebar-state.js?cb=20260925sbstate62',css_file_urls=rtrim(l_css)||chr(10)||'#APP_FILES#hspl-sidebar-state.css?cb=20260925sbstate62',nav_list_template_options=l_nav,files_version=files_version+1,version_scn=dbms_flashback.get_system_change_number,last_updated_on=sysdate where id=105 and security_group_id=4744311978888504;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select nav_list_template_options,case when instr(javascript_file_urls,'hspl-sidebar-state.js?cb=20260925sbstate62')>0 and instr(css_file_urls,'hspl-sidebar-state.css?cb=20260925sbstate62')>0 then 'SIDEBAR_BASELINE_FAST_RESTORED' else 'SIDEBAR_BASELINE_FAST_MISSING' end deployment_status from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
