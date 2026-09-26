(function () {
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
    }, 150);
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
})();
