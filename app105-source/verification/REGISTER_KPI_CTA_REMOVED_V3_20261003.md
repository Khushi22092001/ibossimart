# Register KPI redundant CTA removal V3 — verification

Verified on 2026-10-03 in Chrome against the live Oracle APEX application.

## Change

- Removed the visible `View records` / `Showing records` footer strip from KPI cards.
- The complete KPI card remains the existing button/click target.
- Card filtering JavaScript, KPI queries, status rules, report queries, filters, buttons, and form functionality were not changed.
- The change is page-scoped and was applied only to the 157 responsive compact register pages.

## Pilot verification — Comparative Statement Register (page 711)

- Card height before: `72.8px`.
- Card height after: `57px`.
- CTA footer after: `display:none`, height `0px`.
- Clicking the complete `ACTIVE` card changed `aria-pressed` to `true`.
- The report continued to show `Total number of rows: 7`, matching the `ACTIVE: 7` card.

## Secondary verification — Material Out Register (page 167)

- `Total records` card height: `57px`.
- CTA footer: hidden with height `0px`.
- Existing selected state remained intact (`aria-pressed=true`).

## Rollout validation

- `RESPONSIVE_COMPACT_PAGES = 157`
- `CTA_REMOVED_V3_PAGES = 157`
- `MISSING_V3_PAGES = 0`
- Rollout updated 156 pages after the page 711 pilot.

## Recovery

The exact pre-V3 `INLINE_CSS` for all affected pages is preserved in `IMART_REG_KPICTA_BAK_20261003`.

- CSS source: `app105-source/register_kpi_cta_removed_v3.css`
- Pilot: `app105-source/deploy_register_kpi_cta_removed_pilot_p711_20261003.sql`
- Rollout: `app105-source/deploy_register_kpi_cta_removed_rollout_20261003.sql`
- Rollback: `app105-source/rollback_register_kpi_cta_removed_v3_20261003.sql`
