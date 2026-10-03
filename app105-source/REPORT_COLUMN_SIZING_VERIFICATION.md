# Common report sizing — App105, 2026-10-01

## Cause confirmed in Chrome
The existing design-system.css declares normal wrapping with !important on non-numeric Interactive Report cells. Semantic minimum widths were absent. Existing fixed-header clones also have viewport stretch rules. Narrow address tracks therefore produced tall rows. The solution sizes both native body and cloned heading tracks together instead of changing one independently.

## Deployment
Shared application static assets report-column-sizing.js and .css, included once at application level (v3). Asset configuration backup: IMART_REPORT_SIZING_BACKUP_20261001. No SQL, processes, validations, computations or business Dynamic Actions were changed.

IR and native tabular Classic Reports use semantic patterns plus bounded 90th-percentile measurement of up to 30 visible rows. Widths are proportionate and capped. Plain long-text cells get a two-line display and a full-value title; interactive/custom markup is preserved without DOM replacement. Document/code cells are single-line with overflow ellipsis/title. The fixed-header source and clone receive identical widths. Native scroll containers retain horizontal scrolling on smaller viewports.

Interactive Grids use Oracle's documented getColumns/getColumnForCell/setColumnWidth APIs. Hidden/uninitialized grids are deferred. Existing sensible authored widths are preserved, only narrow defaults increased; manual resize events are respected. Native editors, models and column order are untouched. Grid content is single-line to preserve native row virtualization.

Observer watches child additions only; no attribute or ResizeObserver feedback loop. Measurements are bounded; no timers, server calls or report refresh is added by the helper. Optional .imart-sizing-off class opts out a specialized report region.

## Chrome QA
- Account Master: headers/body aligned; addresses 337px and 243px, visible rows 33–51px. Full-value titles retained.
- Account pagination reached 2 (51–100) and widths reapplied. Search RCM returned matching rows; the test filter was removed.
- Enquiry Register: document fields approximately 170–214px; rows 33–39px.
- Quotation Register: Quotation No 243px, Enquiry No 252px; rows about 33px.
- Rate Contract List: compact rows and scrolling.
- Employee List: long-text two-line wrappers; rows 39–51px.
- Item Master List: descriptions clamped; rows about 39px.
- Location Master and HSN List: compact rows.
- Comparative Statement Register: no records under current filters, not counted as populated verification.
- Purchase Order Detail grid: native editor activation checked without changing or saving values; header tracks and ~40px rows intact.
- Populated Purchase Quotation Detail grid: native Item/Specification/Description/HSN/Unit/Quantity tracks aligned, rows ~40px. No values changed/saved.
- 900px viewport: Account address widths remained 337/243px; table 4950px with an 805px scroll viewport, not squeezed. Viewport reset afterward.
- Earlier deferred grid null-columns exception fixed in v3. Pre-existing DOMPurify/Oracle JET translation errors are unrelated and remain out of scope.
- Native Classic Report selector support implemented but no populated standalone Classic Report was separately visually verified in this run.

Screenshot: report-column-sizing-chrome.jpg.
Rollback removes only these asset references, preserving other application changes. Static files remain recoverable and harmless when not referenced.

## Register trailing blank strip (v6)

Chrome City List confirmed a 1344px table inside a 1441px scroll viewport. The bounded semantic total was smaller than the available report area. Registers now distribute only unused viewport width proportionally across non-action columns, applying identical tracks to source and sticky clone. Wide reports retain their original preferred widths and horizontal scrolling. Dashboard sizing, CSS, regions and queries are unchanged; expansion is gated to master KPI report identities or register/list/master region labels, excluding dashboard/analytics/insights/command-centre labels.

Chrome populated checks: City, Terms and Condition Head, Packing Type, Vehicle Type, Industry Sector, Item Grade, Item Length, Item Make, Item Thickness and Item Width. All ten filled their 1441px report viewport with matching source/clone widths. City at 1920px viewport filled 1825px; at 980px viewport retained 1344px content with an 885px body viewport and horizontal overflow. Viewport restored. City Total KPI refresh and return navigation retained alignment. Screenshot: master-insights-plan/register-blank-strip-fixed.png.

## Smaller register data font (v7)

User requested only data typography reduction. Register report regions receive the imart-register-data marker; dashboard/analytics/insights/command-centre labels are excluded. Body data cells use 12px, including inherited text-expression wrappers; headings, toolbar, KPI cards and native editor styles are not targeted. Before Account data measured 13px; after 12px, while headings remained 10.5px. Verified Account plus the ten populated master lists above in Chrome; all data measured 12px and headings 10.5px. Screenshot: register-data-font-compact.png. No SQL, records, processes, sorting or pagination changed.

## Sticky heading gap follow-up (v4)
Account's sticky placeholder retained 74px after the actual resized heading became 61.4px, leaving 12.6px blank space. A scoped header ResizeObserver now synchronizes only the native placeholder to measured heading height. No fixed heights, negative margins or refresh calls. Observers are disconnected for removed headers.

Chrome: Account fresh load, pagination and scrolling, 900px viewport (reset afterward), Quotation Register and Item Master List all measured matching 61.4px heading/placeholder heights and effectively 0px gap. Screenshot: report-header-gap-fixed-chrome.jpg. No business data edited or saved.

## Column containment regression correction (v13)

Only report-column-sizing.js/css were deployed. Existing theme, dashboard, navigation, business queries and processes were not edited. Live comparison against the pre-fix asset-reference backup returned PASS for every unrelated CSS/JS reference. Backups IMART_REPORT_SIZING_V7_ASSETS and IMART_REPORT_SIZING_V7_REFS preserve the prior assets/configuration.

Root causes: blanket nowrap and forced narrow cell widths; inner HTML-expression containers with their own widths/nowrap; header measurement omitted anchor padding and rendered uppercase letters. The helper now measures padded rendered headings and representative visible cells, uses bounded semantic widths, contains inner text, permits controlled name/long-text wrapping and keeps source/sticky tracks identical. Creator is treated as a name. Print remains a compact icon/action column with a single-line uppercase heading; the icon size was not changed.

Chrome populated fresh-load checks: GRN (matching 6316px tracks, 55.6px header, six compact detail rows), Quotation (matching 4501px tracks, document columns 229/238px, name cells normal wrapping), Indent (matching 4298px tracks, document columns 229px, name cells normal wrapping). The latest Print screenshot is verification/grn-column-wrap-v13.png. Existing GRN filters were preserved. Native automated semantic/bounds/outlier/badge tests passed. These current-version checks do not constitute a complete audit of every IG/classic report or the separate slow KPI request.
