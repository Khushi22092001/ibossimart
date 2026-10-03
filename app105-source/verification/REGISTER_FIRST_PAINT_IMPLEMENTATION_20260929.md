# Register first-paint implementation — 29 September 2026

## Confirmed cause

The shared `hspl-theme.js` converts plain Interactive Report Status and overdue-day cells into their final pill markup at DOM-ready and after refresh.  The final CSS already exists in head, but this DOM rewrite happens after the report can be painted.  Only some register pages had a copied parser-time paint lock, so the flash was inconsistent.  APEX/Universal Theme cell transitions made the late replacement visible.

## Change

Two application-level static files implement one lifecycle contract:

- `hspl-register-first-paint.css` disables report/grid/table paint transitions without changing any visual values or geometry.  It reserves the normal report space with `visibility:hidden` only until its deterministic IR cell decoration is complete.
- `hspl-register-first-paint.js` binds before APEX widget initialization, performs the existing Status/overdue classification synchronously at `apexreadyend`, then marks the individual Interactive Report ready. On refresh, it keeps the previous styled report visible while the request is pending and prepares replacement DOM synchronously inside `apexafterrefresh`. A newly created report wrapper has no ready marker and is hidden until prepared; a retained wrapper is decorated in the same APEX replacement task. There are no timers, polling loops, or broad mutation observers in this added script.

- Initial canvas CSS now applies the existing final offset before Universal Theme adds `t-PageBody--leftNav`. On the observed Purchase Order load the initial margin changed from 0px before the fix to 48px after it; the final margin remains 48px.
- The parser-time sidebar bootstrap now reads navigation handoff/session/window-name state before the legacy fallback. The existing sidebar controller synchronizes the local and session preference keys, so the earlier finding of different keys alone was insufficient to establish a persistent mismatch. The confirmed geometry bug was the late `t-PageBody--leftNav` dependency; handoff precedence is an additional correction.

Interactive Grid and Classic Report styling is CSS-only and is never hidden.  Their transition lock applies to original and regenerated elements, keeping normal APEX lifecycle behaviour intact.

## Deployment order

1. Run `deploy_register_first_paint_css_20260929.sql`.
2. Run `deploy_register_first_paint_js_20260929.sql`.
3. Run `activate_register_first_paint_20260929.sql`.
4. Run `verify_register_first_paint_20260929.sql`.

## Local verification completed

- JavaScript syntax check: PASS (`node --check`).
- Static-file SQL payloads round-trip to the source assets: PASS.
- Git whitespace check: PASS.

## Live deployment and observed results

Deployed to application 105 on 29 September 2026. Full pre-deployment export: `app105-source/backups/register-first-paint-before-20260929/f105.sql` (67,224,045 bytes, successful SQLcl export).

Both static assets are present, their URLs are active, and the new JavaScript precedes `hspl-theme.js`: database verification PASS. The corrected navigation bootstrap is present on all 626 pages. One deployment attempt failed at compile time and rolled back; the corrected deployment then succeeded.

| Page | Register | Initial observation | Final observation |
| --- | --- | --- | --- |
| 117 | Purchase Order List | Loading: report hidden, 0 pills, main offset already 48px | Visible: 12 status pills, fixed header, same 48px offset; final screenshot visually matches baseline |
| 145 | GRN Register | Document/report streaming observed | Visible: 2 status pills, fixed header |
| 142 | Purchase Bill Register | Document streaming observed | Visible: 14 status pills, fixed header |
| 68 | Material In Register | Document streaming observed | Visible: 4 status pills, fixed header, 48px main offset |
| 407 | Stock Statement | Empty report | Ready and visible with no pills/rows |
| 129 | Requisition Register | Loading: report hidden, 0 pills | Ready and visible, empty report |
| 118 | Purchase Order form | Document streaming observed | Four visible Interactive Grids and one prepared, visible IR; no edits/saves performed |
| 940 | Purchase Analytics | Document streaming observed | Five populated Classic Report tables and three ready/visible IRs, including a 77-row Vendor Scorecard; no alert errors |

At desktop 1366px, expanding navigation produced the original 320px nav/canvas offset. Returning to Purchase Order List captured `readyState=loading`, no `js-ready` class, and an already-correct 320px nav/canvas offset. This confirms the early geometry correction for the open state as well as the closed state. It is not a complete sidebar interaction matrix.

Purchase Order search: searching A.S produced 3 matching rows (from 6); report remained prepared and visible. The audit filter was removed afterwards. No business records were saved or deleted.

Purchase Analytics Vendor Scorecard pagination: moved from rows 1–50 to 51–77, then back to 1–50. Both completed refreshes restored the report's ready class and visible state. Cells computed `transition-duration:0s`; all five Classic Report tables also computed `0s`. Initial version hid the old report during the request; version 2 removes that unnecessary blank interval. Final version 2 was confirmed loaded from `hspl-register-first-paint.js?cb=20260929v2`; repeating pagination captured the old 1–50 rows visible and ready while the request was pending, followed by the new 51–77 rows visible and ready. Browser font status on this completed analytics load was `loaded`.

These are sampled live DOM and screenshot observations, not a frame-by-frame recording of every page. Do not infer all-register completion from them. Full region inventory is in `verification/register-inventory-20260929.csv`; it includes report regions on forms and dashboards as well as register pages.

Standalone Chrome connector fails before tab inspection with a request-header policy error; Edge is not connected. Both standalone browser verifications therefore remain unverified. Pre-existing browser console errors include missing DOMPurify and Oracle JET locale module errors (observed before deployment as well as after); this patch does not alter those dependencies.

Remaining coverage includes every-register lifecycle matrix (sorting, reset, horizontal scroll, persisted-data editing/saving/deletion), populated IG detail rows, and standalone Chrome/Edge visual verification. The inventory lists 420 IR, 321 IG, 258 Classic Report, and 76 selected static regions across 484 pages; most are not individually browser-tested. Do not present this sample audit as verification of all 626 pages.
