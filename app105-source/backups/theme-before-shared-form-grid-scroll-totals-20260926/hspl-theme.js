/* ==========================================================================
   HINDUSTAN GROUP — theme behaviour (loaded app-wide via application.apx)

   Ported from the ibossCMPL (app 105) filter-drawer.js, plus the HSPL-specific
   page-title injection and the collapsible-region drawer.

   Nothing here rewrites Oracle-generated markup or changes any page's logic —
   it adds chrome and syncs classes, so pages need NO per-page dynamic actions.

     1. Page title       — fills the empty .t-Body-title (HSPL pages carry no
                           breadcrumb region, so they render with no heading)
     2. Filter drawer A  — .js-filter-drawer, an @inline-dialog region
     3. Filter drawer B  — .hspl-drawer, a collapsible region (page 57 today)
     4. Pretius LOV      — repositions the enhanced-LOV popup inside a drawer
     5. Status pills     — colours any report's Status column
   ========================================================================== */

/* First-paint action bridge for compact legacy forms without a Tabs Region. */
(function () {
  "use strict";
  var doc = document;
  function apply() {
    var html = doc.documentElement;
    /* Page 118 owns a dedicated Purchase Order hero below. Do not move its
       controls through the generic bridge first: that creates an empty hero
       and lets the legacy action strip be clipped before its own shell runs. */
    if (html.classList.contains("page-69") || html.classList.contains("page-118") || !doc.querySelector(".t-Body-main .t-Form-fieldContainer")) return;
    html.classList.add("hspl-compact-form");
    var hero = doc.querySelector(".t-Body-title, #t_Body_title");
    var region = doc.getElementById("buttons");
    if (!hero || !region || !region.querySelector(".t-Button,button")) return;
    hero.classList.add("hspl-hero-card", "hspl-has-title");
    var marker = hero.querySelector(".hspl-page-title");
    if (!marker) {
      marker = hero.querySelector("h1,.t-Breadcrumb-label");
      if (marker) marker.classList.add("hspl-page-title");
      else { marker = doc.createElement("span"); marker.className = "hspl-page-title"; marker.setAttribute("aria-hidden", "true"); marker.style.cssText = "display:none!important"; hero.appendChild(marker); }
    }
    var holder = hero.querySelector(".hspl-form-hero-actions");
    if (!holder) { holder = doc.createElement("div"); holder.className = "hspl-form-hero-actions"; hero.appendChild(holder); }
    if (!holder.contains(region)) holder.appendChild(region);
  }
  /* Application JavaScript is emitted at the end of BODY, after the register
     and its filter items already exist. Apply the final shell class in this
     same parser task so the browser cannot paint the native register first and
     add the compact register treatment on a later timer. The bounded retries
     remain only for genuinely lazy APEX regions. */
  apply();
  [80, 220, 550, 1100, 2200].forEach(function (delay) { setTimeout(apply, delay); });
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", apply, { once: true }); else apply();
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplFormActionBridge", apply);
})();

/* ============================================================================
   PERMISSION-AWARE MODULE DIRECTORIES (PAGES 820-826)

   These pages replace formerly blank module-group links.  Their cards are
   rendered from the same authorized menu rows as the sidebar; this adapter
   supplies the shared hero, semantic state and first-paint release only.
   ========================================================================== */
(function () {
  'use strict';
  var doc = document;
  var root = doc.documentElement;
  var configs = {
    820:{slug:'masters',subtitle:'Maintain shared definitions that keep every transaction consistent.'},
    821:{slug:'freight',subtitle:'Plan and control freight types, advice and transporter activity.'},
    822:{slug:'finance',subtitle:'Manage accounts, banking, vouchers, compliance and financial controls.'},
    823:{slug:'visitor',subtitle:'Manage visitor movement and gate activity from one workspace.'},
    824:{slug:'inventory',subtitle:'Control item masters, stock movement and warehouse operations.'},
    825:{slug:'reports',subtitle:'Open operational, statutory and management reports from one place.'},
    826:{slug:'dashboard',subtitle:'Move directly to the dashboards available for your role.'}
  };

  function enhance() {
    /* APEX adds its page-NNN class after this file can begin executing.  Read
       it on every bounded retry instead of permanently exiting on first paint. */
    var match = (root.className || '').match(/(?:^|\s)page-(82[0-6])(?:\s|$)/);
    if (!match) return false;
    var config = configs[Number(match[1])];
    if (!config) return false;
    /* The no-UI APEX region template replaces the configured Static ID with
       its generated component id, so the server-owned grid is the stable hook. */
    var grid = doc.querySelector('.hspl-directory-grid');
    var hero = doc.querySelector('.t-Body-title.hspl-hero-card');
    if (!grid || !hero) return false;
    doc.body.classList.add('hspl-directory-hub','hspl-directory-' + config.slug);
    hero.classList.add('hspl-directory-hero');
    var titleBlock = hero.querySelector('.hspl-title-block');
    if (!titleBlock) return false;
    var subtitle = titleBlock.querySelector('.hspl-directory-subtitle,.hspl-page-desc');
    if (!subtitle) {
      subtitle = doc.createElement('p');
      subtitle.className = 'hspl-page-desc hspl-directory-subtitle';
      titleBlock.appendChild(subtitle);
    }
    subtitle.textContent = config.subtitle;
    Array.prototype.forEach.call(grid.querySelectorAll('.hspl-directory-card'), function (card, index) {
      card.setAttribute('data-hspl-card-index', String(index + 1));
    });
    if (config.slug === 'dashboard') {
      var dashboardCopy = {
        'business insights':{icon:'fa-line-chart',description:'Explore business performance, trends and decision-ready insights.',meta:'PERFORMANCE · TRENDS · INSIGHTS'},
        '360 dashboard':{icon:'fa-dashboard',description:'Review key business activity and performance from every angle.',meta:'ANALYTICS · VISIBILITY · CONTROL'},
        '360 view':{icon:'fa-dashboard',description:'Review key business activity and performance from every angle.',meta:'ANALYTICS · VISIBILITY · CONTROL'},
        'portlet':{icon:'fa-th-large',description:'Open focused operational views and role-based information panels.',meta:'WORKSPACE · INSIGHTS · ACTION'},
        'task':{icon:'fa-tasks',description:'Track assigned work, pending actions and completion status.',meta:'ASSIGN · TRACK · COMPLETE'},
        'task dashboard':{icon:'fa-tasks',description:'Track assigned work, pending actions and completion status.',meta:'ASSIGN · TRACK · COMPLETE'}
      };
      Array.prototype.forEach.call(grid.querySelectorAll('.hspl-directory-card'), function (card, index) {
        var title = card.querySelector('.hspl-directory-title');
        var key = title ? title.textContent.trim().toLowerCase().replace(/\s+/g, ' ') : '';
        var copy = dashboardCopy[key] || {description:'Open this dashboard workspace.',meta:'MONITOR · REVIEW · ACT'};
        card.classList.add('hspl-dashboard-card');
        var cardIcon = card.querySelector('.hspl-directory-icon .fa');
        if (cardIcon && copy.icon) cardIcon.className = 'fa ' + copy.icon;
        if (!card.querySelector('.hspl-dashboard-description')) {
          var description = doc.createElement('span');
          description.className = 'hspl-dashboard-description';
          description.textContent = copy.description;
          card.appendChild(description);
        }
        if (!card.querySelector('.hspl-dashboard-meta')) {
          var meta = doc.createElement('span');
          meta.className = 'hspl-dashboard-meta';
          meta.textContent = copy.meta;
          card.appendChild(meta);
        }
      });
    }
    root.classList.add('hspl-directory-ready');
    return true;
  }

  function start(attempt) {
    if (enhance() || attempt >= 24) return;
    window.setTimeout(function () { start(attempt + 1); }, 75);
  }
  if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', function () { start(0); }, { once:true });
  else start(0);
  doc.addEventListener('apexafterrefresh', function () { enhance(); }, true);
})();

/* ===========================================================================
   Shared form keyboard shortcuts
   ---------------------------------------------------------------------------
   Alt+S, Alt+N and Escape are an application-wide convenience for actual
   transaction forms.  They intentionally locate and click the page's own
   enabled header action; no submit, DML, validation, Dynamic Action or
   navigation logic is recreated here.  That keeps each form's existing APEX
   processing contract authoritative.

   The guard is deliberately strict.  A shortcut is ignored for registers,
   interactive grids, Popup LOVs, menus, drawers and modal dialogs, as well as
   whenever there is no matching visible native action.  This lets the owning
   APEX component retain its normal keyboard behaviour.
   =========================================================================== */
(function () {
  "use strict";
  var doc = document;
  var confirmationOpen = false;
  var actionInProgress = false;
  var actionCooldown;

  function visible(element) {
    if (!element || !element.isConnected || element.disabled ||
        element.getAttribute("aria-disabled") === "true") return false;
    var style = window.getComputedStyle(element);
    return style.display !== "none" && style.visibility !== "hidden" &&
      !!(element.offsetWidth || element.offsetHeight || element.getClientRects().length);
  }

  function textFor(element) {
    var label = element && (element.getAttribute("aria-label") ||
      element.getAttribute("title") || element.value ||
      ((element.querySelector && element.querySelector(".t-Button-label")) || element).textContent);
    return String(label || "").replace(/\s+/g, " ").trim().toLowerCase();
  }

  function pageHasForm() {
    if (doc.documentElement.classList.contains("hspl-compact-form")) return true;
    return Array.prototype.some.call(doc.querySelectorAll(".t-Body-main .t-Form-fieldContainer"), function (field) {
      if (field.closest(".hspl-drawer,.js-filter-drawer,.a-IRR,.a-GV,.t-IRR-region")) return false;
      return !!field.querySelector("input:not([type=hidden]),select,textarea,[role=combobox]");
    });
  }

  function actionHost(element) {
    /* The shared form shell tags its authored header actions.  The remaining
       selectors cover the few native/custom heroes (including Material In)
       without ever selecting a grid toolbar, a filter button or an in-form
       utility button. */
    return element.classList.contains("hspl-form-action-save") ||
      element.classList.contains("hspl-form-action-add") ||
      element.classList.contains("hspl-form-action-back") ||
      !!element.closest(".hspl-form-hero-actions,#buttons,.t-Body-title,.t-HeroRegion-col--actions,.t-HeroRegion-form,.hspl-mi-hero-side,.hspl-po-hero");
  }

  function isActionCandidate(element) {
    if (!visible(element) || !actionHost(element)) return false;
    return !element.closest(".t-Form-fieldContainer,.a-IG,.a-GV,.a-IRR,.t-IRR-region,.hspl-drawer,.js-filter-drawer,.ui-dialog,.a-Menu");
  }

  function findNativeAction(kind) {
    if (!pageHasForm()) return null;
    var patterns = {
      save: /^(save|create|apply)(?:\s+(?:form|record|changes?))?$/,
      add: /^(add new|new|create new)$/,
      exit: /^(back|cancel|exit|close)$/
    };
    var buttons = doc.querySelectorAll("button,a.t-Button,input[type=submit],input[type=button]");
    for (var i = 0; i < buttons.length; i++) {
      if (isActionCandidate(buttons[i]) && patterns[kind].test(textFor(buttons[i]))) return buttons[i];
    }
    return null;
  }

  function activeOverlay() {
    /* Do not steal Escape or Alt combinations from APEX overlays.  A hidden
       dialog template still exists in the DOM, hence the explicit visibility
       test.  The form assistant is not an overlay and is deliberately absent
       from this list. */
    var overlays = doc.querySelectorAll(
      ".ui-dialog,.a-Dialog,.a-Menu,.ui-datepicker,.a-PopupLOV-dialog," +
      ".a-IG-dialog,.a-IRR-dialog,.a-Toolbar-menu,.apex-item-popup-lov-dialog"
    );
    for (var i = 0; i < overlays.length; i++) if (visible(overlays[i])) return true;
    return doc.documentElement.classList.contains("hspl-drawer-open") ||
      !!doc.querySelector(".hspl-drawer.is-open,.hspl-drawer.hspl-drawer--open,.js-filter-drawer.is-open,.js-filter-open");
  }

  function insideGridOrPopup(target) {
    return !!(target && target.closest && target.closest(
      ".a-GV,.a-IG,.a-IRR,.t-IRR-region,.a-PopupLOV-dialog,.ui-datepicker,.a-Menu"
    ));
  }

  function confirmation(kind, action) {
    if (confirmationOpen || actionInProgress || !window.apex || !apex.message ||
        typeof apex.message.confirm !== "function") return;
    confirmationOpen = true;
    var messages = {
      save: { title: "Save Form?", body: "Are you sure you want to save this form?" },
      add:  { title: "Create New Record?", body: "Unsaved changes may be lost. Do you want to create a new record?" },
      exit: { title: "Leave Form?", body: "Unsaved changes may be lost. Do you want to leave this form?" }
    };
    var prompt = messages[kind];
    apex.message.confirm(prompt.body, function (confirmed) {
      confirmationOpen = false;
      if (!confirmed || !visible(action)) return;
      actionInProgress = true;
      /* Invoke the same authored click users reach with the mouse.  Native
         validations, Dynamic Actions and page processing decide what happens
         next; this shortcut never calls apex.submit or performs DML itself. */
      window.setTimeout(function () {
        try { action.click(); } finally {
          window.clearTimeout(actionCooldown);
          actionCooldown = window.setTimeout(function () { actionInProgress = false; }, 900);
        }
      }, 0);
    }, {
      title: prompt.title,
      /* Some older APEX builds ignore these two labels, so the small
         post-open normalizer below also updates the native dialog buttons. */
      okButtonLabel: "Yes",
      cancelButtonLabel: "No"
    });
    window.setTimeout(function () {
      var dialogs = doc.querySelectorAll(".ui-dialog[role=alertdialog],.ui-dialog[role=dialog]");
      for (var i = 0; i < dialogs.length; i++) {
        if (!visible(dialogs[i])) continue;
        var yes = dialogs[i].querySelector(".js-confirmBtn");
        var buttons = dialogs[i].querySelectorAll(".ui-dialog-buttonpane button");
        if (!yes || !buttons.length) continue;
        yes.textContent = "Yes";
        yes.setAttribute("aria-label", "Yes");
        Array.prototype.forEach.call(buttons, function (button) {
          if (button !== yes) {
            button.textContent = "No";
            button.setAttribute("aria-label", "No");
          }
        });
        try { yes.focus(); } catch (ignore) {}
        break;
      }
    }, 0);
  }

  function invokeNativeAction(action) {
    if (actionInProgress || !visible(action)) return;
    actionInProgress = true;
    /* Alt+N must follow the authored New/Add action directly.  APEX already
       owns the unsaved-changes warning for that navigation, so adding a theme
       confirmation here produced two consecutive dialogs. */
    window.setTimeout(function () {
      try { action.click(); } finally {
        window.clearTimeout(actionCooldown);
        actionCooldown = window.setTimeout(function () { actionInProgress = false; }, 900);
      }
    }, 0);
  }

  doc.addEventListener("keydown", function (event) {
    if (event.defaultPrevented || event.isComposing || event.repeat ||
        event.ctrlKey || event.metaKey || event.shiftKey || activeOverlay() ||
        insideGridOrPopup(event.target)) return;
    var kind = null;
    if (event.altKey && String(event.key).toLowerCase() === "s") kind = "save";
    else if (event.altKey && String(event.key).toLowerCase() === "n") kind = "add";
    else if (!event.altKey && event.key === "Escape") kind = "exit";
    if (!kind) return;
    var action = findNativeAction(kind);
    if (!action) return;
    event.preventDefault();
    event.stopPropagation();
    if (kind === "add") invokeNativeAction(action);
    else confirmation(kind, action);
  }, true);
})();

/* Capture a queued sidebar handoff before the rest of this shared runtime can
   allow APEX to paint the previous branch state. The navigation module below
   resolves and removes this marker as soon as the target branch is restored. */
(function () {
  try {
    /* This file is shared by every page. Mark the shell before APEX can
       render a body frame so CSS can keep the legacy pre-enhancement layout
       from becoming a visible intermediate paint. */
    document.documentElement.classList.add('hspl-shell-boot');
    /* Paint the user's last native rail state before Universal Theme's shell
       can show its startup default. This is a CSS first-paint guard only;
       the navigation module below synchronises the real native state before
       releasing it, so the rail never visibly opens and then closes. */
    var requested = (window.localStorage && window.localStorage.getItem('imart.sidebar.state.v1')) ||
      (window.sessionStorage &&
        (window.sessionStorage.getItem('hspl-nav-next-state') || window.sessionStorage.getItem('hspl-nav-preferred-state')));
    document.documentElement.classList.add(requested === 'open' ? 'hspl-nav-target-open' : 'hspl-nav-target-closed');
  } catch (ignore) {}
})();

/* Final lifecycle safety net for late-rendered form regions.  It deliberately
   repeats only the compact-page decision: adding the class is harmless when
   the main form bootstrap already did so, and it reaches pages whose APEX
   regions are inserted after both DOMContentLoaded and apexreadyend. */
(function () {
  function promoteLateForm() {
    var html = document.documentElement, body = document.body;
    if (!body || /(?:^|\s)page-69(?:\s|$)/.test((html.className || '') + ' ' + (body.className || ''))) return;
    var regions = document.querySelectorAll('.t-Body-main .t-Region:not(.t-IRR-region):not(.hspl-drawer):not(.js-filter-drawer)');
    var formRegion = Array.prototype.some.call(regions, function (region) {
      var heading = (region.querySelector('.t-Region-title,.t-Region-header') || {}).textContent || '';
      if (/\b(filter|search|criteria)\b/i.test(heading)) return false;
      return !!region.querySelector('.t-Form-fieldContainer input:not([type=hidden]):not([readonly]),.t-Form-fieldContainer select,.t-Form-fieldContainer textarea:not([readonly])');
    });
    if (formRegion) html.classList.add('hspl-compact-form');
  }
  [0, 180, 700, 1400].forEach(function (delay) { setTimeout(promoteLateForm, delay); });
  document.addEventListener('apexreadyend', promoteLateForm, { once: true });
})();

/* Account-menu first-paint guard. The user menu is released only after APEX
   has completed startup, preventing a stale Sign Out entry on reload. */
(function () {
  function release() { document.documentElement.classList.add('hspl-account-ready'); }
  document.addEventListener('apexreadyend', release, { once: true });
  window.addEventListener('load', function () { requestAnimationFrame(release); }, { once: true });
})();

/* Shared first-paint and register scroll stability. Keeps native table sizing intact.
   Do not wait for sidebar mutations or report content here: those can continue
   after APEX is ready and made every navigation look like a multi-second load. */
(function () {
  'use strict';
  var html = document.documentElement;
  html.classList.add('hspl-shell-loading');

  function revealShell() {
    if (html.classList.contains('hspl-shell-ready')) return;
    requestAnimationFrame(function () {
      html.classList.add('hspl-shell-ready');
      html.classList.remove('hspl-shell-loading');
    });
  }

  document.addEventListener('apexreadyend', revealShell, { once: true });
  document.addEventListener('DOMContentLoaded', revealShell, { once: true });
  window.addEventListener('load', revealShell, { once: true });
  /* Never leave the interface waiting on a slow optional report query. */
  window.setTimeout(revealShell, 300);

  /* A fixed-header clone must follow the report body in the same scroll event.
     Capture phase runs before older deferred listeners, so the header never
     trails the horizontal scrollbar by a frame. */
  document.addEventListener('scroll', function (event) {
    var body = event.target;
    if (!body || !body.classList || !body.classList.contains('t-fht-tbody')) return;
    var wrap = body.closest ? body.closest('.t-fht-wrapper') : null;
    var head = wrap ? wrap.querySelector('.t-fht-thead') : null;
    if (head && head.scrollLeft !== body.scrollLeft) head.scrollLeft = body.scrollLeft;
  }, { capture: true, passive: true });
})();

/* A Global Search result is a complete selectable row, not only its text link. */
(function () {
  document.addEventListener('click', function (event) {
    if (!event.target || !event.target.closest) return;
    var field = document.getElementById('P0_NEW');
    var root = (field && field.closest('.ui-dialog')) || document.getElementById('global-search');
    var card = event.target.closest('.a-SearchResults-item, .a-SearchResult');
    if (!root || !card || !root.contains(card) || event.target.closest('a[href],[role=link]')) return;
    var link = card.querySelector('a[href],[role=link]');
    if (link) link.click();
  }, true);
})();

/* A register filter may perform a normal page submit rather than an AJAX
   refresh. Carry the *current* rail state into that submit before APEX starts
   its lifecycle. Without this handoff Universal Theme briefly restores its
   last saved (often open) navigation state, then the page's legacy rule
   closes it — the open/close flash reported after Apply. This listener only
   records state; it never clicks or animates the sidebar. */
(function () {
  var intentKey = 'hspl-nav-next-state';
  var marker = '::hspl-nav::';
  function persistCurrentRail() {
    /* Kept as a no-op for legacy filter handlers. The native APEX shell already
       persists its state; duplicating it in sessionStorage/window.name made a
       filter submit replay a stale open/close instruction on the next page. */
  }
  function isFilterSubmitControl(target) {
    var control = target && target.closest && target.closest('button, a.t-Button, input[type=submit]');
    if (!control) return false;
    var scope = control.closest('.hspl-drawer, .js-filter-drawer, .ui-dialog');
    if (!scope) return false;
    var label = (control.getAttribute('aria-label') || control.getAttribute('data-otel-label') || control.value || control.textContent || '')
      .replace(/\s+/g, ' ').trim().toLowerCase();
    return /^(apply|refresh|go|search)$/.test(label);
  }
  document.addEventListener('click', function (event) {
    if (isFilterSubmitControl(event.target)) persistCurrentRail();
  }, true);
  document.addEventListener('submit', function (event) {
    if (event.target && event.target.closest && event.target.closest('.hspl-drawer, .js-filter-drawer, .ui-dialog')) persistCurrentRail();
  }, true);
})();

/* Store only the user's native sidebar preference.  There is intentionally no
   custom sidebar animation: an animated rail forces Interactive Report fixed
   headers to be measured at intermediate widths. */
(function () {
  function rememberUserRailState() {
    /* Save only after a user action. A reload must not replace the user's
       known state with Universal Theme's temporary startup default. */
    setTimeout(function () {
      try {
        window.sessionStorage.setItem(
          'hspl-nav-preferred-state',
          document.body.classList.contains('js-navExpanded') ? 'open' : 'closed'
        );
      } catch (ignore) {}
    }, 0);
  }
  document.addEventListener('click', function (event) {
    if (!event.isTrusted || !event.target.closest) return;
    var hamburger = event.target.closest('#t_Button_navControl');
    var outsideOpenNav = document.body.classList.contains('js-navExpanded') &&
      !event.target.closest('#t_Body_nav, #t_Button_navControl');
    if (!hamburger && !outsideOpenNav) return;
    rememberUserRailState();
  }, true);
  /* A browser reload has no preceding click inside the page. Capture the
     final native rail state at unload so F5/reload uses the exact same
     persistent preference as a hamburger action. */
  window.addEventListener('beforeunload', function () {
    try {
      window.sessionStorage.setItem(
        'hspl-nav-preferred-state',
        document.body.classList.contains('js-navExpanded') ? 'open' : 'closed'
      );
    } catch (ignore) {}
  });
})();


/* Keep legacy master actions in the shared hero.  These pages expose real
   Cancel/Create or Back/Save controls, but a few templates render the button
   region after the hero was initially built.  Move only that existing region;
   event handlers, labels and submit/navigation behaviour remain APEX-owned. */
(function () {
  "use strict";
  var MASTER_PAGE_IDS = [24, 25, 32, 181, 183, 240, 297, 350, 480, 546, 548];
  function pageId() {
    var match = ((document.documentElement.className || "") + " " +
      ((document.body && document.body.className) || "")).match(/(?:^|\s)page-(\d+)(?:\s|$)/);
    return match ? parseInt(match[1], 10) : 0;
  }
  function placeActions() {
    if (MASTER_PAGE_IDS.indexOf(pageId()) === -1) return;
    document.documentElement.classList.add("hspl-master-form-page", "hspl-compact-form");
    var hero = document.querySelector(".t-Body-title.hspl-hero-card");
    if (!hero) return;
    var region = document.getElementById("buttons") ||
      hero.querySelector(".t-ButtonRegion") ||
      Array.prototype.filter.call(document.querySelectorAll(".t-ButtonRegion"), function (candidate) {
        return !candidate.closest(".t-Body-main,.t-Body-content") &&
          !!candidate.querySelector(".t-Button,button");
      })[0];
    if (!region || !region.querySelector(".t-Button,button")) return;
    var holder = hero.querySelector(".hspl-form-hero-actions");
    if (!holder) {
      holder = document.createElement("div");
      holder.className = "hspl-form-hero-actions";
      hero.appendChild(holder);
    }
    if (!holder.contains(region)) holder.appendChild(region);
  }
  [0, 180, 700, 1400].forEach(function (delay) { setTimeout(placeActions, delay); });
  if (window.apex && apex.jQuery) apex.jQuery(document).on("apexafterrefresh.hsplMasterActions", placeActions);
})();

/* ===========================================================================
   SHARED MASTER-FORM HERO
   ---------------------------------------------------------------------------
   A small group of legacy master forms previously suppressed their empty
   Universal Theme title host.  That left the step bar as the first visible
   element, unlike every other form.  Give those pages the same existing hero
   header used throughout the application; no region, item, grid or behaviour
   is changed.
   =========================================================================== */
(function () {
  "use strict";
  var MASTER_FORM_PAGE_IDS = [24, 25, 32, 181, 183, 240, 297, 350, 480, 546, 548];
  var ICON = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"/><path d="M14 3v5h5M9 13h6M9 17h6M9 9h1"/></svg>';

  function currentPageId() {
    var classes = (document.documentElement.className || "") + " " + ((document.body && document.body.className) || "");
    var match = classes.match(/(?:^|\s)page-(\d+)(?:\s|$)/);
    return match ? parseInt(match[1], 10) : 0;
  }
  function apply() {
    if (MASTER_FORM_PAGE_IDS.indexOf(currentPageId()) === -1) return;
    var host = document.querySelector(".t-Body-title");
    if (!host || host.children.length) return;
    var title = (document.title || "").split(/\s+[|–-]\s+/)[0].trim();
    if (!title) return;
    document.documentElement.classList.remove("hspl-form-page");
    /* Master pages use the same real header-action adapter as transaction
       forms.  Marking them as compact-form pages is only an eligibility flag:
       it moves their existing Cancel/Create (or Back/Save) buttons into this
       hero; it does not create, rename, or rebind any action. */
    document.documentElement.classList.add("hspl-master-form-page", "hspl-compact-form");
    host.style.removeProperty("display");
    var icon = document.createElement("div");
    icon.className = "hspl-hero-icon";
    icon.innerHTML = ICON;
    var block = document.createElement("div");
    block.className = "hspl-title-block";
    var heading = document.createElement("h1");
    heading.className = "hspl-page-title";
    heading.textContent = title;
    block.appendChild(heading);
    var subject = title.replace(/\s+master$/i, "").trim();
    if (subject) {
      var subtitle = document.createElement("p");
      subtitle.className = "hspl-page-desc";
      subtitle.textContent = "Manage " + subject.toLowerCase() + " records";
      block.appendChild(subtitle);
    }
    host.appendChild(icon);
    host.appendChild(block);
    host.classList.add("hspl-has-title", "hspl-hero-card");
  }
  /* Build the existing title host in the DOM-ready task itself.  Deferring
     this one turn leaves a visibly blank hero while the generic title adapter
     briefly hides the host. */
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", apply, { once: true });
  else apply();
})();

/* ===========================================================================
   PENDING DISPATCH ADVICE — single-record picker (page 169)
   ---------------------------------------------------------------------------
   The region already returns the selected Interactive Grid record to Material
   Out.  Add an explicit radio affordance beside each row so the one-record
   nature of that choice is clear, without changing the grid query, returned
   item, or its existing selection-change Dynamic Action.
   =========================================================================== */
(function () {
  "use strict";
  var REGION_ID = "pending-despatch-advice";
  var SELECTOR_CLASS = "hspl-pending-dispatch-selector";

  function region() { return document.getElementById(REGION_ID); }
  function rowKey(row, index) {
    return row.getAttribute("data-id") || row.getAttribute("data-row") || String(index);
  }
  function selected(row) {
    return row.classList.contains("is-selected") || row.getAttribute("aria-selected") === "true";
  }
  function selector(row, index) {
    var cell = row.querySelector("td." + SELECTOR_CLASS);
    if (cell) return cell.querySelector("input");
    cell = document.createElement("td");
    cell.className = SELECTOR_CLASS;
    cell.setAttribute("role", "gridcell");
    var input = document.createElement("input");
    input.type = "radio";
    input.name = "hspl-pending-dispatch-choice";
    input.className = "hspl-pending-dispatch-radio";
    input.setAttribute("aria-label", "Select dispatch advice");
    input.value = rowKey(row, index);
    cell.appendChild(input);
    row.insertBefore(cell, row.firstChild);
    return input;
  }
  function install() {
    var host = region();
    if (!host) return;
    Array.prototype.forEach.call(host.querySelectorAll("thead tr"), function (header) {
      if (header.querySelector("th." + SELECTOR_CLASS)) return;
      var head = document.createElement("th");
      head.className = SELECTOR_CLASS;
      head.setAttribute("scope", "col");
      head.setAttribute("aria-label", "Select");
      header.insertBefore(head, header.firstChild);
    });
    Array.prototype.forEach.call(host.querySelectorAll("tbody tr"), function (row, index) {
      var input = selector(row, index);
      input.checked = selected(row);
    });
  }
  function selectRow(radio) {
    var row = radio.closest("tr");
    if (!row) return;
    Array.prototype.forEach.call(region().querySelectorAll("input.hspl-pending-dispatch-radio"), function (item) {
      item.checked = item === radio;
    });
    /* Let the existing native IG row-selection event select the record and
       close the picker exactly as it did before this visual affordance. */
    var cell = row.querySelector("td:not(." + SELECTOR_CLASS + ")");
    if (cell) cell.dispatchEvent(new MouseEvent("click", { bubbles: true, cancelable: true }));
  }
  function start() {
    var host = region();
    if (!host) return;
    install();
    host.addEventListener("click", function (event) {
      var radio = event.target && event.target.closest && event.target.closest("input.hspl-pending-dispatch-radio");
      if (!radio) return;
      event.preventDefault();
      event.stopPropagation();
      selectRow(radio);
    });
    host.addEventListener("click", function () { setTimeout(install, 0); });
    try {
      new MutationObserver(function () { install(); }).observe(host, { childList: true, subtree: true });
    } catch (ignore) { /* refresh/click hooks still keep the selector current */ }
    document.addEventListener("apexafterrefresh", function (event) {
      if (event.target === host || (event.target && event.target.closest && event.target.closest("#" + REGION_ID))) install();
    }, true);
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", start, { once: true });
  else start();
})();

/* ==========================================================================
   0b. CHART PALETTE AS A JET DEFAULT (kills the first-load re-colour delay).
   Previously styleCharts() re-coloured every chart AFTER JET had already drawn
   it with JET's stock palette — a second async JET re-render per chart. That
   re-render was the "renders in default colours, then flips to ours" flash AND
   a big slice of the 2-3s first-hover lag (JET rebuilds its interactivity layer
   on the re-render). Here we register OUR palette as ojChart's DEFAULT via the
   JET component-defaults API, BEFORE any chart is created, so every chart draws
   in-brand on its FIRST pass — no re-colour, no re-render, no flip. Animations
   are defaulted off for the same reason. styleCharts() below is now only a
   fallback for any chart that raced ahead of this registration.
   Poll for oj.Components since this file can load before JET's modules do. */
(function () {
  var PALETTE = ['#7B6EF6','#1BB5A8','#57C97D','#F5C242','#4C8DF5','#F2789F','#A78BFA','#F59842','#3FC5DE','#8B8FC9'];
  function setDefaults() {
    try {
      if (window.oj && oj.Components && typeof oj.Components.setDefaultOptions === 'function') {
        var g = oj.Components.createDynamicPropertyGetter;
        oj.Components.setDefaultOptions({
          'ojChart': {
            animationOnDisplay:    g(function () { return 'none'; }),
            animationOnDataChange: g(function () { return 'none'; }),
            styleDefaults:         g(function () { return { colors: PALETTE }; })
          }
        });
        return true;
      }
    } catch (e) {}
    return false;
  }
  if (!setDefaults()) {
    var tries = 0;
    var iv = setInterval(function () { if (setDefaults() || ++tries > 400) clearInterval(iv); }, 15);
  }
})();

/* Dashboard entry focus. APEX or the browser can restore the last focused IR
   control and consequently reopen a dashboard halfway down the page. Preserve
   intentional anchor drills, but normal dashboard navigation always starts at
   the top with no control stealing scroll. */
(function () {
  var entryGuardUntil = Date.now() + 5000;
  var userInteracted = false;

  function isDashboard() {
    return !!document.querySelector(
      ".ds-dashboard,.ds-slc-hero,.ds-purchase-head,.ds-sales-head,.ds-360-head," +
      ".hs-home-root,.hs-sample-home,.imart-home-shell,.bi-workspace," +
      ".go-command,.approval-workspace"
    );
  }
  function resetDashboardEntry() {
    /* A real wheel gesture is user intent just as much as a click or key.
       Never let late APEX focus restoration pull an actively scrolling user
       back to the top. */
    if (userInteracted || window.location.hash || !isDashboard()) return;
    try { history.scrollRestoration = "manual"; } catch (e) {}
    var active = document.activeElement;
    if (active && active !== document.body && typeof active.blur === "function") active.blur();
    if (window.scrollX || window.scrollY) window.scrollTo(0, 0);
  }
  function ready() {
    resetDashboardEntry();
    setTimeout(resetDashboardEntry, 0);
  }

  /* Interactive Reports initialise after DOMContentLoaded and can restore focus
     to their column-search button several seconds later. That late focus makes
     the browser scroll a long dashboard to the report even though navigation
     had correctly started at the top. During the short, non-interactive entry
     window only, discard focus from generated report controls and restore the
     top. The guard stops immediately on real pointer/keyboard input, so normal
     accessibility and report keyboard use are unaffected. */
  function markInteracted() { userInteracted = true; }
  document.addEventListener("pointerdown", markInteracted, { capture: true, once: true });
  document.addEventListener("keydown", markInteracted, { capture: true, once: true });
  document.addEventListener("wheel", markInteracted, { capture: true, passive: true, once: true });
  document.addEventListener("focusin", function (event) {
    if (userInteracted || Date.now() > entryGuardUntil || window.location.hash || !isDashboard()) return;
    var target = event.target;
    if (!target || !target.closest || !target.closest(".a-IRR-toolbar,.a-IRR-controls,.t-fht-thead")) return;
    if (typeof target.blur === "function") target.blur();
    requestAnimationFrame(resetDashboardEntry);
  }, true);

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", ready, { once: true });
  else ready();
  document.addEventListener("apexreadyend", function () {
    resetDashboardEntry();
    setTimeout(resetDashboardEntry, 50);
    setTimeout(resetDashboardEntry, 250);
  }, { once: true });
  window.addEventListener("pageshow", resetDashboardEntry);
})();

/* ==========================================================================
   1. PAGE TITLE + 3. COLLAPSIBLE-REGION DRAWER
   ========================================================================== */
(function () {
  "use strict";

  var OPEN_CLASS = "hspl-drawer-open";
  var doc = document;

  function el(tag, cls, html) {
    var n = doc.createElement(tag);
    if (cls) n.className = cls;
    if (html != null) n.innerHTML = html;
    return n;
  }

  function isOpen() { return doc.documentElement.classList.contains(OPEN_CLASS); }
  /* Several legacy register pages collapse their original Filter region after
     Apply by adding .is-collapsed and writing display:none on the collapsible
     body. Once that region is presented as our fixed drawer, those legacy
     instructions must not leave an open but empty shell. Restore only the
     collapsible visibility state; page items and their values are untouched. */
  function restoreDrawerContent() {
    var drawer = doc.querySelector(".t-Region.hspl-drawer");
    if (!drawer) return;
    /* Do not remove/re-add the collapsible state every time a drawer opens.
       Enhanced LOV listens to that state change and re-runs its AJAX refresh,
       making already-selected values blink for several seconds. Only repair a
       genuinely collapsed drawer left by a legacy Apply action. */
    if (drawer.classList.contains("is-collapsed")) drawer.classList.remove("is-collapsed");
    if (!drawer.classList.contains("is-expanded")) drawer.classList.add("is-expanded");
    var content = drawer.querySelector(".a-Collapsible-content");
    if (content) {
      if (content.hidden) content.hidden = false;
      if (content.style.display === "none") content.style.removeProperty("display");
    }
    var control = drawer.querySelector(".a-Collapsible-control,[aria-controls]");
    if (control && control.getAttribute("aria-controls")) {
      control.setAttribute("aria-expanded", "true");
    }
  }
  function open() {
    restoreDrawerContent();
    doc.documentElement.classList.add(OPEN_CLASS);
    /* Focus the drawer's close control instead of its first field. Enhanced
       LOV plugins open their result popup on focus, which made the drawer look
       as if it flashed/opened another panel before the user touched a field. */
    var closeControl = doc.querySelector(".hspl-drawer .hspl-drawer-close");
    if (closeControl) { try { closeControl.focus({ preventScroll: true }); } catch (e) { /* older browsers */ } }
  }
  function close() { doc.documentElement.classList.remove(OPEN_CLASS); }
  function toggle() { isOpen() ? close() : open(); }

  /* APEX Dynamic Actions do not automatically run the browser's native
     required-field validation. Register filters therefore used to refresh
     even when a required Enhanced LOV/date item was blank. Validate the
     metadata APEX already renders (`is-required` / `required`) before the
     Apply click reaches the page Dynamic Action. This is deliberately
     generic: no page ids, item ids or filter business rules are duplicated. */
  function itemName(container) {
    return (container.id || "").replace(/_CONTAINER$/, "");
  }
  function itemValue(name, container) {
    if (name && window.apex && apex.item) {
      try { return apex.item(name).getValue(); } catch (ignore) { /* fallback below */ }
    }
    var control = name ? doc.getElementById(name) : null;
    if (!control) control = container.querySelector("input:not([type=hidden]),select,textarea,input[type=hidden]");
    if (!control) return "";
    if ((control.type === "checkbox" || control.type === "radio") && !control.checked) return "";
    return control.value;
  }
  function isBlank(value) {
    if (value == null) return true;
    if (Array.isArray(value)) return value.length === 0 || value.every(isBlank);
    return String(value).trim() === "";
  }
  function clearFilterValidation(drawer) {
    var summary = drawer.querySelector(".hspl-filter-validation");
    if (summary) summary.parentNode.removeChild(summary);
    Array.prototype.forEach.call(drawer.querySelectorAll(".hspl-filter-invalid"), function (container) {
      container.classList.remove("hspl-filter-invalid");
      var name = itemName(container);
      var control = name ? doc.getElementById(name) : null;
      if (control) control.removeAttribute("aria-invalid");
    });
  }
  function validateRequiredFilters(drawer) {
    clearFilterValidation(drawer);
    var missing = [];
    Array.prototype.forEach.call(drawer.querySelectorAll(".t-Form-fieldContainer"), function (container) {
      var name = itemName(container);
      var control = name ? doc.getElementById(name) : null;
      var required = container.classList.contains("is-required") ||
        (control && (control.required || control.getAttribute("aria-required") === "true")) ||
        !!container.querySelector("[required],[aria-required=true]");
      if (!required || !isBlank(itemValue(name, container))) return;
      var label = container.querySelector(".t-Form-label");
      missing.push({ container: container, control: control, label: ((label && label.textContent) || name || "Required field").trim() });
    });
    if (!missing.length) return true;

    missing.forEach(function (field) {
      field.container.classList.add("hspl-filter-invalid");
      if (field.control) field.control.setAttribute("aria-invalid", "true");
    });
    var summary = el("div", "hspl-filter-validation");
    summary.setAttribute("role", "alert");
    summary.setAttribute("aria-live", "assertive");
    summary.textContent = "Please complete the required filters: " + missing.map(function (field) { return field.label; }).join(", ") + ".";
    var content = drawer.querySelector(".a-Collapsible-content") || drawer.querySelector(".t-Region-body") || drawer;
    content.insertBefore(summary, content.firstChild);
    open();
    try { missing[0].container.scrollIntoView({ block: "nearest" }); } catch (ignore) { /* older browsers */ }
    return false;
  }

  /* These pages carry no breadcrumb region, so Universal Theme renders an empty
     .t-Body-title and the page has no heading at all. Fill it from the page
     title rather than editing 500+ pages. Purely additive: a page that already
     has a breadcrumb or hero is left alone. */
  /* A document/register icon for the hero tile — a literal SVG, so it never
     depends on an icon font being loaded. */
  var HERO_ICON =
    '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" ' +
    'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">' +
    '<path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"/>' +
    '<path d="M14 3v5h5M9 13h6M9 17h6M9 9h1"/></svg>';

  /* Derive a page-specific subtitle from the title, in the reference's style
     ("View and search all payment advices"). Used only when the page has no
     subtitle of its own. Not fabricated per-record copy — it restates the
     page's own subject. */
  function pluralize(s) {
    if (/(s|x|z|ch|sh)$/i.test(s)) return s + "es";
    if (/[^aeiou]y$/i.test(s))     return s.replace(/y$/i, "ies");
    return s + "s";
  }
  function genericSubtitle(title) {
    var t = (title || "").trim(), m;
    if ((m = t.match(/^(.*?)\s+register$/i))) return "View and search all " + pluralize(m[1].trim().toLowerCase());
    if ((m = t.match(/^(.*?)\s+master$/i)))   return "Manage " + m[1].trim().toLowerCase() + " records";
    if ((m = t.match(/^(.*?)\s+(report|summary|sheet|statement)$/i))) return "View and analyse " + m[1].trim().toLowerCase() + " data";
    if (/\bmis\b/i.test(t))       return "Management information and analytics";
    if (/\bledger\b/i.test(t))    return "View account movements and balances";
    if (/\bdashboard\b/i.test(t)) return "Key metrics and activity at a glance";
    if (/\bmaterial out\b/i.test(t)) return "Dispatch, track and manage outgoing material";
    if (/\bmaterial in\b/i.test(t)) return "Receive, verify and record incoming material";
    if (/\b(order|bill|advice|note|voucher|grn|indent|issue|weighment|transfer|gate pass|production|bom|enquiry|quotation|comparative|rate contract|mrn)\b/i.test(t)) {
      return "Create, manage and track " + pluralize(t.toLowerCase());
    }
    return "";
  }

  /* Every current page backed by an APEX Form region. This inventory is
     generated from the application export, so register filters, dashboards
     and report search controls are not mistaken for transaction forms. Page
     69 (Material In) is deliberately excluded: it remains the untouched
     reference implementation for the shared compact treatment below. */
  var COMPACT_FORM_PAGE_IDS = new Set([
    4,5,8,9,14,15,16,22,25,26,28,30,32,34,37,39,42,44,47,49,51,53,55,57,
    59,61,62,63,65,67,71,73,75,77,79,81,83,85,87,89,91,93,95,97,99,102,
    104,106,108,110,112,114,116,118,120,122,124,128,130,133,136,138,140,
    143,146,148,150,152,155,156,159,161,166,168,171,173,175,177,179,181,
    184,187,188,189,191,193,195,197,199,202,204,206,208,211,213,215,217,
    218,221,223,225,230,242,244,246,248,252,264,266,270,274,277,285,287,
    289,301,303,305,308,312,313,317,320,326,332,334,336,338,340,342,344,
    346,348,350,352,355,356,367,369,371,373,381,383,415,418,420,602,604,
    606,608,610,612,614,616,618,620,622,624,626,628,630,632,634,636,639,
    641,643,645,647,649,652,654,656,658,660,662,664,666,668,670,672,675,
    677,679,682,684,686,688,690,692,694,696,702,705,706,708,710,712,714,
    716,718,720
  ]);
  function markCompactFormPage() {
    /* Universal Theme places page-N on body for normal pages, but dialog and
       some legacy page templates put it on html. Read both shells before
       deciding whether the shared form treatment applies. */
    var pageClasses = (doc.documentElement.className || "") + " " +
      ((doc.body && doc.body.className) || "");
    var match = pageClasses.match(/(?:^|\s)page-(\d+)(?:\s|$)/);
    var pageId = match ? parseInt(match[1], 10) : 0;
    if (pageId === 69) return;
    /* Most document pages are already known. Do not walk every region and
       field merely to confirm that fact—large detail grids made this repeated
       startup scan disproportionately expensive. */
    if (COMPACT_FORM_PAGE_IDS.has(pageId)) {
      doc.documentElement.classList.add("hspl-compact-form");
      return;
    }
    var formRegion = Array.prototype.some.call(
      doc.querySelectorAll('.t-Body-main .t-Region:not(.t-IRR-region):not(.hspl-drawer):not(.js-filter-drawer)'),
      function (region) {
        var heading = (region.querySelector('.t-Region-title,.t-Region-header') || {}).textContent || '';
        if (/\b(filter|search|criteria)\b/i.test(heading)) return false;
        return !!region.querySelector('.t-Form-fieldContainer input:not([type=hidden]):not([readonly]),.t-Form-fieldContainer select,.t-Form-fieldContainer textarea:not([readonly])');
      }
    );
    if (formRegion) {
      doc.documentElement.classList.add("hspl-compact-form");
    }
  }

  function ensurePageTitle() {
    var host = doc.querySelector(".t-Body-title");
    var formPageIds = [24, 25, 32, 181, 183, 240, 297, 350, 480, 546, 548];
    var pageClass = (doc.documentElement.className || "").match(/(?:^|\s)page-(\d+)(?:\s|$)/);
    if (pageClass && formPageIds.indexOf(parseInt(pageClass[1], 10)) !== -1) {
      /* The dedicated master hero above owns this title host.  Do not hide it
         here: that former hand-off produced the short blank-heading frame. */
      doc.documentElement.classList.add("hspl-master-form-page", "hspl-compact-form");
      return;
    }
    if (!host || host.children.length) return;
    var t = (doc.title || "").split(/\s+[|–-]\s+/)[0].trim();
    if (!t) return;

    var icon = el("div", "hspl-hero-icon", HERO_ICON);
    var block = el("div", "hspl-title-block");
    block.appendChild(el("h1", "hspl-page-title", t));
    var sub = genericSubtitle(t);
    if (sub) { var p = el("p", "hspl-page-desc"); p.textContent = sub; block.appendChild(p); }

    host.appendChild(icon);
    host.appendChild(block);
    host.classList.add("hspl-has-title", "hspl-hero-card");
  }

  /* Screenshot B shows an icon on every sidebar item; this app's navigation
     list has none assigned, so APEX renders an empty icon slot. Fill it by
     matching the item's label to a Font APEX glyph. Purely additive: an item
     that already carries a glyph is left alone, and unmapped items get a quiet
     default so nothing is left bare. */
  var NAV_ICONS = [
    [/^home/i, "fa-home"], [/dashboard/i, "fa-dashboard"],
    [/admin/i, "fa-cog"], [/account/i, "fa-money"],
    [/material/i, "fa-cubes"], [/human ?resource|^hr\b/i, "fa-users"],
    [/plant|mainten/i, "fa-wrench"], [/rake|payloader|loader/i, "fa-truck"],
    [/transport/i, "fa-truck"], [/logistic/i, "fa-map-marker"],
    [/audit/i, "fa-check-square-o"], [/conversion/i, "fa-exchange"],
    [/mail|email/i, "fa-envelope-o"], [/mis|report|analytic/i, "fa-line-chart"],
    [/purchase|procure/i, "fa-shopping-cart"], [/sales|dispatch|order/i, "fa-truck"],
    [/store|inventor|stock/i, "fa-archive"], [/quality|inspect/i, "fa-check-circle-o"],
    [/vendor|party|supplier/i, "fa-handshake-o"], [/invoice|payment|bill/i, "fa-file-text-o"],
    [/setting|config/i, "fa-sliders"], [/user|employee|attend|salary|overtime/i, "fa-user"]
  ];
  function iconFor(label) {
    for (var i = 0; i < NAV_ICONS.length; i++) if (NAV_ICONS[i][0].test(label)) return NAV_ICONS[i][1];
    return "fa-angle-right";   /* quiet default */
  }
  function injectNavIcons() {
    var rows = doc.querySelectorAll(".t-Body-nav .a-TreeView-content:not([data-hspl-icon])");
    Array.prototype.forEach.call(rows, function (row) {
      row.setAttribute("data-hspl-icon", "1");
      var label = (row.textContent || "").trim();
      if (!label) return;
      /* This app renders its OWN icon as <span class="fa fa fa-xxx"> — NOT
         .a-Icon. If the app icon is present, remove any .a-Icon a previous
         build injected (the duplicate) and stop. Only inject where the item
         genuinely has no icon. */
      var appIcon = row.querySelector("span.fa:not(.a-Icon), .t-Icon, svg");
      var myIcon  = row.querySelector("span.a-Icon");
      if (appIcon) {
        if (myIcon) myIcon.parentNode.removeChild(myIcon);
        return;
      }
      if (myIcon && /\bfa-\S/.test(myIcon.className)) return;
      if (!myIcon) { myIcon = el("span", "a-Icon"); row.insertBefore(myIcon, row.firstChild); }
      myIcon.className = "a-Icon fa " + iconFor(label);
    });
  }

  /* Count filters carrying a value, so the trigger can show a badge. Only
     visible APEX page items count. */
  function countActive(drawer) {
    var n = 0;
    Array.prototype.forEach.call(drawer.querySelectorAll("input, select, textarea"), function (f) {
      if (!/^P\d+_/.test(f.id || "")) return;
      if (f.type === "hidden" || f.disabled) return;
      if (f.offsetParent === null) return;
      if (f.type === "checkbox" || f.type === "radio") { if (f.checked) n++; return; }
      if ((f.value || "").trim() !== "") n++;
    });
    return n;
  }

  function refreshBadge(drawer, trigger) {
    var n = countActive(drawer);
    var badge = trigger.querySelector(".hspl-filter-trigger__count");
    if (badge) badge.textContent = n;
    trigger.classList.toggle("is-filtered", n > 0);
  }

  /* APEX emits the saved IR highlight colours as data attributes in the
     server HTML, but waits until its DOM-ready bootstrap to copy them to the
     visible controls.  On a register reload that left the labels white for a
     frame before the exact same saved colours appeared.  Copy only those
     server-owned values now; APEX remains authoritative and will later write
     the identical inline declarations. */
  function paintReportHighlightControls(root) {
    var scope = root && root.querySelectorAll ? root : doc;
    Array.prototype.forEach.call(
      scope.querySelectorAll('.a-IRR-controlsLabel[data-bgcol], .a-IRR-button--remove .u-vh[data-bgcol]'),
      function (control) {
        var background = control.getAttribute('data-bgcol');
        var foreground = control.getAttribute('data-ftcol');
        if (background) control.style.backgroundColor = background;
        if (foreground) control.style.color = foreground;
      }
    );
  }

  function buildTrigger(drawer) {
    var btn = el("button", "hspl-filter-trigger");
    btn.type = "button";
    btn.setAttribute("aria-haspopup", "dialog");
    btn.innerHTML =
      '<span class="fa fa-filter" aria-hidden="true"></span>' +
      "<span>Filters</span>" +
      '<span class="hspl-filter-trigger__count">0</span>';
    btn.addEventListener("click", toggle);

    /* The button belongs with the page heading, not buried in the report's
       own toolbar — it acts on the page, not on the report's search. Preference
       order: a hero region's action slot, then the page title band, then the
       report toolbar as a last resort. */
    var hero = doc.querySelector(".t-HeroRegion-col--actions, .t-HeroRegion .t-HeroRegion-form");
    var titleBar = doc.querySelector(".t-Body-title");
    if (hero) {
      hero.appendChild(btn);
    } else if (titleBar) {
      titleBar.appendChild(btn);
      titleBar.classList.add("hspl-title-has-action");
    } else {
      var toolbar = doc.querySelector(".a-IRR-toolbar, .a-IRR-searchBar");
      if (toolbar) toolbar.appendChild(btn);
      else {
        var host = el("div", "hspl-row");
        host.style.cssText = "margin:0 0 12px;justify-content:flex-end";
        host.appendChild(btn);
        var report = doc.querySelector(".t-IRR-region, .a-IRR") || drawer.nextElementSibling;
        if (report && report.parentNode) report.parentNode.insertBefore(host, report);
        else doc.body.appendChild(host);
      }
    }
    return btn;
  }

  /* APEX can render a filter action in either the region header or body.
     Once the native region becomes a drawer, retain the same action in the
     visible footer. Moving the original node keeps its id, delegated handlers
     and Dynamic Actions intact. */
  function buildFooter(drawer) {
    var footer = el("div", "hspl-drawer-footer");
    Array.prototype.forEach.call(
      drawer.querySelectorAll(".t-Region-header .t-Button, .t-Region-headerItems--buttons .t-Button"),
      function (b) { if (!b.classList.contains("hspl-drawer-close")) footer.appendChild(b); }
    );
    Array.prototype.forEach.call(
      drawer.querySelectorAll(".t-Region-body .t-Button, .t-Region-body button"),
      function (b) {
        var label = ((b.getAttribute("aria-label") || b.getAttribute("data-otel-label") || b.textContent) || "")
          .replace(/\s+/g, " ").trim();
        if (/^(apply|refresh|go)$/i.test(label)) footer.appendChild(b);
      }
    );
    if (!footer.children.length) return null;
    drawer.appendChild(footer);
    return footer;
  }

  function init() {
    paintReportHighlightControls(doc);
    markCompactFormPage();
    ensurePageTitle();
    injectNavIcons();
    /* Auto-promote every register filter region to the shared Material-In
       drawer. Older pages are inconsistent: some name the region “Filter”,
       while others name it after the register and leave it as a collapsed
       plus-control. The reliable contract is a non-report region containing
       this page's visible item containers and an Apply/Refresh action. */
    function pageNumber() {
      try { if (window.apex && apex.env && apex.env.APP_PAGE_ID) return String(apex.env.APP_PAGE_ID); } catch (ignore) {}
      var flow = doc.getElementById('pFlowStepId') || doc.querySelector('input[name="pFlowStepId"],input[name="p_flow_step_id"]');
      return flow && flow.value ? String(flow.value) : '';
    }
    function regionTitle(region) {
      var heading = region.querySelector('.t-Region-title, .t-Region-header');
      return ((heading && heading.textContent) || region.getAttribute('aria-label') || '').replace(/\s+/g, ' ').trim().toLowerCase();
    }
    /* A transaction form may contain an Interactive Grid in its Detail tab;
       that does not make the page a register. A register can also render its
       filter fields in a native collapsible region. Treat those fields as
       filters when their own region has an Apply/Refresh action; only fields
       outside such a region identify a document form. */
    function hasRegisterReport() {
      if (!doc.querySelector('.a-IRR, .a-GV, .t-IRR-region')) return false;
      return !Array.prototype.some.call(
        doc.querySelectorAll('.t-Body-main .t-Form-fieldContainer, .t-Body-content .t-Form-fieldContainer'),
        function (field) {
          var region = field.closest && field.closest('.t-Region');
          return !region || !hasFilterAction(region);
        }
      );
    }
    function filterFieldCount(region, pageNo) {
      if (region.querySelector('.a-IRR, .a-GV, .t-IRR-region')) return 0;
      var prefix = pageNo ? '[id^="P' + pageNo + '_"]' : '[id^="P"]';
      return region.querySelectorAll(prefix + '[id$="_CONTAINER"] .t-Form-fieldContainer,' + prefix + '.t-Form-fieldContainer').length;
    }
    function hasFilterAction(region) {
      if (region.querySelector('#refresh, [data-otel-label="REFRESH"], [data-otel-label="APPLY"], button[name="REFRESH"], button[name="APPLY"]')) return true;
      return Array.prototype.some.call(region.querySelectorAll('button, a.t-Button'), function (button) {
        var label = ((button.getAttribute('aria-label') || button.getAttribute('data-otel-label') || button.textContent) || '').replace(/\s+/g, ' ').trim();
        return /^(apply|refresh|go)$/i.test(label);
      });
    }
    var currentPage = pageNumber();
    var unnamedCandidates = [];
    var pageHasRegisterReport = hasRegisterReport();
    Array.prototype.forEach.call(doc.querySelectorAll('.t-Region'), function (region) {
      if (region.classList.contains('js-filter-drawer') || region.classList.contains('hspl-drawer')) return;
      var title = regionTitle(region);
      if (title === 'filter' || title === 'filters') {
        region.classList.add('hspl-drawer');
        return;
      }
      if (!pageHasRegisterReport) return;
      var fields = filterFieldCount(region, currentPage);
      if (fields >= 2 && hasFilterAction(region)) unnamedCandidates.push({ region: region, fields: fields });
    });
    /* There is one filter panel per register. Selecting the densest matching
       panel avoids promoting a tiny helper region that happens to contain an
       item and preserves all report/toolbar regions unchanged. */
    if (!doc.querySelector('.t-Region.hspl-drawer') && unnamedCandidates.length) {
      unnamedCandidates.sort(function (a, b) { return b.fields - a.fields; });
      unnamedCandidates[0].region.classList.add('hspl-drawer');
    }
    var drawer = doc.querySelector(".t-Region.hspl-drawer");
    if (!drawer || drawer.dataset.hsplDrawerReady) return;
    drawer.dataset.hsplDrawerReady = "1";

    drawer.classList.remove("is-collapsed");
    drawer.setAttribute("role", "dialog");
    drawer.setAttribute("aria-label", "Filters");

    var overlay = el("div", "hspl-drawer-overlay");
    overlay.addEventListener("click", close);
    doc.body.appendChild(overlay);

    /* a literal glyph, not an icon-font class — the close affordance must not
       disappear if Font Awesome fails to load */
    var closeBtn = el("button", "hspl-drawer-close", '<span aria-hidden="true">&times;</span>');
    closeBtn.type = "button";
    closeBtn.setAttribute("aria-label", "Close filters");
    closeBtn.addEventListener("click", close);
    var header = drawer.querySelector(".t-Region-header");
    if (header) header.appendChild(closeBtn);

    buildFooter(drawer);
    var trigger = buildTrigger(drawer);
    /* FAIL-SAFE: the CSS only lifts the region into a fixed off-screen drawer
       once this class is present. If the trigger could not be placed, we never
       set it, so the region renders inline and the filters stay reachable
       instead of sliding off-screen with no way to open them. */
    if (!trigger || !trigger.isConnected) return;
    doc.documentElement.classList.add("hspl-drawer-ready");

    /* Applying filters hands the screen back to the report — but ONLY the
       drawer's own footer button (the Apply/Refresh, moved there by
       buildFooter) may close it. Buttons inside an APEX form default to
       type=submit, so every LOV list-trigger and date-picker trigger looked
       like a submit button; closing on those meant opening a lookup slammed
       the drawer shut and the picker appeared over the bare page. Scoping to
       the footer excludes every in-field trigger. */
    drawer.addEventListener("click", function (e) {
      if (!e.target.closest) return;
      var footerBtn = e.target.closest(
        ".hspl-drawer-footer .t-Button, .hspl-drawer-footer button," +
        ".hspl-filter-footer .t-Button, .hspl-filter-footer button, .hspl-filter-footer a"
      );
      var buttonLabel = footerBtn && ((footerBtn.querySelector(".t-Button-label") || footerBtn).textContent || "").trim();
      if (footerBtn && /^(apply|refresh|go)$/i.test(buttonLabel) && !validateRequiredFilters(drawer)) {
        e.preventDefault();
        e.stopImmediatePropagation();
        return;
      }
      /* Close immediately but do not cancel the native APEX click. Submit /
         dynamic-action processing continues normally in the background. */
      if (footerBtn) close();
    }, true);
    function clearCompletedFilterError(e) {
      var container = e.target.closest && e.target.closest(".hspl-filter-invalid");
      if (container && !isBlank(itemValue(itemName(container), container))) container.classList.remove("hspl-filter-invalid");
    }
    /* Text fields emit input, while Enhanced LOVs and date pickers emit
       change. Clear only the field that is now valid; never submit/requery. */
    drawer.addEventListener("input", clearCompletedFilterError);
    drawer.addEventListener("change", clearCompletedFilterError);
    /* Keyboard submission must obey the identical required-filter gate as an
       Apply click. This catches template variants whose filter button is a
       submit control rather than a Dynamic Action trigger. */
    drawer.addEventListener("submit", function (e) {
      if (!validateRequiredFilters(drawer)) {
        e.preventDefault();
        e.stopImmediatePropagation();
      }
    }, true);
    /* APEX binds its legacy date picker to the calendar button only. Make the
       date field itself use that same native trigger as users expect. This is
       click-only (not focus), so opening the drawer or tabbing through fields
       never launches a calendar unexpectedly. */
    drawer.addEventListener("click", function (e) {
      var input = e.target.closest && e.target.closest("input.apex-item-datepicker");
      if (!input) return;
      var group = input.closest(".apex-item-group--datepicker") || input.parentElement;
      var trigger = group && group.querySelector(".ui-datepicker-trigger,.a-Button--calendar");
      if (trigger) trigger.click();
    });
    /* Older register filters can use the UC Date Range Picker rather than
       native APEX date items. It is icon-only, so clicking the displayed
       range invokes its already-bound adjacent calendar button. */
    drawer.addEventListener("click", function (e) {
      var input = e.target.closest && e.target.closest("input[id$='_DATE_RANGE'],input[id$='_DATERANGE']");
      if (!input) return;
      var button = input.nextElementSibling;
      if (!button || button.tagName !== "BUTTON" || button.disabled || button.classList.contains("disabled")) return;
      button.click();
    });
    drawer.addEventListener("change", function () { refreshBadge(drawer, trigger); });
    doc.addEventListener("keydown", function (e) { if (e.key === "Escape" && isOpen()) close(); });

    refreshBadge(drawer, trigger);
    if (window.apex && apex.jQuery) {
      apex.jQuery(document).on("apexafterrefresh", function () {
        refreshBadge(drawer, trigger);
        /* Run after the refresh action chain so a later legacy "collapse
           filter" Dynamic Action cannot win when the user has already
           reopened the drawer. */
        setTimeout(function () { if (isOpen()) restoreDrawerContent(); }, 0);
      });
    }
  }

  /* This application file is emitted at the end of BODY, so register markup
     already exists even while document.readyState is still "loading".  Build
     the final title/filter shell in this parser task; waiting for
     DOMContentLoaded exposed the native Filter region and empty title band for
     the first 0.2-2 seconds on every register.  Keep one DOM-ready retry only
     for genuinely late APEX regions. */
  init();
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", init, { once: true });
  /* Some transaction pages (for example Sales Order) render their form
     regions after DOMContentLoaded.  The compact CSS is deliberately scoped
     behind .hspl-compact-form, so make the same safe DOM-based decision again
     after APEX completes its page lifecycle.  This is idempotent and avoids
     page-by-page IDs or broad selectors that would affect registers/drawers. */
  /* One post-APEX pass covers late-rendered form regions without repeatedly
     scanning the full document during page startup. */
  doc.addEventListener("apexreadyend", markCompactFormPage, { once: true });
  /* The nav tree can hydrate after init; re-run icon injection a few times and
     after APEX signals ready. Each pass skips rows already done. */
  if (window.apex && apex.jQuery) apex.jQuery(window).one("apexready", injectNavIcons);
})();


/* ============================================================================
   Shared transaction-form shell (Material In reference, page 69 excluded)

   The completed Material In page has three useful chrome behaviours that were
   previously page-specific: its real action buttons live in the hero, the
   form has a compact completion assistant, and the assistant follows the
   reader without covering controls.  This adapter applies those behaviours to
   other tabbed APEX forms by moving the ORIGINAL action region and by reading
   existing APEX required metadata. It creates no page items, submits nothing,
   and never changes a page's grid, dynamic action, validation or process.
   ============================================================================ */
(function () {
  "use strict";
  var doc = document;
  var ASSISTANT_ID = "hspl-form-assistant";

  function eligible() {
    return doc.documentElement.classList.contains("hspl-compact-form") &&
      !doc.documentElement.classList.contains("page-69");
  }
  function clean(text) {
    return String(text || "").replace(/\s+/g, " ").replace(/^[*•\s]+/, "").trim();
  }
  function itemName(container) {
    return (container && container.id || "").replace(/_CONTAINER$/, "");
  }
  function labelFor(container) {
    var label = container && container.querySelector(".t-Form-label,label");
    return clean((label && label.textContent) || itemName(container) || "Required field");
  }
  function isRequired(container) {
    if (!container) return false;
    if (container.classList.contains("is-required")) return true;
    if (container.querySelector(".t-Form-labelRequired,[required],[aria-required='true']")) return true;
    var label = container.querySelector(".t-Form-label,label");
    return !!(label && /(^|\s)\*/.test(label.textContent || ""));
  }
  function valueFor(container) {
    var name = itemName(container), value;
    try {
      if (name && window.apex && apex.item) value = apex.item(name).getValue();
    } catch (ignore) {}
    if (value == null || value === "") {
      var control = container.querySelector("input:not([type='hidden']),select,textarea,[role='combobox'] input");
      if (control) {
        if ((control.type === "checkbox" || control.type === "radio") && !control.checked) value = "";
        else value = control.value;
      }
    }
    if (Array.isArray(value)) return value.some(function (part) { return String(part || "").trim(); });
    return String(value == null ? "" : value).trim();
  }
  function activeScope(shell) {
    var active = shell && shell.querySelector(".t-Tabs-link[aria-selected='true']");
    var id = active && String(active.getAttribute("href") || "").replace(/^#/, "");
    return (id && doc.getElementById(id)) || shell;
  }
  /* Form pages were built over several APEX generations. Material In calls
     its tabs "tabcontainer" while Purchase Enquiry calls the exact same APEX
     Tabs Region "new". Use the rendered Tabs Region structure, never a
     page-specific static id, so the shared Material-In shell reaches both. */
  function tabsShell() {
    var shell = doc.getElementById("tabcontainer");
    if (!shell) {
      shell = Array.prototype.filter.call(doc.querySelectorAll(".t-TabsRegion"), function (candidate) {
        return candidate.querySelector(":scope > .t-TabsRegion-items > .t-Tabs, .t-Tabs") &&
          candidate.querySelector(":scope > .t-TabsRegion-items > .a-Tabs-panel, .a-Tabs-panel");
      })[0] || null;
    }
    if (shell) shell.classList.add("hspl-form-tabs");
    return shell;
  }
  function requiredFields(scope) {
    var seen = {}, fields = [];
    if (!scope) return fields;
    Array.prototype.forEach.call(scope.querySelectorAll(".t-Form-fieldContainer"), function (container) {
      var key = itemName(container);
      if (!isRequired(container) || !key || seen[key]) return;
      seen[key] = true;
      fields.push({ container: container, key: key, label: labelFor(container) });
    });
    return fields;
  }
  function actionRegion(hero) {
    /* Every legacy transaction form exposes its real header actions through
       the conventional static id. Older exports discard that static id at
       render time, leaving the button region in the header outside main; use
       that equally constrained fallback, never an arbitrary in-form region. */
    var region = doc.getElementById("buttons");
    if (!region) {
      Array.prototype.some.call(doc.querySelectorAll(".t-ButtonRegion"), function (candidate) {
        if (candidate.closest(".t-Body-main,.t-Body-content")) return false;
        if (!candidate.querySelector(".t-Button,button")) return false;
        region = candidate;
        return true;
      });
    }
    if (!region || !region.querySelector(".t-Button,button")) return;
    var holder = hero.querySelector(".hspl-form-hero-actions");
    if (!holder) {
      holder = doc.createElement("div");
      holder.className = "hspl-form-hero-actions";
      hero.appendChild(holder);
    }
    if (!holder.contains(region)) holder.appendChild(region);
    /* Only the authored #buttons region belongs in the form header.  Legacy
       inline-dialog regions also expose Back buttons; pulling those nodes into
       the hero produced the three duplicate arrows seen on GRN and other
       forms.  Leave each dialog button in its own original region so its
       associated dialog behaviour remains available when that dialog opens. */
    /* Match the reference action hierarchy: only an explicit Add/New action
       is filled. Save, Cancel and Back remain quiet outlined actions even if
       a legacy page marked every header button as "hot". */
    Array.prototype.forEach.call(holder.querySelectorAll(".t-Button,button"), function (button) {
      /* Older pages sometimes expose the visible caption outside
         .t-Button-label, but their accessible name is always present.  Use
         that first so the action treatment cannot produce a text-only Back
         button or an empty outline. */
      var label = clean(button.getAttribute("aria-label") || button.getAttribute("title") ||
        (button.querySelector(".t-Button-label") || button).textContent || "");
      if (/^(?:\\)?f060$/i.test(label)) {
        button.setAttribute("aria-label", "Back");
        label = "Back";
      }
      button.classList.toggle("hspl-form-primary-action", /^(add new|new|add)$/i.test(label));
      button.classList.toggle("hspl-form-action-back", /^(back|cancel)$/i.test(label));
      button.classList.toggle("hspl-form-action-save", /^(save|create)$/i.test(label));
      button.classList.toggle("hspl-form-action-add", /^(add new|new|add)$/i.test(label));
      button.classList.toggle("hspl-form-action-iconless", /^(back|cancel)$/i.test(label) && !button.querySelector(".t-Icon"));
      /* Inline-dialog close controls are merged by APEX into the same button
         region as the true header actions. They have a visible Back caption
         but no authored accessible name/title, unlike the real Cancel action.
         Mark only those legacy controls for visual suppression; their DOM,
         event handlers and dialog lifecycle remain unchanged. */
      button.classList.toggle("hspl-form-dialog-back", /^back$/i.test(label) &&
        !button.getAttribute("aria-label") && !button.getAttribute("title"));
    });
  }
  function normalizeLegacyBackGlyph(hero) {
    /* Some APEX exports inject this button after the standard action region,
       and expose its Font Awesome source token rather than icon markup. Keep
       the original node/handler, replacing only that erroneous visible token. */
    Array.prototype.forEach.call(hero.querySelectorAll(".t-Button,button"), function (button) {
      var fingerprint = [button.getAttribute("aria-label"), button.getAttribute("title"), button.textContent].join(" ");
      if (!/f060/i.test(fingerprint)) return;
      button.setAttribute("aria-label", "Back");
      button.classList.add("hspl-form-action-back", "hspl-form-action-iconless");
      var caption = button.querySelector(".t-Button-label");
      if (caption) caption.textContent = "";
      else button.textContent = "";
    });
  }
  function compactCcInvoiceCards() {
    /* Page 175's General tab has two independent business columns. Native
       APEX grid rows use the height of their tallest neighbour, which left a
       large artificial void under General and GST Nature. Retain every APEX
       region and item in place; only lift the existing left-column wrappers
       to the end of the preceding left card. This preserves LOVs, validation,
       dynamic actions and the server-defined tab/order. */
    if (!doc.documentElement.classList.contains("page-175")) return;
    var general = doc.getElementById("General");
    if (!general) return;
    var ids = ["P175_LOCATIONCODE", "P175_CURRENCYUNITCODE", "P175_VOUCHERNO"];
    function cardForItem(id) {
      var item = doc.getElementById(id);
      if (!item) return null;
      /* The outer General form is also a .t-Region. Walk upward until the
         first *titled child region* rather than stopping at that container;
         otherwise all three items resolve to the same wrapper and no lift is
         possible. */
      var region = item.closest && item.closest(".t-Region");
      while (region && region !== general) {
        if (region.querySelector(":scope > .t-Region-header")) {
          return region.closest(".col") || region;
        }
        region = region.parentElement && region.parentElement.closest(".t-Region");
      }
      return null;
    }
    var cards = ids.map(cardForItem);
    var main = cards[0], gst = cards[1], amount = cards[2];
    if (!main || !gst || !amount || main === gst || gst === amount) return;
    var targets = [gst, amount];
    function reset() {
      targets.forEach(function (card) {
        if (card.dataset.hsplCcInvoiceMargin != null) {
          card.style.marginTop = card.dataset.hsplCcInvoiceMargin;
          delete card.dataset.hsplCcInvoiceMargin;
        }
      });
      delete general.dataset.hsplCcInvoiceCompacted;
    }
    if (window.innerWidth < 1024) {
      reset();
      return;
    }
    if (general.dataset.hsplCcInvoiceCompacted === "true") return;
    targets.forEach(function (card) {
      card.dataset.hsplCcInvoiceMargin = card.style.marginTop || "";
      card.style.marginTop = "";
    });
    requestAnimationFrame(function () {
      var gap = 12;
      function liftAfter(card, previous) {
        var desiredTop = previous.getBoundingClientRect().bottom + gap;
        var excess = card.getBoundingClientRect().top - desiredTop;
        if (excess > 18) card.style.marginTop = "-" + Math.round(excess) + "px";
      }
      liftAfter(gst, main);
      requestAnimationFrame(function () {
        liftAfter(amount, gst);
        general.dataset.hsplCcInvoiceCompacted = "true";
      });
    });
  }
  function ensureAssistant(shell, hero) {
    /* Older master forms use the same tabbed form shell but have no decorative
       hero. The assistant belongs to the form shell, so do not manufacture
       new page chrome just to make it available. */
    if (!shell || doc.getElementById(ASSISTANT_ID)) return null;
    var panelHost = shell.querySelector(".t-TabsRegion-items");
    if (!panelHost) return null; /* no tab-panel grid to place beside safely */
    var assistant = doc.createElement("aside");
    assistant.id = ASSISTANT_ID;
    assistant.className = "hspl-form-assistant";
    assistant.setAttribute("aria-label", "Document Assistant");
    assistant.innerHTML =
      '<div class="hspl-form-assistant-head"><span class="fa fa-file-text-o" aria-hidden="true"></span>' +
      '<strong>Document Assistant</strong><button type="button" aria-expanded="true" aria-label="Collapse Document Assistant">&#8250;</button></div>' +
      '<div class="hspl-form-assistant-body"><div class="hspl-form-assistant-status">' +
      '<span>Status <b>Draft</b></span><span>Completion <b class="hspl-form-assistant-percent">0%</b><i><em></em></i></span></div>' +
      '<div class="hspl-form-assistant-note"><span class="fa fa-info-circle" aria-hidden="true"></span><b class="hspl-form-assistant-missing">0 required fields are missing</b></div>' +
      '<section class="hspl-form-assistant-required"><h3><span class="fa fa-asterisk" aria-hidden="true"></span> Required Fields <b>0/0</b></h3><div></div></section></div>';
    panelHost.appendChild(assistant);
    assistant.querySelector("button").addEventListener("click", function () {
      var collapsed = assistant.classList.toggle("is-collapsed");
      this.setAttribute("aria-expanded", String(!collapsed));
      this.setAttribute("aria-label", collapsed ? "Expand Document Assistant" : "Collapse Document Assistant");
      /* Keep the assistant and its parent canvas in one atomic state.  The
         previous delayed observer could leave the form in a two-column grid
         after the rail had closed, which looked like the page had retained
         the assistant width. */
      panelHost.classList.toggle("hspl-detail-assistant-collapsed", collapsed);
      delete assistant.dataset.hsplAutoCollapsed;
      requestAnimationFrame(function () {
        window.dispatchEvent(new Event("resize"));
        if (window.apex && apex.jQuery) apex.jQuery(window).trigger("apexwindowresized");
      });
    });
    if (hero) syncAssistantTop(hero);
    return assistant;
  }
  function syncAssistantTop(hero) {
    if (!hero) return;
    var top = parseFloat(window.getComputedStyle(hero).top) || 0;
    doc.documentElement.style.setProperty("--hspl-form-assistant-top", Math.ceil(top + hero.getBoundingClientRect().height + 10) + "px");
  }
  function updateFormStepNotice(shell, fields, done) {
    /* Page 118 uses the same contextual completion strip as Material In. It
       reports only APEX's real required metadata; it never invents a business
       validation rule for an Interactive Grid or optional tab. */
    /* Material In and Purchase Order already own finished implementations.
       All remaining forms receive the same completion strip via this one
       shared component, based only on their actual APEX required metadata. */
    if (doc.documentElement.classList.contains("page-69") || doc.body.classList.contains("hspl-po-reference")) return;
    var scope = activeScope(shell);
    /* APEX may paint the shell just before its active panel exists. Do not
       fall back to the shell itself: that put a duplicate notice above the
       tabs and created a large, empty-looking gap below the hero. */
    if (!scope || scope === shell) return;
    var stray = shell.querySelector(":scope > .hspl-form-step-message");
    if (stray) stray.remove();
    var notice = scope.querySelector(":scope > .hspl-form-step-message");
    if (!notice) {
      notice = doc.createElement("div");
      notice.className = "hspl-form-step-message";
      notice.setAttribute("role", "status");
      scope.insertBefore(notice, scope.firstChild);
    }
    var total = fields.length, missing = total - done;
    if (!total) {
      notice.classList.add("is-empty");
      notice.innerHTML = '<span class="fa fa-info-circle" aria-hidden="true"></span><span>No required fields are configured for this step.</span>';
      return;
    }
    var percent = Math.round(done * 100 / total);
    notice.classList.remove("is-empty");
    notice.innerHTML = '<span class="fa fa-info-circle" aria-hidden="true"></span><span>Complete <b>' + missing + '</b> required field' + (missing === 1 ? '' : 's') + ' before creating</span><span class="hspl-form-step-progress"><b>' + percent + '%</b><small>Complete</small><i><em style="width:' + percent + '%"></em></i></span>';
  }
  function updateAssistant(shell) {
    var assistant = doc.getElementById(ASSISTANT_ID);
    if (!assistant || !shell) return;
    var activeTab = shell.querySelector(".t-Tabs-link[aria-selected='true']");
    var firstTab = shell.querySelector(".t-Tabs-link");
    /* The document summary belongs to the primary document tab only. Detail
       tabs need their full working width for grids, and must not inherit a
       summary for a different document step. Keep the same assistant node so
       its explicit collapsed/expanded choice is preserved on return. */
    var showAssistant = !activeTab || activeTab === firstTab;
    assistant.hidden = !showAssistant;
    assistant.setAttribute("aria-hidden", String(!showAssistant));
    var assistantHost = assistant.parentElement;
    if (assistantHost) assistantHost.classList.toggle("hspl-form-assistant-tab-hidden", !showAssistant);

    var fields = requiredFields(activeScope(shell));
    var done = fields.filter(function (field) { return !!valueFor(field.container); }).length;
    var total = fields.length, missing = total - done;
    var percent = total ? Math.round(done * 100 / total) : 100;
    updateFormStepNotice(shell, fields, done);
    if (!showAssistant) return;
    assistant.querySelector(".hspl-form-assistant-percent").textContent = percent + "%";
    assistant.querySelector(".hspl-form-assistant-status i em").style.width = percent + "%";
    assistant.querySelector(".hspl-form-assistant-missing").textContent = total ?
      (missing + " required field" + (missing === 1 ? " is" : "s are") + " missing") : "No required fields on this step";
    assistant.querySelector(".hspl-form-assistant-required h3 b").textContent = done + "/" + total;
    assistant.querySelector(".hspl-form-assistant-required > div").innerHTML = fields.map(function (field) {
      var complete = !!valueFor(field.container);
      return '<div class="hspl-form-assistant-row' + (complete ? ' is-complete' : '') + '"><span>' + (complete ? '&#10003;' : '') + '</span><b>' + field.label.replace(/</g, '&lt;') + '</b><small>' + (complete ? 'Completed' : 'Required') + '</small></div>';
    }).join('');
  }
  function tidyFreightAdviceDetail() {
    if (!doc.documentElement.classList.contains("page-199")) return;
    /* Freight Advice's historical Master region contains only hidden technical
       items. It is not an account section, so never expose its empty, dark
       collapsible heading in the Detail tab. */
    Array.prototype.forEach.call(doc.querySelectorAll(".t-Region-titleButton"), function (titleButton) {
      if (clean(titleButton.textContent) !== "Master") return;
      var region = titleButton.closest(".t-Region");
      var body = region && region.querySelector(":scope > .t-Region-bodyWrap .t-Region-body");
      if (!region || !body) return;
      var visibleControl = body.querySelector("input:not([type='hidden']),select,textarea,button,a");
      if (!visibleControl && !clean(body.textContent)) region.classList.add("hspl-empty-technical-region");
    });
    /* Amount Summary is a real business card. Mark it independently from the
       empty technical region so CSS can give its labels/values the same quiet,
       stacked form treatment as the reference form without touching its items. */
    var amount = doc.getElementById("P199_SUMOFAMOUNT");
    var amountRegion = amount && amount.closest(".t-Region");
    if (amountRegion) amountRegion.classList.add("hspl-freight-amount-summary");
  }
  function boot() {
    if (!eligible()) return;
    var hero = doc.querySelector(".t-Body-title.hspl-hero-card");
    var shell = tabsShell();
    if (hero && !doc.body.classList.contains("hspl-po-reference")) normalizeLegacyBackGlyph(hero);
    if (hero) actionRegion(hero);
    compactCcInvoiceCards();
    tidyFreightAdviceDetail();
    /* #buttons can be authored in beforeNavigationBar on a compact master
       form without tabs.  Move its original DOM into the hero before the
       tab-only assistant work, otherwise Back/Save remain in app navigation. */
    if (!shell) return;
    ensureAssistant(shell, hero);
    updateAssistant(shell);
    if (hero) syncAssistantTop(hero);
  }
  function scheduleBoot() { [0, 180, 700, 1400].forEach(function (delay) { setTimeout(boot, delay); }); }
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", scheduleBoot);
  else scheduleBoot();
  doc.addEventListener("input", function () { var shell = tabsShell(); if (shell) updateAssistant(shell); }, true);
  doc.addEventListener("change", function () { var shell = tabsShell(); if (shell) updateAssistant(shell); }, true);
  doc.addEventListener("click", function (event) {
    if (event.target.closest && event.target.closest(".hspl-form-tabs .t-Tabs-link")) setTimeout(function () { updateAssistant(tabsShell()); }, 0);
  }, true);
  window.addEventListener("resize", function () {
    syncAssistantTop(doc.querySelector(".t-Body-title.hspl-hero-card"));
    var general = doc.getElementById("General");
    if (general) delete general.dataset.hsplCcInvoiceCompacted;
    compactCcInvoiceCards();
  }, { passive: true });
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplFormShell", scheduleBoot);
})();


/* ============================================================================
   Detail-grid horizontal tracks

   APEX sometimes hides its native .a-GV-w-scroll element for an empty editable
   grid even when the rendered columns are wider than the grid viewport. Mark
   only actual overflow, so a horizontal track is available on wide Detail/Job
   grids but never appears as a dummy bar on compact grids.
   ============================================================================ */
(function () {
  "use strict";
  var doc = document;
  function visible(element) {
    return !!(element && (element.offsetWidth || element.offsetHeight || element.getClientRects().length));
  }
  function isDetailGrid(grid) {
    /* The first tab is the document header/master form. Every later APEX tab
       is a detail workspace (Detail, Job, Items, etc.). Those workspaces must
       retain a horizontal navigation track even while the grid is empty,
       because APEX otherwise hides the track before real row widths exist. */
    var panel = grid.closest(".a-Tabs-panel");
    var shell = panel && panel.closest(".t-TabsRegion");
    if (!panel || !shell) return false;
    var panels = Array.prototype.filter.call(shell.querySelectorAll(".a-Tabs-panel"), function (candidate) {
      return candidate.closest(".t-TabsRegion") === shell;
    });
    return panels.indexOf(panel) > 0;
  }
  function syncGrid(grid) {
    /* APEX redraws the inner .a-GV view while switching detail tabs. Keep the
       state on its stable Interactive Grid host as well, otherwise APEX can
       discard the class after measurement without changing the actual width. */
    var host = grid.closest(".a-IG") || grid;
    var detailGrid = isDetailGrid(grid);
    grid.classList.toggle("hspl-detail-grid", detailGrid);
    if (host !== grid) host.classList.toggle("hspl-detail-grid", detailGrid);
    if (!visible(grid)) {
      grid.classList.remove("hspl-grid-has-horizontal-overflow");
      if (host !== grid) host.classList.remove("hspl-grid-has-horizontal-overflow");
      return;
    }
    var body = grid.querySelector(".a-GV-bdy");
    var table = grid.querySelector(".a-GV-w-scroll .a-GV-table") || grid.querySelector(".a-GV-table");
    if (!body || !table || !body.clientWidth) return;
    /* Real overflow remains measurement-driven. Detail tabs additionally keep
       the native track available while empty, instead of waiting for rows to
       make APEX's placeholder table wider than its viewport. */
    var hasOverflow = detailGrid || table.scrollWidth > body.clientWidth + 1;
    grid.classList.toggle("hspl-grid-has-horizontal-overflow", hasOverflow);
    if (host !== grid) host.classList.toggle("hspl-grid-has-horizontal-overflow", hasOverflow);
  }
  function syncAll() {
    Array.prototype.forEach.call(doc.querySelectorAll(".a-GV"), syncGrid);
  }
  function schedule() { [0, 160, 700, 1400].forEach(function (delay) { setTimeout(syncAll, delay); }); }
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule);
  else schedule();
  doc.addEventListener("click", function (event) {
    if (event.target.closest && event.target.closest(".t-Tabs-link")) schedule();
  }, true);
  window.addEventListener("resize", schedule, { passive: true });
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplGridTracks", schedule);
  /* APEX reveals a tab panel after it changes aria-selected. In that final
     layout pass, an initially hidden table obtains its real scroll width.
     Observe only those layout attributes and debounce the re-measurement; the
     class itself settles after one pass and cannot manufacture a track. */
  if (window.MutationObserver && doc.documentElement) {
    var pending = false;
    new MutationObserver(function (records) {
      if (pending || !records.some(function (record) {
        return record.type === "childList" ||
          (record.target && record.target.closest && record.target.closest(".a-GV,.t-TabsRegion"));
      })) return;
      pending = true;
      setTimeout(function () { pending = false; schedule(); }, 0);
    }).observe(doc.documentElement, {
      subtree: true,
      childList: true,
      attributes: true,
      attributeFilter: ["class", "style", "aria-selected", "aria-hidden"]
    });
  }
})();


/* ============================================================================
   Shared modal close contract

   Business modals opened by page buttons get one consistent Back affordance,
   and Escape invokes the same native dialog close path. Popup LOVs, menus,
   date pickers, report/grid settings and filter drawers keep their specialised
   keyboard behaviour and are deliberately excluded.
   ============================================================================ */
(function () {
  "use strict";
  var doc = document;
  var BACK_ICON = '<span aria-hidden="true">&#8592;</span><span class="hspl-dialog-back-label">Back</span>';

  function visible(element) {
    if (!element || !element.isConnected) return false;
    var style = window.getComputedStyle(element);
    return style.display !== "none" && style.visibility !== "hidden" &&
      !!(element.offsetWidth || element.offsetHeight || element.getClientRects().length);
  }
  function excluded(dialog) {
    var content = Array.prototype.filter.call(dialog.children, function (child) {
      return child.classList && child.classList.contains("ui-dialog-content");
    })[0];
    return dialog.classList.contains("ui-dialog--drawer") ||
      dialog.classList.contains("ui-dialog-popuplov") ||
      dialog.matches(".a-IG-dialog,.a-IRR-dialog,.a-Toolbar-menu,[role=alertdialog]") ||
      !!(content && content.matches(".js-filter-drawer,.hspl-drawer,.a-PopupLOV,.a-IG-dialog,.a-IRR-dialog"));
  }
  function businessModal(dialog) {
    if (!dialog || excluded(dialog)) return false;
    return dialog.classList.contains("ui-dialog--apex") ||
      !!dialog.querySelector("iframe,.t-DialogRegion,.js-regionDialog");
  }
  function activeModal() {
    var dialogs = doc.querySelectorAll(".ui-dialog,.a-Dialog");
    for (var index = dialogs.length - 1; index >= 0; index--) {
      if (visible(dialogs[index]) && businessModal(dialogs[index])) return dialogs[index];
    }
    return null;
  }
  function closeModal(dialog) {
    if (!dialog) return;
    var nativeClose = dialog.querySelector(".ui-dialog-titlebar-close,.a-Dialog-close");
    if (visible(nativeClose)) {
      nativeClose.click();
      return;
    }
    var content = dialog.querySelector(".ui-dialog-content");
    if (content && window.apex && apex.jQuery) {
      try {
        apex.jQuery(content).dialog("close");
        return;
      } catch (ignore) { /* fall through to the owning page API */ }
    }
    try {
      if (window.apex && apex.navigation && apex.navigation.dialog &&
          typeof apex.navigation.dialog.close === "function") {
        apex.navigation.dialog.close(true);
      }
    } catch (ignore) { /* no safe native close path is available */ }
  }
  function ensureBack(dialog) {
    if (!businessModal(dialog) || dialog.querySelector(".hspl-dialog-back")) return;
    var existingBack = Array.prototype.some.call(dialog.querySelectorAll("button,a.t-Button"), function (button) {
      var label = String(button.getAttribute("aria-label") || button.getAttribute("title") || button.textContent || "")
        .replace(/\s+/g, " ").trim();
      return /^back$/i.test(label) && visible(button);
    });
    if (existingBack) return;
    var titlebar = dialog.querySelector(".ui-dialog-titlebar,.a-Dialog-header");
    if (!titlebar) return;
    var button = doc.createElement("button");
    button.type = "button";
    button.className = "t-Button t-Button--icon hspl-dialog-back";
    button.setAttribute("aria-label", "Back");
    button.setAttribute("title", "Back");
    button.innerHTML = BACK_ICON;
    button.addEventListener("click", function () { closeModal(dialog); });
    titlebar.insertBefore(button, titlebar.firstChild);
  }
  function decorate() {
    Array.prototype.forEach.call(doc.querySelectorAll(".ui-dialog,.a-Dialog"), ensureBack);
  }
  function schedule() { [0, 80, 260].forEach(function (delay) { setTimeout(decorate, delay); }); }
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule);
  else schedule();
  if (window.MutationObserver) {
    var decoratePending = false;
    new MutationObserver(function () {
      if (decoratePending) return;
      decoratePending = true;
      setTimeout(function () {
        decoratePending = false;
        decorate();
      }, 30);
    }).observe(doc.documentElement, { childList:true, subtree:true, attributes:true, attributeFilter:["class","style","aria-hidden"] });
  }
  doc.addEventListener("keydown", function (event) {
    if (event.defaultPrevented || event.isComposing || event.key !== "Escape") return;
    var dialog = activeModal();
    if (!dialog) {
      /* A modal Dialog Page receives keyboard events inside its iframe, while
         the visible .ui-dialog wrapper lives in the parent document. */
      if (window.parent !== window && doc.body && /(?:^|\s)t-DialogPage(?:\s|$)/.test(doc.body.className || "")) {
        try {
          if (window.apex && apex.navigation && apex.navigation.dialog &&
              typeof apex.navigation.dialog.close === "function") {
            event.preventDefault();
            event.stopImmediatePropagation();
            apex.navigation.dialog.close(true);
          }
        } catch (ignore) {}
      }
      return;
    }
    event.preventDefault();
    event.stopImmediatePropagation();
    closeModal(dialog);
  }, true);
})();


/* Purchase Bill Pass has two author-time rows of three form-section cards.
   Keep the original card nodes, their field order and all APEX bindings, but
   present those six sections in two compact, independently stacked columns.
   This is deliberately Page-152-only; no other form receives this treatment. */
(function () {
  "use strict";
  var doc = document;
  var titles = [
    "Select Purchase Bill No And Pass On", "Currency", "Nature and Transaction",
    "Other Details", "TDS Detail", "Account Posting Detail"
  ];
  function sectionForTitle(title) {
    var headings = doc.querySelectorAll("#SR_General .t-Region-title,#SR_General .t-Region-titleButton");
    for (var index = 0; index < headings.length; index++) {
      if (String(headings[index].textContent || "").replace(/\s+/g, " ").trim() === title) {
        return headings[index].closest(".t-Region");
      }
    }
    return null;
  }
  function arrange() {
    if (!doc.documentElement.classList.contains("page-152")) return;
    if (window.innerWidth < 768) return;
    var slots = titles.map(function (title) {
      var section = sectionForTitle(title);
      return section && section.parentElement;
    });
    if (slots.some(function (slot) { return !slot || !slot.classList.contains("col"); })) return;
    var firstRow = slots[0].parentElement;
    var secondRow = slots[3].parentElement;
    var container = firstRow && firstRow.parentElement;
    if (!container || !container.classList.contains("container")) return;
    var grid = container.querySelector(":scope > .hspl-pbpass-section-grid");
    if (!grid) {
      grid = doc.createElement("div");
      grid.className = "hspl-pbpass-section-grid";
      container.insertBefore(grid, firstRow);
    }
    var columns = ["left", "right"].map(function (side) {
      var column = grid.querySelector(":scope > .hspl-pbpass-section-column--" + side);
      if (!column) {
        column = doc.createElement("div");
        column.className = "hspl-pbpass-section-column hspl-pbpass-section-column--" + side;
        grid.appendChild(column);
      }
      return column;
    });
    /* Alternating source slots keeps each visual row to two cards while each
       column packs upward independently: 1/3/5 on the left, 2/4/6 on right. */
    slots.forEach(function (slot, index) { columns[index % 2].appendChild(slot); });
    /* Both original rows now contain only moved card slots. Hide their empty
       layout wrappers rather than deleting them, preserving APEX's structure. */
    [firstRow, secondRow].forEach(function (row) {
      if (row && row !== grid) row.classList.add("hspl-pbpass-card-source-row");
    });
  }
  function schedule() { [0, 250, 900].forEach(function (delay) { setTimeout(arrange, delay); }); }
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule);
  else schedule();
  window.addEventListener("resize", schedule, { passive:true });
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplPbPassSections", schedule);
})();


/* ============================================================================
   Semantic form layout (Material In's space discipline, page 69 excluded)

   The old transaction pages use a server-side two-column grid for almost
   every item.  That leaves a date beside a document number, then a large
   empty half-row, even when three compact business fields belong together.
   Material In instead lets the *meaning* of each field decide its space.

   This adapter changes only the rendered grid cells: the original APEX item,
   validation, LOV, Dynamic Action and DOM order all remain in place.  It is
   intentionally conservative: a region is opted in only when its direct
   grid consists exclusively of one form item per standard APEX cell.  Complex
   plug-ins, reports and nested regions retain their native layout.
   ============================================================================ */
(function () {
  "use strict";
  var doc = document;
  function eligible() {
    /* This shared adapter accepts only simple APEX field grids. Material In,
       Purchase Order and Purchase Bill Pass keep their deliberate, dedicated
       layouts; every other eligible form inherits these same rules. */
    return doc.documentElement.classList.contains("hspl-compact-form") &&
      !doc.documentElement.classList.contains("page-69") &&
      !doc.documentElement.classList.contains("page-118") &&
      !doc.documentElement.classList.contains("page-152");
  }
  function clean(text) {
    return String(text || "").replace(/\s+/g, " ").replace(/^[*•\s]+/, "").trim().toLowerCase();
  }
  function fieldLabel(container) {
    var label = container.querySelector(".t-Form-label,label");
    return clean((label && label.textContent) || container.id.replace(/^P\d+_/, "").replace(/_CONTAINER$/, "").replace(/_/g, " "));
  }
  function kindFor(container) {
    var label = fieldLabel(container);
    /* A popup LOV is a compound control (value area + trigger, and sometimes
       a second utility action). It must retain a normal Material-In-width
       track; classifying it as a small code/date field could shrink its value
       area to zero in an already narrow section card. */
    if (container.querySelector(".apex-item-group--popup-lov,.apex-item-popup-lov,.a-ComboSelect,select.apex-item-select")) return "standard";
    /* Narrative inputs deserve the whole row. They are the exact opposite of
       a code/date field and should never leave an accidental empty column. */
    if (/remark|description|address|narration|comment|note|terms|condition/.test(label) ||
        container.querySelector("textarea")) return "full";
    /* A radio group is a single decision, but its choices must not be squeezed
       into an arbitrary legacy half-column. */
    if (container.querySelector("input[type='radio']")) return "full";
    /* Document and contract numbers are business values, not small numeric
       inputs.  A label ending in "No" must never make the LOV too narrow to
       read/select. */
    if (/(rate contract|contract no|quotation|indent no|purchase order|sales order|job order|loading advice|gate pass|invoice|bill no|voucher|debit note|credit note|challan|material (?:in|out) no|party po|po receipt|delivery intimation|eway bill|reference no|lr no|irn|ack)/.test(label)) return "standard";
    /* All written text fields use two balanced cells rather than inheriting
       uneven legacy column widths. */
    if (/(text|email|website|contact detail)/.test(label)) return "wide";
    /* A genuinely short numeric/status control may use a compact cell. */
    if (/(^| )(code|id|date|status|qty|quantity|amount|rate|weight|percentage|percent|days|time|flag|vehicle|freight|currency|unit)( |$)|\b(type|category|department)\b/.test(label)) return "compact";
    return "standard";
  }
  function isSingleChoice(container) {
    return !!container.querySelector("input[type='checkbox']") &&
      !container.querySelector("input[type='text'],input[type='number'],textarea,select");
  }
  function syncRegionWidth(region) {
    if (!region.classList.contains("hspl-semantic-layout") ||
        region.classList.contains("hspl-semantic-layout--five")) return;
    /* A narrow, side-by-side card should use two usable controls per row,
       rather than squeezing document/LOV fields into four tiny columns. */
    var width = Math.round(region.getBoundingClientRect().width || 0);
    /* Around a 1,000px card is still a side-by-side form section once the
       Document Assistant and page gutters are accounted for. Two fields give
       it the same readable input width as Material In's General section. */
    region.classList.toggle("hspl-semantic-layout--two-up", width >= 460 && width <= 1020);
  }
  function directBody(region) {
    var wrap = Array.prototype.filter.call(region.children, function (child) {
      return child.classList && child.classList.contains("t-Region-bodyWrap");
    })[0];
    var body = wrap && Array.prototype.filter.call(wrap.children, function (child) {
      return child.classList && child.classList.contains("t-Region-body");
    })[0];
    if (!body) {
      body = Array.prototype.filter.call(region.children, function (child) {
        return child.classList && child.classList.contains("t-Region-body");
      })[0];
    }
    return body || null;
  }
  function regionTitle(region) {
    var title = region.querySelector(":scope > .t-Region-header .t-Region-title, :scope > .t-Region-header h1, :scope > .t-Region-header h2, :scope > .t-Region-header h3");
    return clean(title && title.textContent);
  }
  function markFullAreaSection(region) {
    /* A full-width section follows the shared three-fields-per-row contract.
       Measure against its owning tab canvas rather than relying on page IDs or
       region titles: master forms often call the section after the document
       (Location Master / Enquiry) instead of "General". Half-width cards stay
       below this threshold and retain their two-field layout. */
    var canvas = region.closest(".a-Tabs-panel") || doc.querySelector(".t-Body-main");
    var canvasWidth = canvas && canvas.getBoundingClientRect().width;
    var regionWidth = region.getBoundingClientRect().width;
    var fullArea = !!(canvasWidth && regionWidth >= canvasWidth * 0.72);
    region.classList.toggle("hspl-semantic-layout--full-area", fullArea);
    if (fullArea) {
      Array.prototype.forEach.call(region.querySelectorAll(".hspl-semantic-cell--full"), function (cell) {
        if (cell.closest(".t-Region") !== region) return;
        cell.style.setProperty("grid-column", "1 / -1", "important");
        cell.style.setProperty("width", "100%", "important");
        cell.style.setProperty("max-width", "100%", "important");
        cell.style.setProperty("flex", "0 0 100%", "important");
      });
    }
  }
  function promotePrimarySection(region, fieldCount) {
    /* The finished Material In form does not make its General fields compete
       with a side card.  Reproduce that layout principle generically: only a
       real, multi-field General section is promoted, never an arbitrary card.
       The containing APEX grid cell is found by walking outward from the
       region, so fields and their tab order are left completely intact. */
    if (fieldCount < 5 || regionTitle(region) !== "general") return;
    var slot = region.parentElement;
    while (slot && slot !== doc.body) {
      if (slot.classList && slot.classList.contains("col") &&
          slot.parentElement && slot.parentElement.classList.contains("row")) {
        region.classList.add("hspl-form-primary-section");
        slot.classList.add("hspl-form-primary-slot");
        return;
      }
      slot = slot.parentElement;
    }
  }
  function prepare(region) {
    if (region.classList.contains("hspl-semantic-layout")) {
      syncRegionWidth(region);
      markFullAreaSection(region);
      return;
    }
    var body = directBody(region);
    if (!body) return;
    var grid = Array.prototype.filter.call(body.children, function (child) {
      return child.classList && child.classList.contains("container");
    })[0];
    if (!grid) return;
    var fields = Array.prototype.filter.call(region.querySelectorAll(".t-Form-fieldContainer"), function (field) {
      return field.closest(".t-Region") === region;
    });
    if (fields.length < 2) return;
    var cells = [];
    for (var index = 0; index < fields.length; index++) {
      var cell = fields[index].closest(".col");
      var row = cell && cell.parentElement;
      /* A normal Universal Theme item lives directly in .container > .row >
         .col. Refuse to rearrange any more complex structure. */
      if (!cell || !row || !row.classList.contains("row") || row.parentElement !== grid ||
          cell.querySelectorAll(".t-Form-fieldContainer").length !== 1 ||
          cell.querySelector(".t-Region")) return;
      cells.push({ cell: cell, kind: kindFor(fields[index]), choice: isSingleChoice(fields[index]) });
    }
    if (cells.length < 2) return;
    /* Dense logistics/quantity blocks work like Material In Transportation:
       five compact controls on a row. Normal General/Reference sections keep
       their more readable mixed 12-unit proportions. */
    var compactCount = cells.filter(function (entry) { return entry.kind === "compact"; }).length;
    var denseFive = cells.length >= 8 && compactCount / cells.length >= 0.65 &&
      !fields.some(function (field) { return field.querySelector(".apex-item-group--popup-lov,.apex-item-popup-lov,.a-ComboSelect,select.apex-item-select"); }) &&
      !cells.some(function (entry) { return entry.kind === "wide" || entry.kind === "full"; });
    /* Legacy page rules occasionally define a smaller grid for a .col-12
       parent. This semantic form contract owns the accepted region, so pin
       its track count here rather than letting that old selector turn a
       three-field General section into a one-field vertical stack. */
    grid.style.setProperty("grid-template-columns", denseFive ? "repeat(5,minmax(0,1fr))" : "repeat(12,minmax(0,1fr))", "important");
    Array.prototype.forEach.call(grid.children, function (row) {
      if (row.classList && row.classList.contains("row")) row.classList.add("hspl-semantic-row");
    });
    cells.forEach(function (entry) {
      entry.cell.classList.add("hspl-semantic-cell", "hspl-semantic-cell--" + entry.kind);
      if (entry.choice) entry.cell.classList.add("hspl-semantic-cell--choice");
    });
    /* Preserve the compact checkbox itself, but let the meaningful control
       immediately after it absorb the otherwise unused end of the last row.
       This is inferred from the rendered controls, not an item/page name. */
    if (cells.length >= 2) {
      var penultimate = cells[cells.length - 2], last = cells[cells.length - 1];
      if (penultimate.choice && !last.choice && last.kind !== "full") {
        last.cell.classList.add("hspl-semantic-cell--trailing-fill");
      }
    }
    region.classList.add("hspl-semantic-layout");
    /* Mark width ownership as soon as the region is accepted.  Some legacy
       pages contain a later malformed nested card; it must not prevent an
       already-valid full-width section from receiving its three-column rule. */
    markFullAreaSection(region);
    /* A short, full-width business section is not a three-column form with a
       blank third track.  Material In uses two balanced controls for this
       exact shape (for example its Reference information).  Preserve dense
       short-code blocks in three tracks, but make up to four normal controls
       use the available canvas as two readable columns. */
    var nonCompactCount = cells.filter(function (entry) {
      return entry.kind !== "compact";
    }).length;
    if (cells.length >= 2 && cells.length <= 4 && nonCompactCount >= 2) {
      region.classList.add("hspl-semantic-layout--two-up");
    }
    promotePrimarySection(region, fields.length);
    if (denseFive) region.classList.add("hspl-semantic-layout--five");
    syncRegionWidth(region);
    markFullAreaSection(region);
  }
  function directGrid(region) {
    var body = directBody(region);
    return body && Array.prototype.filter.call(body.children, function (child) {
      return child.classList && child.classList.contains("container");
    })[0];
  }
  function ownFieldCount(region) {
    return Array.prototype.filter.call(region.querySelectorAll(".t-Form-fieldContainer"), function (field) {
      return field.closest(".t-Region") === region;
    }).length;
  }
  function sectionSlot(card, parent) {
    var slot = card.parentElement;
    while (slot && slot !== parent) {
      if (slot.classList && slot.classList.contains("col") &&
          slot.parentElement && slot.parentElement.classList.contains("row")) return slot;
      slot = slot.parentElement;
    }
    return null;
  }
  function prepareSectionCanvases() {
    /* A parent form can contain several headed cards.  Earlier code promoted
       only cards that had already passed the inner-field adapter; a perfectly
       valid native card (Currency on Purchase Order) then remained outside a
       grid whose rows had been flattened.  Build the canvas from every direct
       form card instead.  General owns the first row; all following cards are
       balanced halves in their original DOM/tab order. */
    Array.prototype.forEach.call(doc.querySelectorAll(".t-Body-main .t-Region"), function (parent) {
      if (parent.classList.contains("hspl-semantic-layout") ||
          parent.closest(".ui-dialog,.a-IRR,.a-GV,.t-IRR-region")) return;
      var grid = directGrid(parent);
      if (!grid) return;
      var entries = [];
      Array.prototype.forEach.call(grid.children, function (row) {
        if (!row.classList || !row.classList.contains("row")) return;
        Array.prototype.forEach.call(row.children, function (slot) {
          if (!slot.classList || !slot.classList.contains("col")) return;
          var card = Array.prototype.filter.call(slot.querySelectorAll(".t-Region"), function (candidate) {
            return candidate.parentElement && candidate.parentElement.closest(".t-Region") === parent;
          })[0];
          if (!card || ownFieldCount(card) < 1) return;
          entries.push({ card: card, slot: slot });
        });
      });
      if (entries.length < 2) return;
      grid.classList.add("hspl-section-canvas");
      Array.prototype.forEach.call(grid.children, function (row) {
        if (row.classList && row.classList.contains("row")) row.classList.add("hspl-section-canvas-row");
      });
      entries.forEach(function (entry) {
        entry.slot.classList.add("hspl-section-slot");
        var count = ownFieldCount(entry.card);
        if (regionTitle(entry.card) === "general" && count >= 5) {
          entry.slot.classList.add("hspl-section-slot--primary", "hspl-form-primary-slot");
          entry.card.classList.add("hspl-form-primary-section");
        /* A dense business section must claim a full canvas row before its
           controls are reflowed. Keeping six-plus fields inside a half card
           was the cause of the clustered Transporting Info controls. */
        } else if (count >= 6) {
          entry.slot.classList.add("hspl-section-slot--wide");
        } else {
          entry.slot.classList.add("hspl-section-slot--half");
        }
      });
      /* Compact a common legacy-grid waste pattern without naming any page or
         section: a short card at left, a much taller multi-field card at
         right, and another short card next.  Let the tall card span the next
         grid track; the following card then occupies the usable space directly
         below the short card instead of waiting below an empty half-row. */
      for (var index = 0; index < entries.length - 2; index++) {
        var leftCount = ownFieldCount(entries[index].card);
        var rightCount = ownFieldCount(entries[index + 1].card);
        var nextCount = ownFieldCount(entries[index + 2].card);
        if (leftCount <= 2 && rightCount >= 5 && nextCount <= 2 &&
            !entries[index].slot.classList.contains("hspl-section-slot--primary") &&
            !entries[index + 1].slot.classList.contains("hspl-section-slot--primary")) {
          entries[index + 1].slot.classList.add("hspl-section-slot--tall");
          entries[index + 2].slot.classList.add("hspl-section-slot--after-tall");
          index += 2;
        }
      }
    });
  }
  function apply() {
    if (!eligible()) return;
    Array.prototype.forEach.call(doc.querySelectorAll(".t-Body-main .t-Region"), function (region) {
      if (region.classList.contains("hspl-drawer") || region.classList.contains("js-filter-drawer") ||
          region.closest(".ui-dialog,.a-IRR,.a-GV,.t-IRR-region")) return;
      /* One malformed legacy region must not cancel layout normalization for
         every valid region that follows it on the page. */
      try { prepare(region); } catch (error) {
        if (window.console && console.warn) console.warn("HSPL semantic layout skipped a region", region.id || region, error);
      }
    });
  }
  function schedule() { [0, 180, 700, 1400].forEach(function (delay) { setTimeout(apply, delay); }); }
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule);
  else schedule();
  doc.addEventListener("click", function (event) {
    if (event.target.closest && event.target.closest("#tabcontainer .t-Tabs-link")) {
      setTimeout(apply, 0);
    }
  }, true);
  var resizeTimer;
  window.addEventListener("resize", function () {
    window.clearTimeout(resizeTimer);
    resizeTimer = window.setTimeout(apply, 120);
  });
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplSemanticLayout", schedule);
})();

/* Shared form section canvas: cards use compact independent two-card columns,
   while standalone/General sections own the full row. */
(function () {
  "use strict";
  var doc = document;
  function pageIsException() {
    var html = doc.documentElement;
    return html.classList.contains("page-69") || html.classList.contains("page-118") || html.classList.contains("page-152");
  }
  function directBody(region) {
    var wrap = Array.prototype.filter.call(region.children, function (child) { return child.classList && child.classList.contains("t-Region-bodyWrap"); })[0];
    return (wrap && Array.prototype.filter.call(wrap.children, function (child) { return child.classList && child.classList.contains("t-Region-body"); })[0]) ||
      Array.prototype.filter.call(region.children, function (child) { return child.classList && child.classList.contains("t-Region-body"); })[0] || null;
  }
  function ownFields(region) {
    return Array.prototype.filter.call(region.querySelectorAll(".t-Form-fieldContainer"), function (field) { return field.closest(".t-Region") === region; });
  }
  function title(region) {
    var heading = region.querySelector(":scope > .t-Region-header .t-Region-title, :scope > .t-Region-header h1, :scope > .t-Region-header h2, :scope > .t-Region-header h3");
    return String((heading && heading.textContent) || "").replace(/\s+/g, " ").trim().toLowerCase();
  }
  function cardIn(slot, parent) {
    return Array.prototype.filter.call(slot.children, function (child) {
      return child.classList && child.classList.contains("t-Region") && child.parentElement &&
        child.parentElement.closest(".t-Region") === parent && ownFields(child).length > 0;
    })[0] || null;
  }
  function arrange(parent) {
    if (parent.classList.contains("hspl-auto-section-owner")) return;
    var body = directBody(parent);
    var grid = body && Array.prototype.filter.call(body.children, function (child) { return child.classList && child.classList.contains("container"); })[0];
    if (!grid) return;
    var rows = Array.prototype.filter.call(grid.children, function (child) { return child.classList && child.classList.contains("row"); });
    var entries = [];
    for (var rowIndex = 0; rowIndex < rows.length; rowIndex++) {
      var slots = Array.prototype.filter.call(rows[rowIndex].children, function (child) { return child.classList && child.classList.contains("col") && cardIn(child, parent); });
      if (!slots.length) continue;
      /* Mixed rows can contain buttons, reports or plug-ins: leave them native. */
      if (slots.length > 2) return;
      slots.forEach(function (slot) { entries.push({ slot:slot, card:cardIn(slot, parent), row:rows[rowIndex], rowSize:slots.length }); });
    }
    if (entries.length < 2) return;
    var layout = doc.createElement("div");
    layout.className = "hspl-auto-section-layout";
    grid.insertBefore(layout, entries[0].row);
    var pair = null;
    function appendPair(slot) {
      if (!pair || pair.count === 2) {
        var pairNode = doc.createElement("div"), left = doc.createElement("div"), right = doc.createElement("div");
        pairNode.className = "hspl-auto-section-pair";
        left.className = "hspl-auto-section-column hspl-auto-section-column--left";
        right.className = "hspl-auto-section-column hspl-auto-section-column--right";
        pairNode.appendChild(left); pairNode.appendChild(right); layout.appendChild(pairNode);
        pair = { count:0, left:left, right:right };
      }
      (pair.count % 2 ? pair.right : pair.left).appendChild(slot); pair.count += 1;
    }
    entries.forEach(function (entry) {
      var fieldCount = ownFields(entry.card).length;
      var nativeFull = entry.rowSize === 1 || entry.slot.classList.contains("col-12");
      /* GRN intentionally presents its related sections as two business
         pairs: Select No + Reference, then Transportation Info + Under
         Signed. Their legacy APEX slots are all col-12, but the requested
         layout is parallel cards with two controls per row in each card.
         Keep this exception scoped to page 146 and the exact regions so no
         other form inherits it. */
      var grnParallel = doc.documentElement.classList.contains("page-146") &&
        (entry.card.id === "R641800941481137672" ||
         entry.card.id === "R641801102750137674" ||
         entry.card.id === "R641801251666137675" ||
         entry.card.id === "R641801344859137676");
      var full = !grnParallel && (nativeFull || (title(entry.card) === "general" && fieldCount >= 5) || fieldCount >= 6);
      entry.slot.classList.add("hspl-auto-section-slot");
      if (grnParallel) {
        entry.card.classList.add("hspl-grn-parallel-section", "hspl-semantic-layout--two-up");
        entry.card.classList.remove("hspl-semantic-layout--full-area", "hspl-auto-section-full");
      }
      if (full) {
        pair = null;
        entry.slot.classList.add("hspl-auto-section-slot--full");
        entry.card.classList.add("hspl-auto-section-full");
        layout.appendChild(entry.slot);
      } else appendPair(entry.slot);
    });
    rows.forEach(function (row) { row.classList.add("hspl-auto-section-source-row"); });
    parent.classList.add("hspl-auto-section-owner");
  }
  function apply() {
    if (pageIsException() || !doc.documentElement.classList.contains("hspl-compact-form")) return;
    Array.prototype.forEach.call(doc.querySelectorAll(".t-Body-main .t-Region"), function (region) {
      if (!region.closest(".ui-dialog,.a-IRR,.a-GV,.t-IRR-region,.hspl-drawer,.js-filter-drawer")) arrange(region);
    });
  }
  function schedule() { [0, 250, 900, 1500].forEach(function (delay) { setTimeout(apply, delay); }); }
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule); else schedule();
  doc.addEventListener("apexreadyend", schedule, { once:true });
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplAutoSection", schedule);
})();


/* ============================================================================
   Independent form-card stacks (Material In excluded)

   Legacy APEX puts every pair of half-width section cards in one flex row.
   When the left card is taller, the next right-hand card is forced to begin
   below that left card, leaving an empty vertical hole under the shorter
   right-hand card.  Keep the server layout, card widths and DOM/tab order
   intact; only translate subsequent cards up inside their own visual column.
   The outer row still owns document flow, so no later full-width region can
   overlap it.  This deliberately applies only to desktop form-card canvases
   with direct headed APEX form regions, never reports, dialogs, grids or
   Material In.
   ============================================================================ */
(function () {
  "use strict";
  var doc = document;
  var GAP = 10;

  function directCard(slot) {
    return Array.prototype.filter.call(slot.children, function (child) {
      return child.classList && child.classList.contains("t-Region") &&
        child.querySelector(":scope > .t-Region-header") &&
        child.querySelector(".t-Form-fieldContainer");
    })[0] || null;
  }

  function cardSlots(row) {
    return Array.prototype.filter.call(row.children, function (child) {
      return child.classList && child.classList.contains("col") && directCard(child);
    });
  }

  function reset(slot) {
    if (!slot.hasAttribute("data-hspl-card-stack")) return;
    slot.style.removeProperty("transform");
    slot.removeAttribute("data-hspl-card-stack");
  }

  function layout(grid) {
    var rows = Array.prototype.filter.call(grid.children, function (child) {
      return child.classList && child.classList.contains("row");
    });
    var rowSlots = rows.map(cardSlots).filter(function (slots) { return slots.length; });
    if (rowSlots.length < 2) return;

    /* Mark only proven outer card canvases. The accompanying shared CSS keeps
       APEX's existing column spans but prevents flex wrapping from turning a
       two-card row into a vertical stack on medium desktop screens. */
    grid.classList.add("hspl-card-canvas");
    rowSlots.forEach(function (slots) { slots.forEach(reset); });
    /* 768px is the application desktop breakpoint. Below it native responsive
       stacking remains untouched; at and above it each existing column keeps
       its original span and can use the compact independent-card stack. */
    if (window.innerWidth < 768) return;

    /* A valid canvas is made only of one or two direct form cards per row.
       This declines nested form grids and any mixed report/button layout. */
    if (rowSlots.some(function (slots) { return slots.length > 2; })) return;

    var gridTop = grid.getBoundingClientRect().top;
    var columnBottom = [null, null];
    rowSlots.forEach(function (slots) {
      slots.sort(function (a, b) {
        return a.getBoundingClientRect().left - b.getBoundingClientRect().left;
      });
      var full = slots.length === 1 ||
        slots[0].getBoundingClientRect().width > grid.getBoundingClientRect().width * 0.8;
      slots.forEach(function (slot, index) {
        var card = directCard(slot);
        var naturalTop = slot.getBoundingClientRect().top;
        var previous = full ? Math.max(columnBottom[0] || gridTop, columnBottom[1] || gridTop) :
          (columnBottom[index] || gridTop);
        var desiredTop = previous === gridTop ? naturalTop : Math.max(gridTop, previous + GAP);
        var delta = Math.round(desiredTop - naturalTop);
        /* Do not translate a later section into a preceding row's empty
           space. Region rows and their vertical start remain APEX-owned. */
        var bottom = desiredTop + card.getBoundingClientRect().height;
        if (full) {
          columnBottom[0] = bottom;
          columnBottom[1] = bottom;
        } else {
          columnBottom[index] = bottom;
        }
      });
    });
  }

  function apply() {
    /* Preserve APEX's authored section rows.  The former card-stack routine
       translated later cards upward to fill the neighbouring card's unused
       height. That visually changed the intended region hierarchy and could
       overlap a dynamically sized preceding section (for example GST and PO
       Amendment Detail). Shared compactness is vertical rhythm only; it must
       never use a masonry/transform layout to repack sections. */
    return;
  }

  var queued = false;
  function schedule() {
    if (queued) return;
    queued = true;
    window.requestAnimationFrame(function () {
      queued = false;
      apply();
    });
  }

  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule);
  else schedule();
  window.addEventListener("load", schedule, { once: true });
  window.addEventListener("resize", schedule, { passive: true });
  /* A few legacy transaction pages, including Sales Order, hydrate their
     section cards after DOMContentLoaded. Re-run the same guarded layout only
     after APEX has finished that lifecycle; no fields, spans or card order are
     changed, and pages without proven direct form-card rows are still ignored. */
  [180, 700, 1400].forEach(function (delay) { window.setTimeout(schedule, delay); });
  doc.addEventListener("apexreadyend", schedule, { once: true });
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplCardStack", schedule);
  doc.addEventListener("change", schedule, true);
  doc.addEventListener("click", function (event) {
    if (event.target.closest && event.target.closest("#tabcontainer .t-Tabs-link")) schedule();
  }, true);
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplCardStack", schedule);
})();


/* ========================================================================== 
   2. INLINE-DIALOG FILTER DRAWER  +  4. PRETIUS LOV POSITIONING
   Auto-wires every .js-filter-drawer so pages need NO per-page dynamic
   actions. Visibility is CSS-gated in hspl-theme.css (hidden unless <body>
   carries .filter-drawer-open); this keeps that class synced to the jQuery-UI
   dialog's open/close state.
   ========================================================================== */
(function () {
  "use strict";
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;

  /* Reset clears EVERY filter in the drawer, Company included. It only blanks
     the on-page items; it never touches the app-level company scope set at
     login, and never removes any LOV's available options. */
  var SCOPE = /(?!x)x/;   /* a regex that can never match anything */

  /* jQuery-UI appends the inline dialog to <body>, OUTSIDE #wwvFlowForm, so a
     page submit never posts the filter items — the report comes back
     unfiltered and the fields read back empty. Move the dialog into the form.
     Idempotent; position:fixed keeps it docked regardless of DOM location. */
  function ensureInForm($d) {
    var dlg = $d.closest(".ui-dialog").get(0);
    var form = document.getElementById("wwvFlowForm");
    if (dlg && form && !form.contains(dlg)) form.appendChild(dlg);
  }

  /* Tag the drawer's buttons by their VISIBLE LABEL. APEX does not render a
     page button's id as "FILTERRESET" — it emits a generated id such as
     B14632005288941679, so neither #FILTERRESET nor button[name='FILTERRESET']
     ever matches. Matching the rendered label works on every page without
     editing any of them. Idempotent. */
  function tagDrawerButtons($d) {
    $d.closest(".ui-dialog").find("button, a.t-Button").each(function () {
      var t = ($(this).text() || "").trim().toLowerCase();
      if (t === "reset") this.classList.add("js-filter-reset");
      else if (t === "cancel" || t === "close") this.classList.add("js-filter-close");
      else if (t === "apply" || t === "refresh" || t === "go") this.classList.add("js-filter-apply");
    });
    $(".t-HeroRegion button, .t-HeroRegion a.t-Button").each(function () {
      var t = ($(this).text() || "").trim().toLowerCase();
      if (t === "filter" || t === "filters") this.classList.add("js-filter-open");
    });
  }

  function initDrawers() {
    $(".js-filter-drawer").each(function () {
      var $d = $(this);
      ensureInForm($d);
      tagDrawerButtons($d);
      if (!$d.data("hsplDrawerWired")) {
        $d.data("hsplDrawerWired", true);
        $d.on("dialogopen", function () {
          ensureInForm($d); tagDrawerButtons($d);
          $("body").addClass("filter-drawer-open");
        });
        $d.on("dialogclose", function () { $("body").removeClass("filter-drawer-open"); });
      }
      try { $d.dialog("close"); } catch (e) {}
    });
    $("body").removeClass("filter-drawer-open");
  }

  function openDrawer()  { try { $(".js-filter-drawer").dialog("open"); }  catch (e) {} }
  function closeDrawer() { try { $(".js-filter-drawer").dialog("close"); } catch (e) {} }

  function resetDrawer() {
    var names = {};
    $(".js-filter-drawer").find("[id$='_CONTAINER']").each(function () {
      names[this.id.replace(/_CONTAINER$/, "")] = true;
    });
    /* fallback — any page item control inside the drawer, including a plugin's
       hidden input, in case its container id differs */
    $(".js-filter-drawer").find("input[id], select[id], textarea[id]").each(function () {
      if (/^P\d+_/i.test(this.id)) names[this.id] = true;
    });
    Object.keys(names).forEach(function (name) {
      if (!name || SCOPE.test(name)) return;
      try {
        var it = apex.item(name);
        if (it && it.setValue) it.setValue("", null, true);
      } catch (e) {}
    });
  }

  /* Bind by CSS class AND by APEX button name/id so the handler works on pages
     converted with either pattern, without editing hundreds of them. */
  var SEL_OPEN  = ".js-filter-open,  #FILTEROPEN,  [id$='FILTEROPEN'],  button[name='FILTEROPEN']";
  var SEL_CLOSE = ".js-filter-close, #FILTERCANCEL,[id$='FILTERCANCEL'],button[name='FILTERCANCEL']";
  var SEL_RESET = ".js-filter-reset, #FILTERRESET, [id$='FILTERRESET'], button[name='FILTERRESET']";
  var SEL_APPLY = ".js-filter-apply";

  $(function () {
    $(document.body)
      .on("click", SEL_OPEN,  function (e) { e.preventDefault(); openDrawer(); })
      .on("click", SEL_CLOSE, function (e) { e.preventDefault(); closeDrawer(); })
      .on("click", SEL_RESET, function (e) { e.preventDefault(); resetDrawer(); })
      /* Close the inline dialog immediately, but never cancel its native APEX
         submit / dynamic action. This makes Apply deterministic on both full
         submits and Partial Page Refresh registers. */
      .on("click", SEL_APPLY, function () { closeDrawer(); });
  });

  /* ---------------------------------------------------------------------
     Pretius Enhanced-LOV popup mispositioning inside the drawer.
     The plugin appends its dropdown into .t-DialogRegion-body and positions it
     with .offset() — DOCUMENT coordinates — while the dropdown is
     position:absolute, so the browser resolves those numbers against the
     nearest positioned ancestor (our position:fixed .ui-dialog). Document
     coords read in the dialog's coordinate space put the popup far from its
     field. .t-DialogRegion-body is also the scroll container, so an absolute
     popup gets clipped by it.
     Both problems disappear in VIEWPORT space: switch to position:fixed and
     feed it getBoundingClientRect(), which needs no scroll correction and
     escapes the overflow clipping. */
  function positionPrompt(promptEl) {
    var id = promptEl.getAttribute("data-prompt");
    if (!id) return;
    /* data-mask sits on the INNER .itemContainer, not the .mask wrapper — so
       querying .mask[data-mask=...] matches nothing. Look up the inner element
       then walk out to its .mask. */
    var inner = document.querySelector('[data-mask="' + id + '"]');
    var mask = inner && inner.closest ? inner.closest(".pretius--enhancedLovItem.mask") : null;
    if (!mask) mask = document.querySelector(".pretius--enhancedLovItem.mask.focused");
    if (!mask || !mask.getBoundingClientRect) return;
    /* This compensates for Pretius' dialog-coordinate calculation only.  An
       Interactive Grid owns its own cell editor and popup positioning; forcing
       that editor to `fixed` made detail LOVs appear outside their cell. */
    if (!mask.closest('.hspl-drawer,.js-filter-drawer')) return;

    var r = mask.getBoundingClientRect();
    if (!r.width && !r.height) return;

    promptEl.__hsplFixing = true;
    promptEl.style.setProperty("position", "fixed", "important");
    promptEl.style.setProperty("width", Math.round(r.width) + "px", "important");
    promptEl.style.setProperty("min-width", "0", "important");
    promptEl.style.setProperty("max-width", "calc(100vw - 16px)", "important");
    promptEl.style.setProperty("box-sizing", "border-box", "important");

    /* measure only after width is applied, so flip/clamp use real numbers */
    var ph = promptEl.offsetHeight || 260;
    var top = (r.bottom + ph > window.innerHeight && r.top - ph > 0) ? (r.top - ph) : (r.bottom - 1);
    var left = r.left;
    if (left + r.width > window.innerWidth) left = Math.max(8, window.innerWidth - r.width - 8);

    promptEl.style.setProperty("top", Math.round(top) + "px", "important");
    promptEl.style.setProperty("left", Math.round(left) + "px", "important");
    promptEl.style.setProperty("right", "auto", "important");
    promptEl.style.setProperty("z-index", "10000", "important");
    promptEl.__hsplFixing = false;
  }

  function isOpenPrompt(el) {
    return el.nodeType === 1 && el.classList &&
      el.classList.contains("pretius--enhancedLovItem") &&
      el.classList.contains("prompt") &&
      el.style.display !== "none";
  }

  function watchLovPrompts() {
    if (!window.MutationObserver) return;
    var attrObserver = new MutationObserver(function (mutations) {
      mutations.forEach(function (m) {
        if (!m.target.__hsplFixing && isOpenPrompt(m.target)) positionPrompt(m.target);
      });
    });
    function observe(el) { attrObserver.observe(el, { attributes: true, attributeFilter: ["style", "class"] }); }
    Array.prototype.forEach.call(document.querySelectorAll(".pretius--enhancedLovItem.prompt"), observe);

    /* popups are created lazily — observe new ones as they appear */
    new MutationObserver(function (mutations) {
      mutations.forEach(function (m) {
        Array.prototype.forEach.call(m.addedNodes || [], function (node) {
          if (node.nodeType === 1 && node.classList &&
              node.classList.contains("pretius--enhancedLovItem") &&
              node.classList.contains("prompt")) { observe(node); positionPrompt(node); }
        });
      });
    }).observe(document.body, { childList: true, subtree: true });

    function repositionOpen() {
      Array.prototype.forEach.call(document.querySelectorAll(".pretius--enhancedLovItem.prompt"),
        function (el) { if (isOpenPrompt(el)) positionPrompt(el); });
    }
    var positionFrame = 0;
    function scheduleReposition() {
      if (positionFrame) return;
      positionFrame = requestAnimationFrame(function () { positionFrame = 0; repositionOpen(); });
    }
    window.addEventListener("resize", scheduleReposition, true);
    document.addEventListener("scroll", scheduleReposition, true);
  }

  $(window).on("apexready", initDrawers);
  $(function () { setTimeout(initDrawers, 0); watchLovPrompts(); });
})();


/* ==========================================================================
   5. STATUS PILLS
   Status columns render as plain text, so "Pending" reads the same as any
   other cell. Wrap each value in a coloured pill purely in the DOM — the
   stored value, the SQL and the report definition are untouched. Targets cells
   structurally via their `headers` attribute, so it works on every page's
   status column with no per-page wiring.
   ========================================================================== */
(function () {
  "use strict";
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;

  function tone(text) {
    var u = (text || "").toUpperCase();
    if (!u) return null;
    /* conservative — only classify clear, known words */
    if (/\b(PENDING|REJECT|CANCEL|FAIL|DECLIN|EXPIR|OVERDUE|UNPAID|UNAPPROV|CRITICAL|STOCK[\s-]?OUT|NEGATIVE|DEAD\b|BELOW[\s-]?MIN|STILL[\s-]?NO|SHORTAGE)/.test(u)) return "is-danger";
    if (/\b(HOLD|PARTIAL|PARTLY|IN[\s-]?PROCESS|PROCESSING|IN[\s-]?PROGRESS|AWAIT|DRAFT|OPEN|SLOW|NON[\s-]?MOV|LOW[\s-]?RATIO|LOW\b|EXCESS|OVERSTOCK|IDLE|STUCK|NO[\s-]?OUTPUT|NO[\s-]?INPUT|NOT[\s-]?ISSUED|SHORT[\s-]?ISSUED|BELOW[\s-]?REORDER|NOT[\s-]?COSTED|DELAY|OUT.?IN)/.test(u)) return "is-warn";
    if (/\b(PREPAR|APPROV|COMPLET|PASS|DISPATCH|DELIVER|DONE|SUCCESS|ACTIVE|ISSUED|RECEIV|CLOSED|PAID|VERIFIED|ACCEPT|CONFIRM|BALANCED|HEALTHY|WITHIN|COVERED|ADEQUATE|MOVING|NORMAL|FAST|FULLY|COSTED|CLEAN)/.test(u)) return "is-ok";
    return "is-info";
  }

  /* Ids of header cells whose TEXT contains "status". Reports often give data
     cells a GENERATED headers id (e.g. C1234) rather than the column name, so
     matching the id string alone silently misses them. */
  function statusHeaderIds(root) {
    var ids = {};
    var scope = root && root.querySelectorAll ? root : document;
    Array.prototype.forEach.call(scope.querySelectorAll("th[id]"), function (th) {
      if ((th.textContent || "").toUpperCase().indexOf("STATUS") !== -1) ids[th.id] = true;
    });
    return ids;
  }

  function paint(root) {
    var scope = root && root.querySelectorAll ? root : document;
    var ids = statusHeaderIds(scope);
    Array.prototype.forEach.call(scope.querySelectorAll("td[headers]"), function (td) {
      if (td.querySelector(".hspl-status-pill")) return;              /* already done */
      var h = td.getAttribute("headers") || "";
      var isStatus = h.toUpperCase().indexOf("STATUS") !== -1 ||
        h.split(/\s+/).some(function (x) { return ids[x]; });
      if (!isStatus) return;
      /* never touch a cell holding an interactive control or a link */
      if (td.querySelector("a,button,input,select,textarea,img")) return;
      var txt = (td.textContent || "").trim();
      if (!txt || txt.length > 40) return;
      var cls = tone(txt);
      if (!cls) return;
      var span = document.createElement("span");
      span.className = "hspl-status-pill " + cls;
      span.textContent = txt;
      td.textContent = "";
      td.appendChild(span);
    });
    /* Overdue-days pills: a column whose header says REMAINING or OVERDUE (of days)
       gets its NEGATIVE values shown as a red pill — matching the register design
       where a negative "delivery remaining days" means the order is overdue. */
    var dayIds = {};
    Array.prototype.forEach.call(scope.querySelectorAll("th[id]"), function (th) {
      var t = (th.textContent || "").toUpperCase();
      if (/DAY/.test(t) && /(REMAINING|OVERDUE)/.test(t)) dayIds[th.id] = true;
    });
    Array.prototype.forEach.call(scope.querySelectorAll("td[headers]"), function (td) {
      if (td.querySelector(".hspl-num-pill")) return;
      var h = td.getAttribute("headers") || "";
      if (!h.split(/\s+/).some(function (x) { return dayIds[x]; })) return;
      if (td.querySelector("a,button,input,select,textarea")) return;
      var raw = (td.textContent || "").trim();
      var v = parseFloat(raw.replace(/,/g, ""));
      if (raw === "" || isNaN(v) || v >= 0) return;   /* only flag overdue (negative) */
      var s = document.createElement("span");
      s.className = "hspl-num-pill is-danger";
      s.textContent = raw;
      td.textContent = "";
      td.appendChild(s);
    });
  }

  /* Re-entrancy guard: paint() itself inserts pill <span>s, which the observer below
     would see as added nodes — the guard stops it re-triggering on our own writes. */
  var painting = false;
  function paintSafe(root) { if (painting) return; painting = true; try { paint(root); } finally { painting = false; } }

  function initStatusPaint() {
    /* Run directly from DOMContentLoaded instead of jQuery's deferred ready queue.
       The server-rendered first page is therefore enhanced in the same task that
       makes the DOM ready, before the browser gets a paint opportunity. */
    paintSafe(document);

    /* AJAX / filter-refresh rows are enhanced only inside the IR that changed.
       The old observer rescanned the entire page for every inserted APEX node and
       then repeated the same work at 300/900/1800 ms; large dashboards paid for
       several full-DOM passes while the user was already scrolling. */
    try {
      new MutationObserver(function (muts) {
        for (var i = 0; i < muts.length; i++) {
          var an = muts[i].addedNodes;
          for (var j = 0; j < an.length; j++) {
            var n = an[j];
            if (n.nodeType !== 1) continue;
            if (n.classList && n.classList.contains("hspl-status-pill")) continue;  /* our own write */
            var ir = n.closest ? n.closest(".a-IRR") : null;
            if (!ir && n.matches && n.matches(".a-IRR")) ir = n;
            if (!ir && n.querySelector) ir = n.querySelector(".a-IRR");
            if (ir) { paintSafe(ir); return; }
          }
        }
      }).observe(document.body, { childList: true, subtree: true });
    } catch (e) {}
    $(document).on("apexafterrefresh.hsplStatus", function (e) { paintSafe(e.target || document); });
  }
  /* The report table is already parsed because this file is at BODY end.
     Paint status cells before first paint rather than at DOMContentLoaded;
     the previous delay exposed plain status text before the final pills. */
  initStatusPaint();
})();

/* ============================================================================
   Register scrolling.
   APEX renders the fixed header and body as separate tables. Auto-sized report
   columns therefore need one geometry pass after render/refresh. The rendered
   body cells are authoritative; only the cloned header receives those widths,
   so normal report layout and scrolling remain untouched.
   ========================================================================== */
(function () {
  var nativeScrollPositions = Object.create(null);
  var lastViewportScrollAt = 0;
  var nativeScrollGuardUntil = 0;
  var nativeViewportFrame = 0;
  function nativeScrollKey(node) {
    var report = node && node.closest ? node.closest(".a-IRR") : null;
    if (report && report.id) return report.id;
    var region = node && node.closest ? node.closest(".t-Region") : null;
    if (region && region.id) return region.id;
    var wrapper = node && node.closest ? node.closest(".t-fht-wrapper") : null;
    return wrapper && wrapper.id ? wrapper.id : "";
  }
  function hasExplicitHorizontalInput(tbody) {
    return !!(tbody && tbody.__hsplHorizontalInputUntil > Date.now());
  }
  function restoreProtectedHorizontalPosition(tbody, thead) {
    var key = nativeScrollKey(tbody);
    var savedLeft = key && Object.prototype.hasOwnProperty.call(nativeScrollPositions, key)
      ? nativeScrollPositions[key]
      : 0;
    if (tbody.scrollLeft !== 0 || !savedLeft || Date.now() > nativeScrollGuardUntil || hasExplicitHorizontalInput(tbody)) {
      return false;
    }
    tbody.scrollLeft = savedLeft;
    if (thead && thead.scrollLeft !== savedLeft) thead.scrollLeft = savedLeft;
    return true;
  }
  function linkBodyToHeader(tbody, thead) {
    /* This is only an assignment between APEX's two already-rendered scroll
       ports; it does not measure or resize a table. Do it in the same scroll
       event so the fixed header never trails a dragged horizontal bar by one
       paint frame. */
    tbody.addEventListener("scroll", function () {
      var key = nativeScrollKey(tbody);
      var savedLeft = key && Object.prototype.hasOwnProperty.call(nativeScrollPositions, key)
        ? nativeScrollPositions[key]
        : 0;
      /* StickyTableHeader briefly forces a freshly toggled body back to zero.
         During a vertical page scroll that is an internal reset, not user
         intent: restore the last horizontal position in this same event. */
      if (tbody.scrollLeft === 0 && savedLeft > 0 && restoreProtectedHorizontalPosition(tbody, thead)) return;
      var left = tbody.scrollLeft;
      if (key) nativeScrollPositions[key] = left;
      if (thead.scrollLeft !== left) thead.scrollLeft = left;
    }, { passive: true });
  }
  /* Fixed-header IRs contain two independent tables. Let APEX size the body
     naturally, then copy those FINAL rendered tracks to the cloned heading.
     We never write a body/table-cell width here, so refreshes cannot feed a
     previous measurement back into APEX or produce the old growing-columns
     glitch. */
  function syncHeaderToBody(tbody, thead) {
    var bodyTable = tbody.querySelector(".a-IRR-table");
    /* APEX keeps its original <thead> inside the scrolling body table as a
       sizing clone.  The visible heading is the sibling .t-fht-thead table.
       Some report refresh paths add an inline display rule after our stylesheet
       has loaded, which resurrects that sizing clone as a second header row.
       Set the exact generated element inline every time the fixed-header pair
       is synchronised; its colgroup remains available for APEX sizing. */
    if (bodyTable && bodyTable.tHead) {
      bodyTable.tHead.style.setProperty("display", "none", "important");
      bodyTable.tHead.setAttribute("aria-hidden", "true");
    }
    /* This APEX version stores the original fixed-header row in <tbody>, not
       in <thead>.  It is a sizing-only copy of the visible .t-fht-thead row;
       leaving it in flow is the exact source of the second clipped heading.
       Hide only a first row made of header cells, never a data row. */
    var originalHeaderRow = bodyTable && bodyTable.querySelector(":scope > tbody > tr:first-child");
    if (originalHeaderRow && originalHeaderRow.querySelector(":scope > th")) {
      /* `visibility:collapse` is deliberate. Unlike display:none it retains
         the header labels for the browser's table-track calculation, while
         removing the duplicate row from paint and height. */
      originalHeaderRow.style.setProperty("display", "table-row", "important");
      originalHeaderRow.style.setProperty("visibility", "collapse", "important");
      originalHeaderRow.setAttribute("aria-hidden", "true");
      /* The old geometry routine offset the body upward to overlay this row.
         With the clone removed, the normal sticky placeholder owns that space
         and the first data row must start directly beneath the real heading. */
      bodyTable.style.setProperty("margin-top", "0", "important");
    }
    /* APEX owns fixed-header track sizing.  Copying every measured body cell
       into its clone created an intermediate, partially sized heading whenever
       a page or sidebar state changed.  The source heading is now suppressed
       above, so retain only scroll alignment and leave all column geometry to
       the native fixed-header widget. */
    if (thead && thead.scrollLeft !== tbody.scrollLeft) thead.scrollLeft = tbody.scrollLeft;
  }
  function scheduleNativeGeometry(tbody, thead) {
    /* Older theme builds copied measured body widths into the fixed-header
       clone with !important inline rules.  Those pixels survive a sidebar
       state change, so the body immediately takes its new width while the
       heading remains frozen at the previous one.  Remove only that legacy
       signature and let APEX own both tables again.  No dimensions are read or
       calculated here. */
    var headTable = thead && thead.querySelector('.a-IRR-table');
    if (headTable &&
        headTable.style.getPropertyValue('table-layout') === 'fixed' &&
        headTable.style.getPropertyPriority('table-layout') === 'important') {
      headTable.style.removeProperty('table-layout');
      headTable.style.removeProperty('width');
      headTable.style.removeProperty('min-width');
      headTable.style.removeProperty('max-width');
      Array.prototype.forEach.call(headTable.querySelectorAll('th'), function (cell) {
        /* Semantic column minimums never set max-width. Its presence is the
           unique marker left by the removed header-width copier. */
        if (cell.style.getPropertyPriority('max-width') !== 'important') return;
        cell.style.removeProperty('box-sizing');
        cell.style.removeProperty('width');
        cell.style.removeProperty('min-width');
        cell.style.removeProperty('max-width');
      });
    }
    syncHeaderToBody(tbody, thead);
    /* Cancel a frame queued by a previously loaded build, but never replace it
       with another geometry pass. */
    if (tbody.__hsplHeaderAlignFrame) cancelAnimationFrame(tbody.__hsplHeaderAlignFrame);
    tbody.__hsplHeaderAlignFrame = 0;
  }

  /* APEX can reset only the cloned heading's scrollLeft when its fixed-header
     state changes during vertical page scrolling. Correct that in the same
     scroll event (before paint); do not queue RAF/timer work, which is what made
     the reset visible as a flicker. */
  function syncNativeHeaderScroll() {
    lastViewportScrollAt = Date.now();
    var bodies = document.querySelectorAll(".t-fht-tbody");
    for (var i = 0; i < bodies.length; i++) {
      var tbody = bodies[i];
      var bodyTable = tbody.querySelector(".a-IRR-table");
      if (bodyTable && bodyTable.tHead) {
        bodyTable.tHead.style.setProperty("display", "none", "important");
        bodyTable.tHead.setAttribute("aria-hidden", "true");
      }
      var wrap = tbody.closest ? tbody.closest(".t-fht-wrapper") : null;
      var thead = wrap ? wrap.querySelector(".t-fht-thead") : null;
      restoreProtectedHorizontalPosition(tbody, thead);
      if (thead && thead.scrollLeft !== tbody.scrollLeft) thead.scrollLeft = tbody.scrollLeft;
    }
  }
  function protectNativeHeaderScroll() {
    nativeScrollGuardUntil = Math.max(nativeScrollGuardUntil, Date.now() + 900);
    syncNativeHeaderScroll();
    /* APEX can make one late sticky-header write after a vertical viewport
       scroll. Correct that once on the next frame; the former 40-frame loop
       kept every large register busy for ~650ms after every page scroll. */
    if (nativeViewportFrame) return;
    nativeViewportFrame = requestAnimationFrame(function () {
      nativeViewportFrame = 0;
      syncNativeHeaderScroll();
    });
  }

  function guardAnyNativeHeaderScroll(event) {
    var header = event.target;
    if (!header || !header.classList || !header.classList.contains("t-fht-thead")) return;
    var wrapper = header.closest ? header.closest(".t-fht-wrapper") : null;
    var body = wrapper ? wrapper.querySelector(".t-fht-tbody") : null;
    if (body && header.scrollLeft !== body.scrollLeft) header.scrollLeft = body.scrollLeft;
  }
  /* Keep APEX's native report sizing. The custom geometry pass that used to
     follow this block rewrote every table/cell width after render and caused
     registers to visibly grow while loading. Only horizontal scroll syncing is
     needed; APEX remains authoritative for all column widths. */
  function attachNativeScrollSync() {
    var bodies = document.querySelectorAll(".t-fht-tbody");
    for (var i = 0; i < bodies.length; i++) {
      var tbody = bodies[i];
      var bodyTable = tbody.querySelector(".a-IRR-table");
      if (bodyTable && bodyTable.tHead) {
        bodyTable.tHead.style.setProperty("display", "none", "important");
        bodyTable.tHead.setAttribute("aria-hidden", "true");
      }
      var wrap = tbody.closest ? tbody.closest(".t-fht-wrapper") : null;
      var thead = wrap ? wrap.querySelector(".t-fht-thead") : null;
      if (!thead) continue;
      var key = nativeScrollKey(tbody);
      if (key && Object.prototype.hasOwnProperty.call(nativeScrollPositions, key)) {
        var savedLeft = nativeScrollPositions[key];
        if (tbody.scrollLeft !== savedLeft) tbody.scrollLeft = savedLeft;
        if (thead.scrollLeft !== savedLeft) thead.scrollLeft = savedLeft;
      } else if (key) {
        nativeScrollPositions[key] = tbody.scrollLeft;
      }
      if (!tbody.__hsplHdrSync) {
        tbody.__hsplHdrSync = true;
        linkBodyToHeader(tbody, thead);
        /* A deliberate drag/wheel inside a register is user intent. It may
           legitimately bring the table back to its left edge, so do not let
           the vertical-scroll recovery guard fight that action. */
        tbody.addEventListener("pointerdown", function (event) {
          /* Only a grab on the native horizontal scrollbar is explicit
             horizontal intent. Ordinary clicks in a row must not disable the
             vertical-scroll recovery that follows immediately afterwards. */
          var rect = this.getBoundingClientRect();
          if (event.clientY >= rect.bottom - 22) this.__hsplHorizontalInputUntil = Date.now() + 450;
        }, { passive: true });
        tbody.addEventListener("wheel", function (event) {
          if (Math.abs(event.deltaX || 0) > 0) this.__hsplHorizontalInputUntil = Date.now() + 450;
        }, { passive: true });
      }
      if (!thead.__hsplBodyScrollGuard) {
        thead.__hsplBodyScrollGuard = true;
        thead.addEventListener("scroll", function () {
          var header = this;
          var wrapper = header.closest ? header.closest(".t-fht-wrapper") : null;
          var body = wrapper ? wrapper.querySelector(".t-fht-tbody") : null;
          if (body && header.scrollLeft !== body.scrollLeft) header.scrollLeft = body.scrollLeft;
        }, { capture: true, passive: true });
      }
      if (!thead.__hsplStickyLifecycleSync && window.apex && apex.jQuery) {
        thead.__hsplStickyLifecycleSync = true;
        apex.jQuery(thead).on(
          "stickywidgetstick.hsplRegister stickywidgetunstick.hsplRegister " +
          "stickywidgetstickend.hsplRegister stickywidgetunstickend.hsplRegister",
          function () {
            var header = this;
            var wrapper = header.closest ? header.closest(".t-fht-wrapper") : null;
            var body = wrapper ? wrapper.querySelector(".t-fht-tbody") : null;
            if (!body) return;
            restoreProtectedHorizontalPosition(body, header);
            if (header.scrollLeft !== body.scrollLeft) header.scrollLeft = body.scrollLeft;
            requestAnimationFrame(function () {
              restoreProtectedHorizontalPosition(body, header);
              if (header.scrollLeft !== body.scrollLeft) header.scrollLeft = body.scrollLeft;
            });
          }
        );
      }
      thead.scrollLeft = tbody.scrollLeft;
      scheduleNativeGeometry(tbody, thead);
    }
  }
  function initNativeScrollSync() {
    attachNativeScrollSync();
    if (window.MutationObserver && document.body && !document.body.__hsplRegisterScrollObserver) {
      document.body.__hsplRegisterScrollObserver = new MutationObserver(function (mutations) {
        for (var i = 0; i < mutations.length; i++) {
          var added = mutations[i].addedNodes;
          for (var j = 0; j < added.length; j++) {
            var node = added[j];
            if (node.nodeType !== 1) continue;
            if ((node.matches && node.matches(".t-fht-tbody,.t-fht-thead,.t-fht-wrapper")) ||
                (node.querySelector && node.querySelector(".t-fht-tbody,.t-fht-thead"))) {
              attachNativeScrollSync();
              return;
            }
          }
        }
      });
      document.body.__hsplRegisterScrollObserver.observe(document.body, { childList: true, subtree: true });
    }
    if (window.apex && apex.jQuery) {
      apex.jQuery(document)
        .off("apexafterrefresh.hsplRegisterScroll")
        .on("apexafterrefresh.hsplRegisterScroll", attachNativeScrollSync);
    }
    /* Do not observe the canvas or navigation classes. A sidebar toggle on a
       loaded register changes the report viewport, and these legacy observers
       used to schedule redundant work for every intermediate width. Native
       APEX owns table sizing; the scroll listener above remains responsible
       only for synchronising the two horizontal scroll ports. */
  }
  /* This application file is rendered at the end of BODY, so the report DOM
     is already available even while document.readyState is still "loading".
     Initialise synchronously instead of waiting for DOMContentLoaded. */
  initNativeScrollSync();
  /* Universal Theme owns report geometry on browser/sidebar resize. Calling
     attachNativeScrollSync from resize reintroduced the removed pixel copier
     at the exact moment the canvas was changing. */
  window.addEventListener("scroll", protectNativeHeaderScroll, { passive: true });
  document.addEventListener("scroll", guardAnyNativeHeaderScroll, { capture: true, passive: true });
  /* Do not run another geometry write at window.load/fonts.ready. Both events
     occur after the register is already visible and were the remaining source
     of the 0.5-2 second second-paint. Native APEX and the static stylesheet use
     the same font metrics for the body and cloned heading. */
})();

/* ============================================================================
   Chart styling: one unified, professional palette (navy / blue / teal / amber
   / slate) plus a glossy gradient sheen across EVERY dashboard chart. APEX's
   default Oracle-JET palette looked flat and generic; this sets styleDefaults
   on each ojChart once, and re-applies to charts created by a region refresh.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  var PALETTE = ['#7B6EF6','#1BB5A8','#57C97D','#F5C242','#4C8DF5','#F2789F','#A78BFA','#F59842','#3FC5DE','#8B8FC9'];
  var NS = 'http://www.w3.org/2000/svg';
  var glossSeq = 0;
  function shade(hex, amt) {
    var n = parseInt(hex.slice(1), 16);
    var r = Math.max(0, Math.min(255, (n >> 16) + amt)), g = Math.max(0, Math.min(255, ((n >> 8) & 255) + amt)), b = Math.max(0, Math.min(255, (n & 255) + amt));
    return '#' + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
  }
  /* Tasteful vertical gradient: gently lighter at the top, base in the middle, a
     touch deeper at the foot — the clean corporate look, NOT a glassy white sheen
     (that read as cheap). Same profile for the bar gradients and the pie-slice
     gloss, so every chart reads alike. */
  var STOPS = [['0%', 46], ['50%', 0], ['100%', -40]];
  function fillGrad(g, base) {
    STOPS.forEach(function (st) {
      var s = document.createElementNS(NS, 'stop');
      s.setAttribute('offset', st[0]); s.setAttribute('stop-color', shade(base, st[1])); g.appendChild(s);
    });
  }

  /* ---- Bars/areas: their tall shapes carry no DOM-reachable fill (only tiny legend
     markers do), so DOM patching can't gloss them. Instead hand Oracle-JET a set of
     gradient url() series colours; JET paints each bar with the gradient natively and
     keeps it through internal re-renders. The gradient defs live in one shared hidden
     SVG in <body> (never wiped by a chart re-render); Chrome resolves the cross-SVG
     paint-server refs fine. (Pie slices ignore url() fills — they black out — so pies
     keep the DOM path-gloss below.) --------------------------------------------- */
  var GRAD_COLS = null;
  function ensureDefs() {
    if (GRAD_COLS) return GRAD_COLS;
    if (!document.getElementById('hspl-chart-grads')) {
      var host = document.createElementNS(NS, 'svg');
      host.setAttribute('id', 'hspl-chart-grads');
      host.setAttribute('aria-hidden', 'true');
      host.style.cssText = 'position:absolute;width:0;height:0;overflow:hidden';
      var defs = document.createElementNS(NS, 'defs');
      PALETTE.forEach(function (base, i) {
        var g = document.createElementNS(NS, 'linearGradient');
        g.setAttribute('id', 'hsplBar' + i);
        g.setAttribute('x1', '0'); g.setAttribute('y1', '0'); g.setAttribute('x2', '0'); g.setAttribute('y2', '1');
        fillGrad(g, base); defs.appendChild(g);
      });
      host.appendChild(defs);
      document.body.appendChild(host);
    }
    GRAD_COLS = PALETTE.map(function (_, i) { return 'url(#hsplBar' + i + ')'; });
    return GRAD_COLS;
  }

  /* ---- Pie/donut gloss: JET keeps solid #hex fills on the slice <path>s, so swap
     each for its own vertical gloss gradient after the colour re-render. Idempotent:
     an already url()-filled slice is skipped. ---------------------------------- */
  function glossSlice(p, defs) {
    var f = p.getAttribute('fill') || '';
    if (!/^#[0-9A-Fa-f]{6}$/.test(f)) return;
    var id = 'hsplGloss' + (glossSeq++);
    var g = document.createElementNS(NS, 'linearGradient');
    g.setAttribute('id', id); g.setAttribute('x1', '0'); g.setAttribute('y1', '0'); g.setAttribute('x2', '0.5'); g.setAttribute('y2', '1');
    fillGrad(g, f);
    defs.appendChild(g); p.setAttribute('fill', 'url(#' + id + ')');
  }
  function glossPieEl(el) {
    var svg = el.querySelector('svg'); if (!svg) return false;
    var solid = [].filter.call(svg.querySelectorAll('path'), function (p) { return /^#[0-9A-Fa-f]{6}$/.test(p.getAttribute('fill') || ''); });
    if (!solid.length) return false;
    var defs = svg.querySelector('defs');
    if (!defs) { defs = document.createElementNS(NS, 'defs'); svg.insertBefore(defs, svg.firstChild); }
    solid.forEach(function (p) { glossSlice(p, defs); });
    return true;
  }
  /* Bars get their gradient THROUGH JET (a url() series colour), so JET paints them
     gradient on the very first frame. JET renders PIE slices BLACK if given a url()
     colour, so a pie's gradient can only be a post-render DOM swap. The bug the user
     saw ("pie loads solid, THEN turns gradient") is a timing race: setting the pie's
     palette (styleDefaults.colors) triggers an ASYNC JET re-render that repaints every
     slice SOLID a few frames later — after any one-shot gloss has already run — so the
     pie sat solid until the next timed pass caught it (hundreds of ms of visible solid).
     Fix: watch each pie's slice <path> fills with a MutationObserver. Whenever JET
     writes a solid hex fill (first render, palette set, or a filter refresh), the
     observer re-glosses it as a microtask — which runs BEFORE the browser paints — so
     the solid state is swapped to the gradient in the same frame and never shown. Our
     own url() fills are skipped by glossPieEl, so the observer can't loop on itself. */
  /* Gloss a pie's slices to the gradient a frame or two after JET lays down the solid
     fills — a BOUNDED requestAnimationFrame probe, NOT a live MutationObserver.
     The earlier observer (attributeFilter fill + childList + subtree) fired on EVERY DOM
     mutation JET makes while drawing, each firing a full querySelectorAll('path') scan —
     on a dashboard with several donuts that was O(mutations × paths) and FROZE the page
     (the renderer became unresponsive). This instead retries at most ~40 frames until the
     solid slices exist, glosses once, and stops; the __glossing guard stops stacked loops,
     and it re-runs per styleCharts pass so a filter re-render is re-glossed. Keeps the
     gradient look; costs O(paths) once per render instead of per mutation. */
  function glossPieSoon(el) {
    if (el.__glossing) return;
    el.__glossing = 1;
    var n = 0;
    (function attempt() {
      if (glossPieEl(el)) { el.__glossing = 0; return; }   /* glossed — done */
      if (n++ < 40) requestAnimationFrame(attempt); else el.__glossing = 0;
    })();
  }

  function styleCharts() {
    var grads = ensureDefs();
    $('.oj-chart').each(function () {
      var el = this, t;
      try { t = $(el).ojChart('option', 'type'); } catch (e) { return; }  /* not ready; a later pass catches it */
      if (!el.__hsplPal) {
        try {
          /* FAST PATH: section 0b registered our palette as ojChart's DEFAULT, so a chart
             that rendered after that registration is ALREADY in-brand — re-setting it would
             queue a needless JET re-render (the very delay we're removing). So only touch the
             chart if its colours aren't ours yet (a chart that raced the registration); then
             mark it done. Killing the entrance + data-change animations stops the flicker. */
          var cur = $(el).ojChart('option', 'styleDefaults') || {};
          if (!(cur.colors && cur.colors[0] === PALETTE[0])) {
            $(el).ojChart('option', {
              animationOnDisplay: 'none',
              animationOnDataChange: 'none',
              styleDefaults: $.extend({}, cur, { colors: PALETTE })
            });
          }
          el.__hsplPal = true;
        } catch (e) { return; /* widget not ready; a later pass catches it */ }
      }
      /* GLOSS REMOVED for speed (per request): pies + bars render FLAT with the palette in a
         SINGLE JET pass — no gradient DOM-swap, no rAF probe, no per-slice work, no observer.
         Eliminates the solid→gradient flip AND the freeze. This is the MKSPL-style fast path. */
    });
  }
  $(function () {
    var pend;
    /* short debounce so the gloss/palette lands almost as soon as a chart's svg appears —
       shrinks the visible "plain → glossy" flip that made HSPL feel slower than MKSPL's
       plain single-render charts. Still coalesces a burst of mutations. */
    function schedule() { clearTimeout(pend); pend = setTimeout(styleCharts, 50); }
    [400, 1200, 2500, 4000].forEach(function (t) { setTimeout(styleCharts, t); });
    /* catch charts that render late (slow SQL) — react only to added chart/svg nodes. */
    try {
      new MutationObserver(function (muts) {
        var hit = false;
        for (var i = 0; i < muts.length; i++) {
          var an = muts[i].addedNodes;
          for (var j = 0; j < an.length; j++) {
            var n = an[j];
            if (n.nodeType !== 1) continue;
            var svg = n.tagName === 'svg' ? n : (n.querySelector && n.querySelector('.oj-chart svg, svg'));
            if (!svg) continue;
            hit = true;
            /* If a KNOWN pie just had its svg replaced by a re-render, re-gloss the fresh
               slices right away (bounded rAF probe — no live per-mutation observer). */
            var chart = svg.closest && svg.closest('.oj-chart');
            if (chart && chart.__hsplPie) { try { glossPieSoon(chart); } catch (e) {} }
          }
        }
        if (hit) schedule();
      }).observe(document.body, { childList: true, subtree: true });
    } catch (e) {}
    $(document).on('apexafterrefresh', function () { setTimeout(styleCharts, 250); });
    $(window).on('apexready', function () { setTimeout(styleCharts, 350); });
  });
})();

/* ============================================================================
   Enterprise chart interactions (reusable across every dashboard chart).
     - hoverBehavior 'dim': the hovered bar / slice stays full strength, the rest
       fade back, so the active data point is the obvious focus. Native Oracle-JET
       behaviour, so it also works from the LEGEND and by keyboard, and needs no
       per-chart wiring.
     - live donut centre: shows the whole total by default, and the hovered
       segment's share (name / % of total / value) while the pointer is over it,
       restoring the total on leave.
   Pure presentation: no DB request, no submit, no region refresh, no chart
   re-render. Scoped to .oj-chart, idempotent, and re-applied after every APEX
   region refresh so filters never break it. Motion-free (opacity + text), so it
   already honours prefers-reduced-motion.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  /* DISABLED FOR SPEED (charts now render FLAT, no gradient fills): JET's own
     hover-dim + tooltip work natively on flat #hex fills and do NOT crash (the
     getColor() crash only happened with url() gradient fills). So this whole IIFE
     — the hoverBehavior override (a re-render per chart), a document-body-wide
     MutationObserver, and the custom donut-centre/hover — is no longer needed.
     Dropping it removes one re-render per chart AND one body-wide observer, a big
     part of what made HSPL charts slower than MKSPL's zero-JS charts. */
  return;
  var $ = apex.jQuery;

  var PALETTE = ['#7B6EF6','#1BB5A8','#57C97D','#F5C242','#4C8DF5','#F2789F','#A78BFA','#F59842','#3FC5DE','#8B8FC9'];
  function nfmt(v) { return Math.round(v).toLocaleString('en-IN'); }
  function compact(v) {
    var n = Math.round(v);
    if (n >= 1e7) return (n / 1e7).toFixed(2).replace(/\.?0+$/, '') + ' Cr';
    if (n >= 1e5) return (n / 1e5).toFixed(2).replace(/\.?0+$/, '') + ' L';
    if (n >= 1e3) return (n / 1e3).toFixed(2).replace(/\.?0+$/, '') + 'K';
    return nfmt(n);
  }

  function donutCentre(el) {
    var series;
    try { series = $(el).ojChart('option', 'series') || []; } catch (e) { return; }
    var data = series.map(function (s) {
      return { name: s.name, value: (s.items && s.items[0] ? +s.items[0].value : 0) };
    }).filter(function (d) { return d.value > 0; });
    if (!data.length) return;
    var total = data.reduce(function (a, b) { return a + b.value; }, 0);
    var svg = el.querySelector('svg'); if (!svg) return;

    var host = el.querySelector('.js-chart-container') || el;
    host.classList.add('hspl-donut-host');

    /* STATIC centre — the grand total, set ONCE and never touched on hover, so there is
       zero per-move work in the middle of the ring (that was the lag). */
    var c = host.__hsplCentre;
    if (!c || !c.isConnected) {
      c = document.createElement('div');
      c.className = 'hspl-donut-centre';
      c.innerHTML = '<span class="hspl-dc-t"></span><span class="hspl-dc-n"></span><span class="hspl-dc-s"></span>';
      host.appendChild(c);
      host.__hsplCentre = c;
    }
    c.children[0].textContent = 'Total';
    c.children[1].textContent = nfmt(total);
    c.children[2].textContent = data.length + ' segments';

    /* Hover detail CARD, floated to the right of the ring (like the reference): name +
       Value + Share of total. On hover we only swap three bits of text and toggle a
       class — cheap, no chart work. */
    var card = host.__hsplCard;
    if (!card || !card.isConnected) {
      card = document.createElement('div');
      card.className = 'hspl-donut-card';
      card.innerHTML =
        '<div class="hspl-card-head"><span class="hspl-card-dot"></span><span class="hspl-card-name"></span></div>' +
        '<div class="hspl-card-row"><span class="hspl-card-k">Value</span><span class="hspl-card-v hspl-card-val"></span></div>' +
        '<div class="hspl-card-row"><span class="hspl-card-k">Share of total</span><span class="hspl-card-v hspl-card-pct"></span></div>';
      host.appendChild(card);
      host.__hsplCard = card;
    }
    var qName = card.querySelector('.hspl-card-name'), qDot = card.querySelector('.hspl-card-dot'),
        qVal = card.querySelector('.hspl-card-val'), qPct = card.querySelector('.hspl-card-pct');

    /* Candidate wedge paths: a solid palette #hex fill or an already-glossed url(#hsplGloss…).
       But JET/the gloss also touch a couple of tiny non-slice paths (e.g. zero-value or ring
       artifacts), so the count won't match the data — mapping by DOM order would mislabel.
       Instead pick the REAL slices as the data.length paths with the largest getTotalLength,
       then map them to data by size-rank ↔ value-rank (bigger value = bigger arc = longer
       path). getTotalLength is intrinsic path geometry (NOT layout-dependent), so — unlike
       getBBox — it does NOT force a page reflow: ~4ms for every chart path on the page. No
       getBBox, no getPointAtLength, no per-move work → no freeze. */
    var glossed = [].slice.call(svg.querySelectorAll('path[fill]')).filter(function (p) {
      var f = p.getAttribute('fill') || '';
      return /^#[0-9A-Fa-f]{6}$/.test(f) || /url\(#hsplGloss/.test(f);
    });
    var ranked = glossed.map(function (p) { var L = 0; try { L = p.getTotalLength(); } catch (e) {} return { p: p, L: L }; })
                        .sort(function (a, b) { return b.L - a.L; });
    var slices = ranked.slice(0, data.length).map(function (x) { return x.p; });   /* real wedges only */
    var dataRank = data.map(function (d, i) { return { i: i, v: d.value }; }).sort(function (a, b) { return b.v - a.v; });
    slices.forEach(function (p, k) { p.__dataIdx = (dataRank[k] ? dataRank[k].i : k); });  /* size-rank ↔ value-rank */

    /* Show a slice's detail: dim the others (opacity only — composited, no layout) and swap
       the card's three text bits. Cheap: no geometry, no getBBox, no chart re-render. */
    function show(idx) {
      slices.forEach(function (p) { p.style.opacity = (idx == null || p.__dataIdx === idx) ? '' : '0.4'; });
      if (idx == null || !data[idx]) { card.classList.remove('is-on'); return; }
      var d = data[idx];
      qName.textContent = d.name;
      qDot.style.background = PALETTE[idx % PALETTE.length];
      qVal.textContent = compact(d.value);
      qPct.textContent = Math.round(d.value / total * 100) + '%';
      card.classList.add('is-on');
    }
    host.__hsplShow = show;   /* keep the latest closure so the once-bound mouseleave uses current data */

    /* Hover wiring: a plain mouseenter per real slice PATH — NO mousemove, NO getPointAtLength,
       NO getScreenCTM, NO getBBox. This is what killed the freeze: the old hover ran a getBBox
       sweep over every slice on EVERY mouse move (each a ~130ms full-page relayout on a busy
       dashboard). */
    slices.forEach(function (p) {
      if (p.__hsplHover) return; p.__hsplHover = 1;
      p.style.transition = 'opacity 80ms ease';
      p.addEventListener('mouseenter', function () { show(p.__dataIdx); });
    });
    if (!host.__hsplLeave) {
      host.__hsplLeave = 1;
      host.addEventListener('mouseleave', function () { if (host.__hsplShow) host.__hsplShow(null); });
    }

    /* Pin the centre total to the ring's true middle. The ring is NOT vertically centred in
       the host (it sits high when the chart reserves space below), so pure CSS top:50% would
       drop the total too low — we nudge it once. This reads client rects (a forced layout),
       so it runs EXACTLY ONCE per donut (guarded) and again only on resize — never per pass
       and never per mouse-move (that repetition was the freeze). Reads are batched before the
       write. If it can't measure yet, the CSS 50%/50% default still shows something sane. */
    function positionCentre() {
      if (!slices.length) return;
      var hr = host.getBoundingClientRect(); if (!hr.width) return;
      var minX = 1e9, minY = 1e9, maxX = -1e9, maxY = -1e9, found = false;
      slices.forEach(function (p) { var r = p.getBoundingClientRect(); if (r.width < 2 || r.height < 2) return; found = true; if (r.left < minX) minX = r.left; if (r.top < minY) minY = r.top; if (r.right > maxX) maxX = r.right; if (r.bottom > maxY) maxY = r.bottom; });
      if (!found) return;
      c.style.left = (((minX + maxX) / 2 - hr.left) / hr.width * 100) + '%';
      c.style.top = (((minY + maxY) / 2 - hr.top) / hr.height * 100) + '%';
    }
    host.__hsplPos = positionCentre;   /* latest closure, so the once-bound resize uses fresh slices */
    if (!host.__hsplPositioned) { host.__hsplPositioned = 1; positionCentre(); }
    if (!host.__hsplResize) {
      host.__hsplResize = 1;
      $(window).on('resize', function () { clearTimeout(host.__hsplRT); host.__hsplRT = setTimeout(function () { if (host.__hsplPos) host.__hsplPos(); }, 120); });
    }
  }

  function apply() {
    $('.oj-chart').each(function () {
      var el = this, t;
      try { t = $(el).ojChart('option', 'type'); } catch (e) { return; }
      /* Set hoverBehavior:'none' (and, for pies, the null tooltip) ONCE per chart, in a
         SINGLE option call so it costs at most one re-render — not one per pass.
         WHY hoverBehavior 'none': our bars carry url(#…) gradient series colours and our
         slices carry url(#hsplGloss…) fills; JET's built-in hover effect calls
         getFill().getColor() to compute a hover shade, which THROWS on a gradient paint
         ("getColor is not a function") and leaves the chart half-rendered (the "faulty
         chart on hover" glitch). We supply our own hover, so JET's is not needed. The pie
         null-tooltip suppresses JET's native tooltip so it doesn't overlap our card. */
      if (!el.__hsplChartOpt) {
        el.__hsplChartOpt = 1;
        try {
          /* Only kill JET's built-in HOVER-DIM (it throws getColor() on our gradient
             fills). Leave JET's native TOOLTIP on — it's built-in and cheap and gives the
             slice name/value on hover with ZERO custom compute. */
          $(el).ojChart('option', { hoverBehavior: 'none' });
        } catch (e) {}
      }
      /* CUSTOM donut hover + centre-total REMOVED for speed (per request): it read client
         rects to place the centre and wired per-slice mouseenter listeners. Charts now do
         no per-chart JS beyond the one-time palette/gradient + this hoverBehavior set. */
    });
  }

  $(function () {
    var pend;
    function schedule() { clearTimeout(pend); pend = setTimeout(apply, 50); }
    requestAnimationFrame(apply);
    /* catch charts that render late (slow SQL) without long polling — react only to added
       chart/svg nodes, so gloss/hover attach whenever a chart finally appears. */
    try {
      new MutationObserver(function (muts) {
        for (var i = 0; i < muts.length; i++) {
          var an = muts[i].addedNodes;
          for (var j = 0; j < an.length; j++) {
            var n = an[j];
            if (n.nodeType === 1 && (n.tagName === 'svg' || (n.querySelector && n.querySelector('.oj-chart svg, svg')))) { schedule(); return; }
          }
        }
      }).observe(document.body, { childList: true, subtree: true });
    } catch (e) {}
    $(document).on('apexafterrefresh', schedule);
    $(window).on('apexready', schedule);
  });
})();

/* Interactive-Report cell wrap moved to a STATIC CSS rule in design-system.css
   (`body:not(.t-PageBody--login) .a-IRR-table td:not(.u-tR)`, which out-specifies APEX's
   0,2,2 nowrap rule). The former JS style-injection raced APEX's fixed-header table
   CLONE (a fresh id each refresh), which was the "overlaps ~2s then fixes" glitch. Pure
   CSS applies to the original and the clone on first paint — no JS, no timing, no flip. */

/* ==========================================================================
   Alt + L — open the app Search dialog from anywhere (same as clicking the
   "Search" nav-bar item, which fires an APEX #action$a-dialog-open link).
   ========================================================================== */
(function () {
  if (!window.document) return;
  function findSearch() {
    var staticItem = document.getElementById('nbsp');
    if (staticItem) {
      if (staticItem.matches && staticItem.matches('a,button')) return staticItem;
      var staticLink = staticItem.querySelector('a,button');
      if (staticLink) return staticLink;
    }
    var links = document.querySelectorAll('a.t-Button--header, .t-NavigationBar-item a, .t-Header-navBar a, a[href*="openRegion"]');
    for (var i = 0; i < links.length; i++) {
      var t = (links[i].textContent || '').trim();
      var target = links[i].getAttribute('href') || '';
      if (/global_search/i.test(target) || /^search\b/i.test(t) || /search/i.test(links[i].getAttribute('aria-label') || '')) return links[i];
    }
    return null;
  }
  function enhanceSearch() {
    var trigger = findSearch();
    if (!trigger) return;
    trigger.setAttribute('aria-label', 'Search — shortcut Alt + L');
    trigger.setAttribute('title', 'Search (Alt + L)');
    trigger.setAttribute('data-search-shortcut', 'Alt+L');
    if (!trigger.querySelector('.hspl-search-shortcut')) {
      var hint = document.createElement('kbd');
      hint.className = 'hspl-search-shortcut';
      hint.textContent = 'Alt+L';
      hint.setAttribute('aria-hidden', 'true');
      trigger.appendChild(hint);
    }
  }
  function openSearch() {
    if (window.apex && apex.theme && typeof apex.theme.openRegion === 'function') {
      apex.theme.openRegion('global_search');
    } else {
      var trigger = findSearch();
      if (trigger) trigger.click();
    }
    setTimeout(function () {
      var input = document.getElementById('P0_NEW');
      if (input) input.focus();
    }, 0);
  }
  document.addEventListener('keydown', function (e) {
    if (e.altKey && !e.ctrlKey && !e.metaKey && !e.shiftKey && (e.key === 'l' || e.key === 'L')) {
      e.preventDefault();
      e.stopImmediatePropagation();
      openSearch();
    }
  }, true);
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', enhanceSearch, { once: true });
  else enhanceSearch();
  if (window.apex && apex.jQuery) apex.jQuery(document).on('apexreadyend.hsplSearchShortcut apexafterrefresh.hsplSearchShortcut', enhanceSearch);
})();

/* Global Search results are rendered asynchronously by the native Search
   region. Give each complete result card a roving keyboard focus without
   replacing the region or changing its link behaviour. */
(function () {
  function input() { return document.getElementById('P0_NEW'); }
  function root() {
    var field = input();
    /* APEX re-parents the region into a jQuery-UI dialog. Prefer that live
       wrapper over the original region, whose source node can remain hidden. */
    return (field && field.closest('.ui-dialog')) || document.getElementById('global-search');
  }
  function results() {
    var scope = root();
    if (!scope) return [];
    var cards = [];
    Array.prototype.forEach.call(scope.querySelectorAll('.a-SearchResults-item, .a-SearchResult'), function (card) {
      if (card.offsetParent === null || card.closest('.ui-dialog-titlebar,.t-Region-header') ||
          !card.querySelector('a[href],[role="link"]') || cards.indexOf(card) >= 0) return;
      cards.push(card);
    });
    return cards;
  }
  function linkFor(card) {
    return card && card.querySelector('a[href],[role="link"]');
  }
  function activeIndex(items) {
    var current = document.activeElement;
    return items.indexOf(current);
  }
  function activate(items, index) {
    if (!items.length) return;
    index = Math.max(0, Math.min(items.length - 1, index));
    items.forEach(function (item, itemIndex) {
      item.tabIndex = itemIndex === index ? 0 : -1;
      item.classList.toggle('hspl-search-result-active', itemIndex === index);
    });
    items[index].focus({ preventScroll: true });
    try { items[index].scrollIntoView({ block: 'nearest' }); } catch (ignore) {}
  }
  function initialise() {
    results().forEach(function (item) {
      if (item.dataset.hsplSearchKeyboard) return;
      item.dataset.hsplSearchKeyboard = '1';
      item.tabIndex = -1;
      item.setAttribute('role', 'link');
      var link = linkFor(item);
      if (link && !item.getAttribute('aria-label')) item.setAttribute('aria-label', link.textContent.trim());
      item.addEventListener('pointerdown', function () {
        results().forEach(function (other) { other.classList.remove('hspl-search-result-active'); });
        item.classList.add('hspl-search-result-active');
      });
      /* A result is one hit area.  The native region places a smaller link
         inside the coloured card, which made its unused right-hand side feel
         inactive. Keep the destination link and let the complete card invoke
         it when its non-interactive surface is clicked. */
      item.addEventListener('click', function (event) {
        if (event.target.closest('a[href],button,input,select,textarea,label')) return;
        var destination = linkFor(item);
        if (!destination) return;
        event.preventDefault();
        destination.click();
      });
    });
  }
  document.addEventListener('keydown', function (event) {
    var field = input();
    if (!field || field.offsetParent === null) return;
    var items = results();
    if (!items.length) return;
    var onSearch = event.target === field || items.indexOf(event.target) >= 0;
    if (!onSearch) return;
    var current = activeIndex(items);
    if (event.key === 'ArrowDown') {
      event.preventDefault(); activate(items, current < 0 ? 0 : current + 1);
    } else if (event.key === 'ArrowUp') {
      event.preventDefault(); activate(items, current < 0 ? items.length - 1 : current - 1);
    } else if (event.key === 'Home') {
      event.preventDefault(); activate(items, 0);
    } else if (event.key === 'End') {
      event.preventDefault(); activate(items, items.length - 1);
    } else if (event.key === 'Enter' && current >= 0) {
      var link = linkFor(items[current]);
      if (link) { event.preventDefault(); link.click(); }
    }
  }, true);
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initialise, { once: true });
  else initialise();
  if (window.apex && apex.jQuery) apex.jQuery(document).on('apexafterrefresh.hsplGlobalSearchKeyboard', initialise);
  /* The native search region refreshes asynchronously. Limit observation to
     its dialog so table/report rendering elsewhere cannot make search work. */
  function observeSearch() {
    var scope = root();
    if (!scope || scope.dataset.hsplSearchObserved) return;
    scope.dataset.hsplSearchObserved = '1';
    try { new MutationObserver(initialise).observe(scope, { childList: true, subtree: true }); } catch (ignore) {}
  }
  document.addEventListener('apexafterrefresh', observeSearch);
  setTimeout(observeSearch, 0);
})();

/* ==========================================================================
   HTML/SVG DONUT — replaces the Oracle-JET pie/donut charts. A classicReport emits
     <div class="ds-svgdonut" data-total-label="…" data-json='[{"l","v","sub","u"}]'></div>
   and this draws the ring in pure SVG: INSTANT (no JET, no ojtranslations load, no
   solid→gloss flip), same look (subtle-gloss slices, static centre Total, right hover
   card, bottom legend) and working (hover detail + optional drill via "u"). Reusable
   across every dashboard donut; bars are left as JET charts.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery, NS = 'http://www.w3.org/2000/svg';
  var PAL = ['#2E73C4','#26A69A','#4CAF7D','#F5A623','#5B7FA6','#1E3A5F','#57B6E0','#EFB021','#8497B0','#C0607A'];
  function shade(hex, a) { var n = parseInt(hex.slice(1), 16), r = Math.max(0, Math.min(255, (n >> 16) + a)), g = Math.max(0, Math.min(255, ((n >> 8) & 255) + a)), b = Math.max(0, Math.min(255, (n & 255) + a)); return '#' + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1); }
  function nfmt(v) { return Math.round(v).toLocaleString('en-IN'); }
  function compact(v) { var n = Math.round(v); if (n >= 1e7) return (n / 1e7).toFixed(2).replace(/\.?0+$/, '') + ' Cr'; if (n >= 1e5) return (n / 1e5).toFixed(2).replace(/\.?0+$/, '') + ' L'; if (n >= 1e3) return (n / 1e3).toFixed(2).replace(/\.?0+$/, '') + 'K'; return nfmt(n); }
  function svgel(tag, attrs) { var e = document.createElementNS(NS, tag); for (var k in attrs) e.setAttribute(k, attrs[k]); return e; }
  function polar(cx, cy, r, a) { return [cx + r * Math.cos(a), cy + r * Math.sin(a)]; }
  function arcPath(cx, cy, rI, rO, a0, a1) {
    var large = (a1 - a0) > Math.PI ? 1 : 0;
    var o0 = polar(cx, cy, rO, a0), o1 = polar(cx, cy, rO, a1), i1 = polar(cx, cy, rI, a1), i0 = polar(cx, cy, rI, a0);
    return 'M' + o0[0] + ' ' + o0[1] + ' A' + rO + ' ' + rO + ' 0 ' + large + ' 1 ' + o1[0] + ' ' + o1[1] +
           ' L' + i1[0] + ' ' + i1[1] + ' A' + rI + ' ' + rI + ' 0 ' + large + ' 0 ' + i0[0] + ' ' + i0[1] + ' Z';
  }
  function ringPath(cx, cy, rI, rO) {   /* full 100% slice: outer CW + inner CCW, even-odd */
    return 'M' + (cx - rO) + ' ' + cy + ' a' + rO + ' ' + rO + ' 0 1 0 ' + (2 * rO) + ' 0 a' + rO + ' ' + rO + ' 0 1 0 ' + (-2 * rO) + ' 0 Z' +
           'M' + (cx - rI) + ' ' + cy + ' a' + rI + ' ' + rI + ' 0 1 1 ' + (2 * rI) + ' 0 a' + rI + ' ' + rI + ' 0 1 1 ' + (-2 * rI) + ' 0 Z';
  }
  var seq = 0;
  function draw(host) {
    if (host.__svgDone) return;
    var data; try { data = JSON.parse(host.getAttribute('data-json') || '[]'); } catch (e) { return; }
    data = data.filter(function (d) { return +d.v > 0; });
    host.__svgDone = 1;
    if (!data.length) { host.innerHTML = '<div class="ds-svgd-empty">No data for the current filters</div>'; return; }
    var total = data.reduce(function (a, b) { return a + (+b.v); }, 0);
    var totalLabel = host.getAttribute('data-total-label') || (data.length + ' segments');
    var S = 250, cx = 125, cy = 125, rO = 112, rI = 68;
    var svg = svgel('svg', { viewBox: '0 0 ' + S + ' ' + S, 'class': 'ds-svgd-svg' });
    var defs = svgel('defs', {}); svg.appendChild(defs);
    var a0 = -Math.PI / 2, slices = [];
    data.forEach(function (d, i) {
      var base = PAL[i % PAL.length], gid = 'svgd' + (++seq);
      var g = svgel('linearGradient', { id: gid, x1: '0', y1: '0', x2: '0.35', y2: '1' });
      [['0%', 46], ['50%', 0], ['100%', -40]].forEach(function (st) { g.appendChild(svgel('stop', { offset: st[0], 'stop-color': shade(base, st[1]) })); });
      defs.appendChild(g);
      var frac = (+d.v) / total, a1 = a0 + frac * 2 * Math.PI;
      var pd = frac >= 0.9999 ? ringPath(cx, cy, rI, rO) : arcPath(cx, cy, rI, rO, a0, a1 - 0.006);
      var p = svgel('path', { d: pd, fill: 'url(#' + gid + ')', 'class': 'ds-svgd-slice' });
      if (frac >= 0.9999) p.setAttribute('fill-rule', 'evenodd');
      svg.appendChild(p); slices.push(p);
      a0 = a1;
    });
    host.innerHTML = '';
    var wrap = document.createElement('div'); wrap.className = 'ds-svgd-wrap';
    var box = document.createElement('div'); box.className = 'ds-svgd-chart'; box.appendChild(svg);
    var centre = document.createElement('div'); centre.className = 'hspl-donut-centre ds-svgd-centre';
    centre.innerHTML = '<span class="hspl-dc-t">Total</span><span class="hspl-dc-n">' + nfmt(total) + '</span><span class="hspl-dc-s">' + totalLabel + '</span>';
    box.appendChild(centre);
    var card = document.createElement('div'); card.className = 'hspl-donut-card ds-svgd-card';
    card.innerHTML = '<div class="hspl-card-head"><span class="hspl-card-dot"></span><span class="hspl-card-name"></span></div>' +
      '<div class="hspl-card-row"><span class="hspl-card-k">Value</span><span class="hspl-card-v hspl-card-val"></span></div>' +
      '<div class="hspl-card-row"><span class="hspl-card-k">Share of total</span><span class="hspl-card-v hspl-card-pct"></span></div>';
    var qn = card.querySelector('.hspl-card-name'), qd = card.querySelector('.hspl-card-dot'), qv = card.querySelector('.hspl-card-val'), qp = card.querySelector('.hspl-card-pct');
    var leg = document.createElement('div'); leg.className = 'ds-svgd-legend';
    data.forEach(function (d, i) {
      var it = document.createElement('span'); it.className = 'ds-svgd-leg';
      var dot = document.createElement('span'); dot.className = 'ds-svgd-legdot'; dot.style.background = PAL[i % PAL.length];
      it.appendChild(dot); it.appendChild(document.createTextNode(d.l || ''));
      leg.appendChild(it);
    });
    wrap.appendChild(box); wrap.appendChild(card); wrap.appendChild(leg); host.appendChild(wrap);
    function on(i) { slices.forEach(function (s, j) { s.style.opacity = j === i ? '' : '0.38'; }); var d = data[i]; qn.textContent = d.l; qd.style.background = PAL[i % PAL.length]; qv.textContent = compact(+d.v); qp.textContent = Math.round((+d.v) / total * 100) + '%'; card.classList.add('is-on'); }
    function off() { slices.forEach(function (s) { s.style.opacity = ''; }); card.classList.remove('is-on'); }
    slices.forEach(function (s, i) { s.style.transition = 'opacity 140ms ease'; s.addEventListener('mouseenter', function () { on(i); }); if (data[i].u) { s.style.cursor = 'pointer'; s.addEventListener('click', function () { window.location.href = data[i].u; }); } });
    svg.addEventListener('mouseleave', off);
    [].slice.call(leg.children).forEach(function (it, i) { it.addEventListener('mouseenter', function () { on(i); }); it.addEventListener('mouseleave', off); if (data[i].u) { it.style.cursor = 'pointer'; it.addEventListener('click', function () { window.location.href = data[i].u; }); } });
  }
  function scan() { document.querySelectorAll('.ds-svgdonut').forEach(draw); }
  $(function () {
    scan();
    $(document).on('apexafterrefresh', function () { setTimeout(scan, 30); });
    try {
      new MutationObserver(function (muts) {
        for (var i = 0; i < muts.length; i++) { var an = muts[i].addedNodes; for (var j = 0; j < an.length; j++) { var n = an[j]; if (n.nodeType === 1 && ((n.matches && n.matches('.ds-svgdonut')) || (n.querySelector && n.querySelector('.ds-svgdonut')))) { scan(); return; } } }
      }).observe(document.body, { childList: true, subtree: true });
    } catch (e) {}
  });
})();

/* ==========================================================================
   FILTER enhancements (every filter: the sliding .hspl-drawer AND the inline
   .ds-dash-filters). Two things: (1) rename the submit button to "Apply", and
   (2) inject a "Reset" button right beside it that reloads the page with its cache
   cleared, so all filter items return to their defaults. The sticky-footer layout
   (so Apply/Reset stay reachable on a tall filter) is in design-system.css.
   Idempotent; re-run when a drawer opens / a region refreshes.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  function resetUrl() {
    try { return 'f?p=' + apex.env.APP_ID + ':' + apex.env.APP_PAGE_ID + ':' + apex.env.APP_SESSION + '::NO:' + apex.env.APP_PAGE_ID; } catch (e) { return null; }
  }
  function label(el) { var l = el.querySelector('.t-Button-label'); return (l ? l.textContent : el.textContent || '').trim(); }
  function findApply(scope) {
    /* the filter's SUBMIT button — a standalone button (NOT a field's list-picker /
       "Search" button, which lives inside a .t-Form-fieldContainer). Prefer the primary
       (hot) button; else a standalone Apply/Refresh/Go. */
    var all = scope.querySelectorAll('button.t-Button, a.t-Button'), i;
    for (i = 0; i < all.length; i++) { if (!all[i].closest('.t-Form-fieldContainer') && all[i].classList.contains('t-Button--hot')) return all[i]; }
    for (i = 0; i < all.length; i++) { if (!all[i].closest('.t-Form-fieldContainer') && /^(apply|refresh|go)$/i.test(label(all[i]))) return all[i]; }
    return null;
  }
  function renameApply(apply) {
    var lbl = apply.querySelector('.t-Button-label');
    if (lbl) { if (lbl.textContent.trim() !== 'Apply') lbl.textContent = 'Apply'; }
    else if (apply.textContent.trim() !== 'Apply') { apply.textContent = 'Apply'; }
  }
  function makeReset() {
    var rb = document.createElement('button');
    rb.type = 'button';
    rb.className = 't-Button t-Button--icon t-Button--iconLeft hspl-reset-btn';
    rb.innerHTML = '<span class="t-Icon fa fa-undo" aria-hidden="true"></span><span class="t-Button-label">Reset</span>';
    rb.addEventListener('click', function () { var u = resetUrl(); if (u) { apex.navigation.redirect(u); } else { location.reload(); } });
    return rb;
  }
  /* Drawer: MOVE Apply + Reset into a dedicated flex footer at the bottom of the panel.
     Moving the button out of the item grid (rather than styling the grid row) is what
     keeps plugin fields — the Pretius Enhanced-LOV items — from collapsing, and makes
     the two buttons sit side-by-side and always visible without scrolling. */
  function enhanceDrawer(scope) {
    var wrap = scope.querySelector('.t-Region-bodyWrap'); if (!wrap) return;
    if (wrap.querySelector('.hspl-filter-footer')) return;
    var apply = findApply(scope); if (!apply || apply.closest('.hspl-filter-footer')) return;
    renameApply(apply);
    var footer = document.createElement('div'); footer.className = 'hspl-filter-footer';
    footer.appendChild(apply);
    footer.appendChild(makeReset());
    wrap.appendChild(footer);
  }
  /* Inline dashboard filter (.ds-dash-filters): no scroll, so just rename + drop Reset
     right beside Apply. */
  function enhanceInline(scope) {
    var apply = findApply(scope); if (!apply) return;
    var host = apply.parentElement; if (!host || host.querySelector('.hspl-reset-btn')) return;
    renameApply(apply);
    /* A few dashboard pages already ship a native Reset with page-specific
       clear-cache behaviour. Respect it instead of rendering a duplicate. */
    var controls = scope.querySelectorAll('button.t-Button, a.t-Button');
    for (var i = 0; i < controls.length; i++) {
      if (controls[i] !== apply && !controls[i].closest('.t-Form-fieldContainer') && /^reset$/i.test(label(controls[i]))) return;
    }
    apply.insertAdjacentElement('afterend', makeReset());
  }
  /* From Date + To Date on ONE full-width row (From left, To right), whatever the page's
     item sequence. Registers place these two inconsistently — some scatter them across
     different grid rows/columns (From on the right, To a row below on the left), which
     read as broken. This pulls both date fieldContainers into a flex row (.hspl-daterow,
     grid-column:1/-1 in design-system.css) so every filter shows the pair aligned and
     side-by-side. Idempotent: skips if already paired. Only the two date items move; no
     other field is touched (verified the Enhanced-LOV plugin widths stay intact). */
  function pairDates(scope) {
    var from = null, to = null;
    scope.querySelectorAll('.t-Form-fieldContainer').forEach(function (fc) {
      var l = ((fc.querySelector('.t-Form-label') || {}).textContent || '').trim().toUpperCase();
      if (l === 'FROM DATE') from = fc; else if (l === 'TO DATE') to = fc;
    });
    if (!from || !to || from.closest('.hspl-daterow')) return;
    var row = document.createElement('div'); row.className = 'hspl-daterow';
    var fromCol = from.closest('.col') || from.parentElement;
    fromCol.parentNode.insertBefore(row, fromCol);
    row.appendChild(from); row.appendChild(to);
  }
  function enhance() {
    /* pairDates ONLY on the register drawer: it is a 2-col CSS grid, where wrapping From/To
       into a full-width `.hspl-daterow` (grid-column:1/-1) lines them up cleanly. The inline
       dashboard filter (.ds-dash-filters) is a flex-wrap bar, NOT a grid — there From/To are
       already side-by-side naturally, and forcing them into a bundle shoved Company off to the
       far right (the "dashboard filters fucked up" regression). So inline gets rename+Reset only. */
    document.querySelectorAll('.hspl-drawer').forEach(function (s) { pairDates(s); enhanceDrawer(s); });
    document.querySelectorAll('.ds-dash-filters').forEach(enhanceInline);
  }
  var pend;
  function sched() { clearTimeout(pend); pend = setTimeout(enhance, 150); }
  $(function () {
    requestAnimationFrame(enhance);
    $(document).on('apexafterrefresh', sched);
    try {
      new MutationObserver(function (muts) {
        for (var i = 0; i < muts.length; i++) {
          var an = muts[i].addedNodes;
          for (var j = 0; j < an.length; j++) {
            var n = an[j];
            if (n.nodeType === 1 && ((n.matches && (n.matches('.hspl-drawer') || n.matches('.ds-dash-filters'))) || (n.querySelector && n.querySelector('.hspl-drawer .row, .ds-dash-filters button')))) { sched(); return; }
          }
        }
      }).observe(document.body, { childList: true, subtree: true });
    } catch (e) {}
  });
})();


/* ============================================================================
   KPI card in-page drill (Purchase Command Centre + any dashboard using
   data-kpi-goto). Clicking a .ds-kpi--clickable card scrolls to the register
   region named by its data-kpi-goto (a page htmlDomId) and flashes it, so every
   KPI card lands the user on the rows behind the number. Pure client navigation
   - no submit, no DB call. Scrolling a lazy region into view also loads it.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  function goTo(id) {
    var el = document.getElementById(id);
    if (!el) return;
    var top = el.getBoundingClientRect().top + window.pageYOffset - 72;
    try { window.scrollTo({ top: top, behavior: 'smooth' }); }
    catch (e) { window.scrollTo(0, top); }
    el.classList.remove('ds-goto-flash');
    void el.offsetWidth;               /* restart the animation */
    el.classList.add('ds-goto-flash');
    setTimeout(function () { el.classList.remove('ds-goto-flash'); }, 1800);
  }
  $(document).on('click', '[data-kpi-goto]', function (e) {
    e.preventDefault();
    goTo(this.getAttribute('data-kpi-goto'));
  });
  $(document).on('keydown', '[data-kpi-goto]', function (e) {
    if (e.which === 13 || e.which === 32) { e.preventDefault(); goTo(this.getAttribute('data-kpi-goto')); }
  });
})();


/* ============================================================================
   Purchase Command Centre (p00668) stage-drill handler. Delegated, so it lives in
   the app-wide theme instead of the page's 4000-byte jsCode. Clicking a stage in
   the Sourcing Funnel / Execution Pipeline sets the focus item, then shows the
   DEDICATED register for that stage (p668RegS<seq> / p668RegE<seq>) when one exists
   - hiding the others and the generic fallback - else refreshes the generic detail.
   Supports both the source dashboard page 668 and the Ironmart-compatible copy
   on page 934.  The visual/register static IDs intentionally stay p668-prefixed;
   only the APEX page item namespace changes between the two pages.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  $(document).off('click.p668drill').on('click.p668drill',
    '.ds-stage-drill,.ds-exec-drill,.ds-exc-drill',
    function (e) {
      e.preventDefault();
      var el = this, item, region, dedPrefix = null, groupSel = null;
      var itemPrefix = document.getElementById('P934_STAGE_FOCUS') ? 'P934_' : 'P668_';
      if (el.classList.contains('ds-stage-drill')) {
        item = itemPrefix + 'STAGE_FOCUS'; region = 'p668StageDetail';
        dedPrefix = 'p668RegS'; groupSel = '#p668StageDetail,.ds-srcreg';
      } else if (el.classList.contains('ds-exec-drill')) {
        item = itemPrefix + 'EXEC_FOCUS'; region = 'p668ExecDetail';
        dedPrefix = 'p668RegE'; groupSel = '#p668ExecDetail,.ds-execreg';
      } else {
        item = itemPrefix + 'EXC_FOCUS'; region = 'p668ExcDetail';
      }
      var seq = el.getAttribute('data-k');
      try { apex.item(item).setValue(seq); } catch (err) { return; }
      var targetId = region;
      if (dedPrefix && document.getElementById(dedPrefix + seq)) targetId = dedPrefix + seq;
      if (groupSel) {
        document.querySelectorAll(groupSel).forEach(function (n) {
          n.classList.toggle('ds-reg-hidden', n.id !== targetId);
        });
      }
      try { apex.region(targetId).refresh(); } catch (err) {}
      var t = document.getElementById(targetId);
      if (t) t.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
})();

/* ============================================================================
   Sales Lifecycle Control Tower KPI registers. Each Lifecycle Pulse card opens
   its complete in-dashboard register over AJAX, without a page submit/reload.
   The focus item also distinguishes the pending-order and missing-IRN subsets.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  function openRegister(el) {
    var focus = el.getAttribute('data-focus') || 'SC';
    var targetId = el.getAttribute('data-reg') || 'p730ScRegister';
    try { apex.item('P730_REGISTER_FOCUS').setValue(focus); } catch (err) { return; }
    document.querySelectorAll('.ds-slc-kpireg').forEach(function (n) {
      n.classList.toggle('ds-reg-hidden', n.id !== targetId);
    });
    try { apex.region(targetId).refresh(); } catch (err) {}
    document.querySelectorAll('.ds-slc-register-drill.is-active').forEach(function (n) {
      n.classList.remove('is-active');
    });
    el.classList.add('is-active');
    var t = document.getElementById(targetId);
    if (t) t.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }
  $(document).off('click.p730register').on('click.p730register', '.ds-slc-register-drill', function (e) {
    e.preventDefault(); openRegister(this);
  });
  $(document).off('keydown.p730register').on('keydown.p730register', '.ds-slc-register-drill', function (e) {
    if (e.which === 13 || e.which === 32) { e.preventDefault(); openRegister(this); }
  });
})();


/* ============================================================================
   Sales Lifecycle Control Tower (p730) stage drill. Clicking a funnel stage or a
   bottleneck card (.ds-slc-drill, data-k = stage seq 10..70) sets P730_STAGE_FOCUS
   and refreshes the Stage Documents register. No-ops on pages without the class.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  $(document).off('click.p730drill').on('click.p730drill', '.ds-slc-drill', function (e) {
    e.preventDefault();
    var seq = this.getAttribute('data-k');
    try { apex.item('P730_STAGE_FOCUS').setValue(seq); } catch (err) { return; }
    try { apex.region('p730StageDetail').refresh(); } catch (err) {}
    document.querySelectorAll('.ds-slc-stage.is-active').forEach(function (n) { n.classList.remove('is-active'); });
    if (this.classList.contains('ds-slc-stage')) this.classList.add('is-active');
    var t = document.getElementById('p730StageDetail');
    if (t) t.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
})();

/* p730 exception summary/donut drill: one AJAX-only path for both controls. */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  window.hsplP730ExceptionDrill = function (label) {
    if (!label) return false;
    try { apex.item('P730_EXCEPTION_FOCUS').setValue(label); } catch (err) { return false; }
    try { apex.region('p730Exceptions').refresh(); } catch (err) {}
    var t = document.getElementById('p730Exceptions');
    if (t) t.scrollIntoView({ behavior: 'smooth', block: 'start' });
    return false;
  };
  $(document).off('click.p730exc').on('click.p730exc', '.ds-exception-count', function (e) {
    e.preventDefault();
    window.hsplP730ExceptionDrill(this.getAttribute('data-exc') || '');
  });
})();

/* p730 vehicle KPI drill: refresh the exact live condition without a page submit. */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  $(document).off('click.p730vehicle').on('click.p730vehicle', '.ds-vehicle-kpi', function (e) {
    e.preventDefault();
    var focus = this.getAttribute('data-v') || 'INSIDE';
    try { apex.item('P730_VEHICLE_FOCUS').setValue(focus); } catch (err) { return; }
    try { apex.region('p730LiveVehicles').refresh(); } catch (err) {}
    var t = document.getElementById('p730LiveVehicles');
    if (t) t.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
})();

/* ============================================================================
   Sales Lifecycle Control Tower (p730) Category-Flow drill. Clicking "View lines"
   (.ds-cflow-drill, data-c/data-o = confirmed/order category codes) sets
   P730_CFLOW_C/P730_CFLOW_O and refreshes the Confirmation-vs-Order detail
   register. No-ops on pages without the class.
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  $(document).off('click.p730cflow').on('click.p730cflow', '.ds-cflow-drill', function (e) {
    e.preventDefault();
    try {
      apex.item('P730_CFLOW_C').setValue(this.getAttribute('data-c') || '');
      apex.item('P730_CFLOW_O').setValue(this.getAttribute('data-o') || '');
    } catch (err) { return; }
    try { apex.region('p730CatFlowDetail').refresh(); } catch (err) {}
    var t = document.getElementById('p730CatFlowDetail');
    if (t) t.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
})();



/* Material In: compact live completion meter in the existing notice bar. */
(function () {
  if (!document.documentElement.classList.contains('page-69')) return;
  var actionPlacementObserver = null;
  var stickySizeObserver = null;

  function syncMaterialInStickyOffset() {
    var hero = document.querySelector('.hspl-po-hero');
    if (!hero) return;
    var top = parseFloat(window.getComputedStyle(hero).top) || 0;
    document.documentElement.style.setProperty(
      '--hspl-mi-assistant-top',
      Math.ceil(top + hero.getBoundingClientRect().height + 10) + 'px'
    );
    if (!stickySizeObserver && window.ResizeObserver) {
      stickySizeObserver = new ResizeObserver(syncMaterialInStickyOffset);
      stickySizeObserver.observe(hero);
    }
  }

  /* Move the existing APEX region instead of cloning its buttons. All original
     button IDs, dynamic actions, disabled states and server-side behaviour stay
     attached to the same nodes. */
  function placeMaterialInActions() {
    var side = document.querySelector('.hspl-mi-hero-side');
    var actions = document.getElementById('R717089552420977799');
    if (!side || !actions) return false;
    if (side.contains(actions)) {
      if (actionPlacementObserver) actionPlacementObserver.disconnect();
      return true;
    }
    side.appendChild(actions);
    syncMaterialInStickyOffset();
    if (actionPlacementObserver) actionPlacementObserver.disconnect();
    return true;
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', placeMaterialInActions);
  } else {
    placeMaterialInActions();
  }
  document.addEventListener('apexreadyend', placeMaterialInActions);
  window.addEventListener('resize', syncMaterialInStickyOffset, { passive: true });
  if (window.apex && apex.jQuery) {
    apex.jQuery(document).on('apexafterrefresh.miHeaderActions', placeMaterialInActions);
  }
  [0, 120, 350, 900, 1800].forEach(function (delay) {
    setTimeout(placeMaterialInActions, delay);
  });
  try {
    actionPlacementObserver = new MutationObserver(function () {
      placeMaterialInActions();
    });
    actionPlacementObserver.observe(document.documentElement, { childList: true, subtree: true });
    setTimeout(function () {
      if (actionPlacementObserver) actionPlacementObserver.disconnect();
    }, 3000);
  } catch (ignore) { /* scheduled lifecycle attempts remain active */ }
})();

/* Material In: compact live completion meter in the existing notice bar. */
(function(){if(!document.documentElement.classList.contains('page-69'))return;var f=['P69_LOCATIONCODE','P69_MATERIALINDATE','P69_DOCTYPECODE','P69_PARTYCODE','P69_REFDOCTYPECODE','P69_REFDOCNO'];function v(id){try{return String(apex.item(id).getValue()||'').trim()}catch(e){var x=document.getElementById(id);return x?String(x.value||'').trim():''}}function u(){var m=document.querySelector('#SR_General .mi-message');if(!m)return;var c=m.querySelector('.mi-completion');if(!c){c=document.createElement('div');c.className='mi-completion';c.setAttribute('aria-live','polite');c.innerHTML='<span><b>0%</b><small>Complete</small></span><i><em></em></i>';var q=m.querySelector('button');m.insertBefore(c,q||null)}var d=f.filter(function(id){return!!v(id)}).length,p=Math.round(d/f.length*100);c.querySelector('b').textContent=p+'%';c.querySelector('em').style.width=p+'%';c.setAttribute('aria-label',d+' of '+f.length+' required fields complete')}function i(){u();document.addEventListener('change',u,true);document.addEventListener('input',u,true);if(window.apex&&apex.jQuery)apex.jQuery(document).on('apexafterrefresh.miCompletion',u)}if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',i);else i()})();

/* Retry completion setup after Page 69's own UI enhancement inserts the notice. */
(function(){if(!document.documentElement.classList.contains('page-69'))return;function boot(){document.dispatchEvent(new Event('input',{bubbles:true}))}setTimeout(boot,250);setTimeout(boot,900);setTimeout(boot,1800)})();

/* Purchase Order (page 118): use the already-finished Material In form shell.
   The nodes reparented here are the original page heading and action controls;
   their IDs, APEX dynamic actions and submit/navigation behaviour remain
   unchanged.  Material In is deliberately not selected or modified. */
(function () {
  "use strict";
  var doc = document;

  function isPurchaseOrder() {
    return /(?:^|\s)page-118(?:\s|$)/.test(
      (doc.documentElement.className || "") + " " + ((doc.body && doc.body.className) || "")
    );
  }
  function build() {
    if (!isPurchaseOrder()) return;
    var hero = doc.querySelector(".t-Body-title");
    if (!hero) return;
    /* The generic transaction shell can attach the late-rendered legacy
       #back control after this page shell has been built. Keep hiding that
       duplicate on every scheduled pass. */
    Array.prototype.forEach.call(hero.querySelectorAll("button[id='back'], .t-Button[id='back']"), function (button) {
      button.classList.add("hspl-po-legacy-back");
      button.setAttribute("aria-hidden", "true");
      button.tabIndex = -1;
    });
    var existingActions = hero.querySelector(".hspl-form-hero-actions");
    if (existingActions) {
      Array.prototype.forEach.call(existingActions.children, function (region) {
        if (region.classList && region.classList.contains("t-ButtonRegion--dialogRegion")) {
          region.style.setProperty("display", "none", "important");
        }
      });
      var existingRegion = existingActions.querySelector(".t-ButtonRegion:not(.t-ButtonRegion--dialogRegion)");
      if (existingRegion) {
        existingRegion.style.setProperty("display", "flex", "important");
        existingRegion.style.setProperty("box-sizing", "border-box", "important");
        existingRegion.style.setProperty("width", "auto", "important");
        existingRegion.style.setProperty("max-width", "100%", "important");
        existingRegion.style.setProperty("flex", "0 1 auto", "important");
        existingRegion.style.setProperty("flex-wrap", "wrap", "important");
        existingRegion.style.setProperty("gap", "6px", "important");
        var existingWrap = existingRegion.querySelector(".t-ButtonRegion-wrap");
        if (existingWrap) {
          existingWrap.style.setProperty("width", "auto", "important");
          existingWrap.style.setProperty("display", "flex", "important");
          existingWrap.style.setProperty("flex-wrap", "wrap", "important");
        }
      }
    }
    if (hero.dataset.hsplPoShell === "1") return;
    var title = hero.querySelector("h1");
    if (!title) return;

    hero.dataset.hsplPoShell = "1";
    doc.body.classList.add("hspl-po-reference");
    /* Reuse the Material In header structure/classes.  Page 118 keeps its
       own content and button IDs, but renders through the same shell. */
    hero.classList.add("hspl-hero-card", "hspl-po-hero-card", "hspl-po-hero");
    /* The generic empty-title safeguard may already have supplied its icon
       before APEX paints this legacy heading. Page 118 owns the one icon in
       its Material-In-style header, so remove only that generated duplicate. */
    var generatedIcon = hero.querySelector(".hspl-hero-icon");
    if (generatedIcon) generatedIcon.remove();
    var icon = doc.createElement("div");
    icon.className = "hspl-mi-hero-icon hspl-po-reference-icon";
    /* Use the same receiving/entry glyph as the Material In transaction
       header, rather than the generic document-file glyph. */
    icon.innerHTML = '<span class="fa fa-sign-in" aria-hidden="true"></span>';

    var identity = doc.createElement("div");
    identity.className = "hspl-mi-identity";
    var copy = doc.createElement("div");
    copy.className = "hspl-po-reference-copy";
    var titleLine = doc.createElement("div");
    titleLine.className = "hspl-po-titleline";
    title.classList.add("hspl-po-title", "hspl-po-reference-title");
    titleLine.appendChild(title);
    var badge = doc.createElement("span");
    badge.className = "hspl-po-status hspl-po-reference-badge";
    badge.textContent = "Draft";
    titleLine.appendChild(badge);
    copy.appendChild(titleLine);
    var subtitle = doc.createElement("p");
    subtitle.className = "hspl-po-subtitle hspl-po-reference-subtitle";
    subtitle.textContent = "Create, manage and track purchase orders";
    copy.appendChild(subtitle);

    var side = doc.createElement("div");
    side.className = "hspl-mi-hero-side hspl-po-reference-side";
    var context = doc.createElement("div");
    context.className = "hspl-po-breadcrumb hspl-po-reference-context";
    context.innerHTML = '<span>Transaction</span><i>/</i><b>Purchase Order</b>';
    side.appendChild(context);
    var actions = doc.createElement("div");
    actions.className = "hspl-form-hero-actions";
    side.appendChild(actions);

    identity.appendChild(icon);
    identity.appendChild(copy);
    hero.insertBefore(identity, hero.firstChild);
    hero.appendChild(side);

    var buttonRegion = hero.querySelector(".t-ButtonRegion");
    if (buttonRegion && !actions.contains(buttonRegion)) actions.appendChild(buttonRegion);
    if (buttonRegion) {
      /* Material In's region is a 144px three-button strip. The PO template
         injects a 6px empty dialog region and applies inline layout values,
         so correct that template artifact at its source. */
      buttonRegion.style.setProperty("display", "flex", "important");
      buttonRegion.style.setProperty("box-sizing", "border-box", "important");
      buttonRegion.style.setProperty("width", "auto", "important");
      buttonRegion.style.setProperty("max-width", "100%", "important");
      buttonRegion.style.setProperty("flex", "0 1 auto", "important");
      buttonRegion.style.setProperty("flex-wrap", "wrap", "important");
      buttonRegion.style.setProperty("gap", "6px", "important");
      var buttonWrap = buttonRegion.querySelector(".t-ButtonRegion-wrap");
      if (buttonWrap) {
        buttonWrap.style.setProperty("width", "auto", "important");
        buttonWrap.style.setProperty("display", "flex", "important");
        buttonWrap.style.setProperty("flex-wrap", "wrap", "important");
      }
    }
    Array.prototype.forEach.call(actions.children, function (region) {
      if (region.classList && region.classList.contains("t-ButtonRegion--dialogRegion")) {
        region.style.setProperty("display", "none", "important");
      }
    });
    Array.prototype.forEach.call(hero.querySelectorAll("button[id='back'], .t-Button[id='back']"), function (button) {
      /* A legacy region emits the Font Awesome codepoint as literal text
         (\\f060). The proper Cancel/Back action is already the first action
         in the existing button region, so leave this duplicate node intact
         but exclude it from the visual header. */
      button.classList.add("hspl-po-legacy-back");
      button.setAttribute("aria-hidden", "true");
      button.tabIndex = -1;
    });
  }

  function start() { build(); [120, 500, 1200].forEach(function (delay) { setTimeout(build, delay); }); }
  /* The application script is emitted after the page markup. Build in this
     parser task so the original Page 118 actions enter their final hero before
     first paint; later lifecycle hooks remain fallbacks for lazy regions. */
  build();
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", start, { once: true });
  else start();
  doc.addEventListener("apexreadyend", start);
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplPurchaseOrderShell", start);
})();

/* Material In: keep the notice meter and Document Assistant contextual to the
   selected form step. Each tab reports only the fields relevant to that step. */
(function () {
  if (!document.documentElement.classList.contains('page-69')) return;
  var generalRequired = [
    { kind: 'item', id: 'P69_LOCATIONCODE', label: 'Location' },
    { kind: 'item', id: 'P69_MATERIALINDATE', label: 'Material In Date' },
    { kind: 'item', id: 'P69_DOCTYPECODE', label: 'Doc Type' },
    { kind: 'item', id: 'P69_PARTYCODE', label: 'Party' },
    { kind: 'item', id: 'P69_REFDOCTYPECODE', label: 'Ref Doc Type' },
    { kind: 'item', id: 'P69_REFDOCNO', label: 'Ref Doc No' }
  ];
  var requiredByPanel = {
    SR_General: generalRequired,
    SR_Detail: [
      { kind: 'grid', region: 'Detail', column: 'ITEMCODE', label: 'Item' },
      { kind: 'grid', region: 'Detail', column: 'ITEMSPECIFICATIONCODE', label: 'Item Specification' },
      { kind: 'grid', region: 'Detail', column: 'QUANTITY1', label: 'Primary Quantity', positive: true }
    ],
    SR_PersonalBelonging: [
      { kind: 'grid', region: 'PersonalBelonging', column: 'ATTRIBUTECODE', label: 'Attribute Name' },
      { kind: 'grid', region: 'PersonalBelonging', column: 'ATTRIBUTEVALUE', label: 'Attribute Value' }
    ],
    SR_R1026751010212889983: [
      { kind: 'attachment', label: 'Attachment' }
    ]
  };
  function itemValue(id) {
    var value = '';
    try { value = String(apex.item(id).getValue() || '').trim(); } catch (ignore) {}
    if (value) return value;
    var element = document.getElementById(id) || document.getElementById(id + '_input');
    return element ? String(element.value || element.textContent || '').trim() : '';
  }
  function activePanelId() {
    var link = document.querySelector('#tabcontainer > .t-TabsRegion-items > .t-Tabs .t-Tabs-link[aria-selected="true"]');
    return link ? String(link.getAttribute('href') || '').replace(/^#/, '') : 'SR_General';
  }
  function gridRows(regionId) {
    try {
      var view = apex.region(regionId).widget().interactiveGrid('getViews', 'grid');
      var model = view && view.model;
      var rows = [];
      if (!model) return { model: null, rows: rows };
      model.forEach(function (record) {
        var meta = model.getRecordMetadata(record) || {};
        if (!meta.deleted && !meta.agg && !meta.aggregate) rows.push(record);
      });
      return { model: model, rows: rows };
    } catch (ignore) {
      return { model: null, rows: [] };
    }
  }
  function scalar(value) {
    if (value && typeof value === 'object') value = value.v != null ? value.v : value.d;
    return String(value == null ? '' : value).trim();
  }
  function attachmentExists() {
    var region = document.getElementById('attachment');
    if (!region || region.querySelector('.a-IRR-noDataMsg')) return false;
    return Array.prototype.some.call(region.querySelectorAll('.a-IRR-table tbody tr'), function (row) {
      return row.cells && row.cells.length && !row.querySelector('.a-IRR-noDataMsg');
    });
  }
  function fieldComplete(field, grids) {
    if (field.kind === 'item') return !!itemValue(field.id);
    if (field.kind === 'attachment') return attachmentExists();
    if (field.kind === 'grid') {
      var grid = grids[field.region] || (grids[field.region] = gridRows(field.region));
      if (!grid.model || !grid.rows.length) return false;
      return grid.rows.every(function (record) {
        var value = scalar(grid.model.getValue(record, field.column));
        return field.positive ? Number(value) > 0 : !!value;
      });
    }
    return false;
  }
  function update() {
    var assistant = document.querySelector('.mi-assistant');
    if (!assistant) return;
    var warning = assistant.querySelector('.mi-warning');
    var panel = assistant.querySelector('.mi-required-panel');
    if (!panel) {
      panel = document.createElement('section');
      panel.className = 'mi-required-panel';
      panel.innerHTML = '<h3><span class="fa fa-asterisk" aria-hidden="true"></span> Required Fields <b></b></h3><div class="mi-required-panel-list"></div>';
      if (warning) warning.insertAdjacentElement('afterend', panel);
      else assistant.querySelector('.mi-assistant-body').appendChild(panel);
    }
    var panelId = activePanelId();
    var required = requiredByPanel[panelId] || generalRequired;
    var grids = {};
    var done = 0;
    panel.querySelector('.mi-required-panel-list').innerHTML = required.map(function (field) {
      var complete = fieldComplete(field, grids);
      if (complete) done++;
      return '<div class="mi-required-row' + (complete ? ' is-complete' : '') + '"><span class="mi-required-check">' + (complete ? '&#10003;' : '') + '</span><span>' + field.label + '</span><small>' + (complete ? 'Completed' : 'Required') + '</small></div>';
    }).join('');
    var missing = required.length - done;
    var percent = Math.round(done / required.length * 100);
    panel.querySelector('h3 b').textContent = done + '/' + required.length;
    var assistantPercent = assistant.querySelector('.mi-percent');
    var assistantProgress = assistant.querySelector('.mi-progress i');
    var assistantMissing = assistant.querySelector('.mi-missing');
    if (assistantPercent) assistantPercent.textContent = percent + '%';
    if (assistantProgress) assistantProgress.style.width = percent + '%';
    if (assistantMissing) {
      assistantMissing.textContent = missing;
      Array.prototype.forEach.call(assistantMissing.parentNode.childNodes, function (node) {
        if (node.nodeType === 3 && /required fields? (?:is|are) missing/.test(node.nodeValue || '')) {
          node.nodeValue = missing === 1 ? ' required field is missing' : ' required fields are missing';
        }
      });
    }
    var generalDone = generalRequired.filter(function (field) { return fieldComplete(field, {}); }).length;
    var messageMissing = document.querySelector('#SR_General .mi-message-missing');
    if (messageMissing) messageMissing.textContent = generalRequired.length - generalDone;
    var messageCompletion = document.querySelector('#SR_General .mi-completion');
    if (messageCompletion) {
      var meterText = messageCompletion.querySelector('b');
      var meterBar = messageCompletion.querySelector('em');
      var generalPercent = Math.round(generalDone / generalRequired.length * 100);
      if (meterText) meterText.textContent = generalPercent + '%';
      if (meterBar) meterBar.style.width = generalPercent + '%';
      messageCompletion.setAttribute('aria-label', generalDone + ' of ' + generalRequired.length + ' required fields complete');
    }
  }
  function scheduleUpdate() { setTimeout(update, 0); }
  function init() {
    update();
    setTimeout(update, 350);
    setTimeout(update, 1000);
    document.addEventListener('input', scheduleUpdate, true);
    document.addEventListener('change', scheduleUpdate, true);
    document.addEventListener('apexafterrefresh', scheduleUpdate, true);
    document.addEventListener('click', function (event) {
      if (event.target.closest('#tabcontainer .t-Tabs-link')) scheduleUpdate();
    }, true);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();

/* Detail grids need the full form canvas.  On a Detail / Item Detail step,
   collapse the existing Document Assistant to its arrow rail; choosing that
   arrow restores the full panel and its normal two-column layout.  This uses
   the existing assistants on Material In, Purchase Order and all other forms
   rather than replacing their data or controls. */
(function () {
  "use strict";
  var lastDetail = false;
  function formShell() {
    return document.getElementById("tabcontainer") || document.querySelector(".hspl-form-tabs");
  }
  function activeLink() {
    var shell = formShell();
    return shell && shell.querySelector(".t-Tabs-link[aria-selected='true'],.t-Tabs-link.is-active");
  }
  function isDetailStep() {
    var link = activeLink();
    if (!link) return false;
    var target = (link.getAttribute("href") || "") + " " + (link.textContent || "");
    return /\bdetail\b/i.test(target);
  }
  function setGeneric(host, detail, entering) {
    var assistant = host.querySelector(".hspl-form-assistant");
    if (!assistant) return;
    if (detail && entering && !assistant.classList.contains("is-collapsed")) {
      assistant.classList.add("is-collapsed");
      assistant.dataset.hsplAutoCollapsed = "true";
    }
    if (!detail && assistant.dataset.hsplAutoCollapsed === "true") {
      assistant.classList.remove("is-collapsed");
      delete assistant.dataset.hsplAutoCollapsed;
    }
    /* Manual collapse is valid on every tab, not only Detail. Keep the
       assistant state and the grid-width state driven by the same class so
       Purchase Enquiry immediately releases the full form canvas. */
    host.classList.toggle("hspl-detail-assistant-collapsed", assistant.classList.contains("is-collapsed"));
  }
  function setMaterialIn(host, detail, entering) {
    var assistant = host.querySelector(".mi-assistant");
    if (!assistant) return;
    if (detail && entering && !host.classList.contains("mi-assistant-collapsed")) {
      host.classList.add("mi-assistant-collapsed");
      host.dataset.hsplAutoAssistantCollapsed = "true";
    }
    if (!detail && host.dataset.hsplAutoAssistantCollapsed === "true") {
      host.classList.remove("mi-assistant-collapsed");
      delete host.dataset.hsplAutoAssistantCollapsed;
    }
    /* A manual close is valid on every Material In step.  Do not reserve the
       assistant column merely because the active step is not Detail. */
    host.classList.toggle("hspl-detail-assistant-collapsed", host.classList.contains("mi-assistant-collapsed"));
  }
  function sync() {
    var shell = formShell();
    var host = shell && shell.querySelector(":scope > .t-TabsRegion-items");
    if (!host) return;
    var detail = isDetailStep();
    var entering = detail && !lastDetail;
    setGeneric(host, detail, entering);
    setMaterialIn(host, detail, entering);
    if (host.classList.contains("hspl-detail-assistant-collapsed")) {
      var tabs = host.querySelector(":scope > .t-Tabs") || host.querySelector(".t-Tabs");
      if (tabs) {
        var hostBox = host.getBoundingClientRect();
        var tabsBox = tabs.getBoundingClientRect();
        host.style.setProperty("--hspl-detail-assistant-rail-top", Math.max(0, Math.round(tabsBox.bottom - hostBox.top + 8)) + "px");
      }
    } else {
      host.style.removeProperty("--hspl-detail-assistant-rail-top");
    }
    lastDetail = detail;
  }
  function schedule() {
    setTimeout(sync, 0);
    setTimeout(sync, 140);
  }
  function notifyLayout() {
    requestAnimationFrame(function () {
      window.dispatchEvent(new Event("resize"));
      if (window.apex && apex.jQuery) apex.jQuery(window).trigger("apexwindowresized");
    });
  }
  function init() {
    schedule();
    document.addEventListener("click", function (event) {
      if (!event.target || !event.target.closest) return;
      var genericToggle = event.target.closest(".hspl-form-assistant-head>button");
      if (genericToggle) {
        var genericAssistant = genericToggle.closest(".hspl-form-assistant");
        if (genericAssistant) delete genericAssistant.dataset.hsplAutoCollapsed;
      }
      var materialToggle = event.target.closest(".mi-assistant-toggle");
      if (materialToggle) {
        var materialHost = materialToggle.closest(".t-TabsRegion-items");
        if (materialHost) delete materialHost.dataset.hsplAutoAssistantCollapsed;
      }
      if (event.target.closest(".hspl-form-tabs .t-Tabs-link,#tabcontainer .t-Tabs-link,.hspl-form-assistant-head>button,.mi-assistant-toggle")) schedule();
    }, true);
    /* Run after each form's own target listener.  This covers the dedicated
       Material In assistant and any assistant repainted by an APEX refresh,
       while the generic assistant already updates its host immediately. */
    document.addEventListener("click", function (event) {
      if (!event.target || !event.target.closest) return;
      var toggle = event.target.closest(".hspl-form-assistant-head>button,.mi-assistant-toggle");
      if (!toggle) return;
      sync();
      notifyLayout();
    });
    document.addEventListener("apexafterrefresh", schedule, true);
    window.addEventListener("resize", sync, { passive: true });
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init, { once: true });
  else init();
})();

/* Preserve a register's live drawer criteria when its edit/detail form is
   opened and then closed with Back. APEX report filtering is AJAX based, so
   browser history alone cannot restore those client-side values reliably. */
(function () {
  var storageKey = 'hspl-register-return-state-v1';
  var handoffPrefix = '#hspl-register-return=';
  var match = (document.documentElement.className || '').match(/(?:^|\s)page-(\d+)(?:\s|$)/);
  var flowStep = document.getElementById('pFlowStepId') || document.querySelector('input[name="pFlowStepId"], input[name="p_flow_step_id"]');
  /* Page templates do not all expose the same root class. Prefer APEX's
     runtime id, then the hidden page-step field, before using that class. */
  var pageId = String((window.apex && apex.env && apex.env.APP_PAGE_ID) || (flowStep && flowStep.value) || (match ? match[1] : ''));
  /* Material Out's return route is the first audited migration to the v2
     per-register state model below. Keep this legacy compatibility path off
     that register and its form so the two models can never race each other.
     Material In and every other existing route remain unchanged for now. */
  if (pageId === '167' || pageId === '168' || pageId === '707' || pageId === '708') return;
  /* Session storage is useful while the user stays on the register, but a
     return needs to survive APEX's clear-page redirect too. Carry the small,
     one-use payload in the URL fragment during that one navigation. The
     fragment never reaches the server and is removed immediately on arrival. */
  function readHandoff() {
    var hash = location.hash || '';
    if (hash.indexOf(handoffPrefix) !== 0) return null;
    try {
      var state = JSON.parse(decodeURIComponent(hash.slice(handoffPrefix.length)));
      if (history.replaceState) history.replaceState(null, document.title, location.pathname + location.search);
      return state;
    } catch (ignore) { return null; }
  }
  var incomingHandoff = readHandoff();
  function read() {
    if (incomingHandoff) { var handoff = incomingHandoff; incomingHandoff = null; return handoff; }
    try { return JSON.parse(sessionStorage.getItem(storageKey) || 'null'); } catch (ignore) { return null; }
  }
  function clear() { try { sessionStorage.removeItem(storageKey); } catch (ignore) {} }
  function returnUrl(state) {
    return String(state.url || '').split('#')[0] + handoffPrefix + encodeURIComponent(JSON.stringify(state));
  }
  function drawer() { return document.querySelector('.hspl-drawer, .js-filter-drawer'); }
  function isRegister() { return !!(drawer() && document.querySelector('.a-IRR, .t-IRR-region, .a-GV')); }
  function values(d) {
    var result = {};
    /* Legacy register drawers use both standard APEX containers and plugin
       controls. Capture every page item in the drawer, not only the standard
       *_CONTAINER wrappers, otherwise a valid filtered return loses the
       fields that made the report non-empty. */
    d.querySelectorAll('input[id], select[id], textarea[id]').forEach(function (control) {
      if (!/^P\d+_/i.test(control.id)) return;
      try { result[control.id] = apex.item(control.id).getValue(); }
      catch (ignore) { result[control.id] = control.value; }
    });
    d.querySelectorAll('[id$="_CONTAINER"]').forEach(function (container) {
      var id = (container.id || '').replace(/_CONTAINER$/, '');
      if (!/^P\d+_/.test(id)) return;
      try { result[id] = apex.item(id).getValue(); }
      catch (ignore) { var input = document.getElementById(id); if (input) result[id] = input.value; }
    });
    return result;
  }
  function save() {
    var d = drawer();
    if (!d || !isRegister()) return;
    try { sessionStorage.setItem(storageKey, JSON.stringify({ pageId: pageId, url: location.href.split('#')[0], values: values(d), created: Date.now() })); }
    catch (ignore) {}
  }
  function restore(state, attempt) {
    attempt = attempt || 0;
    if (!state || state.pageId !== pageId) return;
    if (Date.now() - Number(state.created || 0) > 15 * 60 * 1000) { clear(); return; }
    if (!isRegister()) {
      if (attempt < 20) setTimeout(function () { restore(state, attempt + 1); }, 75);
      return;
    }
    Object.keys(state.values || {}).forEach(function (id) {
      /* APEX Enhanced LOVs show an AJAX spinner whenever their cascade change
         handlers run. Their values are already present in this handoff, so
         suppress those artificial change events and submit the saved values
         through the register's normal Refresh button below. */
      try { apex.item(id).setValue(state.values[id], null, true); }
      catch (ignore) { var input = document.getElementById(id); if (input) input.value = state.values[id]; }
    });
    setTimeout(function () {
      /* Most legacy registers use a Refresh/Apply button with a Dynamic
         Action that submits the exact filter items and then refreshes the
         report. Use that canonical path when it exists; a raw region refresh
         can otherwise run before the client item values reach session state. */
      /* APEX may render a button's static ID as a generated DOM ID. Its
         stable telemetry label is REFRESH (Material In's visible Apply
         button), so prefer that canonical control before the legacy ID. */
      var refreshButton = document.querySelector('#refresh, #filter button[data-otel-label="REFRESH"], .hspl-drawer button[data-otel-label="REFRESH"]');
      if (refreshButton) {
        clear();
        refreshButton.click();
        return;
      }
      var refreshed = false;
      document.querySelectorAll('.t-Region[id]').forEach(function (region) {
        if (!region.querySelector('.a-IRR, .a-GV')) return;
        try { apex.region(region.id).refresh(); refreshed = true; } catch (ignore) {}
      });
      /* Keep the one-time handoff until the report refresh has actually been
         requested. This avoids clearing it during APEX's initial page build. */
      if (refreshed) clear();
      else if (attempt < 20) setTimeout(function () { restore(state, attempt + 1); }, 75);
    }, 0);
  }
  function init() {
    restore(read());
    /* Capture only navigation that opens a record form. Registers use both
       report-row edit links and Create/Add New buttons. */
    function isFormLaunch(event) {
      if (!isRegister() || !event.target.closest) return;
      var link = event.target.closest('.a-IRR a[href], .t-Report-report a[href], .a-GV a[href]');
      if (link) return !link.closest('.hspl-drawer, .a-IRR-toolbar, .a-GV-toolbar');
      var action = event.target.closest('button, a');
      if (!action || action.closest('.hspl-drawer, .a-IRR-toolbar, .a-GV-toolbar')) return false;
      var label = String(action.getAttribute('data-otel-label') || action.getAttribute('aria-label') ||
        action.getAttribute('title') || action.textContent || '').replace(/\s+/g, ' ').trim();
      return action.matches('#create,#addnew,[name="Create"],[name="ADDNEW"],[data-button-name="Create"]') ||
        /^(add new|create|edit|view|open)$/i.test(label);
    }
    ['pointerdown', 'click'].forEach(function (eventName) {
      document.addEventListener(eventName, function (event) { if (isFormLaunch(event)) save(); }, true);
    });
    /* Keyboard-opened report links do not emit pointerdown. Preserve the same
       state for Enter/Space navigation as for a mouse click. */
    document.addEventListener('keydown', function (event) {
      if (event.key !== 'Enter' && event.key !== ' ') return;
      if (!isRegister() || !event.target.closest) return;
      var link = event.target.closest('.a-IRR a[href], .t-Report-report a[href], .a-GV a[href]');
      if (link && !link.closest('.hspl-drawer, .a-IRR-toolbar, .a-GV-toolbar')) save();
    }, true);
    document.addEventListener('click', function (event) {
      if (!event.target.closest) return;
      // Form pages do not use one stable generated button id.  Some expose a
      // text Back action while Material In exposes the same route as its
      // icon-only Cancel control.  Capture both semantic button labels so a
      // register return always uses the persisted filter state.
      var candidate = event.target.closest('button, a, input');
      var label = candidate && String(candidate.getAttribute('data-otel-label') || candidate.getAttribute('aria-label') ||
        candidate.getAttribute('title') || candidate.value || candidate.textContent || '').replace(/\s+/g, ' ').trim();
      var back = candidate && (candidate.matches('#back,#cancel,.back,[name="CANCEL"],[data-button-name="CANCEL"],button[data-otel-label="Back"],button[data-otel-label="CANCEL"]') ||
        /^(back|cancel)$/i.test(label)) ? candidate : null;
      var state = read();
      if (!back || !state || !state.url || state.pageId === pageId) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      location.assign(returnUrl(state));
    }, true);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();

/* ============================================================================
   REGISTER RETURN STATE v2 — audited pilot: Material Out Register (167)

   This is deliberately a per-register state record, not a global "last
   register" value. The pilot relies on APEX's normal page/session report
   state for data, sort and pagination; it captures only client-only state
   (drawer values, search text and scroll positions) and restores that without
   clicking Apply or issuing a second query. Once the 167 -> 168 route has
   passed the full matrix it can be enabled for the next audited register by
   adding its register/form pair below.
   ========================================================================== */
(function () {
  "use strict";
  /* No JavaScript workflow is active until a register has passed its
     configuration-level pilot. Material Out now uses its corrected native
     Cancel target, which preserves APEX session state without interception. */
  var WORKFLOWS = {
    '707': {
      forms: { '708': true },
      registerPath: '/enquiry-register'
    }
  };
  var pageMatch = (document.documentElement.className || '').match(/(?:^|\s)page-(\d+)(?:\s|$)/);
  var flowStep = document.getElementById('pFlowStepId') || document.querySelector('input[name="pFlowStepId"], input[name="p_flow_step_id"]');
  var pageId = String((window.apex && apex.env && apex.env.APP_PAGE_ID) || (flowStep && flowStep.value) || (pageMatch ? pageMatch[1] : ''));
  /* Static application files can load before a page template exposes its
     runtime id. The audited workflow owns these aliases, so use them only as
     an early-load fallback—not as a cross-application heuristic. */
  if (!pageId) {
    var route = String(location.pathname || '').toLowerCase();
    if (/\/material-out-register(?:\/|$)/.test(route)) pageId = '167';
    else if (/\/material-out(?:\/|$)/.test(route)) pageId = '168';
  }
  var registerFlow = WORKFLOWS[pageId] || null;
  var formRegisterId = Object.keys(WORKFLOWS).filter(function (id) {
    return WORKFLOWS[id].forms[pageId];
  })[0] || '';
  if (!registerFlow && !formRegisterId) return;

  function env(name) {
    try { return String(window.apex && apex.env && apex.env[name] || ''); } catch (ignore) { return ''; }
  }
  var storagePrefix = 'hspl-register-return-v2:' + (env('APP_ID') || '105') + ':' + (env('APP_SESSION') || 'session') + ':';
  function stateKey(registerId) { return storagePrefix + registerId; }
  function read(registerId) {
    try { return JSON.parse(sessionStorage.getItem(stateKey(registerId)) || 'null'); }
    catch (ignore) { return null; }
  }
  function write(registerId, state) {
    try { sessionStorage.setItem(stateKey(registerId), JSON.stringify(state)); } catch (ignore) {}
  }
  function clear(registerId) {
    try { sessionStorage.removeItem(stateKey(registerId)); } catch (ignore) {}
  }
  function expired(state) {
    return !state || Date.now() - Number(state.savedAt || 0) > 15 * 60 * 1000;
  }
  function normalUrl() {
    return location.href.split('#')[0];
  }
  function same(a, b) {
    return JSON.stringify(a == null ? '' : a) === JSON.stringify(b == null ? '' : b);
  }
  function drawer() { return document.querySelector('.hspl-drawer, .js-filter-drawer'); }
  function drawerValues(root) {
    var values = {};
    if (!root) return values;
    root.querySelectorAll('[id$="_CONTAINER"], input[id], select[id], textarea[id]').forEach(function (node) {
      var id = node.id || '';
      if (/_CONTAINER$/.test(id)) id = id.replace(/_CONTAINER$/, '');
      if (!/^P\d+_/i.test(id) || Object.prototype.hasOwnProperty.call(values, id)) return;
      try { values[id] = apex.item(id).getValue(); }
      catch (ignore) {
        var control = document.getElementById(id);
        if (control) values[id] = control.value;
      }
    });
    return values;
  }
  function reportState() {
    var reports = [];
    document.querySelectorAll('.a-IRR').forEach(function (ir, index) {
      var region = ir.closest('.t-Region') || ir;
      var body = region.querySelector('.t-fht-tbody');
      var search = ir.querySelector('.a-IRR-search-field, input[type="search"]');
      var rows = ir.querySelector('.a-IRR-rowsPerPage, select[id$="_row_select"], button[id$="_row_select"]');
      reports.push({
        id: region.id || ir.id || String(index),
        search: search ? search.value : '',
        rows: rows && (rows.value || rows.textContent || '').trim(),
        scrollLeft: body ? body.scrollLeft : 0,
        scrollTop: body ? body.scrollTop : 0
      });
    });
    return reports;
  }
  function capture() {
    return {
      registerId: pageId,
      url: normalUrl(),
      savedAt: Date.now(),
      returning: false,
      drawerOpen: document.documentElement.classList.contains('hspl-drawer-open'),
      filters: drawerValues(drawer()),
      reports: reportState()
    };
  }
  function restoreValues(values) {
    Object.keys(values || {}).forEach(function (id) {
      try {
        var item = apex.item(id);
        if (item && item.setValue && !same(item.getValue(), values[id])) item.setValue(values[id], null, true);
      } catch (ignore) {
        var control = document.getElementById(id);
        if (control && !same(control.value, values[id])) control.value = values[id];
      }
    });
  }
  function restoreReports(reports) {
    (reports || []).forEach(function (saved) {
      var region = document.getElementById(saved.id);
      if (!region) return;
      var body = region.querySelector('.t-fht-tbody');
      var search = region.querySelector('.a-IRR-search-field, input[type="search"]');
      if (search && saved.search && !search.value) search.value = saved.search;
      if (body) {
        body.scrollLeft = Number(saved.scrollLeft || 0);
        body.scrollTop = Number(saved.scrollTop || 0);
      }
    });
  }
  function restore(state) {
    if (expired(state) || !state.returning || state.registerId !== pageId) return;
    /* The return URL does not clear this page, so APEX restores its native IR
       query, search, sort and pagination from the same session state. Do not
       replay Apply here: that would issue a duplicate query and reset paging. */
    restoreValues(state.filters);
    [0, 120, 500].forEach(function (delay) {
      setTimeout(function () { restoreReports(state.reports); }, delay);
    });
    clear(pageId);
  }
  function textOf(control) {
    return ((control && (
      control.getAttribute('aria-label') ||
      control.getAttribute('title') ||
      control.getAttribute('data-otel-label') ||
      control.textContent
    )) || '').replace(/\s+/g, ' ').trim();
  }
  function isFormLaunch(target) {
    if (!target || !target.closest) return false;
    /* APEX may render the register's Create action outside the IR toolbar
       depending on the active template. The static id is the stable contract;
       recognise it before relying on theme-specific toolbar markup. */
    if (target.closest('#create, #addnew, [name="Create"], [name="ADDNEW"], [data-button-name="Create"]')) return true;
    if (target.closest('.a-IRR-table a[href], .t-Report-report a[href]')) return true;
    /* This code is scoped to the audited register page. Its generated
       interactive-report button ids differ by export, so use the accessible
       action name rather than a theme wrapper or generated id. */
    var button = target.closest('button, a');
    return !!(button && /^(add new|create|edit|view|open)$/i.test(textOf(button)));
  }
  function initRegister() {
    restore(read(pageId));
    ['pointerdown', 'click'].forEach(function (eventName) {
      document.addEventListener(eventName, function (event) {
        if (isFormLaunch(event.target)) write(pageId, capture());
      }, true);
    });
    document.addEventListener('keydown', function (event) {
      if ((event.key === 'Enter' || event.key === ' ') && isFormLaunch(event.target)) write(pageId, capture());
    }, true);
    document.addEventListener('click', function (event) {
      if (event.target.closest && event.target.closest('.hspl-reset-btn')) clear(pageId);
    }, true);
  }
  function initForm() {
    var state = read(formRegisterId);
    if (expired(state)) { clear(formRegisterId); return; }
    /* Run in window capture before APEX's generated redirect. APEX templates
       may render Cancel as a button, link, or input; its accessible name is
       the stable contract. */
    function returnToRegister(event) {
      if (!event.target.closest) return;
      var candidate = event.target.closest('button, a, input');
      var back = candidate && (
        candidate.matches('#back, #cancel, [name="CANCEL"], [data-button-name="CANCEL"], button[data-otel-label="Back"], button[data-otel-label="CANCEL"]') ||
        /\b(back|cancel)\b/i.test(textOf(candidate))
      ) ? candidate : null;
      if (!back) return;
      state = read(formRegisterId);
      if (expired(state) || !state.url) return;
      /* A state is only honoured on the form reached from this register. This
         prevents an older, unrelated register visit from hijacking Cancel on
         a form opened directly from elsewhere in the application. */
      var workflow = WORKFLOWS[formRegisterId] || {};
      if (document.referrer && workflow.registerPath && document.referrer.indexOf(workflow.registerPath) === -1) return;
      state.returning = true;
      write(formRegisterId, state);
      event.preventDefault();
      event.stopImmediatePropagation();
      /* This is the form's explicit Cancel action, not browser Back. Tell
         APEX not to raise its unsaved-change prompt for that intentional
         route before returning to the retained register context. */
      try { if (apex.page && apex.page.cancelWarnOnUnsavedChanges) apex.page.cancelWarnOnUnsavedChanges(); } catch (ignore) {}
      location.assign(state.url);
    }
    /* APEX's button redirect is initiated before an ordinary click listener
       can reliably cancel it on this template. Pointer-down is the earliest
       cancellable user gesture; click retains keyboard activation support. */
    window.addEventListener('pointerdown', returnToRegister, true);
    window.addEventListener('click', returnToRegister, true);
  }
  if (registerFlow) initRegister();
  else initForm();
})();

/* Enhanced LOV AJAX buttons are implementation-only spinners. Add this from
   the shared JavaScript as well as the stylesheet so the rule takes effect on
   already-open APEX application sessions while their theme CSS cache updates. */
(function () {
  function restoreDrawerLovControls() {
    /* Lookup buttons are functional controls, not decorative indicators.  Keep
       every native LOV trigger visible in forms and filter drawers. */
    var legacyStyle = document.getElementById('hspl-drawer-lov-indicator-style');
    if (legacyStyle) legacyStyle.remove();
    if (document.getElementById('hspl-grid-layout-style')) return;
    var style = document.createElement('style');
    style.id = 'hspl-grid-layout-style';
    style.textContent = '.t-fht-tbody .a-IRR-table>thead,.t-fht-tbody .a-IRR-table>thead>tr{display:none!important;height:0!important}' +
      '.t-fht-tbody .a-IRR-table>thead th{height:0!important;padding-top:0!important;padding-bottom:0!important;line-height:0!important;border-top:0!important;border-bottom:0!important}' +
      '.t-fht-wrapper{row-gap:0!important}.t-fht-wrapper>.t-fht-thead{margin:0!important;padding:0!important;border-bottom:0!important}.t-fht-wrapper>.t-fht-tbody{margin-top:0!important;padding-top:0!important}';
    (document.head || document.documentElement).appendChild(style);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', restoreDrawerLovControls);
  else restoreDrawerLovControls();
})();

/* Keep navigation transitions deterministic across HOME, module landing pages
   and child reports/forms. A navigation carries a ONE-TIME intent; the next
   document consumes it once. No delayed observer is allowed to reopen/close
   the shell later, which removes the visible navigation flicker. */
(function () {
  /* Navigation must remain native. This legacy handler intercepted every
     sidebar link, rewrote its URL and rebuilt the tree on each destination;
     that was the source of the blank/loading rail between pages. */
  /* Universal Theme is the only owner of the shell's open/closed state.
     Intercepting a tree link, an Add New action, or an APEX lifecycle event
     was issuing a second toggle after UT had painted the page, producing the
     visible open-then-close flash on every register and form. */
  var useNativeNavigation = true;

  /* Keep the current visual sidebar CSS, but let Universal Theme own every
     navigation action. The older code below also rewrote links, expanded
     branches and remeasured the complete TreeView during startup. That meant
     a normal click could trigger a second navigation and several full-tree
     layouts. Native APEX already preserves the correct routing and state. */
  if (useNativeNavigation) {
    document.documentElement.classList.remove(
      'hspl-shell-boot',
      'hspl-nav-resolving'
    );
    document.documentElement.classList.add('hspl-nav-ready');
    return;
  }

  var branchKey = 'hspl-nav-open-label';
  var intentKey = 'hspl-nav-next-state';
  var preferenceKey = 'hspl-nav-preferred-state';
  var nameMarker = '::hspl-nav::';
  var handoffMarker = '#hspl-nav-state=';
  var handoffState = {};

  /* Carry the one-page navigation intent in a URL fragment. The fragment is
     never sent to APEX (so checksums and routes are unchanged) and is removed
     immediately on the destination. This is the reliable fallback for browser
     contexts where sessionStorage/window.name are unavailable or reset. */
  try {
    if (String(window.location.hash || '').indexOf(handoffMarker) === 0) {
      handoffState = JSON.parse(decodeURIComponent(
        String(window.location.hash).slice(handoffMarker.length)
      )) || {};
      window.history.replaceState(
        window.history.state,
        document.title,
        window.location.pathname + window.location.search
      );
    }
  } catch (ignore) { handoffState = {}; }

  function handoffUrl(href, intent, branch) {
    var state = {};
    state[intentKey] = intent;
    if (branch) state[branchKey] = branch;
    return String(href).split('#')[0] + handoffMarker + encodeURIComponent(JSON.stringify(state));
  }

  function isCurrentDocument(href) {
    try {
      var target = new URL(href, window.location.href);
      var current = new URL(window.location.href);
      target.hash = '';
      current.hash = '';
      return target.href === current.href;
    } catch (ignore) { return false; }
  }

  /* Do not rely on APEX's optional `--leaf` class here. Some branches render
     a direct page link without that class, which meant a real leaf such as
     Cost Centre could bypass the close-intent handoff. A page is a leaf when
     its own tree node has no direct child-node list. */
  function navigationLeafLink(target) {
    if (!target || !target.closest) return null;
    /* Parent children can be lazy-rendered, so their native toggle/expanded
       state is authoritative. An arrow click is never a leaf navigation. */
    if (target.closest('.a-TreeView-toggle')) return null;
    var node = target.closest('#t_TreeNav .a-TreeView-node');
    if (!node) return null;
    if (node.classList.contains('is-expandable') ||
        node.classList.contains('is-collapsible') ||
        node.classList.contains('hspl-nav-has-children') ||
        node.querySelector(':scope > .a-TreeView-toggle, :scope > .a-TreeView-content [aria-expanded]')) {
      return null;
    }
    var children = null;
    try { children = node.querySelector(':scope > ul'); }
    catch (ignore) { children = null; }
    if (children && children.querySelector('.a-TreeView-node')) return null;
    var link = target.closest('a.a-TreeView-label[href]');
    if (!link) link = node.querySelector(':scope > .a-TreeView-content a.a-TreeView-label[href]');
    return link || null;
  }

  function nameState() {
    try {
      var value = String(window.name || '');
      var at = value.indexOf(nameMarker);
      if (at < 0) return {};
      return JSON.parse(decodeURIComponent(value.slice(at + nameMarker.length))) || {};
    } catch (ignore) { return {}; }
  }
  function writeNameState(state) {
    try {
      var value = String(window.name || '');
      var at = value.indexOf(nameMarker);
      var base = at < 0 ? value : value.slice(0, at);
      var keys = Object.keys(state);
      window.name = keys.length ? base + nameMarker + encodeURIComponent(JSON.stringify(state)) : base;
    } catch (ignore) { /* the storage path below remains available */ }
  }

  function stored(key) {
    if (Object.prototype.hasOwnProperty.call(handoffState, key)) return handoffState[key];
    var value = null;
    try { value = window.sessionStorage && window.sessionStorage.getItem(key); }
    catch (ignore) { value = null; }
    if (value != null) return value;
    var state = nameState();
    return Object.prototype.hasOwnProperty.call(state, key) ? state[key] : null;
  }
  function remember(key, value) {
    try { if (window.sessionStorage) window.sessionStorage.setItem(key, value); }
    catch (ignore) { /* window.name fallback below */ }
    var state = nameState();
    state[key] = value;
    writeNameState(state);
  }
  function forget(key) {
    delete handoffState[key];
    try { if (window.sessionStorage) window.sessionStorage.removeItem(key); }
    catch (ignore) { /* window.name fallback below */ }
    var state = nameState();
    delete state[key];
    writeNameState(state);
  }

  /* Keep the visible-height custom properties for legacy CSS, but never write
     geometry directly to the native sidebar. A visualViewport scroll event
     fires while a register is being scrolled and used to force layout work on
     every event, producing the white/laggy rail seen after a report loaded. */
  function syncVisibleViewportHeight() {
    var viewport = window.visualViewport;
    var height = viewport && viewport.height ? viewport.height : window.innerHeight;
    var header = document.querySelector('.t-Header');
    var headerHeight = header ? header.getBoundingClientRect().height : 48;
    if (height > 0) {
      document.documentElement.style.setProperty('--hspl-visible-viewport-height', height + 'px');
      document.documentElement.style.setProperty(
        '--hspl-nav-visible-height',
        Math.max(0, height - headerHeight) + 'px'
      );
    }
  }
  syncVisibleViewportHeight();

  function stripTreeTooltips() {
    document.querySelectorAll('#t_TreeNav [title]').forEach(function (node) {
      node.removeAttribute('title');
    });
  }

  function isClosed() {
    return document.body.classList.contains('js-navCollapsed') &&
      !document.body.classList.contains('js-navExpanded');
  }
  function isOpen() {
    return document.body.classList.contains('js-navExpanded');
  }
  function closeShellNow() {
    if (!isOpen()) return;
    var shellToggle = document.querySelector('#t_Button_navControl');
    if (shellToggle) shellToggle.click();
  }
  function rootNode() {
    return document.querySelector('#t_TreeNav > ul > .a-TreeView-node--topLevel');
  }
  function referenceNavEnabled() {
    return !!document.querySelector('script[src*="hspl-nav-hierarchy-v22.js"],script[src*="hspl-nav-paint.js"]');
  }
  function setRootFolded(root, folded) {
    if (!root) return;
    var children = root.querySelector(':scope > ul');
    if (!children) return;
    /* Keep fold state outside the APEX tree. Mutating root classes, child
       display styles, or the treeitem aria state makes Universal Theme treat
       this as a request to close the entire navigation shell. */
    document.documentElement.classList.toggle('hspl-home-folded', folded);
    var proxy = document.querySelector('#t_Body_nav > .hspl-root-chevron');
    if (proxy) proxy.setAttribute('aria-expanded', folded ? 'false' : 'true');
  }
  function positionRootChevron(proxy, root) {
    var nav = document.querySelector('#t_Body_nav');
    var content = root && root.querySelector(':scope > .a-TreeView-content');
    if (!proxy || !nav || !content) return;
    var navRect = nav.getBoundingClientRect();
    var contentRect = content.getBoundingClientRect();
    proxy.style.top = Math.round(contentRect.top - navRect.top + (contentRect.height - 24) / 2) + 'px';
  }
  function installRootChevron(root) {
    /* App 103's v22 hierarchy owns the native root chevron. Keeping the old
       proxy as well creates a second, overflowing arrow and the HOME tooltip. */
    if (referenceNavEnabled()) return null;
    if (!root) return null;
    var content = root.querySelector(':scope > .a-TreeView-content');
    var nav = document.querySelector('#t_Body_nav');
    var proxy = nav && nav.querySelector(':scope > .hspl-root-chevron');
    if (proxy) { positionRootChevron(proxy, root); return proxy; }
    if (!content || !nav) return null;
    proxy = document.createElement('button');
    proxy.type = 'button';
    proxy.className = 'hspl-root-chevron';
    proxy.setAttribute('aria-label', 'Toggle HOME navigation');
    proxy.addEventListener('click', function (event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      var current = rootNode();
      var children = current && current.querySelector(':scope > ul');
      if (!children) { expandRoot(); return; }
      setRootFolded(current, !document.documentElement.classList.contains('hspl-home-folded'));
    }, true);
    /* Keep the proxy outside #t_TreeNav. APEX captures tree clicks on window
       before target listeners run; a nav-shell sibling is visually identical
       but is not mistaken for a TreeView selection. */
    nav.appendChild(proxy);
    positionRootChevron(proxy, root);
    var tree = document.querySelector('#t_TreeNav');
    if (tree && !tree.__hsplRootChevronScroll) {
      tree.__hsplRootChevronScroll = true;
      tree.addEventListener('scroll', function () {
        positionRootChevron(document.querySelector('#t_Body_nav > .hspl-root-chevron'), rootNode());
      }, { passive: true });
    }
    return proxy;
  }
  function expandRoot() {
    if (!isOpen()) return;
    /* Each freshly opened sidebar must begin at HOME.  APEX preserves the
       TreeView scroll offset across page visits; when it retained the previous
       offset, HOME was still in the DOM but scrolled just above the visible
       rail, making the first visible module look like the root. */
    var tree = document.querySelector('#t_TreeNav');
    if (tree) tree.scrollTop = 0;
    var root = rootNode();
    var toggle = root && root.querySelector(':scope > .a-TreeView-toggle');
    if (!root) return;
    if (!referenceNavEnabled()) installRootChevron(root);
    if (document.documentElement.classList.contains('hspl-home-folded')) setRootFolded(root, false);
    var children = root.querySelector(':scope > ul');
    if (children && !root.classList.contains('is-expandable')) {
      setRootFolded(root, false);
      return;
    }
    if (root.classList.contains('is-expandable') && toggle) {
      var expandedByApi = false;
      try {
        var label = root.querySelector(':scope > .a-TreeView-content > .a-TreeView-label[aria-expanded]');
        var jq = window.apex && apex.jQuery || window.jQuery;
        if (label && jq) {
          label.focus({ preventScroll: true });
          jq(label).trigger(jq.Event('keydown', { key: 'ArrowRight', code: 'ArrowRight', which: 39, keyCode: 39 }));
          expandedByApi = true;
        } else if (label) {
          label.dispatchEvent(new KeyboardEvent('keydown', { key: 'ArrowRight', code: 'ArrowRight', bubbles: true, cancelable: true }));
          expandedByApi = true;
        }
      } catch (ignore) { expandedByApi = false; }
      if (!expandedByApi) toggle.click();
      /* Some UT pages map the selected top-level node to the shell toggle.
         If that native expansion also closed the shell, restore it in this
         same JavaScript task—before the browser gets a chance to paint. */
      if (!isOpen()) {
        var shellToggle = document.querySelector('#t_Button_navControl');
        if (shellToggle) shellToggle.click();
      }
      root = rootNode();
      if (root && root.querySelector(':scope > ul')) {
        if (!referenceNavEnabled()) installRootChevron(root);
        setRootFolded(root, false);
      }
    }
    /* TreeView expansion can restore its old scroll position while it lays out
       the child branch, so assert the HOME-first position once more. */
    if (tree) tree.scrollTop = 0;
  }
  function normalizeClosedRail() {
    if (!isClosed()) return;
    var expanded = document.querySelectorAll(
      '#t_TreeNav .a-TreeView-node--topLevel .a-TreeView-node.is-collapsible'
    );
    Array.prototype.slice.call(expanded).reverse().forEach(function (node) {
      var toggle = node.querySelector(':scope > .a-TreeView-toggle');
      if (toggle) toggle.click();
    });
  }
  function requestedBranch() { return stored(branchKey); }
  function rememberBranch(label) { remember(branchKey, label); }
  function forgetBranch() { forget(branchKey); }
  function rememberIntent(state) { remember(intentKey, state); }
  function preferredIntent() {
    try { return window.sessionStorage && window.sessionStorage.getItem(preferenceKey); }
    catch (ignore) { return null; }
  }

  function moduleLabel(node) {
    return node && node.querySelector(':scope > .a-TreeView-content > .a-TreeView-label, :scope > .a-TreeView-row .a-TreeView-label');
  }

  /* APEX has used more than one root/list wrapper across these pages. Never
     depend on that wrapper: find the actual expandable parent from its exact
     label after the tree has finished rebuilding. */
  function parentModules() {
    return Array.prototype.filter.call(document.querySelectorAll('#t_TreeNav .a-TreeView-node'), function (node) {
      return !!(node.querySelector(':scope > .a-TreeView-toggle') ||
        node.querySelector(':scope > .a-TreeView-content [aria-expanded]') ||
        node.querySelector(':scope > ul > .a-TreeView-node'));
    });
  }

  function parentModuleByLabel(wanted) {
    return Array.prototype.find.call(parentModules(), function (node) {
      var label = moduleLabel(node);
      return label && label.textContent.trim() === wanted;
    });
  }

  function navigationScrollViewport(node) {
    var current = node && node.parentElement;
    while (current && current !== document.body) {
      var style = window.getComputedStyle(current);
      if ((current.id === 't_TreeNav' || /auto|scroll/.test(style.overflowY)) &&
          current.scrollHeight > current.clientHeight) return current;
      current = current.parentElement;
    }
    return document.querySelector('#t_TreeNav');
  }

  /* Reposition only the sidebar's own scroll viewport. The lookup is repeated
     after every APEX layout pass, so it never scrolls a stale pre-reload node
     and it never moves the document/page. */
  function revealModuleInNavigation(module, wantedLabel) {
    if (!isOpen() || !module) return;
    var labelText = wantedLabel || ((moduleLabel(module) || {}).textContent || '').trim();
    if (!labelText) return;
    [0, 100, 300, 700, 1200].forEach(function (delay) {
      setTimeout(function () {
        if (!isOpen()) return;
        var liveModule = parentModuleByLabel(labelText) || module;
        var content = liveModule.querySelector(':scope > .a-TreeView-content, :scope > .a-TreeView-row');
        var viewport = navigationScrollViewport(liveModule);
        if (!content || !viewport) return;
        var viewportRect = viewport.getBoundingClientRect();
        var itemRect = content.getBoundingClientRect();
        var target = viewport.scrollTop + itemRect.top - viewportRect.top -
          Math.max(10, (viewport.clientHeight - itemRect.height) / 2);
        var maximum = Math.max(0, viewport.scrollHeight - viewport.clientHeight);
        viewport.scrollTop = Math.max(0, Math.min(maximum, target));
      }, delay);
    });
  }

  function revealActiveParentModule() {
    if (!isOpen()) return;
    var active = Array.prototype.find.call(parentModules(), function (node) {
      var content = node.querySelector(':scope > .a-TreeView-content, :scope > .a-TreeView-row');
      var label = node.querySelector(':scope > .a-TreeView-content > .a-TreeView-label, :scope > .a-TreeView-row .a-TreeView-label');
      return !!(node.classList.contains('is-current') || node.classList.contains('is-selected') ||
        (content && (content.classList.contains('is-current') || content.classList.contains('is-current--top') || content.classList.contains('is-selected'))) ||
        (label && label.classList.contains('is-current')));
    });
    if (active) revealModuleInNavigation(active);
  }

  function restoreRequestedBranch(attempt, done) {
    var wanted = requestedBranch();
    if (!wanted) { done(); return; }
    if (!isOpen()) {
      if (attempt < 12) setTimeout(function () { restoreRequestedBranch(attempt + 1, done); }, 20);
      else { forgetBranch(); done(); }
      return;
    }
    expandRoot();
    var match = parentModuleByLabel(wanted);
    if (!match) {
      if (attempt < 12) setTimeout(function () { restoreRequestedBranch(attempt + 1, done); }, 25);
      else { forgetBranch(); done(); }
      return;
    }
    var toggle = match.querySelector(':scope > .a-TreeView-toggle');
    if (match.classList.contains('is-expandable') && toggle) toggle.click();
    revealModuleInNavigation(match, wanted);
    forgetBranch();
    done();
  }

  function revealResolvedPage() {
    requestAnimationFrame(function () {
      requestAnimationFrame(function () {
        document.documentElement.classList.add('hspl-nav-ready');
        document.documentElement.classList.remove('hspl-nav-resolving');
        document.documentElement.classList.remove('hspl-nav-target-closed');
        document.documentElement.classList.remove('hspl-nav-target-open');
      });
    });
  }

  function resolveNavigationIntent() {
    if (!document.getElementById('t_TreeNav')) {
      document.documentElement.classList.remove('hspl-nav-target-open', 'hspl-nav-target-closed');
      return;
    }
    /* The first-paint class already displays this exact target state. Wait for
       Universal Theme to declare its native state, then synchronise it while
       the guard is still applied. Releasing only after the two match removes
       the open-then-close flash on every form/register refresh. */
    var target = stored(intentKey) || preferredIntent() || 'closed';
    var wantedBranch = stored(branchKey);
    var firstChildHandoff = target === 'open' && !!wantedBranch;
    forget(intentKey);
    forgetBranch();
    document.documentElement.classList.remove('hspl-nav-resolving');
    document.documentElement.classList.remove(target === 'open' ? 'hspl-nav-target-closed' : 'hspl-nav-target-open');
    document.documentElement.classList.add(target === 'open' ? 'hspl-nav-target-open' : 'hspl-nav-target-closed');
    var finished = false;
    function settle() {
      if (finished) return;
      /* Reconcile once after APEX is ready. Never observe the whole document
         or recursively queue a toggle: that can starve page initialization. */
      if (!document.body.classList.contains('js-ready') ||
          (firstChildHandoff && document.querySelectorAll('#t_TreeNav .a-TreeView-node').length < 5)) return;
      var hasNativeState = isOpen() || isClosed();
      if (!hasNativeState) return;
      var mismatch = (target === 'open' && !isOpen()) || (target === 'closed' && !isClosed());
      if (mismatch) {
        var shellToggle = document.querySelector('#t_Button_navControl');
        if (shellToggle && hasNativeState) {
          shellToggle.click();
        }
      }
      /* The guard stays in place if UT has not supplied a state yet. It is
         safer to retain the already-correct visual rail than reveal a wrong
         startup state for a frame. */
      if (firstChildHandoff) {
        var module = parentModuleByLabel(wantedBranch);
        var toggle = module && module.querySelector(':scope > .a-TreeView-toggle');
        if (toggle && module.classList.contains('is-expandable')) toggle.click();
      }
      finished = true;
      document.documentElement.classList.remove('hspl-nav-target-closed');
      document.documentElement.classList.remove('hspl-nav-target-open');
      document.documentElement.classList.add('hspl-nav-ready');
    }
    document.addEventListener('apexreadyend', settle, { once: true });
    window.addEventListener('load', settle, { once: true });
    settle();
  }

  function init() {
    document.documentElement.setAttribute('data-hspl-nav', 'ready');
    syncVisibleViewportHeight();
    stripTreeTooltips();
    if (!referenceNavEnabled()) installRootChevron(rootNode());
    var tree = document.querySelector('#t_TreeNav');
    if (tree) {
      var treeMutationFrame = 0;
      try {
        new MutationObserver(function () {
          /* A sidebar toggle changes several TreeView nodes. Re-expanding HOME
             for every one of those mutations repeatedly lays out the entire
             tree while a loaded Interactive Report is resizing. Opening the
             rail already performs one deliberate expansion below; mutations
             only need the lightweight chevron/tooltip housekeeping. */
          if (treeMutationFrame) return;
          treeMutationFrame = requestAnimationFrame(function () {
            treeMutationFrame = 0;
            var root = rootNode();
            if (!root) return;
            stripTreeTooltips();
            if (!referenceNavEnabled()) installRootChevron(root);
          });
        }).observe(tree, { childList: true, subtree: true });
      } catch (ignore) { /* click/rAF path remains functional */ }
    }
    resolveNavigationIntent();

    /* HOME's chevron folds/unfolds the module list; it must never be treated as
       the Universal Theme shell toggle. Listen on window capture so this runs
       before APEX's TreeView handler, while keeping the native v22 chevron. */
    window.addEventListener('click', function (event) {
      if (!isOpen() || !event.target || !event.target.closest) return;
      var toggle = event.target.closest('#t_TreeNav > ul > .a-TreeView-node--topLevel > .a-TreeView-toggle');
      if (!toggle) return;
      var root = rootNode();
      if (!root || !root.querySelector(':scope > ul')) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      var wasFolded = document.documentElement.classList.contains('hspl-home-folded');
      setRootFolded(root, !wasFolded);
      if (wasFolded) expandRoot();
    }, true);

    /* APEX registers its TreeView selection listener on the document. The
       first rendered leaf in a branch can otherwise reach that listener
       before the document-level leaf handoff below, closing the rail on the
       destination. Intercept every level-3 child at window capture instead;
       this is earlier than APEX and deliberately applies equally to City and
       every other first/next child. */
    function childNavigationLink(target) {
      if (!target || !target.closest || target.closest('.a-TreeView-toggle')) return null;
      /* The visible TreeView row/icon extends well beyond its small text link.
         APEX navigates when any part of that row is clicked, so resolve the
         direct child link from the row as well as from the anchor itself. */
      var node = target.closest('#t_TreeNav .a-TreeView-node');
      if (!node || !node.classList.contains('hspl-nav-level-3')) return null;
      return node.querySelector(':scope > .a-TreeView-content > a.a-TreeView-label[href]');
    }
    /* The first child can trigger UT's parent-selection path, which collapses
       the shell before navigation. Handle only that edge case ahead of UT;
       every other tree link remains native. */
    var firstChildNavigating = false;
    function handleFirstChildNavigation(event) {
      if (event.button !== 0 || event.ctrlKey || event.metaKey || event.shiftKey || event.altKey) return;
      var child = childNavigationLink(event.target);
      var node = child && child.closest('.a-TreeView-node');
      if (!node || node !== node.parentElement.querySelector(':scope > .a-TreeView-node')) return;
      var href = child.getAttribute('href');
      if (!href || href === '#' || href.indexOf('javascript:') === 0) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      if (firstChildNavigating) return;
      if (isCurrentDocument(child.href)) return;
      firstChildNavigating = true;
      var parent = node.closest('.hspl-nav-level-2');
      var parentLabel = parent && parent.querySelector(':scope > .a-TreeView-content > .a-TreeView-label');
      var branch = parentLabel ? parentLabel.textContent.trim() : '';
      rememberIntent('open');
      if (branch) rememberBranch(branch);
      /* Keep the APEX-generated URL untouched, including its checksum and
         session. Only the native rail preference travels in sessionStorage. */
      window.location.assign(child.href);
    }
    window.addEventListener('pointerdown', handleFirstChildNavigation, true);
    window.addEventListener('click', handleFirstChildNavigation, true);
    window.addEventListener('click', function (event) {
      if (!isOpen()) return;
      if (useNativeNavigation) return;
      var child = childNavigationLink(event.target);
      if (!child) return;
      var href = child.getAttribute('href');
      if (!href || href === '#' || href.indexOf('javascript:') === 0) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      var parent = child.closest('.hspl-nav-level-2');
      var parentLabel = parent && parent.querySelector(':scope > .a-TreeView-content > .a-TreeView-label');
      var branch = parentLabel ? parentLabel.textContent.trim() : '';
      rememberIntent('open');
      if (isCurrentDocument(child.href)) {
        forget(intentKey);
        expandRoot();
        revealActiveParentModule();
        return;
      }
      window.location.assign(handoffUrl(child.href, 'open', branch));
    }, true);

    /* A navigation launched from the sidebar keeps that sidebar open on the
       destination.  This applies to every leaf, including child registers;
       users can therefore move between siblings without reopening the rail. */
    document.addEventListener('pointerdown', function (event) {
      if (!isOpen() || !event.target.closest) return;
      var link = navigationLeafLink(event.target);
      if (!link) return;
      var href = link.getAttribute('href');
      if (!href || href === '#' || href.indexOf('javascript:') === 0) return;
      forgetBranch();
      rememberIntent('open');
    }, true);
    document.addEventListener('pointerdown', function (event) {
      if (!event.target.closest) return;
      var action = event.target.closest('button, a.t-Button');
      if (!action) return;
      var label = (action.innerText || action.textContent || '').replace(/\s+/g, ' ').trim().toLowerCase();
      if (label !== 'add new') return;
      forgetBranch();
      /* Add New is a normal APEX navigation. Do not close the rail first:
         doing so visibly toggles it during the destination's first paint. */
      forget(intentKey);
    }, true);

    /* Carry the open intent to a true sidebar leaf.  The destination receives
       its final geometry before APEX restores its persisted shell state, so
       there is no open-then-close flash. */
    document.addEventListener('click', function (event) {
      if (!isOpen() || !event.target.closest) return;
      if (useNativeNavigation) return;
      var leafLink = navigationLeafLink(event.target);
      if (!leafLink) return;
      var href = leafLink.getAttribute('href');
      if (!href || href === '#' || href.indexOf('javascript:') === 0) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      forgetBranch();
      rememberIntent('open');

      /* Re-selecting the current leaf is only a hash navigation, so retain the
         open sidebar in this document and consume the one-use intent. */
      if (isCurrentDocument(leafLink.href)) {
        forget(intentKey);
        expandRoot();
        revealActiveParentModule();
        return;
      }
      window.location.assign(handoffUrl(leafLink.href, 'open'));
    }, true);

    /* Populate/show HOME's children in the same paint that opens the shell.
       This avoids the transient HOME-only frame without changing sidebar
       styling or adding any delayed reopen observer. */
    document.addEventListener('click', function (event) {
      if (!event.target.closest || !event.target.closest('#t_Button_navControl')) return;
      var opening = isClosed();
      if (opening) requestAnimationFrame(expandRoot);
    }, true);

    /* Clicking a module card opens its page and guarantees that its children
       are expanded. The small chevron remains an independent toggle. */
    document.addEventListener('click', function (event) {
      if (!isOpen() || !event.target.closest) return;
      if (useNativeNavigation) return;
      if (event.target.closest('.a-TreeView-toggle')) return;
      var hit = event.target.closest('.a-TreeView-content, .a-TreeView-row');
      var node = hit && hit.closest('.a-TreeView-node');
      if (!node || !node.matches(
        '#t_TreeNav > ul > .a-TreeView-node--topLevel > ul > .a-TreeView-node'
      )) return;
      var label = node.querySelector(':scope > .a-TreeView-content > .a-TreeView-label');
      var toggle = node.querySelector(':scope > .a-TreeView-toggle');
      if (!label) return;
      rememberBranch(label.textContent.trim());
      rememberIntent('open');
      if (node.classList.contains('is-expandable') && toggle) toggle.click();

      var href = label.getAttribute('href');
      event.preventDefault();
      event.stopImmediatePropagation();
      if (href && href !== '#' && href.indexOf('javascript:') !== 0) {
        window.location.assign(handoffUrl(label.href, 'open', label.textContent.trim()));
      }
    }, true);

    /* This is kept for child links that APEX renders after the generic leaf
       listener is attached. Child navigation deliberately preserves the open
       shell, exactly like the normal leaf path above. */
    document.addEventListener('click', function (event) {
      if (!isOpen() || !event.target.closest) return;
      if (useNativeNavigation) return;
      var childLink = event.target.closest(
        '#t_TreeNav > ul > .a-TreeView-node--topLevel > ul > .a-TreeView-node > ul a.a-TreeView-label'
      );
      if (!childLink) return;
      var href = childLink.getAttribute('href');
      if (!href || href === '#' || href.indexOf('javascript:') === 0) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      forgetBranch();
      rememberIntent('open');
      window.location.assign(handoffUrl(childLink.href, 'open'));
    }, true);

    /* A Global Search result does not pass through the TreeView handler.
       Carry the sidebar's current state in its destination handoff instead of
       letting Universal Theme briefly restore a stale open rail and then close
       it.  This is limited to actual result links inside the Search dialog. */
    function searchResultLink(target) {
      if (!target || !target.closest) return null;
      var field = document.getElementById('P0_NEW');
      var dialog = field && field.closest('.ui-dialog');
      if (!dialog) return null;
      var link = target.closest('.a-SearchResults-item a[href],.a-SearchResult a[href],a.a-SearchResults-item[href],a.a-SearchResult[href]');
      return link && dialog.contains(link) ? link : null;
    }
    document.addEventListener('pointerdown', function (event) {
      var link = searchResultLink(event.target);
      if (!link) return;
      forgetBranch();
      rememberIntent(isOpen() ? 'open' : 'closed');
    }, true);
    document.addEventListener('click', function (event) {
      var link = searchResultLink(event.target);
      if (!link) return;
      if (useNativeNavigation) return;
      var href = link.getAttribute('href');
      if (!href || href === '#' || href.indexOf('javascript:') === 0) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      forgetBranch();
      var state = isOpen() ? 'open' : 'closed';
      rememberIntent(state);
      window.location.assign(handoffUrl(link.href, state));
    }, true);

    /* APEX refreshes reports and form regions frequently. Those events are
       data/layout lifecycle signals, not sidebar commands. Do lightweight
       tree housekeeping only; never click a tree toggle or shell toggle. */
    document.addEventListener('apexafterrefresh', function () {
      stripTreeTooltips();
    }, true);
    document.addEventListener('apexreadyend', function () {
      stripTreeTooltips();
      if (!referenceNavEnabled()) installRootChevron(rootNode());
    }, true);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();

/* ============================================================================
   HIRE TO RETIRE — PEOPLE LIFECYCLE WORKSPACE (PAGE 253)

   Keep every APEX region, report and generated checksum URL intact. This
   layer only adds semantic hooks and the four-stage lifecycle summary used by
   the modern card layout.
   ========================================================================== */
(function () {
  'use strict';
  var doc = document;
  if (!doc.documentElement.classList.contains('page-253')) return;

  var tones = ['blue', 'green', 'violet', 'orange', 'cyan', 'rose', 'teal', 'slate'];

  function buildJourney(hero) {
    if (!hero || hero.querySelector('.hspl-h2r-journey')) return;
    hero.classList.add('hspl-h2r-hero');
    var titleBlock = hero.querySelector('.hspl-title-block');
    if (titleBlock && !titleBlock.querySelector('.hspl-h2r-subtitle')) {
      var subtitle = doc.createElement('p');
      subtitle.className = 'hspl-h2r-subtitle';
      subtitle.textContent = 'Streamlined people processes. From hiring to beyond.';
      titleBlock.appendChild(subtitle);
    }
    var journey = doc.createElement('div');
    journey.className = 'hspl-h2r-journey';
    journey.setAttribute('aria-label', 'Employee lifecycle: Hire, Manage, Grow, Retire');
    journey.innerHTML =
      '<div class="hspl-h2r-step is-hire"><span class="fa fa-user-plus" aria-hidden="true"></span><b>Hire</b></div>' +
      '<span class="hspl-h2r-arrow fa fa-chevron-right" aria-hidden="true"></span>' +
      '<div class="hspl-h2r-step is-manage"><span class="fa fa-cog" aria-hidden="true"></span><b>Manage</b></div>' +
      '<span class="hspl-h2r-arrow fa fa-chevron-right" aria-hidden="true"></span>' +
      '<div class="hspl-h2r-step is-grow"><span class="fa fa-line-chart" aria-hidden="true"></span><b>Grow</b></div>' +
      '<span class="hspl-h2r-arrow fa fa-chevron-right" aria-hidden="true"></span>' +
      '<div class="hspl-h2r-step is-retire"><span class="fa fa-user" aria-hidden="true"></span><b>Retire</b></div>';
    hero.appendChild(journey);
  }

  function enhance() {
    var workspace = doc.getElementById('R475492556975674250');
    if (!workspace) return false;
    doc.body.classList.add('hspl-h2r');
    workspace.classList.add('hspl-h2r-workspace');
    buildJourney(doc.querySelector('.t-Body-title.hspl-hero-card'));

    var cards = workspace.querySelectorAll('.t-Region.t-Region--noBorder[role="region"]');
    Array.prototype.forEach.call(cards, function (card, index) {
      card.classList.add('hspl-h2r-card', 'hspl-h2r-tone-' + tones[index % tones.length]);
      card.setAttribute('data-hspl-card-index', String(index + 1));
      var column = card.parentElement;
      var row = column && column.parentElement;
      if (column) column.classList.add('hspl-h2r-card-column');
      if (row) row.classList.add('hspl-h2r-grid-row');
    });
    var secondGroup = doc.getElementById('R476341909278381036');
    if (secondGroup) secondGroup.classList.add('hspl-h2r-secondary-group');
    var ready = cards.length === 8 && !!doc.querySelector('.t-Body-title.hspl-h2r-hero .hspl-h2r-journey');
    if (ready) doc.documentElement.classList.add('hspl-h2r-ready');
    return ready;
  }

  function start(attempt) {
    if (enhance() || attempt >= 20) return;
    window.setTimeout(function () { start(attempt + 1); }, 80);
  }
  if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', function () { start(0); }, { once:true });
  else start(0);
  doc.addEventListener('apexafterrefresh', function () { enhance(); }, true);
})();

/* ============================================================================
   ASSET / SETUP / JOB — MODERN MODULE WORKSPACES (PAGES 257, 259, 261)

   These landing pages share Hire to Retire's APEX region + Media List
   contract. Existing regions, links and checksum URLs remain authoritative;
   this layer adds responsive layout hooks and lifecycle context only.
   ========================================================================== */
(function () {
  'use strict';
  var doc = document;
  var root = doc.documentElement;
  var page = root.classList.contains('page-257') ? 257 :
    (root.classList.contains('page-259') ? 259 :
      (root.classList.contains('page-261') ? 261 : 0));
  if (!page) return;

  var configs = {
    257: {
      bodyClass:'hspl-module-asset', workspace:'R476378169995385600', cardIds:['NO1'],
      subtitle:'Control every asset from capitalization through transfer and retirement.',
      aria:'Asset lifecycle: Register, Capitalize, Depreciate, Retire',
      steps:[['fa-list-alt','Register','blue'],['fa-building-o','Capitalize','green'],['fa-line-chart','Depreciate','violet'],['fa-archive','Retire','orange']]
    },
    259: {
      bodyClass:'hspl-module-setup', workspace:'R465910995074396601', cardIds:['ORG_CONFIG','USER_CONFIG','EMP_CONFIG'],
      subtitle:'Configure organization, access and workforce foundations in one place.',
      aria:'Administration lifecycle: Organize, Control, Configure, Govern',
      steps:[['fa-sitemap','Organize','blue'],['fa-shield','Control','green'],['fa-users','Configure','violet'],['fa-check-square-o','Govern','orange']]
    },
    261: {
      bodyClass:'hspl-module-job', workspace:'R478428744006918746', cardIds:['JOB_SERVICE'],
      subtitle:'Plan, order, receive and validate service work with clear controls.',
      aria:'Service lifecycle: Define, Order, Receive, Approve',
      steps:[['fa-wrench','Define','blue'],['fa-file-text-o','Order','green'],['fa-truck','Receive','violet'],['fa-check-circle-o','Approve','orange']]
    }
  };
  var config = configs[page];
  var tones = ['blue','green','violet','orange','cyan','rose','teal','slate'];

  function buildHero() {
    var hero = doc.querySelector('.t-Body-title.hspl-hero-card');
    if (!hero) return false;
    hero.classList.add('hspl-module-hero');
    var titleBlock = hero.querySelector('.hspl-title-block');
    if (!titleBlock) return false;
    var subtitle = titleBlock.querySelector('.hspl-module-subtitle,.hspl-page-desc');
    if (!subtitle) {
      subtitle = doc.createElement('p');
      titleBlock.appendChild(subtitle);
    }
    subtitle.classList.add('hspl-module-subtitle');
    subtitle.textContent = config.subtitle;
    if (!hero.querySelector('.hspl-module-journey')) {
      var journey = doc.createElement('div');
      journey.className = 'hspl-module-journey';
      journey.setAttribute('aria-label', config.aria);
      journey.innerHTML = config.steps.map(function (step, index) {
        var item = '<div class="hspl-module-step is-' + step[2] + '"><span class="fa ' + step[0] + '" aria-hidden="true"></span><b>' + step[1] + '</b></div>';
        return index ? '<span class="hspl-module-arrow fa fa-chevron-right" aria-hidden="true"></span>' + item : item;
      }).join('');
      hero.appendChild(journey);
    }
    return true;
  }

  function enhance() {
    var workspace = doc.getElementById(config.workspace);
    if (!workspace) return false;
    doc.body.classList.add('hspl-module-hub', config.bodyClass);
    workspace.classList.add('hspl-module-workspace');
    var cards = config.cardIds.map(function (id) { return doc.getElementById(id); }).filter(function (card) {
      return !!(card && workspace.contains(card));
    });
    cards.forEach(function (card, index) {
      card.classList.add('hspl-module-card', 'hspl-module-tone-' + tones[index % tones.length]);
      card.setAttribute('data-hspl-module-card', String(index + 1));
      var column = card.parentElement;
      var row = column && column.parentElement;
      if (column) column.classList.add('hspl-module-card-column');
      if (row) row.classList.add('hspl-module-grid-row');
      if (page === 261 && row) {
        Array.prototype.forEach.call(row.children, function (child) {
          if (child !== column) child.classList.add('hspl-module-side-column');
        });
      }
    });
    Array.prototype.forEach.call(workspace.querySelectorAll('.t-Alert'), function (alert) {
      alert.classList.add('hspl-module-info');
    });
    var ready = cards.length === config.cardIds.length && buildHero();
    if (ready) root.classList.add('hspl-module-ready');
    return ready;
  }

  function start(attempt) {
    if (enhance() || attempt >= 24) return;
    window.setTimeout(function () { start(attempt + 1); }, 70);
  }
  if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', function () { start(0); }, { once:true });
  else start(0);
  doc.addEventListener('apexafterrefresh', function () { enhance(); }, true);
})();

/* ============================================================================
   PROCURE TO PAY / ORDER TO CASH — PROCESS HUBS (PAGES 254–255)

   The APEX card reports remain the source of links, labels and icons. This
   enhancement adds only layout hooks and page-specific journey context.
   ========================================================================== */
(function () {
  'use strict';
  var doc = document;
  var root = doc.documentElement;
  var isP2P = root.classList.contains('page-254');
  var isO2C = root.classList.contains('page-255');
  if (!isP2P && !isO2C) return;

  var config = isP2P ? {
    bodyClass:'hspl-p2p-hub',
    cardsId:'R458590376089932109_cards',
    alertId:'R452422091545276619',
    eyebrow:'PROCUREMENT',
    subtitle:'From demand to payment — a seamless procurement journey',
    stages:['PURCHASE','PROCESS','PAY','GROW'],
    qualities:['INTEGRATED','EFFICIENT','TRANSPARENT']
  } : {
    bodyClass:'hspl-o2c-hub',
    cardsId:'R539311827178111429_cards',
    alertId:'R533143542633455939',
    eyebrow:'SALES EXECUTION',
    subtitle:'From enquiry to receipt — a connected order-to-cash journey',
    stages:['ENQUIRE','CONFIRM','DELIVER','COLLECT'],
    qualities:['CONNECTED','VISIBLE','ACCOUNTABLE']
  };
  var tones = ['blue','cyan','teal','green','lime','yellow','amber','orange','rose','pink','violet','indigo','royal','slate','steel'];

  function enhanceHero() {
    var hero = doc.querySelector('.t-Body-title.hspl-hero-card');
    if (!hero) return;
    hero.classList.add('hspl-process-hero');
    var titleBlock = hero.querySelector('.hspl-title-block');
    if (titleBlock && !titleBlock.querySelector('.hspl-process-eyebrow')) {
      var eyebrow = doc.createElement('span');
      eyebrow.className = 'hspl-process-eyebrow';
      eyebrow.textContent = config.eyebrow;
      titleBlock.insertBefore(eyebrow, titleBlock.firstChild);
    }
    var desc = titleBlock && titleBlock.querySelector('.hspl-page-desc');
    if (!desc && titleBlock) {
      desc = doc.createElement('p');
      desc.className = 'hspl-page-desc';
      titleBlock.appendChild(desc);
    }
    if (desc) desc.textContent = config.subtitle;
    if (!hero.querySelector('.hspl-process-meta')) {
      var meta = doc.createElement('div');
      meta.className = 'hspl-process-meta';
      meta.innerHTML =
        '<div class="hspl-process-stages">' + config.stages.map(function (stage) {
          return '<span>' + stage + '</span>';
        }).join('<i>/</i>') + '</div>' +
        '<b aria-hidden="true"></b>' +
        '<div class="hspl-process-qualities">' + config.qualities.map(function (quality) {
          return '<span>' + quality + '</span>';
        }).join('<i>•</i>') + '</div>';
      hero.appendChild(meta);
    }
  }

  function enhance() {
    var cards = doc.getElementById(config.cardsId);
    if (!cards) return false;
    doc.body.classList.add('hspl-process-hub', config.bodyClass);
    cards.classList.add('hspl-process-cards');
    Array.prototype.forEach.call(cards.querySelectorAll(':scope > .t-Cards-item'), function (item, index) {
      item.classList.add('hspl-process-tone-' + tones[index % tones.length]);
      item.setAttribute('data-hspl-process-index', String(index + 1));
      var title = item.querySelector('.t-Card-title');
      if (title && title.textContent.trim() === 'Materail In') title.textContent = 'Material In';
    });
    var region = cards.closest('.js-apex-region');
    if (region) region.classList.add('hspl-process-card-region');
    var alert = doc.getElementById(config.alertId);
    if (alert) alert.classList.add('hspl-process-info');
    enhanceHero();
    var ready = !!doc.querySelector('.t-Body-title.hspl-process-hero .hspl-process-meta');
    if (ready) root.classList.add('hspl-process-ready');
    return ready;
  }

  function start(attempt) {
    if (enhance() || attempt >= 20) return;
    window.setTimeout(function () { start(attempt + 1); }, 80);
  }
  if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', function () { start(0); }, { once:true });
  else start(0);
  doc.addEventListener('apexafterrefresh', function () { enhance(); }, true);
})();

/* ============================================================================
   IRONMART PANEL-NEUTRAL BUSINESS INSIGHTS

   Panel is an HSPL/MKSPL tenant dimension and is not part of Ironmart's
   business scope. Imported dashboards may still contain a compatibility item
   or display-only Panel chip/column. On Business Insights pages, keep the
   value unselected and remove that foreign control from the rendered UI.
   Company and Location remain the authoritative scope dimensions.
   ========================================================================== */
(function () {
  'use strict';
  var doc = document;
  var scheduled = false;

  function pageId() {
    var classes = (doc.documentElement.className + ' ' + (doc.body ? doc.body.className : '')).split(/\s+/);
    for (var i = 0; i < classes.length; i++) {
      var match = /^page-(\d+)$/.exec(classes[i]);
      if (match) return Number(match[1]);
    }
    return 0;
  }

  function inBusinessInsights() {
    var id = pageId();
    return id === 721 || (id >= 902 && id <= 940);
  }

  function hide(node) {
    if (!node) return;
    node.hidden = true;
    node.setAttribute('aria-hidden', 'true');
    node.style.setProperty('display', 'none', 'important');
  }

  function clearPanelItems() {
    doc.querySelectorAll('[id^="P"][id$="_PANEL"]').forEach(function (item) {
      if (!/^P\d+_PANEL$/.test(item.id)) return;
      try {
        if (window.apex && apex.item) apex.item(item.id).setValue('', null, true);
        else item.value = '';
      } catch (ignore) {
        item.value = '';
      }
      hide(item.closest('.t-Form-fieldContainer,[id$="_CONTAINER"]') || item);
      hide(doc.getElementById(item.id + '_CONTAINER'));
      hide(doc.querySelector('label[for="' + item.id + '"]'));
    });
  }

  function removePanelChips() {
    doc.querySelectorAll(
      '.ds-chip,.ds-head-chip,.ds-filter-chip,.ds-slc-chip,.ds-purchase-head-chip,' +
      '.ds-ar-chip,.ds-ap-chip,.t-Badge,.t-Button,.a-CardView-item'
    ).forEach(function (node) {
      var text = (node.textContent || '').replace(/\s+/g, ' ').trim();
      if (/^panel(?:\s|:|$)/i.test(text)) hide(node);
    });
  }

  function removePanelColumns() {
    doc.querySelectorAll('table').forEach(function (table) {
      var headers = table.querySelectorAll('thead th');
      Array.prototype.forEach.call(headers, function (header, index) {
        if ((header.textContent || '').replace(/\s+/g, ' ').trim().toLowerCase() !== 'panel') return;
        hide(header);
        table.querySelectorAll('tbody tr').forEach(function (row) {
          hide(row.children[index]);
        });
      });
    });
  }

  function removeLegacyPanelControls() {
    var phrases = /(?:posted with no panel|cross(?:es|ing)? a panel boundary|panel-locked login)/i;
    doc.querySelectorAll('tbody tr,.t-Cards-item,.ds-kpi,.ds-exception-card').forEach(function (node) {
      if (phrases.test(node.textContent || '')) hide(node);
    });
  }

  function enhance() {
    scheduled = false;
    if (!inBusinessInsights()) return;
    clearPanelItems();
    removePanelChips();
    removePanelColumns();
    removeLegacyPanelControls();
  }

  function schedule() {
    if (scheduled) return;
    scheduled = true;
    window.requestAnimationFrame(enhance);
  }

  if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', enhance);
  else enhance();
  doc.addEventListener('apexafterrefresh', schedule, true);
  new MutationObserver(schedule).observe(doc.documentElement, { childList:true, subtree:true });
})();

/* ============================================================================
   DASHBOARD WORKSPACE SCROLL GUARD

   Oracle JET charts and report wrappers install wheel/keyboard handlers of
   their own. On the long finance dashboards those handlers can consume the
   gesture even when the element under the pointer has no vertical scroll
   range, leaving the document fixed at the top. Preserve genuine nested
   scrolling, but forward an otherwise unhandled vertical gesture to the page.
   This is intentionally limited to dashboard/workspace roots plus the finance
   drill-down family (pages 902 through 933). Forms and registers keep their
   native grid/item scrolling.
   ========================================================================== */
(function () {
  'use strict';
  var doc = document;

  function isDashboardWorkspace() {
    var root = doc.documentElement;
    var financeDrilldown = Array.prototype.some.call(root.classList, function (className) {
      var match = /^page-(\d+)$/.exec(className);
      var pageId = match ? Number(match[1]) : 0;
      return pageId >= 902 && pageId <= 933;
    });
    return financeDrilldown || !!doc.querySelector(
      '.ds-dashboard,.ds-slc-hero,.ds-purchase-head,.ds-sales-head,.ds-360-head,' +
      '.hs-home-root,.hs-sample-home,.imart-home-shell,.bi-workspace,' +
      '.go-command,.approval-workspace'
    );
  }

  function editable(target) {
    return target && target.closest && target.closest(
      'input,textarea,select,[contenteditable="true"],.a-PopupLOV-results,.ui-dialog'
    );
  }

  function nestedScroller(target, deltaY) {
    for (var node = target; node && node !== doc.body && node !== doc.documentElement; node = node.parentElement) {
      var style = window.getComputedStyle(node);
      if (!/(auto|scroll)/.test(style.overflowY) || node.scrollHeight <= node.clientHeight + 1) continue;
      if (deltaY < 0 && node.scrollTop > 0) return true;
      if (deltaY > 0 && node.scrollTop + node.clientHeight < node.scrollHeight - 1) return true;
    }
    return false;
  }

  window.addEventListener('wheel', function (event) {
    if (!isDashboardWorkspace() || event.ctrlKey || Math.abs(event.deltaY) <= Math.abs(event.deltaX)) return;
    if (nestedScroller(event.target, event.deltaY)) return;
    var page = doc.scrollingElement || doc.documentElement;
    var next = Math.max(0, Math.min(page.scrollHeight - page.clientHeight, page.scrollTop + event.deltaY));
    if (next === page.scrollTop) return;
    event.preventDefault();
    event.stopImmediatePropagation();
    page.scrollTop = next;
  }, { capture:true, passive:false });

  window.addEventListener('keydown', function (event) {
    if (!isDashboardWorkspace() || editable(event.target) || event.altKey || event.ctrlKey || event.metaKey) return;
    var page = doc.scrollingElement || doc.documentElement;
    var amount = Math.max(240, Math.round(window.innerHeight * .82));
    var next = null;
    if (event.key === 'PageDown' || (event.key === ' ' && !event.shiftKey)) next = page.scrollTop + amount;
    else if (event.key === 'PageUp' || (event.key === ' ' && event.shiftKey)) next = page.scrollTop - amount;
    else if (event.key === 'Home') next = 0;
    else if (event.key === 'End') next = page.scrollHeight;
    else if (event.key === 'ArrowDown') next = page.scrollTop + 48;
    else if (event.key === 'ArrowUp') next = page.scrollTop - 48;
    if (next == null) return;
    next = Math.max(0, Math.min(page.scrollHeight - page.clientHeight, next));
    if (next === page.scrollTop) return;
    event.preventDefault();
    event.stopImmediatePropagation();
    page.scrollTop = next;
  }, true);
})();
