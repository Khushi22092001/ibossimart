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
  function open() {
    doc.documentElement.classList.add(OPEN_CLASS);
    var first = doc.querySelector(".hspl-drawer .apex-item-text, .hspl-drawer input, .hspl-drawer select");
    if (first) { try { first.focus({ preventScroll: true }); } catch (e) { /* older browsers */ } }
  }
  function close() { doc.documentElement.classList.remove(OPEN_CLASS); }
  function toggle() { isOpen() ? close() : open(); }

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
    return "";
  }

  function ensurePageTitle() {
    var host = doc.querySelector(".t-Body-title");
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
    ensurePageTitle();
    injectNavIcons();

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
      var footerBtn = e.target.closest(".hspl-drawer-footer .t-Button, .hspl-drawer-footer button");
      if (footerBtn) setTimeout(close, 150);
    });
    drawer.addEventListener("change", function () { refreshBadge(drawer, trigger); });
    doc.addEventListener("keydown", function (e) { if (e.key === "Escape" && isOpen()) close(); });

    refreshBadge(drawer, trigger);
    if (window.apex && apex.jQuery) {
      apex.jQuery(document).on("apexafterrefresh", function () { refreshBadge(drawer, trigger); });
    }
  }

  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", init);
  else init();
  /* The nav tree can hydrate after init; re-run icon injection a few times and
     after APEX signals ready. Each pass skips rows already done. */
  [250, 800, 1600].forEach(function (ms) { setTimeout(injectNavIcons, ms); });
  if (window.apex && apex.jQuery) apex.jQuery(window).on("apexready", injectNavIcons);
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

  $(function () {
    $(document.body)
      .on("click", SEL_OPEN,  function (e) { e.preventDefault(); openDrawer(); })
      .on("click", SEL_CLOSE, function (e) { e.preventDefault(); closeDrawer(); })
      .on("click", SEL_RESET, function (e) { e.preventDefault(); resetDrawer(); });
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
  function linkBodyToHeader(tbody, thead) {
    tbody.addEventListener("scroll", function () {
      if (thead.scrollLeft !== tbody.scrollLeft) thead.scrollLeft = tbody.scrollLeft;
    }, { passive: true });
  }
  function setCellWidth(cell, width) {
    cell.style.boxSizing = "border-box";
    cell.style.width = width + "px";
    cell.style.minWidth = width + "px";
    cell.style.maxWidth = width + "px";
  }
  function syncWidths(tbody, thead) {
    var headTable = thead.querySelector(".a-IRR-table");
    var bodyTable = tbody.querySelector(".a-IRR-table");
    /* APEX fixed-header markup is deliberately non-standard: the cloned
       header row is a direct child of its table, while the original table
       keeps the authoritative header as the first TBODY row.  Copy that
       geometry exactly; data-cell intrinsic widths are not authoritative. */
    var headRow = headTable && headTable.querySelector("tr");
    var sourceRow = bodyTable && bodyTable.querySelector("tbody tr");
    if (!headRow || !sourceRow || !sourceRow.cells.length) return;
    var count = Math.min(headRow.cells.length, sourceRow.cells.length);
    if (!count) return;

    var widths = [], total = bodyTable.getBoundingClientRect().width;
    for (var c = 0; c < count; c++) {
      var width = sourceRow.cells[c].getBoundingClientRect().width;
      widths.push(width);
    }
    headTable.style.setProperty("table-layout", "fixed", "important");
    headTable.style.setProperty("width", total + "px", "important");
    headTable.style.setProperty("min-width", total + "px", "important");
    for (var j = 0; j < count; j++) {
      setCellWidth(headRow.cells[j], widths[j]);
    }
    var sourceCols = bodyTable.querySelectorAll("colgroup col");
    var headCols = headTable.querySelectorAll("colgroup col");
    if (sourceCols.length && sourceCols.length === headCols.length) {
      for (var k = 0; k < sourceCols.length; k++) {
        var colWidth = sourceCols[k].getBoundingClientRect().width;
        headCols[k].style.setProperty("width", colWidth + "px", "important");
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
        var table = tbody.querySelector(".a-IRR-table");
        if (table) tbody.__hsplHdrResize.observe(table);
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
    var links = document.querySelectorAll('a.t-Button--header, .t-NavigationBar-item a, .t-Header-navBar a, a[href*="a-dialog-open"]');
    for (var i = 0; i < links.length; i++) {
      var t = (links[i].textContent || '').trim();
      if (/^search\b/i.test(t) || /search/i.test(links[i].getAttribute('aria-label') || '')) return links[i];
    }
    return null;
  }
  document.addEventListener('keydown', function (e) {
    if (e.altKey && !e.ctrlKey && !e.metaKey && !e.shiftKey && (e.key === 'l' || e.key === 'L')) {
      var s = findSearch();
      if (s) { e.preventDefault(); s.click(); }
    }
  });
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
