# Register KPI row/status correction — 3 October 2026

## User-visible behavior

- KPI panels are not hidden.
- `Total records` counts the same report-row grain shown by the native APEX register.
- Current filter drawer values are sent explicitly to the KPI callback, including APEX
  date-picker and popup-LOV values.
- Existing reliable status cards remain filterable.
- 63 previously total-only sources now also expose safe `Last 7 days` and/or
  `Created by me` cards based on projected DATE/CREATOR columns.
- PO Amendment now distinguishes `NOT AMENDED` rows from actual amendment workflow
  statuses and also exposes recent/current-user amendment activity.

## Scope and safeguards

- 159 generated `.coverage-register-kpis` shells were republished through the existing
  shared renderer.
- Coverage after enrichment: 67 regions with status cards, 90 with Last-7-Days cards,
  60 with Created-by-Me cards; 23 aggregate sources remain source-specific because they
  expose no safe status/date/creator field.
- No report source, DML, validation, navigation, drawer logic or business transaction
  was changed.
- Callback item names are allow-listed against the current APEX page before session state
  is set; arbitrary item names are rejected.
- The pre-change configuration is backed up in `IMART_RKPI_CONFIG_BAK_ROWCOUNT` and the
  earlier shell source backup remains in `IMART_RKPI_SHELL_BAK_TOTALONLY`.

## Chrome verification

- Quotation Register: `Total records 14` = native `Total number of rows: 14`.
- Quotation cards: `ACTIVE 12`, `PREPARING 2`, `Last 7 days 14`.
- Selecting `PREPARING 2` changed the native report to 2 rows; selecting Total restored 14.
- PO Amendment Register: `Total records 7` = native `Total number of rows: 7`.
- PO Amendment cards: Total 7, Created by me 0, Last 7 days 0, `NOT AMENDED 7`.
- Item Quality List, previously total-only: panel remains visible and now also includes
  `Created by me`.
- No KPI-specific browser console errors were observed on either page.
