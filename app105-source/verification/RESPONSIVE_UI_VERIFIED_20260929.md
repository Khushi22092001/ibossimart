# Responsive UI deployment and verification — 2026-09-29

## Deployment

Application 105 now loads `hspl-responsive-ui.css?cb=20260929responsive8` as an additional shared stylesheet. The live static file matches the 10,386-byte source exactly. Deployment used the saved IMART connection and updated only this static CSS asset, its CSS URL, and application cache/version metadata. No full application or page import was performed.

No JavaScript, Dynamic Actions, item metadata, validations, calculations, processes, business SQL, or PL/SQL were edited in this task. The SQL deployment files contain APEX asset-registration/cache operations, not changes to business queries or calculations.

The existing live CSS files `design-system.css`, `hspl-grid-compact.css`, `hspl-master-forms.css`, `hspl-scroll-layout.css`, and `hspl-theme.css` are byte-for-byte unchanged against the pre-deployment backup. The deployment appends/replaces only the responsive stylesheet's own URL; it does not reset the other CSS/JavaScript references. Earlier dirty workspace files were left untouched.

During the audit, the live `hspl-theme.js` cache token changed from `20260929detailblueeq1` to `20260929ownfdtotal2`. This task's deployment does not assign `javascript_file_urls`; that live change was retained rather than overwritten. This concurrent application state limits any claim of complete functional equivalence.

## Presentation changes

- Query actual form-card width rather than applying browser zoom or globally scaling the interface.
- Preserve field order and card grouping; wrap fields only when a card cannot fit readable controls.
- Keep authored full-width fields full width, including the Purchase Bill Purchase Order reference.
- Give flex section slots a definite available width before enabling container queries, avoiding intrinsic-width collapse on master forms.
- Preserve native APEX item spans. Material In's authored 30-track transportation region has one inspected exception: use fewer tracks on narrower cards, retaining item order and six-track field spans.
- Keep action groups usable and wrap button-only APEX rows without tiny grid tracks. Enquiry actions now have a measured 16px separation at all three target widths.
- Preserve Interactive Grid column widths and the existing real Detail scrollbar/synchronized header/body/total owners.
- Allow report text wrappers to size to their content. Very long aggregate reference lists are bounded and locally scrollable instead of producing screen-tall rows.
- Preserve compact summary styling and responsive wrapping; no new blue separators or navigation sizing rules were introduced.

## Rendered verification coverage

The following pages were inspected at **1366×768, 1600×900, and 1920×1080**, with screenshots and DOM geometry saved. These are 12 distinct pages, not a claim that every application page has been individually opened.

| Page | Views checked |
| --- | --- |
| Purchase Bill | General and Detail/summary |
| Purchase Bill Pass | General and Detail |
| Purchase Order | General and wide Detail/summary |
| Debit Note | General and Detail/account summary |
| Credit Note | Empty General and Detail/account summary |
| Freight Advice | Empty General and Detail/summary |
| Material In | Custom General and Detail |
| Item Master | Master cards and standalone Detail region |
| Rate Contract | General and Detail/summary |
| Purchase Enquiry | Fields, date/filter controls, both Enquiry action buttons |
| Enquiry Register | Content widths, toolbar, sticky-header alignment, local scrolling |
| Procure to Pay module | Existing module/card dashboard |

The 66 stored after-view measurements include separate General/Detail views, extra small-laptop checks, and native-DPR checks; they are not 66 distinct forms.

Purchase Bill was additionally inspected at 1280×720 and 1024×768. Browser viewport overrides reported DPR approximately 1 and visual viewport scale 1. After resetting the override, native DPR **1.25** and scale **1** were checked on Purchase Bill and Debit Note. Browser zoom and operating-system display scaling were not changed. Temporary viewport overrides were reset.

No page-level horizontal overflow or clipped hero actions were measured in the tested views. Field-wrapper geometry occasionally reports Purchase Order's Open Spec and Quantity as intersecting because an existing full-width checkbox wrapper surrounds an intentional side-by-side layout. The actual checkbox/label and Quantity control were inspected visually and have separate, non-overlapping rectangles. Some 179.8px LOV controls remain in the wide Purchase Order form; these are readable controls rather than hidden or zero-width fields. Offscreen closed filter-drawer wrappers are not counted as visible form failures.

## Actual interaction checks

- Bill Pass's 8px scrollbar thumb was dragged to the right. Header, body, and custom bar moved together to approximately **777.6px**; FD, Footer Amount, Total Amount, and Remark were visibly accessible. The scrollbar also responds to Arrow Right.
- Enquiry Register's native scrollbar was dragged to approximately **1863.2px** of a 1864px range. Header and body scroll positions matched exactly, all 18 measured header/body column widths aligned, and browser/page horizontal overflow remained zero.
- Report Actions menu opened and was dismissed without selecting an action.
- Navigation expanded to its existing 320px width and collapsed back to its existing 48px width; page horizontal overflow stayed zero.
- Purchase Bill date picker and Party lookup opened and were dismissed without selecting a new date or party.
- Tabs switched normally. No Create, Save, Apply Changes, Pass, Fail, Delete, or financial approval action was submitted.
- Purchase Bill and Bill Pass before/after comparisons showed identical item values, required/readonly/disabled states, and hero-action disabled states for the captured baseline controls.

## Functional exceptions — not fixed or hidden

An attempt to open Bill Pass FD produced a calculation failure / `SyntaxError: Unexpected end of JSON input`. Later, a Purchase Bill calculation JSON error was also visible during control/tab testing. These are functional errors, not responsive-CSS layout failures. Their cause was not established or changed in this CSS-only task. Therefore **full functional verification is not passed**, even though the responsive presentation checks above passed. Do not describe these errors as fixed or conclusively pre-existing.

Quotation Register was not verified in this turn: an invalid relative navigation attempt was blocked by the browser URL policy and was not retried through another route. No claim of individual verification is made for that page or for other pages absent from this report.

## Evidence and safe future deployment

`responsive-ui-results-20260929.json` contains the captured baseline/latest-view measurements. `responsive-before-*.png` and `responsive-after-*.png` contain screen-size evidence. Additional screenshots document real scroll movement, popup controls, and the functional errors.

Live CSS backups are in `responsive-ui-live-before-20260929.txt` and `responsive-ui-live-after-20260929.txt`. These contain application-local source and session-related metadata; keep them in the workspace rather than publishing them.

Use `deploy_responsive_ui_20260929.sql` to deploy this overlay idempotently while preserving current live asset references. A future full application import must start from a fresh live export or include this overlay/reference explicitly; importing an old export can replace unrelated later work and is not made safe merely by this stylesheet.
