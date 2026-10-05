# Previous approved register card restored V4 — verification

Verified on 2026-10-05 in Chrome against the live Oracle APEX application.

## Exact change history identified

The immediate previous approved state was `IMART_REGISTER_RESPONSIVE_COMPACT_V2`.
The latest regression (`IMART_REGISTER_KPI_CTA_REMOVED_V3`) introduced exactly two card rules:

1. `.mr-kpi-card-bottom { display:none }`
2. `.mr-inline-kpi { padding-block:5px }`

Those exact V3 rules were removed. No earlier V2 card styling was rewritten or approximated.

## Restored V2 card measurements

- Width: `252px`
- Height: `72.8px`
- Padding: `5px 8px 4px`
- Card gap: `6px`
- Icon: `24px × 24px`
- KPI value: `20px`
- CTA/trend line: `9.5px`, `16.8px` high
- Border radius: `9px`
- Previous gradients, colours, selected border, status text, helper text and card click behaviour remain unchanged.

## Stability rule

Only the immediate KPI grid was given fixed `252px` tracks. The restored card itself was not redesigned. The grid may wrap to fewer columns when the available content area is narrower.

| Viewport | Card width | Card height | Rows | Overflow | Overlap |
|---|---:|---:|---:|---|---|
| 1920×1080 | 252px | 72.8px | 1 | No | No |
| 1600×900 | 252px | 72.8px | 2 | No | No |
| 1536×864 | 252px | 72.8px | 2 | No | No |
| 1440×900 | 252px | 72.8px | 2 | No | No |
| 1366×768 | 252px | 72.8px | 2 | No | No |

The row count varies with the expanded/collapsed sidebar and available content width, as allowed. Card dimensions do not vary.

## Function verification

- Full `ACTIVE` card click changed `aria-pressed` to `true`.
- Comparative Statement report showed `Total number of rows: 2`, matching the `ACTIVE: 2` card.
- The restored footer changed to `Showing records` for the selected card.

## Rollout validation

- `RESPONSIVE_COMPACT_PAGES = 157`
- `REMAINING_V3_PAGES = 0`
- `STABLE_V4_PAGES = 157`
- `MISSING_V4_PAGES = 0`
- 156 pages were updated after the page 711 pilot.
- Material Out Register was independently verified after rollout at `252 × 72.8px`.

## Scope and recovery

- No page header, form, report, sidebar, tabs, filter, button, shared theme, global grid/flex rule, SQL query, PL/SQL package, Dynamic Action, validation or process was changed.
- Exact pre-V4 page `INLINE_CSS` is preserved in `IMART_REG_PREVCARD_BAK_20261005`.

Files:

- Layout-only CSS: `app105-source/register_previous_card_stable_v4.css`
- Pilot: `app105-source/deploy_restore_previous_card_pilot_p711_20261005.sql`
- Rollout: `app105-source/deploy_restore_previous_card_rollout_20261005.sql`
- Rollback: `app105-source/rollback_restore_previous_card_v4_20261005.sql`
