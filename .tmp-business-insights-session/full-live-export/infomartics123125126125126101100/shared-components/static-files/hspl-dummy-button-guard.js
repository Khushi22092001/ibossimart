/*
 * Remove only broken literal Font Awesome placeholders from the form hero.
 * Genuine Back, Save, Create, Status, Pass and Fail actions remain untouched.
 */
(function () {
  "use strict";

  function textOf(button) {
    return String(
      button.getAttribute("aria-label") ||
      button.getAttribute("title") ||
      button.textContent || ""
    ).replace(/\s+/g, " ").trim();
  }

  function isBroken(button) {
    return button.getAttribute("data-hspl-broken-legacy-glyph") === "true" ||
      button.classList.contains("hspl-broken-legacy-glyph") ||
      /^(?:\\)?f060$/i.test(textOf(button));
  }

  function removeBrokenHeroGlyphs() {
    document.querySelectorAll(".t-Body-title button, .t-Body-title .t-Button").forEach(function (button) {
      if (!isBroken(button)) return;
      /* APEX can hydrate a header button after the first pass and rewrite its
         inline style. Keep a durable marker so an empty re-created shell is
         still removed instead of becoming a blank outlined button. */
      button.setAttribute("data-hspl-broken-legacy-glyph", "true");
      button.classList.add("hspl-broken-legacy-glyph");
      button.setAttribute("aria-hidden", "true");
      button.tabIndex = -1;
      button.style.setProperty("display", "none", "important");
    });
    /* Valid form actions are rendered inside their button region. APEX's
       malformed legacy close controls are the only bare direct button nodes
       in the title host; once their text has been wiped they can no longer be
       recognised by label, so remove by that stable rendered structure. */
    document.querySelectorAll(".t-Body-title").forEach(function (hero) {
      Array.prototype.forEach.call(hero.children, function (child) {
        /* The shared register drawer intentionally adds its real Filter
           action directly to the title host. Only legacy placeholders are
           candidates for removal; preserve that trigger. */
        if (child.matches && child.matches("button,.t-Button") &&
            !child.classList.contains("hspl-filter-trigger")) child.remove();
      });
    });
  }

  function schedule() { window.requestAnimationFrame(removeBrokenHeroGlyphs); }
  schedule();
  /* Legacy APEX code hydrates these nodes after the initial page-ready cycle.
     Recheck briefly, then stop; this avoids a permanent polling cost. */
  [0, 60, 180, 500, 1200, 1800, 2500, 4000].forEach(function (delay) { window.setTimeout(schedule, delay); });
  var retries = 0;
  var retryTimer = window.setInterval(function () {
    schedule();
    if (++retries >= 30) window.clearInterval(retryTimer);
  }, 200);
  document.addEventListener("apexafterrefresh", schedule, true);
  new MutationObserver(schedule).observe(document.documentElement, {
    childList: true,
    subtree: true,
    characterData: true,
    attributes: true,
    attributeFilter: ["class", "aria-label", "title", "style"]
  });
})();
