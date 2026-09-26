/*
 * Safety net for legacy compact-card scripts.
 *
 * A card may keep its authored APEX row and natural height, but it must never
 * be translated upward into a previous row. Only the three legacy data flags
 * are cleared; ordinary animations and all application controls are ignored.
 */
(function () {
  "use strict";
  var doc = document;
  var selector = "[data-hspl-card-stack],[data-hspl-medium-stack],[data-hspl-late-stack]";

  function clearLegacyStacking() {
    doc.querySelectorAll(selector).forEach(function (slot) {
      slot.style.removeProperty("transform");
      slot.removeAttribute("data-hspl-card-stack");
      slot.removeAttribute("data-hspl-medium-stack");
      slot.removeAttribute("data-hspl-late-stack");
    });
  }
  function schedule() { window.requestAnimationFrame(clearLegacyStacking); }

  if (doc.readyState === "loading") doc.addEventListener("DOMContentLoaded", schedule);
  else schedule();
  [0, 180, 700, 1400].forEach(function (delay) { window.setTimeout(schedule, delay); });
  window.addEventListener("load", schedule, { once: true });
  window.addEventListener("resize", schedule, { passive: true });
  doc.addEventListener("apexafterrefresh", schedule, true);
})();
