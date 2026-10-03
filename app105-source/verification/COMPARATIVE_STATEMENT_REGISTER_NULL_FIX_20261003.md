# Comparative Statement Register NULL Fix — 03 Oct 2026

## Root cause

Page 711 opened with `P711_COMPANY` and `P711_LOCATION` empty. The original report SQL requires both values, so the register and KPI returned zero rows even though four Comparative Statement documents existed in the selected date range.

## Live fix

- Added secure defaults from the page's existing user-authorized Company and Location LOV rules.
- Preserved submitted/session filter values with `use_cache_before_default = YES`.
- Replaced nullable workflow KPI status with the single requested exception state:
  - `PO NOT CREATED`
- Added `Last 7 days` and `Created by me` cards for Page 711.
- Added a reusable status catalog so important process cards remain visible even when their count is zero.

## Chrome verification

- Authorized companies displayed: Diwanka Energy Private Limited and Ironmart Private Limited.
- Authorized locations displayed: Mouda and Raipur.
- KPI `Total records`: **7**.
- Native report footer `Total number of rows`: **7**.
- KPI `Last 7 days`: **7**.
- Earlier Chrome verification recorded `PO CREATED`: **7** and `PO NOT CREATED`: **0**.
- On 03 Oct 2026, the process-card scope was deliberately narrowed: `PO CREATED` was removed and only `PO NOT CREATED` remains configured.

## Final package checks

- `IMART_REPORT_KPIS` specification/body compilation errors: **0**.
- The single catalog state `PO NOT CREATED` is mapped in the Page 711 process expression.
- Zero-count catalog cards preserve selected state after report refresh.

No Comparative Statement transaction, save, validation, approval, or drill-down logic was modified.
