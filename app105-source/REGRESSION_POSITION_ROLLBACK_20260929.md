# Register right-to-left shift: narrow rollback audit

Date: 2026-09-29. Application 105. Status: rollback deployed; in-app browser samples verified; external Chrome/Edge acceptance remains blocked.

## Root cause and exact change

The recently added v3 `hspl-register-first-paint.css` contained four startup selectors applying margin-left / margin-inline-start and calculated widths to `.t-Body-main`. Before native APEX initialization, `.t-Body` already reserves a sidebar grid track. Later the navigation becomes fixed and the original theme supplies the main margin instead. The new startup rules therefore reserve sidebar space twice before initialization. The first offending ancestor is `.t-Body-main`, not the report itself.

Observed expanded startup DOM: grid columns `320px 1036px 0px`, main margin `0px`, main X=320. Closed startup grid reserves 48px; settled grid has a 0px sidebar track and original main margin 48px. With the removed extra margins, these two stages agree. Old v3 positions of 96/640px are derived from these CSS/grid rules, not recorded pre-rollback browser measurements.

Removed only those four new main-container rules. Before: four main references, eight margin declarations, four width calculations. After: zero of each. No replacement offset, width hack, timer, opacity mask or page hiding was added. Existing IR readiness visibility rules and navigation width rules were unchanged, not newly introduced by this rollback.

Deployment artifacts:

- `deploy_register_position_rollback_css_20260929.sql`: static CSS, 2043 bytes, generated hex roundtrip verified.
- `activate_register_position_rollback_20260929.sql`: only first-paint CSS cache-buster v3 -> v4positionrollback; APEX cache cleared.
- `verify_register_position_rollback_20260929.sql`: live CSS URL verified; live BLOB has no `.t-Body-main`, `margin-left`, or `margin-inline-start` references.
- `backups/register-first-paint-before-20260929/restore-first-paint-css-v3.sql`: recoverable previous deployment payload.

No original theme, JS, sidebar controller, saved-state logic, queries, report definitions, business fields, or processing was modified in this rollback. Browser tests did not edit/save rows. Original navigation toggle was used to exercise both states, then restored to closed.

## Browser evidence

Read-only DOM/computed-style measurements in the authenticated Codex in-app browser. X coordinates and widths are CSS pixels. Loading samples are sampled DOM geometry, not frame-by-frame video or proof of every first compositor frame.

| Page / scenario | Initial or first observed geometry | Settled geometry | Result / limit |
| --- | --- | --- | --- |
| Indent 107, IR, desktop closed | Loading: main X=48; IR X=64.8 | Complete: same X values; IR width 1274.4 | Sampled X delta 0 |
| PO list 117, normal Procure-to-Pay card navigation, desktop closed | Loading: main X=48, width 1308; IR X=64.8, width 1274.4 | Complete: same X/width | Sampled delta 0; nav stayed 48px |
| PO list 117, expanded startup | Loading: main X=320; native grid 320px; main margin 0 | Expanded settled main X=320 observed in separate toggle test | Supports root cause; not a paired report-loading run |
| Purchase Analytics 940, expanded IR + Classic | Loading: main X=320; IR X=350.8/width974.4; visible Classic X=336/width1004 | Complete: identical coordinates/widths | Delta 0; Classic visible at initial sample, not hidden by IR gate |
| PO form 118, master/detail IG | Detail tab: IG X=336.8, width1002.4 | Subsequent measurement identical | Tab/layout stability verified; initial document IG was on a hidden tab, not counted as first-paint proof |
| Browser Back, PO form -> Analytics | Expanded Analytics coordinates restored | Same geometry as earlier Analytics | Back navigation observed |
| PO list 117, viewport 768x900, closed reload | Loading: main X=48/width709.6; IR X=64.8/width676 | Complete: identical | Delta 0; client width758 at both samples |

At desktop PO navigation the viewport client-width reading differed between samples (1356 vs1366), while main/report widths and X stayed identical. Do not interpret this as a complete scrollbar-timing audit.

## Remaining acceptance limits

External Chrome inventory fails its browser-control connection policy; Edge is not connected. Neither is marked PASS. A hard-refresh keyboard action was attempted, but no new loading document was observed, so hard refresh is not certified. Not every register/form, every IG, or a dedicated few-column register has been browser verified. The narrow rollback must not be represented as complete full-application acceptance.

The existing authenticated browser session remains open; no logout/session reset was performed. Earlier expired sessions redirected to login; the user logged in to the responsive verification tab.

## Loading-time question

This rollback removes startup layout overrides and adds no loading delay. It does not establish an end-to-end before/after performance baseline. Browser-control timeouts and an earlier crashed tab contributed to audit duration; these are not evidence that all application latency is harmless. Prior server-duration samples are not total browser-load measurements. Application slowdown remains unproven either way; unrelated performance modifications are intentionally excluded by the user's regression-only instruction.
