/* Form-action first paint bridge.
   Older APEX form templates render their original #buttons region in the
   navigation slot and use a legacy title host rather than a Tabs Region. Run
   this independent, DOM-safe bridge before optional page enhancements so the
   genuine actions cannot remain in global navigation if another enhancement
   is absent or late. It re-parents only the existing action node; it never
   creates, submits, changes, or removes a business action. */
(function () {
  "use strict";
  var doc = document;
  function hasPageClass(pageId) {
    return new RegExp("(?:^|\\s)page-" + pageId + "(?:\\s|$)").test(
      (doc.documentElement.className || "") + " " + ((doc.body && doc.body.className) || "")
    );
  }
  function isRegisterScreen() {
    var title = ((doc.querySelector('.hspl-page-title,.t-Body-title h1,.t-Body-title .t-Breadcrumb-label') || {}).textContent || doc.title || '').replace(/\s+/g, ' ');
    return /\b(?:register|list)\b/i.test(title) && !!doc.querySelector('.t-Body-main .t-IRR-region,.t-Body-main .a-IRR');
  }
  function apply() {
    var html = doc.documentElement;
    /* Page 118 owns a dedicated Purchase Order hero below. Do not move its
       controls through the generic bridge first: that creates an empty hero
       and lets the legacy action strip be clipped before its own shell runs. */
    if (hasPageClass(69) || hasPageClass(118) || isRegisterScreen() || !doc.querySelector(".t-Body-main .t-Form-fieldContainer,.t-Body-content .t-Form-fieldContainer,main .t-Form-fieldContainer")) return;
    html.classList.add("hspl-compact-form");
    var hero = doc.querySelector(".t-Body-title, #t_Body_title");
    if (!hero) {
      var globalTitle = doc.getElementById("P0_TITLE_CONTAINER");
      hero = (globalTitle && globalTitle.parentElement && globalTitle.parentElement.closest(".t-BreadcrumbRegion,.t-Region")) || doc.querySelector('[aria-label="TITLE"]');
    }
    var region = doc.getElementById("buttons");
    if (!hero || !region || !region.querySelector(".t-Button,button")) return;
    hero.classList.add("hspl-hero-card", "hspl-has-title");
    var marker = hero.querySelector(".hspl-page-title");
    if (!marker) {
      marker = hero.querySelector("h1,.t-Breadcrumb-label");
      if (marker) marker.classList.add("hspl-page-title");
      else {
        marker = doc.createElement("span");
        marker.className = "hspl-page-title";
        marker.setAttribute("aria-hidden", "true");
        marker.style.cssText = "display:none!important";
        hero.appendChild(marker);
      }
    }
    var holder = hero.querySelector(".hspl-form-hero-actions");
    if (!holder) {
      holder = doc.createElement("div");
      holder.className = "hspl-form-hero-actions";
      hero.appendChild(holder);
    }
    if (!holder.contains(region)) holder.appendChild(region);
  }
  [0, 80, 220, 550, 1100, 2200].forEach(function (delay) { setTimeout(apply, delay); });
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", apply, { once: true });
  else apply();
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplFormActionBridge", apply);
})();

/* Capture a queued sidebar handoff before the rest of this shared runtime can
   allow APEX to paint the previous branch state. */
(function () {
  try {
    if (window.sessionStorage && sessionStorage.getItem('hspl-nav-next-state')) {
      document.documentElement.classList.add('hspl-nav-resolving');
    }
  } catch (ignore) {}
})();

/* Keep legacy page-action regions out of the first paint.  APEX initially
   mounts them beside the navigation shell, then the form shell moves them
   into the hero.  Showing that intermediate location produces the one-second
   "buttons above the form" flash. */
(function () {
  var html = document.documentElement;
  html.classList.add('hspl-action-placement-pending');
  function formActionRegion() {
    var region = document.getElementById('buttons');
    if (region && region.querySelector('.t-Button,button')) return region;
    return Array.prototype.filter.call(document.querySelectorAll('.t-ButtonRegion'), function (candidate) {
      return !candidate.closest('.t-Body-main,.t-Body-content') && !!candidate.querySelector('.t-Button,button');
    })[0] || null;
  }
  function releaseWhenHeroIsReady() {
    var title = document.querySelector('.t-Body-title');
    if (!title) return;
    var isRegister = !!title.querySelector('.hspl-filter-trigger');
    var actions = formActionRegion();
    /* A title can be ready one or two paints before APEX's legacy action
       region is re-parented.  Keep that intermediate navigation-slot render
       hidden until the real region is inside the final hero action holder. */
    var actionsArePlaced = !actions || !!(title.querySelector('.hspl-form-hero-actions') &&
      title.querySelector('.hspl-form-hero-actions').contains(actions));
    var isFinishedFormHero = title.classList.contains('hspl-hero-card') &&
      !!title.querySelector('.hspl-page-title') && actionsArePlaced;
    if (isRegister || isFinishedFormHero) html.classList.remove('hspl-action-placement-pending');
  }
  [0, 80, 220, 550, 1100, 2200, 4000].forEach(function (delay) {
    setTimeout(releaseWhenHeroIsReady, delay);
  });
  /* A malformed page must not stay hidden indefinitely, but normal forms
     release as soon as their title and hero are actually constructed. */
  setTimeout(function () { html.classList.remove('hspl-action-placement-pending'); }, 5200);
})();

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


/* ==========================================================================
   0. SLOW-SERVER MITIGATION for Oracle-JET module loads.
   This ORDS host intermittently serves JET's ojtranslations / timezoneData
   modules slower than require.js's 7s default, so charts time out and render
   BLANK ("Load timeout for modules" in the console). The modules do arrive —
   just slowly — so we lengthen the require timeout to give them time instead of
   failing outright. Runs first, before any chart initialises. Purely defensive:
   wrapped in try/catch, and a no-op if require is absent or already loaded.
   ========================================================================== */
(function () {
  /* This must run AFTER require.js is defined but BEFORE the JET chart modules are
     requested. This file can load before APEX has defined require.js — in which case a
     one-shot set is a silent no-op and require.js later boots with its 7s default (the
     live symptom: waitSeconds stayed 7, charts timed out and blanked). So poll briefly
     until require.js appears, set the timeout to 60s, then stop. Purely defensive. */
  function bump() {
    var ok = false;
    try {
      if (window.requirejs && requirejs.s && requirejs.s.contexts && requirejs.s.contexts._) {
        requirejs.s.contexts._.config.waitSeconds = 60; ok = true;
      }
    } catch (e) {}
    try { if (window.require && require.config) { require.config({ waitSeconds: 60 }); ok = true; } } catch (e) {}
    return ok;
  }
  if (!bump()) {
    var tries = 0;
    var iv = setInterval(function () { if (bump() || ++tries > 120) clearInterval(iv); }, 40);
  }
})();

/* Remove malformed, late-rendered legacy buttons everywhere—not only in a
   hero action region. A real Back/Save action has its own semantic label;
   a button whose entire label is the literal Font Awesome token is unusable. */
(function () {
  "use strict";
  function malformed(button) {
    var label = String(button.getAttribute("aria-label") || button.getAttribute("title") ||
      (button.querySelector(".t-Button-label") || button).textContent || "").replace(/\s+/g, "").trim();
    return /^(?:\\)?f060$/i.test(label);
  }
  function remove(root) {
    var nodes = [];
    if (root && root.nodeType === 1 && root.matches && root.matches("button,.t-Button,[role=button]")) nodes.push(root);
    if (root && root.querySelectorAll) nodes = nodes.concat(Array.prototype.slice.call(root.querySelectorAll("button,.t-Button,[role=button]")));
    nodes.forEach(function (button) { if (malformed(button)) button.remove(); });
  }
  function start() {
    remove(document);
    if (!document.body || !window.MutationObserver) return;
    new MutationObserver(function (records) {
      records.forEach(function (record) {
        Array.prototype.forEach.call(record.addedNodes || [], function (node) { if (node.nodeType === 1) remove(node); });
      });
    }).observe(document.body, { childList: true, subtree: true });
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", start, { once: true });
  else start();
})();

/* Keep register refreshes visually stable while APEX replaces the report DOM.
   A slow report query must not collapse the canvas or flash side gutters. */
(function () {
  "use strict";
  function reportRoot(node) {
    if (!node || !node.closest) return null;
    return node.closest(".t-IRR-region,.t-Region");
  }
  function begin(event) {
    var root = reportRoot(event.target);
    if (!root || !root.querySelector(".a-IRR,.t-IRR-region")) return;
    root.style.setProperty("--hspl-report-refresh-height", Math.max(120, Math.ceil(root.getBoundingClientRect().height)) + "px");
    root.classList.add("hspl-report-refreshing");
  }
  function end(event) {
    var root = reportRoot(event.target);
    if (!root || !root.classList.contains("hspl-report-refreshing")) return;
    requestAnimationFrame(function () { requestAnimationFrame(function () {
      root.classList.remove("hspl-report-refreshing");
      root.style.removeProperty("--hspl-report-refresh-height");
    }); });
  }
  document.addEventListener("apexbeforerefresh", begin, true);
  document.addEventListener("apexafterrefresh", end, true);
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
      ".hs-home-root,.hs-sample-home,.go-command,.approval-workspace"
    );
  }
  function resetDashboardEntry() {
    if (window.location.hash || !isDashboard()) return;
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
    /* The drawer remains in the DOM while it is off-screen.  Make it
       non-interactive while closed so keyboard Tab does not walk through
       hidden filter fields before landing on the register action buttons. */
    var drawer = doc.querySelector(".t-Region.hspl-drawer");
    if (drawer) drawer.inert = false;
    doc.documentElement.classList.add(OPEN_CLASS);
    /* Focus the drawer's close control instead of its first field. Enhanced
       LOV plugins open their result popup on focus, which made the drawer look
       as if it flashed/opened another panel before the user touched a field. */
    var closeControl = doc.querySelector(".hspl-drawer .hspl-drawer-close");
    if (closeControl) { try { closeControl.focus({ preventScroll: true }); } catch (e) { /* older browsers */ } }
  }
  function close() {
    doc.documentElement.classList.remove(OPEN_CLASS);
    var drawer = doc.querySelector(".t-Region.hspl-drawer");
    if (drawer) drawer.inert = true;
  }
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
    var title = ((doc.querySelector('.hspl-page-title,.t-Body-title h1,.t-Body-title .t-Breadcrumb-label') || {}).textContent || doc.title || '').replace(/\s+/g, ' ');
    var isRegister = /\b(?:register|list)\b/i.test(title) && !!doc.querySelector('.t-Body-main .t-IRR-region,.t-Body-main .a-IRR');
    if (isRegister) return;
    if (pageId !== 69 && COMPACT_FORM_PAGE_IDS.has(pageId)) {
      doc.documentElement.classList.add("hspl-compact-form");
    }
  }

  function ensurePageTitle() {
    var host = doc.querySelector(".t-Body-title");
    var formPageIds = [24, 25, 32, 181, 183, 240, 297, 350, 480, 546, 548];
    var pageClass = (doc.documentElement.className || "").match(/(?:^|\s)page-(\d+)(?:\s|$)/);
    if (pageClass && formPageIds.indexOf(parseInt(pageClass[1], 10)) !== -1) {
      doc.documentElement.classList.add("hspl-form-page");
      if (host) host.style.setProperty("display", "none", "important");
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
    /* Universal Theme renders the same title host as either a class or the
       legacy static id, depending on the page template. Both are valid
       header targets for the register Filter drawer trigger. */
    var titleBar = doc.querySelector(".t-Body-title, #t_Body_title");
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

  /* The filter region's buttons are declared in its "next" slot, so APEX
     renders them in the region header — which, once the region is a drawer, is
     the title bar. Re-parent them into a footer. Moving a node keeps its id,
     href/onclick and delegated bindings, so behaviour is untouched. */
  function buildFooter(drawer) {
    var footer = el("div", "hspl-drawer-footer");
    Array.prototype.forEach.call(
      drawer.querySelectorAll(".t-Region-header .t-Button, .t-Region-headerItems--buttons .t-Button"),
      function (b) { if (!b.classList.contains("hspl-drawer-close")) footer.appendChild(b); }
    );
    if (!footer.children.length) return null;
    drawer.appendChild(footer);
    return footer;
  }

  function init() {
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
    function hasRegisterReport() { return !!doc.querySelector('.a-IRR, .a-GV, .t-IRR-region'); }
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
    /* A filter drawer is a register/report feature only. Form pages can have
       regions named “Filter” for LOV helpers or legacy actions, but those
       must stay invisible to this register drawer initializer. */
    if (!hasRegisterReport()) return;

    var unnamedCandidates = [];
    Array.prototype.forEach.call(doc.querySelectorAll('.t-Region'), function (region) {
      if (region.classList.contains('js-filter-drawer') || region.classList.contains('hspl-drawer')) return;
      var title = regionTitle(region);
      if (title === 'filter' || title === 'filters') {
        region.classList.add('hspl-drawer');
        return;
      }
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
    /* Match the closed visual state from the first paint. The trigger lives
       outside the drawer, so it remains normally reachable by keyboard. */
    drawer.inert = !isOpen();

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

  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", init);
  else init();
  /* The nav tree can hydrate after init; re-run icon injection a few times and
     after APEX signals ready. Each pass skips rows already done. */
  [250, 800, 1600].forEach(function (ms) { setTimeout(injectNavIcons, ms); });
  if (window.apex && apex.jQuery) apex.jQuery(window).on("apexready", injectNavIcons);
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
  function assistantBelongsOnActiveTab(shell) {
    var links = shell ? shell.querySelectorAll(".t-Tabs-link") : [];
    var active;
    /* A single-panel form keeps its assistant. On a multi-tab form it belongs
       only to the first (header) step, leaving detail grids unrestrained. */
    if (links.length < 2) return true;
    active = shell.querySelector(".t-Tabs-link[aria-selected='true'],.t-Tabs-link.is-active");
    return !active || active === links[0];
  }
  function syncAssistantVisibility(shell, assistant) {
    var host = assistant && assistant.parentElement;
    var hide = !assistantBelongsOnActiveTab(shell);
    if (!host) return;
    host.classList.toggle("hspl-assistant-off-tab", hide);
    assistant.classList.toggle("hspl-assistant-off-tab", hide);
    assistant.setAttribute("aria-hidden", String(hide));
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
    /* Legacy dialog-close controls can be emitted as bare direct children of
       the page title, rather than inside their authored dialog region.  They
       carry no usable label after APEX hydration and render as the empty
       outlined F060 boxes. The real action region is the only header action
       source, so remove these orphan nodes instead of merely hiding text. */
    Array.prototype.forEach.call(hero.children, function (child) {
      /* The register drawer trigger is intentionally a direct hero child.
         It is a real page action, not a legacy dialog-close placeholder. */
      if (child === holder || child === region || child.classList.contains("hspl-filter-trigger") ||
          !child.matches || !child.matches("button,.t-Button")) return;
      child.remove();
    });
    /* Some legacy dialog regions render their own Back/Cancel controls beside
       the conventional action region. They duplicate its real navigation
       action and were the source of the visible \\f060 placeholders. */
    Array.prototype.forEach.call(hero.querySelectorAll(".t-Button,button"), function (button) {
      if (region.contains(button)) return;
      var standaloneLabel = clean(button.getAttribute("aria-label") || button.getAttribute("title") ||
        (button.querySelector(".t-Button-label") || button).textContent || "");
      /* Some legacy exports persist the Font Awesome glyph literally as
         \f060. Keep that original Back action and event handler, but give it
         a real accessible name and the same icon treatment as Material In. */
      if (/^(?:\\)?f060$/i.test(standaloneLabel)) {
        button.classList.add("hspl-broken-legacy-glyph");
        button.setAttribute("aria-hidden", "true");
        button.tabIndex = -1;
        button.style.setProperty("display", "none", "important");
        return;
      }
      if (/^(back|cancel)$/i.test(standaloneLabel) && !holder.contains(button)) button.remove();
    });
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
        button.classList.add("hspl-broken-legacy-glyph");
        button.setAttribute("aria-hidden", "true");
        button.tabIndex = -1;
        button.style.setProperty("display", "none", "important");
        return;
      }
      button.classList.toggle("hspl-form-primary-action", /^(add new|new|add)$/i.test(label));
      button.classList.toggle("hspl-form-action-back", /^(back|cancel)$/i.test(label));
      button.classList.toggle("hspl-form-action-save", /^(save|create)$/i.test(label));
      button.classList.toggle("hspl-form-action-add", /^(add new|new|add)$/i.test(label));
      button.classList.toggle("hspl-form-action-iconless", /^(back|cancel)$/i.test(label) && !button.querySelector(".t-Icon"));
      /* Status is the one header action that remains text-first, matching
         Material In's compact Status control. All other icon actions use a
         fixed square tile so legacy captions cannot overlap their neighbours. */
      button.classList.toggle("hspl-form-action-status", /^(status|active|draft|pending|approved|rejected|closed|cancelled)$/i.test(label) || /status/i.test(button.id || ""));
      button.classList.toggle("hspl-form-action-text", !!label && !button.querySelector(".t-Icon") && !/^(back|cancel)$/i.test(label));
    });
  }
  function normalizeLegacyBackGlyph(hero) {
    /* Some APEX exports inject this button after the standard action region,
       and expose its Font Awesome source token rather than icon markup. Keep
       the original node/handler, replacing only that erroneous visible token. */
    Array.prototype.forEach.call(hero.querySelectorAll(".t-Button,button"), function (button) {
      var fingerprint = [button.getAttribute("aria-label"), button.getAttribute("title"), button.textContent].join(" ");
      if (!/f060/i.test(fingerprint)) return;
      button.classList.add("hspl-broken-legacy-glyph");
      button.setAttribute("aria-hidden", "true");
      button.tabIndex = -1;
      button.style.setProperty("display", "none", "important");
    });
  }
  function observeLateLegacyGlyphs(hero) {
    if (!hero || hero.hasAttribute("data-hspl-legacy-glyph-observer") || !window.MutationObserver) return;
    hero.setAttribute("data-hspl-legacy-glyph-observer", "true");
    var queued = false;
    new MutationObserver(function (records) {
      var changed = records.some(function (record) { return record.addedNodes && record.addedNodes.length; });
      if (!changed || queued) return;
      queued = true;
      window.requestAnimationFrame(function () {
        queued = false;
        normalizeLegacyBackGlyph(hero);
      });
    }).observe(hero, { childList: true, subtree: true, characterData: true });
  }
  function ensureAssistant(shell, hero) {
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
      /* The first tab can be collapsed too. The panel host switches to one
         working column while the compact arrow remains available to reopen it. */
      panelHost.classList.toggle("hspl-assistant-user-collapsed", collapsed);
      this.setAttribute("aria-expanded", String(!collapsed));
      this.setAttribute("aria-label", collapsed ? "Expand Document Assistant" : "Collapse Document Assistant");
    });
    syncAssistantTop(hero);
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
    syncAssistantVisibility(shell, assistant);
    var fields = requiredFields(activeScope(shell));
    var done = fields.filter(function (field) { return !!valueFor(field.container); }).length;
    var total = fields.length, missing = total - done;
    var percent = total ? Math.round(done * 100 / total) : 100;
    updateFormStepNotice(shell, fields, done);
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
  function boot() {
    if (!eligible()) return;
    var hero = doc.querySelector(".t-Body-title.hspl-hero-card");
    var shell = tabsShell();
    if (hero && !doc.body.classList.contains("hspl-po-reference")) normalizeLegacyBackGlyph(hero);
    if (hero) {
      actionRegion(hero);
      observeLateLegacyGlyphs(hero);
      normalizeLegacyBackGlyph(hero);
    }
    /* Action placement belongs to every compact form, not only forms that
       happen to have a Tabs Region.  Legacy master pages (for example
       Additional Business Place) author #buttons in beforeNavigationBar;
       returning here previously left those real Back/Save controls inside
       the global navigation bar.  The assistant and step notice still need
       a tab shell, so limit only those tab-specific features below. */
    if (!shell) return;
    ensureAssistant(shell, hero);
    updateAssistant(shell);
    syncAssistantTop(hero);
  }
  function scheduleBoot() { [0, 180, 700, 1400].forEach(function (delay) { setTimeout(boot, delay); }); }
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", scheduleBoot);
  else scheduleBoot();
  doc.addEventListener("input", function () { var shell = tabsShell(); if (shell) updateAssistant(shell); }, true);
  doc.addEventListener("change", function () { var shell = tabsShell(); if (shell) updateAssistant(shell); }, true);
  doc.addEventListener("click", function (event) {
    if (event.target.closest && event.target.closest(".hspl-form-tabs .t-Tabs-link")) {
      [0, 100, 350].forEach(function (delay) { setTimeout(function () { updateAssistant(tabsShell()); }, delay); });
    }
  }, true);
  window.addEventListener("resize", function () { syncAssistantTop(doc.querySelector(".t-Body-title.hspl-hero-card")); }, { passive: true });
  if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplFormShell", scheduleBoot);
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
    return doc.documentElement.classList.contains("hspl-compact-form") &&
      !doc.documentElement.classList.contains("page-69") &&
      !doc.body.classList.contains("hspl-po-reference");
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
        region.classList.contains("hspl-semantic-layout--five") ||
        region.classList.contains("hspl-semantic-layout--row-aligned")) return;
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
    var rowCounts = [];
    Array.prototype.forEach.call(grid.children, function (row) {
      if (!row.classList || !row.classList.contains("row")) return;
      var count = cells.filter(function (entry) { return entry.cell.parentElement === row; }).length;
      if (count) rowCounts.push({ row: row, count: count });
    });
    var rowAlignmentColumns = rowCounts.reduce(function (maximum, entry) {
      return Math.max(maximum, entry.count);
    }, 0);
    var preserveRows = rowCounts.length >= 2 && rowAlignmentColumns >= 2 &&
      rowAlignmentColumns <= 4 && rowCounts.filter(function (entry) {
        return entry.count === rowAlignmentColumns;
      }).length >= 2;
    /* Dense logistics/quantity blocks work like Material In Transportation:
       five compact controls on a row. Normal General/Reference sections keep
       their more readable mixed 12-unit proportions. */
    var compactCount = cells.filter(function (entry) { return entry.kind === "compact"; }).length;
    var denseFive = !preserveRows && cells.length >= 8 && compactCount / cells.length >= 0.65 &&
      !fields.some(function (field) { return field.querySelector(".apex-item-group--popup-lov,.apex-item-popup-lov,.a-ComboSelect,select.apex-item-select"); }) &&
      !cells.some(function (entry) { return entry.kind === "wide" || entry.kind === "full"; });
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
    if (preserveRows) {
      region.classList.add("hspl-semantic-layout--row-aligned");
      rowCounts.forEach(function (entry) {
        entry.row.style.setProperty("--hspl-semantic-columns", String(rowAlignmentColumns));
      });
    }
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
  }
  function directGrid(region) {
    var body = directBody(region);
    return body && Array.prototype.filter.call(body.children, function (child) {
      return child.classList && child.classList.contains("container");
    })[0];
  }
  function hasRepeatedRowRhythm(region) {
    var grid = directGrid(region);
    if (!grid) return false;
    var counts = [];
    Array.prototype.forEach.call(grid.children, function (row) {
      if (!row.classList || !row.classList.contains("row")) return;
      var count = Array.prototype.filter.call(row.children, function (cell) {
        if (!cell.classList || !cell.classList.contains("col") || cell.querySelector(".t-Region")) return false;
        var fields = Array.prototype.filter.call(cell.querySelectorAll(".t-Form-fieldContainer"), function (field) {
          return field.closest(".t-Region") === region;
        });
        return fields.length === 1;
      }).length;
      if (count) counts.push(count);
    });
    var columns = counts.reduce(function (maximum, count) { return Math.max(maximum, count); }, 0);
    return counts.length >= 2 && columns >= 2 && columns <= 4 &&
      counts.filter(function (count) { return count === columns; }).length >= 2;
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
      /* Preserve authored APEX rows. Height-based spanning can pull a later
         card into an earlier visual row after APEX finishes hydrating fields. */
    });
  }
  function apply() {
    if (!eligible()) return;
    Array.prototype.forEach.call(doc.querySelectorAll(".t-Body-main .t-Region"), function (region) {
      if (region.classList.contains("hspl-drawer") || region.classList.contains("js-filter-drawer") ||
          region.closest(".ui-dialog,.a-IRR,.a-GV,.t-IRR-region")) return;
      /* prepare() itself accepts only the simple, one-field-per-cell Universal
         Theme structure. Applying that guarded adapter to every form region
         gives General its Material In three-up rhythm and supporting cards
         their readable two-up rhythm without touching reports or plug-ins. */
      prepare(region);
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
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initStatusPaint, { once: true });
  } else {
    initStatusPaint();
  }
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
  var nativeViewportFramesLeft = 0;
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
    /* Browser scroll events can arrive substantially faster than the display
       refresh rate while a wide register is dragged. Updating the separate
       APEX fixed-header scroller for each event forces needless synchronous
       work and makes the horizontal bar feel heavy. Retain the latest position
       and mirror it once per paint frame instead. */
    var headerFrame = 0;
    var pendingLeft = 0;
    tbody.addEventListener("scroll", function () {
      var key = nativeScrollKey(tbody);
      var savedLeft = key && Object.prototype.hasOwnProperty.call(nativeScrollPositions, key)
        ? nativeScrollPositions[key]
        : 0;
      /* StickyTableHeader briefly forces a freshly toggled body back to zero.
         During a vertical page scroll that is an internal reset, not user
         intent: restore the last horizontal position in this same event. */
      if (tbody.scrollLeft === 0 && savedLeft > 0 && restoreProtectedHorizontalPosition(tbody, thead)) return;
      pendingLeft = tbody.scrollLeft;
      if (key) nativeScrollPositions[key] = pendingLeft;
      if (headerFrame) return;
      headerFrame = requestAnimationFrame(function () {
        headerFrame = 0;
        if (thead.scrollLeft !== pendingLeft) thead.scrollLeft = pendingLeft;
      });
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
    var headTable = thead.querySelector(".a-IRR-table");
    var bodyRow = null;
    if (bodyTable) {
      var bodyRows = bodyTable.querySelectorAll(":scope > tbody > tr");
      for (var rowIndex = 0; rowIndex < bodyRows.length; rowIndex++) {
        if (bodyRows[rowIndex].querySelector(":scope > td")) {
          bodyRow = bodyRows[rowIndex];
          break;
        }
      }
      if (!bodyRow) bodyRow = bodyTable.querySelector("thead tr");
    }
    var headRow = headTable && headTable.querySelector("tr");
    if (!bodyTable || !headTable || !bodyRow || !headRow) return;
    var bodyCells = Array.prototype.slice.call(bodyRow.cells || []);
    var headCells = Array.prototype.slice.call(headRow.cells || []);
    if (!bodyCells.length || bodyCells.length !== headCells.length) return;
    for (var i = 0; i < bodyCells.length; i++) {
      if ((bodyCells[i].colSpan || 1) !== (headCells[i].colSpan || 1)) return;
    }
    var widths = bodyCells.map(function (cell) { return cell.getBoundingClientRect().width; });
    if (widths.some(function (width) { return !width; })) return;
    var total = bodyTable.getBoundingClientRect().width;
    if (!total) return;
    /* The cloned table lives inside its own fixed-header viewport.  During the
       navigation rail animation APEX expands the scrolling body first, while
       that viewport can retain its previous inline width for a paint.  Keep
       the viewport locked to the body's actual scrollport as well as copying
       the table tracks below.  This is deliberately separate from `total`:
       a horizontally scrollable report may have a wider table than viewport. */
    var viewportWidth = Math.round((tbody.clientWidth || tbody.getBoundingClientRect().width) * 100) / 100;
    if (viewportWidth > 0) thead.style.setProperty("width", viewportWidth + "px", "important");
    headTable.style.setProperty("table-layout", "fixed", "important");
    headTable.style.setProperty("width", total + "px", "important");
    headTable.style.setProperty("min-width", total + "px", "important");
    headCells.forEach(function (cell, index) {
      var px = widths[index] + "px";
      cell.style.setProperty("box-sizing", "border-box", "important");
      cell.style.setProperty("width", px, "important");
      cell.style.setProperty("min-width", px, "important");
      cell.style.setProperty("max-width", px, "important");
    });
    var cols = headTable.querySelectorAll("colgroup col");
    if (cols.length === widths.length) {
      for (var c = 0; c < cols.length; c++) cols[c].style.setProperty("width", widths[c] + "px", "important");
    }
    thead.scrollLeft = tbody.scrollLeft;
    /* Universal Theme creates the in-flow sticky placeholder from the original
       IR heading, but this theme deliberately compresses that original row.
       Its computed height can consequently be 5-6px taller than the visible
       clone, leaving a white seam between header and first row.  Keep the two
       measurements identical without changing table/column geometry. */
    var wrapper = tbody.closest ? tbody.closest('.t-fht-wrapper') : null;
    var placeholder = wrapper && wrapper.querySelector(':scope > .js-stickyWidget-placeholder');
    if (placeholder) {
      if (viewportWidth > 0) placeholder.style.setProperty('width', viewportWidth + 'px', 'important');
      var visibleHeight = Math.round(thead.getBoundingClientRect().height * 100) / 100;
      if (visibleHeight > 0) {
        placeholder.style.setProperty('height', visibleHeight + 'px', 'important');
        bodyTable.style.setProperty('margin-top', '0', 'important');
      }
    }
  }
  function scheduleNativeGeometry(tbody, thead) {
    syncHeaderToBody(tbody, thead);
  }

  /* Long business values are deliberately kept in a small, known set of
     semantic columns. Older registers carry 100–150px inline wrappers for
     some of them, so names and document numbers are needlessly ellipsised.
     Apply only a minimum width to those columns: this never changes the report
     viewport or re-measures/re-writes the table width, which is what caused
     the former refresh-time stretching issue. APEX can still make a column
     wider when its own report definition requires it. */
  function semanticColumnMinimum(label) {
    var name = (label || "").replace(/\s+/g, " ").trim().toUpperCase();
    if (!name) return 0;
    if (/\b(FORMULA|NARRATION|DESCRIPTION|DETAIL|ADDRESS|REMARK)\b/.test(name)) return 300;
    if (/\b(VENDOR|SUPPLIER|CUSTOMER|PARTY|TRANSPORTER|CONSIGNEE|AGENT|OWNER|EMPLOYEE|DRIVER)\b/.test(name)) return 280;
    if (/\b(?:MATERIAL|ITEM)\s+(?:(?:IN|OUT)\s+)?NO\b/.test(name)) return 280;
    if (/\b(?:REFERENCE|REF|PURCHASE ORDER|SALES ORDER|LOADING ADVICE|DESPATCH ADVICE|GATE PASS|GRN|INVOICE|BILL|VOUCHER|DEBIT NOTE|CREDIT NOTE|CHALLAN|WEIGHMENT|REQUISITION|INDENT|ISSUE|ENTRY|EWAY BILL|LR|IRN|ACK)\s*(?:NO|NUMBER)\b/.test(name)) return 270;
    return 0;
  }
  function widthMapFromHeader(table) {
    var head = table && table.tHead;
    var rows = head && head.rows && head.rows.length ? head.rows : (table ? table.rows : []);
    var row = rows && rows.length ? rows[rows.length - 1] : null;
    var result = Object.create(null);
    if (!row || !row.cells) return result;
    var column = 0;
    for (var i = 0; i < row.cells.length; i++) {
      var cell = row.cells[i];
      var span = Math.max(1, cell.colSpan || 1);
      var minimum = semanticColumnMinimum(cell.innerText || cell.textContent || "");
      if (minimum) {
        for (var s = 0; s < span; s++) result[column + s] = minimum;
      }
      column += span;
    }
    return result;
  }
  function applyMinimumsToTable(table, minimums) {
    if (!table || !minimums || !Object.keys(minimums).length) return;
    var cols = table.querySelectorAll("colgroup col");
    for (var c = 0; c < cols.length; c++) {
      if (!minimums[c]) continue;
      cols[c].style.setProperty("min-width", minimums[c] + "px", "important");
      /* Fixed-layout IR tables ignore min-width on a <col>. Give only the
         affected semantic track a width. Do not read layout here: this runs
         during report refresh and per-cell geometry reads can block rendering. */
      cols[c].style.setProperty("width", minimums[c] + "px", "important");
    }
    var rows = table.rows || [];
    for (var r = 0; r < rows.length; r++) {
      var column = 0;
      for (var i = 0; i < rows[r].cells.length; i++) {
        var cell = rows[r].cells[i];
        var span = Math.max(1, cell.colSpan || 1);
        var minimum = 0;
        for (var s = 0; s < span; s++) minimum = Math.max(minimum, minimums[column + s] || 0);
        if (minimum) {
          cell.style.setProperty("min-width", minimum + "px", "important");
          cell.style.setProperty("width", minimum + "px", "important");
          /* Many legacy IR definitions wrap text in a 100–180px inline div.
             That creates the apparent "short name in a wide column" defect.
             Let only semantic long-value cells fill their existing track;
             no row/table measurement or non-semantic column is touched. */
          Array.prototype.forEach.call(cell.children || [], function (child) {
            if (!child.style || !/px$/i.test(child.style.width || '')) return;
            child.style.setProperty('width', '100%', 'important');
            child.style.setProperty('max-width', '100%', 'important');
            child.style.setProperty('box-sizing', 'border-box', 'important');
          });
        }
        column += span;
      }
    }
  }
  function applySemanticColumnMinimums(tbody, thead) {
    var bodyTable = tbody && tbody.querySelector(".a-IRR-table");
    var headTable = thead && thead.querySelector(".a-IRR-table");
    if (!bodyTable || !headTable) return;
    var minimums = widthMapFromHeader(headTable);
    if (Object.keys(minimums).length) {
      applyMinimumsToTable(bodyTable, minimums);
      applyMinimumsToTable(headTable, minimums);
    }
    releaseLegacyClippedWrappers(bodyTable);
  }

  /* Auto-repair legacy report expressions such as
     <div style="width:80px">#VALUE#</div>.  Their hard-coded inner width can
     be smaller than the APEX column track, causing a clipped value alongside
     empty space. Inspect one representative cell per rendered column (not
     every value), then release that inner wrapper for the whole column. This
     works on every register and avoids costly text/layout measurement loops. */
  function releaseLegacyClippedWrappers(table) {
    if (!table || table.__hsplLegacyWrapperReleased) return;
    table.__hsplLegacyWrapperReleased = true;
    var rows = Array.prototype.slice.call(table.querySelectorAll('tbody tr')).slice(0, 50);
    if (!rows.length) return;
    var release = Object.create(null);
    function inspect(cell, column) {
      if (release[column]) return;
      var child = cell && cell.querySelector(':scope > div[style]');
      var declared = child && child.style && /px$/i.test(child.style.width || '')
        ? parseFloat(child.style.width) : 0;
      /* A single cheap cell-width comparison is enough: the fixed wrapper is
         structurally the defect when it is narrower than its assigned track. */
      if (declared && cell.clientWidth > declared + 8) release[column] = true;
    }
    rows.forEach(function (row) {
      var column = 0;
      Array.prototype.forEach.call(row.cells || [], function (cell) {
        var span = Math.max(1, cell.colSpan || 1);
        if (span === 1) inspect(cell, column);
        column += span;
      });
    });
    if (!Object.keys(release).length) return;
    rows.forEach(function (row) {
      var column = 0;
      Array.prototype.forEach.call(row.cells || [], function (cell) {
        var span = Math.max(1, cell.colSpan || 1);
        if (span === 1 && release[column]) {
          Array.prototype.forEach.call(cell.querySelectorAll(':scope > div[style]'), function (child) {
            if (!/px$/i.test(child.style.width || '')) return;
            child.style.setProperty('width', '100%', 'important');
            child.style.setProperty('max-width', '100%', 'important');
            child.style.setProperty('box-sizing', 'border-box', 'important');
          });
        }
        column += span;
      });
    });
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
    /* single post-layout correction only */
    if (nativeViewportFrame) return;
    function beforePaint() {
      nativeViewportFrame = 0;
      syncNativeHeaderScroll();
      nativeViewportFramesLeft--;
      if (nativeViewportFramesLeft > 0) nativeViewportFrame = requestAnimationFrame(beforePaint);
    }
    nativeViewportFrame = requestAnimationFrame(beforePaint);
  }

  /* Opening/closing the sidebar changes .t-Body-main's width without a window
     resize. APEX does not then re-run its fixed-header calculation, leaving the
     cloned heading at the old width until a full browser refresh. Re-sync only
     the clone from its already-rendered body on that geometry change; this is
     non-visual state repair and never writes body/table widths. */
  var shellGeometryFrame = 0;
  function syncHeadersAfterShellGeometry() {
    var bodies = document.querySelectorAll('.t-fht-tbody');
    for (var i = 0; i < bodies.length; i++) {
      var wrap = bodies[i].closest ? bodies[i].closest('.t-fht-wrapper') : null;
      var thead = wrap ? wrap.querySelector('.t-fht-thead') : null;
      if (!thead) continue;
      syncHeaderToBody(bodies[i], thead);
      if (thead.scrollLeft !== bodies[i].scrollLeft) thead.scrollLeft = bodies[i].scrollLeft;
    }
  }
  function queueShellGeometrySync() {
    /* The sidebar rail moves while the register canvas changes in one step.
       One post-layout header copy prevents reflow and keeps every column stable. */
    if (shellGeometryFrame) cancelAnimationFrame(shellGeometryFrame);
    shellGeometryFrame = requestAnimationFrame(function () {
      shellGeometryFrame = 0;
      syncHeadersAfterShellGeometry();
    });
  }
  function hasFixedHeaderClone() {
    return !!document.querySelector(".t-fht-wrapper .t-fht-thead, .t-fht-tbody");
  }
  function scheduleShellGeometrySync() {
    if (!hasFixedHeaderClone()) return;
    queueShellGeometrySync();
  }
  function beginSidebarGeometrySync() {
    if (!hasFixedHeaderClone()) return;
    queueShellGeometrySync();
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
      applySemanticColumnMinimums(tbody, thead);
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
    var main = document.querySelector('.t-Body-main');
    if (main && window.ResizeObserver && !main.__hsplRegisterShellResize) {
      main.__hsplRegisterShellResize = true;
      var previousMainWidth = Math.round(main.getBoundingClientRect().width);
      main.__hsplRegisterShellResizeObserver = new ResizeObserver(function (entries) {
        var width = entries[0] && Math.round(entries[0].contentRect.width);
        if (!width || width === previousMainWidth) return;
        previousMainWidth = width;
        scheduleShellGeometrySync();
      });
      main.__hsplRegisterShellResizeObserver.observe(main);
    }
    document.addEventListener('transitionend', function (event) {
      var target = event.target;
      if (target && target.matches && target.matches('#t_Body_nav, .t-Body-main, .t-Body')) {
        scheduleShellGeometrySync();
      }
    }, { passive: true });
    /* Start before the sidebar's width transition begins. ResizeObserver keeps
       this correct for programmatic toggles; the click hook removes the one
       stale cloned-header frame that used to appear immediately after close. */
    document.addEventListener('click', function (event) {
      if (event.target.closest && event.target.closest('#t_Button_navControl')) {
        requestAnimationFrame(beginSidebarGeometrySync);
      }
    }, true);
    if (window.MutationObserver && document.body && !document.body.__hsplRegisterShellClassObserver) {
      var navWasExpanded = document.body.classList.contains('js-navExpanded');
      document.body.__hsplRegisterShellClassObserver = new MutationObserver(function () {
        var navIsExpanded = document.body.classList.contains('js-navExpanded');
        if (navIsExpanded === navWasExpanded) return;
        navWasExpanded = navIsExpanded;
        beginSidebarGeometrySync();
      });
      document.body.__hsplRegisterShellClassObserver.observe(document.body, {
        attributes: true,
        attributeFilter: ['class']
      });
    }
  }
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initNativeScrollSync, { once: true });
  } else {
    initNativeScrollSync();
  }
  setTimeout(initNativeScrollSync, 0);
  setTimeout(initNativeScrollSync, 750);
  window.addEventListener("load", attachNativeScrollSync, { once: true });
  window.addEventListener("resize", attachNativeScrollSync, { passive: true });
  window.addEventListener("scroll", protectNativeHeaderScroll, { passive: true });
  document.addEventListener("scroll", guardAnyNativeHeaderScroll, { capture: true, passive: true });
  if (document.fonts && document.fonts.ready) document.fonts.ready.then(attachNativeScrollSync);
  return;

  function setCellWidth(cell, width) {
    var px = width + "px";
    if (cell.style.boxSizing !== "border-box") cell.style.boxSizing = "border-box";
    if (cell.style.width !== px) cell.style.width = px;
    if (cell.style.minWidth !== px) cell.style.minWidth = px;
    if (cell.style.maxWidth !== px) cell.style.maxWidth = px;
  }
  var measureCanvas;
  function contentWidth(cell) {
    var inner = cell.querySelector(".a-IRR-headerLink,.c-main,.c-sub") || cell;
    var style = getComputedStyle(cell);
    var textStyle = getComputedStyle(inner);
    var horizontal = parseFloat(style.paddingLeft || 0) + parseFloat(style.paddingRight || 0) +
      parseFloat(style.borderLeftWidth || 0) + parseFloat(style.borderRightWidth || 0);
    var text = (inner.innerText || inner.textContent || "").replace(/\s+/g, " ").trim();
    var textWidth = 0;
    try {
      measureCanvas = measureCanvas || document.createElement("canvas");
      var context = measureCanvas.getContext("2d");
      context.font = textStyle.font || [
        textStyle.fontStyle, textStyle.fontVariant, textStyle.fontWeight,
        textStyle.fontSize, textStyle.fontFamily
      ].join(" ");
      textWidth = context.measureText(text).width;
      var spacing = parseFloat(textStyle.letterSpacing || 0);
      if (spacing && text.length > 1) textWidth += spacing * (text.length - 1);
    } catch (ignore) {
      textWidth = text.length * 8;
    }
    var extras = 0;
    Array.prototype.forEach.call(
      cell.querySelectorAll("input,select,button,img,svg,.a-Icon"),
      function (node) {
        var rect = node.getBoundingClientRect();
        if (rect.width && getComputedStyle(node).display !== "none") extras += rect.width + 4;
      }
    );
    /* Only honour an explicitly declared child width. APEX's fixed-header
       helper (.t-fht-cell), and ordinary block children, inherit the width we
       assigned to the cell. Measuring their rendered rect made every geometry
       pass feed the previous width back into the next pass until every column
       hit the 420px safety cap. Text and controls are already measured above. */
    var childWidth = 0;
    Array.prototype.forEach.call(cell.children || [], function (node) {
      if (getComputedStyle(node).display === "none") return;
      if (node.classList && node.classList.contains("t-fht-cell")) return;
      var declared = /px$/i.test(node.style.width || "") ? parseFloat(node.style.width) : 0;
      if (declared) childWidth = Math.max(childWidth, declared);
    });
    var renderedWidth = childWidth ? Math.ceil(childWidth + horizontal) : 0;
    return Math.max(renderedWidth, Math.ceil(textWidth + horizontal + extras + 10));
  }
  function rowCells(row, fn) {
    var column = 0;
    for (var i = 0; i < row.cells.length; i++) {
      var cell = row.cells[i];
      var span = Math.max(1, cell.colSpan || 1);
      fn(cell, column, span);
      column += span;
    }
  }
  function syncWidths(tbody, thead) {
    var headTable = thead.querySelector(".a-IRR-table");
    var bodyTable = tbody.querySelector(".a-IRR-table");
    var headRow = headTable && headTable.querySelector("tr");
    var bodyRows = bodyTable ? Array.prototype.slice.call(bodyTable.rows || []) : [];
    if (!headRow || !bodyRows.length || !headRow.cells.length) return;
    var count = 0;
    rowCells(headRow, function (_cell, column, span) { count = Math.max(count, column + span); });
    if (!count) return;

    /* Measure both the cloned heading and every rendered body value. Using
       only the first row made long headings and later values spill into the
       next column. Huge values are capped and safely ellipsised by CSS. */
    var widths = new Array(count).fill(72);
    var measureRows = [headRow].concat(bodyRows.slice(0, 500));
    for (var r = 0; r < measureRows.length; r++) {
      rowCells(measureRows[r], function (cell, column, span) {
        if (getComputedStyle(cell).display === "none") return;
        var needed = Math.min(420, Math.max(72, contentWidth(cell) + 2));
        if (span === 1 && column < count) {
          widths[column] = Math.max(widths[column], needed);
        } else if (span > 1) {
          var each = Math.ceil(needed / span);
          for (var s = 0; s < span && column + s < count; s++) {
            widths[column + s] = Math.max(widths[column + s], each);
          }
        }
      });
    }

    var total = widths.reduce(function (sum, width) { return sum + width; }, 0);
    var viewport = Math.max(0, tbody.clientWidth);
    if (total < viewport && count) {
      var extra = (viewport - total) / count;
      widths = widths.map(function (width) { return Math.ceil(width + extra); });
      total = widths.reduce(function (sum, width) { return sum + width; }, 0);
    }

    var totalPx = total + "px";
    [bodyTable, headTable].forEach(function (table) {
      if (table.style.getPropertyValue("table-layout") !== "fixed") {
        table.style.setProperty("table-layout", "fixed", "important");
      }
      if (table.style.width !== totalPx) table.style.setProperty("width", totalPx, "important");
      if (table.style.minWidth !== totalPx) table.style.setProperty("min-width", totalPx, "important");
    });

    [headRow].concat(bodyRows).forEach(function (row) {
      rowCells(row, function (cell, column, span) {
        var width = 0;
        for (var s = 0; s < span && column + s < widths.length; s++) width += widths[column + s];
        if (width) setCellWidth(cell, width);
      });
    });

    var tables = [bodyTable, headTable];
    for (var t = 0; t < tables.length; t++) {
      var cols = tables[t].querySelectorAll("colgroup col");
      if (cols.length === widths.length) {
        for (var k = 0; k < cols.length; k++) {
          cols[k].style.setProperty("width", widths[k] + "px", "important");
          cols[k].style.setProperty("min-width", widths[k] + "px", "important");
        }
      }
    }
    thead.scrollLeft = tbody.scrollLeft;
  }
  function scheduleGeometry(tbody) {
    if (tbody.__hsplGeometryFrame) cancelAnimationFrame(tbody.__hsplGeometryFrame);
    tbody.__hsplGeometryFrame = requestAnimationFrame(function () {
      tbody.__hsplGeometryFrame = requestAnimationFrame(function () {
        tbody.__hsplGeometryFrame = 0;
        var wrap = tbody.closest ? tbody.closest(".t-fht-wrapper") : null;
        var thead = wrap ? wrap.querySelector(".t-fht-thead") : null;
        if (thead) syncWidths(tbody, thead);
      });
    });
  }
  function attach(tbody) {
    var wrap = tbody.closest ? tbody.closest(".t-fht-wrapper") : null;
    var thead = wrap ? wrap.querySelector(".t-fht-thead") : null;
    if (!thead) return;
    if (!tbody.__hsplHdrSync) {
      tbody.__hsplHdrSync = true;
      linkBodyToHeader(tbody, thead);
      if (window.ResizeObserver) {
        tbody.__hsplHdrResize = new ResizeObserver(function () { scheduleGeometry(tbody); });
        tbody.__hsplHdrResize.observe(tbody);
        /* Observing the table itself re-triggers when this routine applies the
           calculated width. The scroll viewport is the only resize signal we
           need; report refreshes are handled separately below. */
      }
    }
    scheduleGeometry(tbody);
  }
  function syncAll() {
    var list = document.querySelectorAll(".t-fht-tbody");
    for (var i = 0; i < list.length; i++) {
      attach(list[i]);
      var wrap = list[i].closest ? list[i].closest(".t-fht-wrapper") : null;
      var thead = wrap ? wrap.querySelector(".t-fht-thead") : null;
      if (thead) thead.scrollLeft = list[i].scrollLeft;
    }
  }
  function init() {
    syncAll();
    window.addEventListener("resize", syncAll, { passive: true });
    if (window.apex && apex.jQuery) {
      apex.jQuery(document).off("apexafterrefresh.hsplRegisterScroll").on("apexafterrefresh.hsplRegisterScroll", syncAll);
    }
    if (window.MutationObserver && document.body) {
      new MutationObserver(function (mutations) {
        for (var i = 0; i < mutations.length; i++) {
          if (mutations[i].addedNodes.length) { syncAll(); break; }
        }
      }).observe(document.body, { childList: true, subtree: true });
    }
  }
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init, { once: true });
  } else {
    init();
  }
  window.addEventListener("load", syncAll, { once: true });
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
   region. Give those real result links a roving keyboard focus without
   replacing the region or changing its click behaviour. */
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
    var unique = [];
    Array.prototype.forEach.call(scope.querySelectorAll(
      '.a-SearchResults-item, .a-SearchResult, a[href], [role="link"]'
    ), function (candidate) {
      var item = candidate.matches('a[href],[role="link"]') ? candidate :
        candidate.querySelector('a[href],[role="link"]') || candidate;
      if (item.offsetParent === null || item.closest('.ui-dialog-titlebar,.t-Region-header') || unique.indexOf(item) >= 0) return;
      unique.push(item);
    });
    return unique;
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
      item.addEventListener('pointerdown', function () {
        results().forEach(function (other) { other.classList.remove('hspl-search-result-active'); });
        item.classList.add('hspl-search-result-active');
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
      event.preventDefault(); items[current].click();
    }
  }, true);
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initialise, { once: true });
  else initialise();
  if (window.apex && apex.jQuery) apex.jQuery(document).on('apexafterrefresh.hsplGlobalSearchKeyboard', initialise);
  try { new MutationObserver(initialise).observe(document.documentElement, { childList: true, subtree: true }); } catch (ignore) {}
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
   Only ever acts on p00668 (the drill classes exist nowhere else).
   ========================================================================== */
(function () {
  if (!window.apex || !apex.jQuery) return;
  var $ = apex.jQuery;
  $(document).off('click.p668drill').on('click.p668drill',
    '.ds-stage-drill,.ds-exec-drill,.ds-exc-drill',
    function (e) {
      e.preventDefault();
      var el = this, item, region, dedPrefix = null, groupSel = null;
      if (el.classList.contains('ds-stage-drill')) {
        item = 'P668_STAGE_FOCUS'; region = 'p668StageDetail';
        dedPrefix = 'p668RegS'; groupSel = '#p668StageDetail,.ds-srcreg';
      } else if (el.classList.contains('ds-exec-drill')) {
        item = 'P668_EXEC_FOCUS'; region = 'p668ExecDetail';
        dedPrefix = 'p668RegE'; groupSel = '#p668ExecDetail,.ds-execreg';
      } else {
        item = 'P668_EXC_FOCUS'; region = 'p668ExcDetail';
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

    /* The generic title adapter can run on the same DOM-ready turn. Keep its
       real heading, but discard its generated icon/subtitle before composing
       the dedicated PO identity so the subtitle never appears twice. */
    var genericBlock = title.closest ? title.closest('.hspl-title-block') : null;
    if (genericBlock) {
      title.remove();
      genericBlock.remove();
    }
    /* The early generic bridge can leave its subtitle as a sibling rather
       than inside .hspl-title-block. It describes the same page, so remove
       that generated copy before adding the dedicated PO subtitle. */
    Array.prototype.forEach.call(hero.querySelectorAll('.hspl-page-desc'), function (node) {
      node.remove();
    });

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
  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", start);
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
  function activeLink() {
    return document.querySelector("#tabcontainer .t-Tabs-link[aria-selected='true'],#tabcontainer .t-Tabs-link.is-active");
  }
  function isDetailStep() {
    var link = activeLink();
    if (!link) return false;
    /* The assistant belongs only to the first form step. A Detail name is not
       reliable: GRN uses GrnDetail/GrnJob and other forms use custom labels. */
    var links = document.querySelectorAll("#tabcontainer .t-Tabs-link");
    return Array.prototype.indexOf.call(links, link) > 0;
  }
  function setGeneric(host, detail, entering) {
    var assistant = host.querySelector(".hspl-form-assistant");
    if (!assistant) return;
    assistant.style.setProperty("display", detail ? "none" : "", "important");
    /* Tab changes must not overwrite the first-tab choice made with the
       assistant's collapse button. Off-tab hiding is handled by the shared
       form shell above, without leaving an arrow rail behind. */
    host.classList.remove("hspl-detail-assistant-collapsed");
    if (!detail) assistant.classList.toggle("is-collapsed", host.classList.contains("hspl-assistant-user-collapsed"));
  }
  function setMaterialIn(host, detail, entering) {
    var assistant = host.querySelector(".mi-assistant");
    if (!assistant) return;
    assistant.style.setProperty("display", detail ? "none" : "", "important");
    if (detail && entering) host.classList.add("mi-assistant-collapsed");
    /* Keep the user's explicit first-tab collapse choice intact. */
    if (!detail && !host.classList.contains("hspl-mi-assistant-user-collapsed")) host.classList.remove("mi-assistant-collapsed");
    host.classList.toggle("hspl-detail-assistant-collapsed", detail && host.classList.contains("mi-assistant-collapsed"));
  }
  function sync() {
    var host = document.querySelector("#tabcontainer>.t-TabsRegion-items");
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
  function init() {
    schedule();
    document.addEventListener("click", function (event) {
      if (!event.target || !event.target.closest) return;
      if (event.target.closest("#tabcontainer .t-Tabs-link,.hspl-form-assistant-head>button,.mi-assistant-toggle")) schedule();
    }, true);
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
  /* Retired: this generic handler intercepted every Back/Cancel and replayed
     a filter Apply on return. That made a form's Back action open a filter
     before returning to the register. Native APEX navigation is authoritative. */
  var legacyReturnReplayEnabled = false;
  if (!legacyReturnReplayEnabled) return;
  /* Material Out's return route is the first audited migration to the v2
     per-register state model below. Keep this legacy compatibility path off
     that register and its form so the two models can never race each other.
     Material In and every other existing route remain unchanged for now. */
  if (pageId === '167' || pageId === '168') return;
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
    /* Only report-row detail/edit links create the one-time return handoff;
       sidebar, toolbar and ordinary navigation remain unaffected. */
    document.addEventListener('pointerdown', function (event) {
      if (!isRegister() || !event.target.closest) return;
      var link = event.target.closest('.a-IRR a[href], .t-Report-report a[href], .a-GV a[href]');
      if (!link || link.closest('.hspl-drawer, .a-IRR-toolbar, .a-GV-toolbar')) return;
      save();
    }, true);
    /* Some legacy IR edit icons are converted into links only at click time.
       Save once more during the final capture phase, immediately before APEX
       follows that generated edit URL. This is synchronous and does not add a
       report refresh or visible loader. */
    document.addEventListener('click', function (event) {
      if (!isRegister() || !event.target.closest) return;
      var link = event.target.closest('.a-IRR a[href], .t-Report-report a[href], .a-GV a[href]');
      if (link && !link.closest('.hspl-drawer, .a-IRR-toolbar, .a-GV-toolbar')) save();
    }, true);
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
      var back = event.target.closest('#back, button[data-otel-label="Back"], button[data-otel-label="CANCEL"]');
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
  var WORKFLOWS = {};
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
      if (document.referrer && document.referrer.indexOf('/material-out-register') === -1) return;
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

/*
 * Register return state belongs to APEX, not sessionStorage. Interactive
 * Reports and Interactive Grids persist their saved report state in the APEX
 * session when the source page is revisited without a cache/report reset.
 *
 * This retired v3 implementation intercepted Back/Cancel and then replayed
 * only a subset of browser values. That could replace a native branch and
 * lose sorting, pagination, report filters and grid state. Leave the former
 * body inert so existing APEX Back, Cancel, Save-and-Return and browser Back
 * flows can use the declarative, no-clear-cache return targets instead.
 */
(function () {
  "use strict";
  return;
  var key = 'hspl-register-return-v3';
  var ttl = 15 * 60 * 1000;
  function read() { try { return JSON.parse(sessionStorage.getItem(key) || 'null'); } catch (ignore) { return null; } }
  function write(state) { try { sessionStorage.setItem(key, JSON.stringify(state)); } catch (ignore) {} }
  function clear() { try { sessionStorage.removeItem(key); } catch (ignore) {} }
  function expired(state) { return !state || Date.now() - Number(state.savedAt || 0) > ttl; }
  function route(url) { try { return new URL(url, location.href).pathname.replace(/\/$/, ''); } catch (ignore) { return ''; } }
  function drawer() { return document.querySelector('.hspl-drawer,.js-filter-drawer'); }
  function report() { return document.querySelector('.a-IRR,.t-IRR-region,.a-GV'); }
  function isRegister() { return !!(drawer() && report()); }
  function values(root) {
    var result = {};
    if (!root) return result;
    root.querySelectorAll('[id$="_CONTAINER"],input[id],select[id],textarea[id]').forEach(function (node) {
      var id = (node.id || '').replace(/_CONTAINER$/, '');
      if (!/^P\d+_/i.test(id) || Object.prototype.hasOwnProperty.call(result, id)) return;
      try { result[id] = apex.item(id).getValue(); }
      catch (ignore) { var input = document.getElementById(id); if (input) result[id] = input.value; }
    });
    return result;
  }
  function reports() {
    return Array.prototype.map.call(document.querySelectorAll('.a-IRR,.a-GV'), function (node, index) {
      var region = node.closest('.t-Region') || node;
      var scroll = region.querySelector('.t-fht-tbody,.a-GV-w-scroll,.a-GV-bdy');
      var search = region.querySelector('.a-IRR-search-field,input[type="search"]');
      return { id: region.id || node.id || String(index), search: search ? search.value : '', left: scroll ? scroll.scrollLeft : 0, top: scroll ? scroll.scrollTop : 0 };
    });
  }
  function capture(target) {
    var href = target && target.closest && target.closest('a[href]');
    write({
      url: location.href.split('#')[0],
      sourceRoute: route(location.href),
      targetRoute: href ? route(href.href) : '',
      savedAt: Date.now(),
      returning: false,
      filters: values(drawer()),
      reports: reports()
    });
  }
  function textOf(node) { return String((node && (node.getAttribute('aria-label') || node.getAttribute('data-otel-label') || node.getAttribute('title') || node.textContent)) || '').replace(/\s+/g, ' ').trim(); }
  function isLaunch(target) {
    if (!target || !target.closest) return false;
    var link = target.closest('.a-IRR a[href],.t-Report-report a[href],.a-GV a[href]');
    if (link && !link.closest('.hspl-drawer,.a-IRR-toolbar,.a-GV-toolbar')) return true;
    var action = target.closest('#create,#addnew,[data-button-name="Create"],[data-button-name="ADDNEW"],button,a');
    return !!(action && /^(add new|create|edit|view|open)$/i.test(textOf(action)) && !action.closest('.hspl-drawer'));
  }
  function restore(state, attempt) {
    attempt = attempt || 0;
    if (expired(state) || !state.returning || !isRegister() || route(location.href) !== state.sourceRoute) return;
    Object.keys(state.filters || {}).forEach(function (id) {
      try { apex.item(id).setValue(state.filters[id], null, true); }
      catch (ignore) { var input = document.getElementById(id); if (input) input.value = state.filters[id]; }
    });
    (state.reports || []).forEach(function (saved) {
      var region = document.getElementById(saved.id);
      if (!region) return;
      var scroll = region.querySelector('.t-fht-tbody,.a-GV-w-scroll,.a-GV-bdy');
      var search = region.querySelector('.a-IRR-search-field,input[type="search"]');
      if (search && saved.search && !search.value) search.value = saved.search;
      if (scroll) { scroll.scrollLeft = Number(saved.left || 0); scroll.scrollTop = Number(saved.top || 0); }
    });
    if (attempt < 2) { setTimeout(function () { restore(state, attempt + 1); }, 180); return; }
    clear();
  }
  function initRegister() {
    var state = read();
    restore(state);
    ['pointerdown', 'click'].forEach(function (eventName) {
      document.addEventListener(eventName, function (event) { if (isLaunch(event.target)) capture(event.target); }, true);
    });
    document.addEventListener('keydown', function (event) {
      if ((event.key === 'Enter' || event.key === ' ') && isLaunch(event.target)) capture(event.target);
    }, true);
  }
  function initForm() {
    function returnToRegister(event) {
      if (!event.target.closest) return;
      var control = event.target.closest('button,a,input');
      if (!control || !(control.matches('#back,#cancel,[data-button-name="CANCEL"],[data-button-name="BACK"],button[data-otel-label="Back"],button[data-otel-label="CANCEL"]') || /^(back|cancel)$/i.test(textOf(control)))) return;
      var state = read();
      if (expired(state) || !state.url) return;
      var currentRoute = route(location.href);
      var referrerRoute = route(document.referrer || '');
      if (state.targetRoute && state.targetRoute !== currentRoute && state.sourceRoute !== referrerRoute) return;
      if (!state.targetRoute && state.sourceRoute !== referrerRoute) return;
      state.returning = true;
      write(state);
      event.preventDefault();
      event.stopImmediatePropagation();
      try { if (apex.page && apex.page.cancelWarnOnUnsavedChanges) apex.page.cancelWarnOnUnsavedChanges(); } catch (ignore) {}
      location.assign(state.url);
    }
    window.addEventListener('pointerdown', returnToRegister, true);
    window.addEventListener('click', returnToRegister, true);
  }
  if (isRegister()) initRegister(); else initForm();
})();

/* Enhanced LOV AJAX buttons are implementation-only spinners. Add this from
   the shared JavaScript as well as the stylesheet so the rule takes effect on
   already-open APEX application sessions while their theme CSS cache updates. */
(function () {
  function hideDrawerLovIndicators() {
    if (document.getElementById('hspl-drawer-lov-indicator-style')) return;
    var style = document.createElement('style');
    style.id = 'hspl-drawer-lov-indicator-style';
    style.textContent = '.hspl-drawer button[id$="_BUTTON_AJAX"],.js-filter-drawer button[id$="_BUTTON_AJAX"]{display:none!important}' +
      '.t-fht-tbody .a-IRR-table>thead,.t-fht-tbody .a-IRR-table>thead>tr{display:none!important;height:0!important}' +
      '.t-fht-tbody .a-IRR-table>thead th{height:0!important;padding-top:0!important;padding-bottom:0!important;line-height:0!important;border-top:0!important;border-bottom:0!important}' +
      '.t-fht-wrapper{row-gap:0!important}.t-fht-wrapper>.t-fht-thead{margin:0!important;padding:0!important;border-bottom:0!important}.t-fht-wrapper>.t-fht-tbody{margin-top:0!important;padding-top:0!important}';
    (document.head || document.documentElement).appendChild(style);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', hideDrawerLovIndicators);
  else hideDrawerLovIndicators();
})();

/* Keep navigation transitions deterministic across HOME, module landing pages
   and child reports/forms. A navigation carries a ONE-TIME intent; the next
   document consumes it once. No delayed observer is allowed to reopen/close
   the shell later, which removes the visible navigation flicker. */
(function () {
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

  /* Apply the target width before body/APEX initialization. Only the nav and
     canvas geometry is pre-resolved; the page is never hidden or blanked. */
  var bootIntent = stored(intentKey) || preferredIntent();
  if (bootIntent === 'closed') document.documentElement.classList.add('hspl-nav-target-closed');
  if (bootIntent === 'open') document.documentElement.classList.add('hspl-nav-target-open');

  /* Browser zoom can make CSS viewport units describe the layout viewport
     instead of the actually visible viewport. Bind the fixed nav shell to
     visualViewport so its lower edge stays reachable and the tree itself
     receives wheel scrolling. */
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
      var nav = document.getElementById('t_Body_nav');
      if (nav) {
        nav.style.setProperty('top', headerHeight + 'px', 'important');
        nav.style.setProperty('bottom', 'auto', 'important');
        nav.style.setProperty('height', Math.max(0, height - headerHeight) + 'px', 'important');
        nav.style.setProperty('max-height', Math.max(0, height - headerHeight) + 'px', 'important');
        nav.style.setProperty('transform', 'none', 'important');
      }
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
        document.documentElement.classList.remove('hspl-nav-resolving');
        document.documentElement.classList.remove('hspl-nav-target-closed');
        document.documentElement.classList.remove('hspl-nav-target-open');
      });
    });
  }

  function resolveNavigationIntent() {
    var intent = stored(intentKey) || preferredIntent();
    forget(intentKey);                         /* strictly one navigation only */
    if (!intent) {
      forgetBranch();                          /* discard state left by old builds */
      if (isClosed()) normalizeClosedRail();
      else {
        expandRoot();
        revealActiveParentModule();
      }
      document.documentElement.classList.remove('hspl-nav-resolving');
      document.documentElement.classList.remove('hspl-nav-target-closed');
      document.documentElement.classList.remove('hspl-nav-target-open');
      return;
    }
    var shouldOpen = intent === 'open';
    var shellToggle = document.querySelector('#t_Button_navControl');

    /* A leaf navigation must win over Universal Theme's persisted shell state.
       UT can restore js-navExpanded after load/apexreadyend, so resolving the
       first lifecycle callback made leaf closing timing-dependent. Keep the
       destination geometry locked and reassert the native closed state through
       startup; the observer runs before paint when UT changes the body class. */
    if (!shouldOpen) {
      var closedResolved = false;
      var closedObserver = null;
      var closeTimers = [];

      forgetBranch();

      function enforceClosed() {
        if (closedResolved) return;
        shellToggle = document.querySelector('#t_Button_navControl');
        if (shellToggle && isOpen()) shellToggle.click();
        if (isClosed()) normalizeClosedRail();
      }

      function finishClosed() {
        if (closedResolved) return;
        enforceClosed();
        closedResolved = true;
        if (closedObserver) closedObserver.disconnect();
        closeTimers.forEach(function (timer) { clearTimeout(timer); });
        revealResolvedPage();
      }

      try {
        closedObserver = new MutationObserver(function () {
          if (!closedResolved && isOpen()) enforceClosed();
        });
        closedObserver.observe(document.body, {
          attributes: true,
          attributeFilter: ['class']
        });
      } catch (ignore) { /* lifecycle/timer enforcement remains active */ }

      document.addEventListener('apexreadyend', function () {
        enforceClosed();
        closeTimers.push(setTimeout(finishClosed, 180));
      }, { once: true });
      window.addEventListener('load', function () {
        requestAnimationFrame(enforceClosed);
      }, { once: true });
      [0, 80, 240, 600, 1000].forEach(function (delay) {
        closeTimers.push(setTimeout(enforceClosed, delay));
      });
      closeTimers.push(setTimeout(finishClosed, 1400));
      return;
    }

    var resolved = false;
    function settle(attempt) {
      if (resolved) return;
      if (shellToggle && shouldOpen !== isOpen()) shellToggle.click();
      if (shellToggle && shouldOpen !== isOpen() && attempt < 12) {
        setTimeout(function () { settle(attempt + 1); }, 20);
        return;
      }
      resolved = true;
      if (shouldOpen) restoreRequestedBranch(0, revealResolvedPage);
      else {
        forgetBranch();
        normalizeClosedRail();
        revealResolvedPage();
      }
    }
    /* Universal Theme restores its saved shell state late in startup. Keep the
       destination-width class in place until that lifecycle finishes, then
       commit the intended native state once before revealing the resolved
       shell. This prevents both late reopen/close and any intermediate paint. */
    document.addEventListener('apexreadyend', function () { settle(0); }, { once: true });
    window.addEventListener('load', function () {
      requestAnimationFrame(function () { settle(0); });
    }, { once: true });
    setTimeout(function () { settle(0); }, 1200);
  }

  function init() {
    document.documentElement.setAttribute('data-hspl-nav', 'ready');
    syncVisibleViewportHeight();
    stripTreeTooltips();
    window.addEventListener('resize', syncVisibleViewportHeight, { passive: true });
    if (window.visualViewport) {
      window.visualViewport.addEventListener('resize', syncVisibleViewportHeight, { passive: true });
      window.visualViewport.addEventListener('scroll', syncVisibleViewportHeight, { passive: true });
    }
    if (!referenceNavEnabled()) installRootChevron(rootNode());
    var tree = document.querySelector('#t_TreeNav');
    if (tree) {
      try {
        new MutationObserver(function () {
          var root = rootNode();
          if (!root) return;
          stripTreeTooltips();
          if (!referenceNavEnabled()) installRootChevron(root);
          if (isOpen()) expandRoot();
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
      rememberIntent('closed');
      closeShellNow();
    }, true);

    /* Carry the open intent to a true sidebar leaf.  The destination receives
       its final geometry before APEX restores its persisted shell state, so
       there is no open-then-close flash. */
    document.addEventListener('click', function (event) {
      if (!isOpen() || !event.target.closest) return;
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
      var href = link.getAttribute('href');
      if (!href || href === '#' || href.indexOf('javascript:') === 0) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      forgetBranch();
      var state = isOpen() ? 'open' : 'closed';
      rememberIntent(state);
      window.location.assign(handoffUrl(link.href, state));
    }, true);

    /* Close only from unused page canvas. Form/filter/report interactions must
       never toggle the shell or force a register geometry repaint. */
    document.addEventListener('click', function (event) {
      if (!isOpen() || !event.target.closest) return;
      if (event.target.closest('#t_Body_nav, #t_Button_navControl, .t-Region, .a-IRR, .ui-dialog, .ui-datepicker, .apex-item-group, button, a, input, select, textarea, label, [role=button], [role=link]')) return;
      if (!event.target.closest('.t-Body-content, .t-Body-main')) return;
      var shellToggle = document.querySelector('#t_Button_navControl');
      if (shellToggle) shellToggle.click();
    }, false);

    document.addEventListener('apexafterrefresh', function () {
      if (isClosed()) normalizeClosedRail();
    }, true);
    document.addEventListener('apexreadyend', function () {
      if (isClosed()) normalizeClosedRail();
      else expandRoot();
    }, true);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();


/* Independent desktop stacks for uneven pairs of form cards. */
(function () {
  "use strict";
    var doc = document, GAP = 10;
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
                                                                                                    rowSlots.forEach(function (slots) { slots.forEach(reset); });
                                                                                                        if (window.innerWidth < 1101 || rowSlots.some(function (slots) { return slots.length > 2; })) return;
                                                                                                            var gridTop = grid.getBoundingClientRect().top, columnBottom = [null, null];
                                                                                                                rowSlots.forEach(function (slots) {
                                                                                                                      slots.sort(function (a, b) { return a.getBoundingClientRect().left - b.getBoundingClientRect().left; });
                                                                                                                            var full = slots.length === 1 || slots[0].getBoundingClientRect().width > grid.getBoundingClientRect().width * 0.8;
                                                                                                                                  slots.forEach(function (slot, index) {
                                                                                                                                          var card = directCard(slot), naturalTop = slot.getBoundingClientRect().top;
                                                                                                                                                  var previous = full ? Math.max(columnBottom[0] || gridTop, columnBottom[1] || gridTop) : (columnBottom[index] || gridTop);
                                                                                                                                                          var desiredTop = previous === gridTop ? naturalTop : Math.max(gridTop, previous + GAP);
                                                                                                                                                                  var delta = Math.round(desiredTop - naturalTop);
                                                                                                                                                                          if (delta < -1) {
                                                                                                                                                                                    slot.style.setProperty("transform", "translateY(" + delta + "px)", "important");
                                                                                                                                                                                              slot.setAttribute("data-hspl-card-stack", "true");
                                                                                                                                                                                                      }
                                                                                                                                                                                                              var bottom = desiredTop + card.getBoundingClientRect().height;
                                                                                                                                                                                                                      if (full) { columnBottom[0] = bottom; columnBottom[1] = bottom; }
                                                                                                                                                                                                                              else columnBottom[index] = bottom;
                                                                                                                                                                                                                                    });
                                                                                                                                                                                                                                        });
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                            function apply() {
                                                                                                                                                                                                                                                if (!doc.documentElement.classList.contains("hspl-compact-form") || doc.documentElement.classList.contains("page-69")) return;
                                                                                                                                                                                                                                                    Array.prototype.forEach.call(doc.querySelectorAll(".t-Body-main .container"), layout);
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                        var queued = false;
                                                                                                                                                                                                                                                          function schedule() {
                                                                                                                                                                                                                                                              if (queued) return;
                                                                                                                                                                                                                                                                  queued = true;
                                                                                                                                                                                                                                                                      window.requestAnimationFrame(function () { queued = false; apply(); });
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                          if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule); else schedule();
                                                                                                                                                                                                                                                                            window.addEventListener("load", schedule, { once: true });
                                                                                                                                                                                                                                                                              window.addEventListener("resize", schedule, { passive: true });
                                                                                                                                                                                                                                                                                doc.addEventListener("change", schedule, true);
                                                                                                                                                                                                                                                                                  doc.addEventListener("click", function (event) {
                                                                                                                                                                                                                                                                                      if (event.target.closest && event.target.closest("#tabcontainer .t-Tabs-link")) schedule();
                                                                                                                                                                                                                                                                                        }, true);
                                                                                                                                                                                                                                                                                          if (window.apex && apex.jQuery) apex.jQuery(doc).on("apexafterrefresh.hsplCardStack", schedule);
                                                                                                                                                                                                                                                                                          })();

                                                                                                                                                                                                                                                                                          window.__hsplCardStackLoaded = true;
                                                                                                                                                                                                                                                                                          

/* Shared master-form headers: restore the standard hero above legacy master step tabs. */
(function () {
  "use strict";
  var ids=[24,25,32,181,183,240,297,350,480,546,548];
  function run(){
    var classes=(document.documentElement.className||"")+" "+((document.body&&document.body.className)||"");
    var match=classes.match(/(?:^|\s)page-(\d+)(?:\s|$)/);
    if(!match||ids.indexOf(parseInt(match[1],10))<0)return;
    var host=document.querySelector(".t-Body-title");
    if(!host||host.children.length)return;
    var title=(document.title||"").split(/\s+[|–-]\s+/)[0].trim();
    if(!title)return;
    document.documentElement.classList.remove("hspl-form-page");
    document.documentElement.classList.add("hspl-master-form-page");
    host.style.removeProperty("display");
    var icon=document.createElement("div"); icon.className="hspl-hero-icon";
    icon.innerHTML='<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"/><path d="M14 3v5h5M9 13h6M9 17h6M9 9h1"/></svg>';
    var block=document.createElement("div"); block.className="hspl-title-block";
    var heading=document.createElement("h1"); heading.className="hspl-page-title"; heading.textContent=title; block.appendChild(heading);
    var subject=title.replace(/\s+master$/i,"").trim();
    if(subject){var sub=document.createElement("p");sub.className="hspl-page-desc";sub.textContent="Manage "+subject.toLowerCase()+" records";block.appendChild(sub);}
    host.appendChild(icon); host.appendChild(block); host.classList.add("hspl-has-title","hspl-hero-card");
  }
  if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",function(){setTimeout(run,0);},{once:true});else setTimeout(run,0);
})();


/* Shared master-form action placement. */
(function(){"use strict";var ids=[24,25,32,181,183,240,297,350,480,546,548];function id(){var m=((document.documentElement.className||"")+" "+((document.body&&document.body.className)||"")).match(/(?:^|\s)page-(\d+)(?:\s|$)/);return m?parseInt(m[1],10):0;}function place(){if(ids.indexOf(id())===-1)return;document.documentElement.classList.add("hspl-master-form-page","hspl-compact-form");var hero=document.querySelector(".t-Body-title.hspl-hero-card");if(!hero)return;var region=document.getElementById("buttons")||hero.querySelector(".t-ButtonRegion")||Array.prototype.filter.call(document.querySelectorAll(".t-ButtonRegion"),function(c){return !c.closest(".t-Body-main,.t-Body-content")&&!!c.querySelector(".t-Button,button");})[0];if(!region||!region.querySelector(".t-Button,button"))return;var holder=hero.querySelector(".hspl-form-hero-actions");if(!holder){holder=document.createElement("div");holder.className="hspl-form-hero-actions";hero.appendChild(holder);}if(!holder.contains(region))holder.appendChild(region);}[0,180,700,1400].forEach(function(delay){setTimeout(place,delay);});if(window.apex&&apex.jQuery)apex.jQuery(document).on("apexafterrefresh.hsplMasterActions",place);})();


/* Keep every sidebar child open, including each group’s first child. */
(function () {
  "use strict";
  var marker = "#hspl-nav-state=";
  var intentKey = "hspl-nav-next-state";
  function keepChildSidebarOpen(event) {
    if (!document.body.classList.contains("js-navExpanded") || !event.target || !event.target.closest) return;
    if (event.target.closest(".a-TreeView-toggle")) return;
    var link = event.target.closest("#t_TreeNav a.a-TreeView-label[href]");
    var node = link && link.closest(".a-TreeView-node");
    if (!node || !node.classList.contains("hspl-nav-level-3")) return;
    var href = link.getAttribute("href");
    if (!href || href === "#" || href.indexOf("javascript:") === 0) return;
    event.preventDefault();
    event.stopImmediatePropagation();
    try {
      var target = new URL(link.href, location.href);
      var current = new URL(location.href);
      target.hash = "";
      current.hash = "";
      if (target.href === current.href) return;
    } catch (ignore) {}
    var state = {};
    state[intentKey] = "open";
    location.assign(String(link.href).split("#")[0] + marker + encodeURIComponent(JSON.stringify(state)));
  }
  window.addEventListener("click", keepChildSidebarOpen, true);
})();


/* Preserve the parent branch for the first child’s early navigation path. */
(function () {
  "use strict";
  window.addEventListener("pointerdown", function (event) {
    if (!document.body.classList.contains("js-navExpanded") || !event.target || !event.target.closest) return;
    var link = event.target.closest("#t_TreeNav .hspl-nav-level-3 > .a-TreeView-content > .a-TreeView-label[href]");
    if (!link || event.target.closest(".a-TreeView-toggle")) return;
    var parent = link.closest(".hspl-nav-level-2");
    var label = parent && parent.querySelector(":scope > .a-TreeView-content > .a-TreeView-label");
    if (!label) return;
    try { sessionStorage.setItem("hspl-nav-open-label", label.textContent.trim()); } catch (ignore) {}
    event.stopImmediatePropagation();
  }, true);
})();


/* Release the sidebar only after navigation state restoration has settled. */
(function(){
  function reveal(){
    if(document.documentElement.classList.contains('hspl-nav-resolving')) return false;
    document.documentElement.classList.add('hspl-nav-ready');
    return true;
  }
  function waitForState(){
    var tries=0;
    (function poll(){ if(reveal() || ++tries>150) { document.documentElement.classList.add('hspl-nav-ready'); return; } setTimeout(poll,20); })();
  }
  document.addEventListener('apexreadyend',waitForState,{once:true});
  waitForState();
})();


/* Apply shared compact form rhythm by rendered form architecture, not a page-id list. */
(function(){
  function apply(){
    var html=document.documentElement, classes=html.className+' '+((document.body&&document.body.className)||'');
    if(/(?:^|\s)page-69(?:\s|$)/.test(classes)) return;
    var regions=document.querySelectorAll('.t-Body-main .t-Region:not(.t-IRR-region):not(.hspl-drawer):not(.js-filter-drawer)');
    var hasForm=Array.prototype.some.call(regions,function(region){
      var heading=((region.querySelector('.t-Region-title,.t-Region-header')||{}).textContent||'');
      if(/\b(filter|search|criteria)\b/i.test(heading)) return false;
      return !!region.querySelector('.t-Form-fieldContainer input:not([type=hidden]):not([readonly]),.t-Form-fieldContainer select,.t-Form-fieldContainer textarea:not([readonly])');
    });
    if(hasForm) html.classList.add('hspl-compact-form');
  }
  if(document.readyState==='loading') document.addEventListener('DOMContentLoaded',apply,{once:true}); else apply();
  document.addEventListener('apexafterrefresh',apply,true);
})();

/* Animate direct hamburger toggles and user click-outside closes only. */
(function () {
  var timer = 0;
  document.addEventListener("click", function (event) {
    if (!event.isTrusted || !event.target.closest) return;
    var hamburger = event.target.closest("#t_Button_navControl");
    var outsideOpenNav = document.body.classList.contains("js-navExpanded") &&
      !event.target.closest("#t_Body_nav, #t_Button_navControl");
    if (!hamburger && !outsideOpenNav) return;
    document.documentElement.classList.add("hspl-nav-motion");
    clearTimeout(timer);
    timer = setTimeout(function () {
      document.documentElement.classList.remove("hspl-nav-motion");
    }, 280);
  }, true);
})();

/* Final shell stabilisation: animate only the navigation rail; leave every register canvas fixed. */
(function () {
  var timer = 0;
  document.addEventListener('click', function (event) {
    if (!event.isTrusted || !event.target.closest) return;
    var toggle = event.target.closest('#t_Button_navControl');
    var outsideClose = document.body.classList.contains('js-navExpanded') &&
      !event.target.closest('#t_Body_nav, #t_Button_navControl');
    if (!toggle && !outsideClose) return;
    document.documentElement.classList.add('hspl-nav-motion');
    clearTimeout(timer);
    timer = setTimeout(function () {
      document.documentElement.classList.remove('hspl-nav-motion');
    }, 280);
  }, true);
})();

/* Master pages must never pass through a hidden title host. */
(function () {
  var masterPages = [24,25,32,181,183,240,297,350,480,546,548];
  var icon = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"/><path d="M14 3v5h5M9 13h6M9 17h6M9 9h1"/></svg>';
  function pageId() {
    var classes = (document.documentElement.className || '') + ' ' + ((document.body && document.body.className) || '');
    var match = classes.match(/(?:^|\s)page-(\d+)(?:\s|$)/);
    return match ? parseInt(match[1], 10) : 0;
  }
  function mount() {
    if (masterPages.indexOf(pageId()) === -1) return;
    var host = document.querySelector('.t-Body-title');
    if (!host) return;
    document.documentElement.classList.add('hspl-master-form-page', 'hspl-compact-form');
    host.style.removeProperty('display');
    if (!host.children.length) {
      var title = (document.title || '').split(/\s+[|–-]\s+/)[0].trim();
      if (!title) return;
      var glyph = document.createElement('div'); glyph.className = 'hspl-hero-icon'; glyph.innerHTML = icon;
      var block = document.createElement('div'); block.className = 'hspl-title-block';
      var heading = document.createElement('h1'); heading.className = 'hspl-page-title'; heading.textContent = title;
      block.appendChild(heading);
      var subject = title.replace(/\s+master$/i, '').trim();
      if (subject) { var sub = document.createElement('p'); sub.className = 'hspl-page-desc'; sub.textContent = 'Manage ' + subject.toLowerCase() + ' records'; block.appendChild(sub); }
      host.appendChild(glyph); host.appendChild(block);
      host.classList.add('hspl-has-title', 'hspl-hero-card');
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', mount, { once:true }); else mount();
})();


/* Runtime stability patch: suppress the old per-page sidebar collapse before
   its ready handler runs, and make native Global Search navigate result cards. */
(function () {
  function removeLegacyHideNav() {
    try {
      if (window.apex && apex.da && Array.isArray(apex.da.gEventList)) {
        apex.da.gEventList = apex.da.gEventList.filter(function (event) {
          return String(event && event.name || '').toLowerCase() !== 'hide nav';
        });
      }
    } catch (ignore) {}
  }
  removeLegacyHideNav();
  try {
    if (window.apex && apex.da && typeof apex.da.initDaEventList === 'function' && !apex.da.initDaEventList.__hsplNoLegacyHideNav) {
      var originalInitDaEventList = apex.da.initDaEventList;
      function filteredInitDaEventList() {
        originalInitDaEventList.apply(this, arguments);
        removeLegacyHideNav();
      }
      filteredInitDaEventList.__hsplNoLegacyHideNav = true;
      apex.da.initDaEventList = filteredInitDaEventList;
    }
  } catch (ignore) {}

  function searchField() { return document.getElementById('P0_NEW'); }
  function searchRoot() {
    var field = searchField();
    return (field && field.closest('.ui-dialog')) || document.getElementById('global-search');
  }
  function cards() {
    var scope = searchRoot();
    if (!scope) return [];
    return Array.prototype.filter.call(scope.querySelectorAll('.a-SearchResults-item, .a-SearchResult'), function (card) {
      return card.offsetParent !== null && !!card.querySelector('a[href],[role="link"]');
    });
  }
  function activate(list, index) {
    if (!list.length) return;
    index = Math.max(0, Math.min(list.length - 1, index));
    list.forEach(function (card, position) {
      card.tabIndex = position === index ? 0 : -1;
      card.classList.toggle('hspl-search-result-active', position === index);
    });
    list[index].focus({preventScroll:true});
    try { list[index].scrollIntoView({block:'nearest'}); } catch (ignore) {}
  }
  window.addEventListener('keydown', function (event) {
    var field = searchField(), list = cards();
    if (!field || field.offsetParent === null || !list.length) return;
    var index = list.indexOf(document.activeElement);
    if (event.target !== field && index < 0) return;
    if (event.key === 'ArrowDown') { event.preventDefault(); event.stopImmediatePropagation(); activate(list, index < 0 ? 0 : index + 1); }
    else if (event.key === 'ArrowUp') { event.preventDefault(); event.stopImmediatePropagation(); activate(list, index < 0 ? list.length - 1 : index - 1); }
    else if (event.key === 'Home') { event.preventDefault(); event.stopImmediatePropagation(); activate(list, 0); }
    else if (event.key === 'End') { event.preventDefault(); event.stopImmediatePropagation(); activate(list, list.length - 1); }
    else if (event.key === 'Enter' && index >= 0) {
      var link = list[index].querySelector('a[href],[role="link"]');
      if (link) { event.preventDefault(); event.stopImmediatePropagation(); link.click(); }
    }
  }, true);
  document.addEventListener('pointerdown', function (event) {
    var card = event.target && event.target.closest && event.target.closest('.a-SearchResults-item, .a-SearchResult');
    if (!card) return;
    cards().forEach(function (other) { other.classList.toggle('hspl-search-result-active', other === card); });
  }, true);
})();

/* Shared first-paint and register scroll stability. Keeps native table sizing intact. */
(function () {
  var releaseQueued = false;
  var releaseAttempts = 0;
  function releaseFallbackRail() {
    /* Some legacy UT pages do not expose either body nav class during initial
       report rendering. Use the app's collapsed rail geometry in that short
       gap, rather than leaving the register hidden or letting it sit below the
       rail. Native state still takes over whenever APEX supplies it. */
    document.documentElement.classList.add('hspl-rail-fallback', 'hspl-shell-ready');
  }
  function hasResolvedRail() {
    var body = document.body;
    return !!(body && (body.classList.contains('js-navCollapsed') || body.classList.contains('js-navExpanded')));
  }
  function releaseShell() {
    if (document.documentElement.classList.contains('hspl-shell-ready')) return;
    /* APEX assigns the collapsed/expanded class after DOMContentLoaded. Showing
       an IR before that happens lets the rail cover its first toolbar control
       for one frame. Keep the canvas hidden until the native shell has chosen
       its state, then release it on the following paint. */
    if (!hasResolvedRail()) {
      if (releaseAttempts++ < 8) setTimeout(releaseShell, 25);
      else releaseFallbackRail();
      return;
    }
    if (releaseQueued) return;
    releaseQueued = true;
    requestAnimationFrame(function () {
      requestAnimationFrame(function () {
        document.documentElement.classList.remove('hspl-rail-fallback');
        document.documentElement.classList.add('hspl-shell-ready');
      });
    });
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', releaseShell, { once: true });
  } else {
    releaseShell();
  }
  document.addEventListener('apexreadyend', releaseShell, { once: true });
  window.addEventListener('load', releaseShell, { once: true });

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



/* Preserve the existing sidebar state across a register-filter submit. */
(function () {
  var intentKey = 'hspl-nav-next-state';
  var marker = '::hspl-nav::';
  function persistCurrentRail() {
    var state = document.body && document.body.classList.contains('js-navExpanded') ? 'open' : 'closed';
    try { window.sessionStorage.setItem(intentKey, state); } catch (ignore) {}
    try {
      var value = String(window.name || ''), at = value.indexOf(marker), base = at < 0 ? value : value.slice(0, at), data = {};
      data[intentKey] = state;
      window.name = base + marker + encodeURIComponent(JSON.stringify(data));
    } catch (ignore) {}
  }
  function isFilterSubmitControl(target) {
    var control = target && target.closest && target.closest('button, a.t-Button, input[type=submit]');
    if (!control) return false;
    var scope = control.closest('.hspl-drawer, .js-filter-drawer, .ui-dialog');
    if (!scope) return false;
    var label = (control.getAttribute('aria-label') || control.getAttribute('data-otel-label') || control.value || control.textContent || '').replace(/\s+/g, ' ').trim().toLowerCase();
    return /^(apply|refresh|go|search)$/.test(label);
  }
  document.addEventListener('click', function (event) {
    if (isFilterSubmitControl(event.target)) persistCurrentRail();
  }, true);
  document.addEventListener('submit', function (event) {
    if (event.target && event.target.closest && event.target.closest('.hspl-drawer, .js-filter-drawer, .ui-dialog')) persistCurrentRail();
  }, true);
})();



/* Persist only a real user sidebar toggle for subsequent browser reloads. */
(function () {
  function saveAfterUserToggle() {
    setTimeout(function () {
      try { window.sessionStorage.setItem('hspl-nav-preferred-state', document.body.classList.contains('js-navExpanded') ? 'open' : 'closed'); } catch (ignore) {}
    }, 0);
  }
  document.addEventListener('click', function (event) {
    if (!event.isTrusted || !event.target.closest) return;
    var hamburger = event.target.closest('#t_Button_navControl');
    var outsideClose = document.body.classList.contains('js-navExpanded') && !event.target.closest('#t_Body_nav, #t_Button_navControl');
    if (hamburger || outsideClose) saveAfterUserToggle();
  }, true);
})();



/* Capture the exact rail state for a normal browser reload. */
window.addEventListener('beforeunload', function () {
  try { window.sessionStorage.setItem('hspl-nav-preferred-state', document.body.classList.contains('js-navExpanded') ? 'open' : 'closed'); } catch (ignore) {}
});



/* Do not show a stale account popup while APEX is bootstrapping. */
(function () {
  function release() { document.documentElement.classList.add('hspl-account-ready'); }
  /* apexreadyend fires before the navigation-account widget finishes its own
     initialization on this app.  Keep the stale Sign Out menu hidden until
     that final paint settles instead of revealing it on apexreadyend. */
  window.addEventListener('load', function () { setTimeout(release, 2800); }, { once: true });
  setTimeout(release, 4000);
})();

/* APEX occasionally restores two stale popups after navigation: the account
   menu (whose generated id starts menu_L and contains Sign Out) and a sidebar
   tree tooltip such as the floating HOME label. They are not user actions.
   A stale account menu must stay closed; it is released only for a genuine
   pointer or keyboard action on the account control, never by a timer. */
(function () {
  'use strict';
  var sidebarLabels = /^(home|setup & admin|general masters|procure to pay|order to cash|freight management|finance & accounts|asset-management|job & services|visitor management|inventory control|hire to retire|reports|dashboard)$/i;
  var accountOpenUntil = 0;
  var html = document.documentElement;
  html.classList.add('hspl-account-popup-guard');

  function isAccountControl(node) {
    if (!node || !node.closest) return false;
    /* The account menu's generated L-id is stable, but page templates place
       its button in different header wrappers. */
    return !!node.closest('[id^="L"]');
  }

  function allowAccountMenu() {
    accountOpenUntil = Date.now() + 1200;
    html.classList.add('hspl-account-popup-user-opening');
    setTimeout(function () {
      if (Date.now() >= accountOpenUntil) html.classList.remove('hspl-account-popup-user-opening');
    }, 1250);
    releaseAccountPopups();
  }

  function accountMenuIsOpen() {
    return Date.now() < accountOpenUntil || !!document.querySelector(
      '[id^="L"][aria-expanded="true"]'
    );
  }

  function releaseAccountPopups() {
    document.querySelectorAll('.hspl-startup-account-popup').forEach(function (menu) {
      menu.classList.remove('hspl-startup-account-popup');
      menu.style.removeProperty('visibility');
      menu.style.removeProperty('pointer-events');
      menu.removeAttribute('aria-hidden');
    });
  }

  function suppressAccountPopup() {
    Array.prototype.forEach.call(document.querySelectorAll('[id^="menu_L"]'), function (menu) {
      if (!/sign\s*out/i.test(menu.textContent || '')) return;
      if (accountMenuIsOpen()) {
        releaseAccountPopups();
        return;
      }
      menu.classList.add('hspl-startup-account-popup');
      menu.style.setProperty('visibility', 'hidden', 'important');
      menu.style.setProperty('pointer-events', 'none', 'important');
      menu.setAttribute('aria-hidden', 'true');
      try {
        document.dispatchEvent(new KeyboardEvent('keydown', { key: 'Escape', bubbles: true }));
      } catch (ignore) {}
    });
  }

  function suppressSidebarTooltip() {
    Array.prototype.forEach.call(document.querySelectorAll('.ui-tooltip,[role="tooltip"]'), function (tooltip) {
      var label = (tooltip.textContent || '').replace(/\s+/g, ' ').trim();
      if (!sidebarLabels.test(label)) return;
      tooltip.classList.add('hspl-startup-nav-tooltip');
      tooltip.style.setProperty('display', 'none', 'important');
      tooltip.setAttribute('aria-hidden', 'true');
    });
  }

  function suppress() {
    suppressAccountPopup();
    suppressSidebarTooltip();
  }

  function start() {
    /* A body-level child-list observer is intentionally narrow: it catches
       only newly appended APEX popups and does not watch attributes or the
       report/grid subtree, so normal register rendering remains unaffected. */
    [0, 60, 180, 420, 900, 1600, 2600, 3800].forEach(function (delay) {
      setTimeout(suppress, delay);
    });
    document.addEventListener('pointerdown', function (event) {
      if (isAccountControl(event.target)) allowAccountMenu();
    }, true);
    document.addEventListener('keydown', function (event) {
      if ((event.key === 'Enter' || event.key === ' ' || event.key === 'ArrowDown') && isAccountControl(event.target)) allowAccountMenu();
    }, true);
    if (document.body && window.MutationObserver) {
      new MutationObserver(function (records) {
        records.forEach(function (record) {
          Array.prototype.forEach.call(record.addedNodes || [], function (node) {
            if (node && node.nodeType === 1 && (node.matches('[id^="menu_L"]') || node.querySelector('[id^="menu_L"]'))) suppressAccountPopup();
          });
        });
      }).observe(document.body, { childList: true });
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start, { once: true });
  else start();
})();

/* Interactive Grid may render an "Overall" aggregate placeholder even when
   the grid has no aggregate values.  It looks like an extra grey data row.
   Hide only the empty placeholder; real aggregate rows still have values and
   therefore remain visible. */
(function () {
  'use strict';
  function visibleText(cell) {
    return String(cell && cell.textContent || '').replace(/\s+/g, ' ').trim();
  }
  function removeEmptyOverallRows() {
    document.querySelectorAll('.a-GV tr, .a-GV .a-GV-row').forEach(function (row) {
      var cells = Array.prototype.slice.call(row.querySelectorAll(':scope > td, :scope > .a-GV-cell'));
      if (!cells.length) return;
      var content = cells.map(visibleText).filter(Boolean);
      if (content.length === 1 && /^overall$/i.test(content[0])) {
        row.classList.add('hspl-empty-overall-row');
        row.setAttribute('aria-hidden', 'true');
      }
    });
  }
  function schedule() { requestAnimationFrame(removeEmptyOverallRows); }
  [0, 180, 700, 1400].forEach(function (delay) { setTimeout(schedule, delay); });
  document.addEventListener('apexafterrefresh', schedule, true);
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', schedule, { once: true });
  else schedule();
})();


/* Register-safe sidebar performance: the rail now overlays independently, so
   disconnect legacy resize/class observers that used to remeasure table headers
   on every direct menu toggle. Horizontal scroll sync remains untouched. */
(function () {
  function detachLegacyRailObservers() {
    var main = document.querySelector('.t-Body-main');
    try {
      if (main && main.__hsplRegisterShellResizeObserver) {
        main.__hsplRegisterShellResizeObserver.disconnect();
        main.__hsplRegisterShellResizeObserver = null;
      }
      if (document.body && document.body.__hsplRegisterShellClassObserver) {
        document.body.__hsplRegisterShellClassObserver.disconnect();
        document.body.__hsplRegisterShellClassObserver = null;
      }
    } catch (ignore) {}
  }
  document.addEventListener('apexreadyend', detachLegacyRailObservers, { once: true });
  window.addEventListener('load', function () { setTimeout(detachLegacyRailObservers, 0); }, { once: true });
})();

/* Sidebar/register performance: never let legacy header-resize observers run during a direct rail toggle. Native APEX continues to size the report; existing horizontal scroll synchronisation remains intact. */
(function () {
  function stopLegacyRegisterResizeWork() {
    var main = document.querySelector('.t-Body-main');
    try {
      if (main && main.__hsplRegisterShellResizeObserver) {
        main.__hsplRegisterShellResizeObserver.disconnect();
        main.__hsplRegisterShellResizeObserver = null;
      }
      if (document.body && document.body.__hsplRegisterShellClassObserver) {
        document.body.__hsplRegisterShellClassObserver.disconnect();
        document.body.__hsplRegisterShellClassObserver = null;
      }
    } catch (ignore) {}
  }
  document.addEventListener('click', function (event) {
    if (event.target && event.target.closest && event.target.closest('#t_Button_navControl')) {
      stopLegacyRegisterResizeWork();
    }
  }, true);
  document.addEventListener('apexreadyend', stopLegacyRegisterResizeWork, { once: true });
  window.addEventListener('load', function () { setTimeout(stopLegacyRegisterResizeWork, 0); }, { once: true });
})();

/* Final lifecycle safety net for late-rendered form regions. It applies the existing compact form rules only after APEX has rendered form controls. */
(function () {
  function promoteLateForm() {
    var html = document.documentElement, body = document.body;
    if (!body || /(?:^|\s)page-69(?:\s|$)/.test((html.className || '') + ' ' + (body.className || ''))) return;
    var title = ((document.querySelector('.hspl-page-title,.t-Body-title h1,.t-Body-title .t-Breadcrumb-label') || {}).textContent || document.title || '').replace(/\s+/g, ' ');
    if (/\b(?:register|list)\b/i.test(title) && document.querySelector('.t-Body-main .t-IRR-region,.t-Body-main .a-IRR')) return;
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

/* Compact independent form-card columns without changing field widths or order. */
(function(){function card(s){return [...s.children].find(x=>x.classList&&x.classList.contains("t-Region")&&x.querySelector(":scope > .t-Region-header")&&x.querySelector(".t-Form-fieldContainer"));}function apply(){if(innerWidth<768||!document.documentElement.classList.contains("hspl-compact-form")||document.documentElement.classList.contains("page-69"))return;document.querySelectorAll(".t-Body-main .container").forEach(function(grid){var rows=[...grid.children].filter(x=>x.classList.contains("row")),sets=rows.map(r=>[...r.children].filter(s=>s.classList.contains("col")&&card(s))).filter(a=>a.length);if(sets.length<2||sets.some(a=>a.length>2))return;grid.classList.add("hspl-card-canvas");sets.flat().forEach(s=>{if(s.dataset.hsplMediumStack){s.style.removeProperty("transform");delete s.dataset.hsplMediumStack;}});var bottoms=[null,null],top=grid.getBoundingClientRect().top;sets.forEach(function(set){set.sort((a,b)=>a.getBoundingClientRect().left-b.getBoundingClientRect().left);var full=set.length===1||set[0].getBoundingClientRect().width>grid.getBoundingClientRect().width*.8;set.forEach(function(s,i){var r=card(s),natural=s.getBoundingClientRect().top,previous=full?Math.max(bottoms[0]||top,bottoms[1]||top):(bottoms[i]||top),wanted=previous===top?natural:Math.max(top,previous+10),delta=Math.round(wanted-natural);if(delta<-1){s.style.setProperty("transform","translateY("+delta+"px)","important");s.dataset.hsplMediumStack="1";}var bottom=wanted+r.getBoundingClientRect().height;if(full){bottoms=[bottom,bottom];}else{bottoms[i]=bottom;}});});});}function schedule(){requestAnimationFrame(apply);}if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",schedule);else schedule();addEventListener("load",schedule,{once:true});addEventListener("resize",schedule,{passive:true});document.addEventListener("apexafterrefresh",schedule,true);})();
/* Run proven card compaction after late APEX form hydration (Sales Order included). */
(function(){function card(s){return [...s.children].find(x=>x.classList&&x.classList.contains("t-Region")&&x.querySelector(":scope > .t-Region-header")&&x.querySelector(".t-Form-fieldContainer"));}function apply(){if(innerWidth<768||!document.documentElement.classList.contains("hspl-compact-form")||document.documentElement.classList.contains("page-69"))return;document.querySelectorAll(".t-Body-main .container").forEach(function(grid){var sets=[...grid.children].filter(x=>x.classList.contains("row")).map(r=>[...r.children].filter(s=>s.classList.contains("col")&&card(s))).filter(a=>a.length);if(sets.length<2||sets.some(a=>a.length>2))return;grid.classList.add("hspl-card-canvas");});}function schedule(){requestAnimationFrame(apply);}[0,180,700,1400].forEach(d=>setTimeout(schedule,d));document.addEventListener("apexreadyend",schedule,{once:true});document.addEventListener("apexafterrefresh",schedule,true);addEventListener("resize",schedule,{passive:true});})();

/* Every ordinary form section uses the same compact desktop canvas, even when
   APEX renders only one authored row. Six-plus direct fields are deliberately
   two-up so labels and controls remain readable. Reports, grids and drawers
   do not satisfy the card predicate and are never marked. */
(function(){"use strict";function card(slot){return Array.prototype.find.call(slot.children,function(node){return node.classList&&node.classList.contains("t-Region")&&node.querySelector(":scope > .t-Region-header")&&node.querySelector(".t-Form-fieldContainer");});}function ownFields(region){return Array.prototype.filter.call(region.querySelectorAll(".t-Form-fieldContainer"),function(field){return field.closest(".t-Region")===region;}).length;}function apply(){var html=document.documentElement;if(innerWidth<1101||!html.classList.contains("hspl-compact-form")||html.classList.contains("page-69"))return;document.querySelectorAll(".t-Body-main .container").forEach(function(grid){if(grid.closest(".ui-dialog,.a-IRR,.a-GV,.t-IRR-region,.hspl-drawer,.js-filter-drawer"))return;var sets=Array.prototype.map.call(grid.children,function(row){if(!row.classList||!row.classList.contains("row"))return[];return Array.prototype.filter.call(row.children,function(slot){return slot.classList&&slot.classList.contains("col")&&card(slot);});}).filter(function(set){return set.length;});if(!sets.length||sets.some(function(set){return set.length>3;}))return;grid.classList.add("hspl-card-canvas");sets.forEach(function(set){set.forEach(function(slot){var region=card(slot),title=((region.querySelector(".t-Region-title,.t-Region-header")||{}).textContent||"").replace(/\s+/g," ").trim().toLowerCase(),count=ownFields(region);slot.classList.toggle("hspl-card-slot--primary",title==="general"&&count>=5);slot.classList.toggle("hspl-card-slot--wide",count>=6);});});});}function schedule(){requestAnimationFrame(apply);}[0,180,700,1400].forEach(function(delay){setTimeout(schedule,delay);});document.addEventListener("apexreadyend",schedule,{once:true});document.addEventListener("apexafterrefresh",schedule,true);addEventListener("resize",schedule,{passive:true});if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",schedule);else schedule();})();
/* Late-hydrated form cards: retain each original column and remove only vertical holes. */
(function(){function card(s){return [...s.children].find(x=>x.classList&&x.classList.contains("t-Region")&&x.querySelector(":scope > .t-Region-header")&&x.querySelector(".t-Form-fieldContainer"));}function apply(){if(innerWidth<768||!document.documentElement.classList.contains("hspl-compact-form")||document.documentElement.classList.contains("page-69"))return;document.querySelectorAll(".t-Body-main .container").forEach(function(g){var sets=[...g.children].filter(x=>x.classList.contains("row")).map(r=>[...r.children].filter(s=>s.classList.contains("col")&&card(s))).filter(a=>a.length);if(sets.length<2||sets.some(a=>a.length>2))return;g.classList.add("hspl-card-canvas");sets.flat().forEach(s=>{if(s.dataset.hsplLateStack){s.style.removeProperty("transform");delete s.dataset.hsplLateStack;}});var b=[null,null],top=g.getBoundingClientRect().top;sets.forEach(function(set){set.sort((a,z)=>a.getBoundingClientRect().left-z.getBoundingClientRect().left);var full=set.length===1||set[0].getBoundingClientRect().width>g.getBoundingClientRect().width*.8;set.forEach(function(s,i){var r=card(s),natural=s.getBoundingClientRect().top,previous=full?Math.max(b[0]||top,b[1]||top):(b[i]||top),wanted=previous===top?natural:Math.max(top,previous+10),delta=Math.round(wanted-natural);if(delta<-1){s.style.setProperty("transform","translateY("+delta+"px)","important");s.dataset.hsplLateStack="1";}var bottom=wanted+r.getBoundingClientRect().height;if(full)b=[bottom,bottom];else b[i]=bottom;});});});}function schedule(){requestAnimationFrame(apply);}[0,180,700,1400].forEach(d=>setTimeout(schedule,d));document.addEventListener("apexreadyend",schedule,{once:true});document.addEventListener("apexafterrefresh",schedule,true);addEventListener("resize",schedule,{passive:true});})();

/* In legacy transaction forms, APEX emits each sibling section in a separate
   row. Where the standard Select/Reference/Transportation/Under Signed set is
   present, retain DOM order while placing the two short cards in one right
   stack. Transportation then gets the complete working row below it. */
(function(){"use strict";function title(region){return String(((region.querySelector(":scope > .t-Region-header .t-Region-title")||{}).textContent||"")).replace(/\s+/g," ").trim().toLowerCase();}function card(slot){return Array.prototype.find.call(slot.children,function(node){return node.classList&&node.classList.contains("t-Region")&&node.querySelector(".t-Form-fieldContainer");});}function directSlots(canvas){return Array.prototype.filter.call(canvas.querySelectorAll(":scope > .row > .col"),function(slot){return card(slot);});}function apply(){var html=document.documentElement;if(innerWidth<1101||!html.classList.contains("hspl-compact-form")||html.classList.contains("page-69"))return;document.querySelectorAll(".hspl-card-canvas").forEach(function(canvas){if(canvas.querySelector(":scope > .hspl-form-section-stack"))return;var map={},slots=directSlots(canvas);slots.forEach(function(slot){map[title(card(slot))]=slot;});var select=map["select no"],reference=map.reference,transport=map["transportation info"],under=map["under signed"];if(!select||!reference||!transport||!under)return;var stack=document.createElement("div");stack.className="hspl-form-section-stack";stack.setAttribute("aria-label","Reference and Under Signed");canvas.appendChild(stack);stack.appendChild(reference);stack.appendChild(under);select.classList.add("hspl-select-section");transport.classList.add("hspl-transport-section");});}function schedule(){requestAnimationFrame(apply);}[0,180,700,1400].forEach(function(delay){setTimeout(schedule,delay);});document.addEventListener("apexreadyend",schedule,{once:true});document.addEventListener("apexafterrefresh",schedule,true);addEventListener("resize",schedule,{passive:true});if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",schedule);else schedule();})();

/* Final form-layout guard: cards retain their authored rows and never stack. */
(function(){"use strict";var d=document,s="[data-hspl-card-stack],[data-hspl-medium-stack],[data-hspl-late-stack]";function clear(){d.querySelectorAll(s).forEach(function(n){n.style.removeProperty("transform");n.removeAttribute("data-hspl-card-stack");n.removeAttribute("data-hspl-medium-stack");n.removeAttribute("data-hspl-late-stack");});}function schedule(){requestAnimationFrame(clear);}[0,180,700,1400].forEach(function(delay){setTimeout(schedule,delay);});d.addEventListener("apexafterrefresh",schedule,true);addEventListener("resize",schedule,{passive:true});if(d.readyState==="loading")d.addEventListener("DOMContentLoaded",schedule);else schedule();})();

/* Sales Quotation: Currency is short while Texts is taller. Keep Revision in
   the left column directly below Currency instead of either leaving a blank
   band beneath Currency or translating it over the Currency card. */
(function(){"use strict";function apply(){if(innerWidth<1101||!document.documentElement.classList.contains("hspl-compact-form"))return;var currency=document.getElementById("R1114176284413011379"),revision=document.getElementById("R359159983156631047");if(!currency||!revision)return;var currencySlot=currency.closest(".col"),revisionSlot=revision.closest(".col");if(!currencySlot||!revisionSlot||currencySlot===revisionSlot)return;var canvas=currencySlot.parentElement&&currencySlot.parentElement.parentElement;if(!canvas||!canvas.classList.contains("hspl-card-canvas"))return;var stack=canvas.querySelector(":scope>.hspl-sales-quotation-left-stack");if(!stack){stack=document.createElement("div");stack.className="hspl-sales-quotation-left-stack";currencySlot.parentElement.insertBefore(stack,currencySlot);stack.appendChild(currencySlot);}if(!stack.contains(revisionSlot))stack.appendChild(revisionSlot);}function schedule(){requestAnimationFrame(apply);}[180,700,1400,2500].forEach(function(delay){setTimeout(schedule,delay);});document.addEventListener("apexafterrefresh",schedule,true);addEventListener("resize",schedule,{passive:true});if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",schedule);else schedule();})();

/* Preserve the exact row and column order authored in APEX. A former generic
   stacker re-parented every form-card slot after render, which made Page 143's
   Bill Details section appear only after the right-side stack and created a
   large blank space. Individual, explicitly named page helpers above remain
   available where a page genuinely needs a custom layout. */

/* APEX can initialise a text/LOV control after the shared stylesheet has
   loaded and restore its 36px widget height. Apply the compact density at the
   final rendered-control layer so every ordinary form receives the same
   visible rhythm as Material In. Page 69 deliberately remains untouched. */
(function () {
  "use strict";
  var controlSelector = [
    'input:not([type=hidden]):not([type=checkbox]):not([type=radio]):not([type=file])',
    'select',
    '.apex-item-text',
    '.apex-item-select',
    '.apex-item-popup-lov',
    '.number_field',
    '.datepicker'
  ].join(',');

  function compactControls() {
    var html = document.documentElement;
    if (innerWidth < 768 || !html.classList.contains('hspl-compact-form') || html.classList.contains('page-69')) return;

    document.querySelectorAll('.t-Body-main .t-Form-fieldContainer').forEach(function (field) {
      if (field.closest('.t-IRR-region,.a-IRR,.a-GV,.hspl-drawer,.js-filter-drawer,.ui-dialog')) return;
      field.style.setProperty('padding', '2px 6px 2px', 'important');
      field.querySelectorAll('.t-Form-label').forEach(function (label) {
        label.style.setProperty('font-size', '12px', 'important');
        label.style.setProperty('font-weight', '650', 'important');
        label.style.setProperty('line-height', '14px', 'important');
      });
      field.querySelectorAll(controlSelector).forEach(function (control) {
        if (control.matches('textarea')) return;
        control.style.setProperty('height', '31px', 'important');
        control.style.setProperty('min-height', '31px', 'important');
        control.style.setProperty('font-size', '13px', 'important');
        control.style.setProperty('padding-top', '3px', 'important');
        control.style.setProperty('padding-bottom', '3px', 'important');
        control.style.setProperty('line-height', '17px', 'important');
      });
      field.querySelectorAll('.apex-item-group > button.a-Button').forEach(function (button) {
        button.style.setProperty('height', '31px', 'important');
        button.style.setProperty('min-height', '31px', 'important');
        button.style.setProperty('padding-top', '0', 'important');
        button.style.setProperty('padding-bottom', '0', 'important');
      });
    });
  }

  function schedule() { requestAnimationFrame(compactControls); }
  [0, 120, 400, 900, 1800, 3000].forEach(function (delay) { setTimeout(schedule, delay); });
  document.addEventListener('apexreadyend', schedule, { once: true });
  document.addEventListener('apexafterrefresh', schedule, true);
  document.addEventListener('hsplformready', schedule);
  addEventListener('resize', schedule, { passive: true });
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', schedule);
  else schedule();
})();

/* Registers have filter controls, but their primary canvas is a report—not a
   transaction form. Run this after every form-layout pass so reports always
   retain one full-width canvas. */
(function () {
  "use strict";
  function isRegisterReport() {
    var title = ((document.querySelector('.hspl-page-title,.t-Body-title h1,.t-Body-title .t-Breadcrumb-label') || {}).textContent || document.title || '').replace(/\s+/g, ' ');
    return /\b(?:register|list)\b/i.test(title) && !!document.querySelector('.t-Body-main .t-IRR-region,.t-Body-main .a-IRR');
  }
  function restoreReportCanvas() {
    if (!isRegisterReport()) return;
    document.documentElement.classList.remove('hspl-compact-form');
    document.querySelectorAll('.hspl-card-canvas').forEach(function (canvas) { canvas.classList.remove('hspl-card-canvas'); });
    document.querySelectorAll('.hspl-card-slot--primary,.hspl-card-slot--wide,.hspl-select-section,.hspl-transport-section').forEach(function (slot) {
      slot.classList.remove('hspl-card-slot--primary', 'hspl-card-slot--wide', 'hspl-select-section', 'hspl-transport-section');
      slot.style.removeProperty('transform');
    });
    /* A legacy List page can place its sole report in a half-width APEX
       column. Make the report's own outer slot take the complete register
       canvas without changing any report settings or columns. */
    document.querySelectorAll('.t-Body-main .t-IRR-region,.t-Body-main .a-IRR').forEach(function (report) {
      var slot = report.closest('.col');
      if (slot) slot.classList.add('hspl-register-full-canvas');
    });
  }
  function schedule() { requestAnimationFrame(restoreReportCanvas); }
  [0, 180, 700, 1400, 2500].forEach(function (delay) { setTimeout(schedule, delay); });
  document.addEventListener('apexafterrefresh', schedule, true);
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', schedule);
  else schedule();
})();

/* Final tab-canvas guard. A detail tab never reserves an assistant column;
   Material In also retains a collapse state that the older page script cannot
   clear during its own tab synchronisation. */
(function () {
  "use strict";
  function activeDetail(host) {
    var tabs = host.querySelectorAll(':scope > .t-Tabs .t-Tabs-link,.t-Tabs-link');
    var active = host.querySelector('.t-Tabs-link[aria-selected="true"],.t-Tabs-link.is-active');
    return tabs.length > 1 && Array.prototype.indexOf.call(tabs, active) > 0;
  }
  function bindMaterialCollapse(host) {
    var assistant = host.querySelector('.mi-assistant');
    var button = assistant && assistant.querySelector('.mi-assistant-toggle');
    if (!button) return;
    function setState(collapsed) {
      host.classList.toggle('hspl-mi-assistant-user-collapsed', collapsed);
      host.classList.toggle('mi-assistant-collapsed', collapsed);
      button.setAttribute('aria-expanded', String(!collapsed));
      button.setAttribute('aria-label', collapsed ? 'Expand assistant' : 'Collapse assistant');
    }
    setState(host.classList.contains('hspl-mi-assistant-user-collapsed') || button.getAttribute('aria-expanded') === 'false');
    if (button.dataset.hsplMaterialCollapseBound) return;
    button.dataset.hsplMaterialCollapseBound = '1';
    /* Own this control in capture phase so the legacy page handler cannot
       immediately undo the reopen state during its delayed tab sync. */
    button.addEventListener('click', function (event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      setState(!host.classList.contains('hspl-mi-assistant-user-collapsed'));
    }, true);
  }
  function apply() {
    document.querySelectorAll('.t-TabsRegion-items').forEach(function (host) {
      var detail = activeDetail(host);
      host.classList.toggle('hspl-detail-full-canvas', detail);
      if (!detail) bindMaterialCollapse(host);
    });
  }
  function schedule() { requestAnimationFrame(apply); }
  [0, 180, 700, 1400, 2500].forEach(function (delay) { setTimeout(schedule, delay); });
  document.addEventListener('apexafterrefresh', schedule, true);
  document.addEventListener('click', function (event) {
    if (event.target.closest && event.target.closest('.t-Tabs-link,.mi-assistant-toggle')) setTimeout(schedule, 0);
  }, true);
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', schedule);
  else schedule();
})();
