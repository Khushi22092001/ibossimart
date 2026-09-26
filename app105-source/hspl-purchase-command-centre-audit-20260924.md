# Purchase Command Centre parity audit — 24 Sep 2026

## Outcome

HSPL application 900 page 668 and its complete linked-page graph were imported into Ironmart application 105, translated to Ironmart data objects and routes, and deployed under Business Insights.

## Page map

| HSPL | Ironmart | Page |
|---:|---:|---|
| 668 | 934 | Purchase Command Centre |
| 669 | 935 | Supplier 360 |
| 679 | 936 | Item 360 |
| 680 | 937 | Purchase Bill 360 |
| 681 | 938 | Specification 360 |
| 682 | 939 | Purchase Order 360 |
| 683 | 940 | Purchase Analytics |

## Native Ironmart register routes

| HSPL route | Ironmart route | Register |
|---:|---:|---|
| 15 | 107 | Indent Register |
| 27 | 117 | Purchase Order List |
| 36 | 68 | Material In Register |
| 37 | 145 | GRN Register |
| 72 | 709 | Quotation Register |
| 73 | 142 | Purchase Bill Register |
| 75 | 151 | Purchase Bill Pass Register |
| 172 | 198 | Freight Advice List |
| 178 | 11 | Account Ledger |
| 497 | 711 | Comparative Statement Register |

## Ironmart compatibility work

- Preserved the HSPL page layout, KPI cards, dashboard sections, inline charts, hover handlers, embedded interactive reports, filter drawer, quick periods, drill behaviour and all five 360/analytics pages.
- Replaced HSPL schema ownership and panel helper calls with the Ironmart/SAGAR equivalents.
- Added read-only compatibility views for Ironmart transaction headers that do not physically store the HSPL `PANEL` column. No operational transaction table was altered.
- Remapped every page item, page target, JavaScript navigation target and clear-cache target to its Ironmart page.
- Replaced HSPL labels with Ironmart-facing text.
- Added the live Purchase Command Centre card to Business Insights page 901.

## Defects found during the runtime audit and corrected

1. A stray backtick in the Procurement Pulse KPI SQL caused the whole KPI strip to fail parsing.
2. Indent and Comparative Statement sources expected an HSPL-only `PANEL` column; Ironmart compatibility views now provide the required read-only contract.
3. The same missing-panel issue broke Sourcing Stages, stage drill detail, Indent Register and Comparative Statement Register.
4. Quoted `apex_page.get_url` targets, JavaScript page maps and `clear-cache` values still contained HSPL page numbers after the first translation. The transformer now maps all forms of those references.

## Final runtime evidence

The final database-side APEX runtime audit opened and fetched every SQL-backed region on pages 934–940:

- Page 934: 42 report/interactive-report regions — all `OK`.
- Page 935: 6 data regions — all `OK`.
- Page 936: 6 data regions — all `OK`.
- Page 937: 4 data regions — all `OK`.
- Page 938: 3 data regions — all `OK`.
- Page 939: 5 data regions — all `OK`.
- Page 940: 11 data/chart regions — all `OK`.
- Native chart datasets returned data: Spend Over Time 5 rows, Spend by Dimension 14 rows, Worst Late Deliverers 7 rows.
- High-volume registers returned data: Purchase Bills 1,108 rows, Supplier Performance 76 rows, Vendor Scorecard 76 rows and Item Procurement Analysis 29 rows.
- No remaining APEX SQL parse error, missing item error or invalid-identifier error was reported.

The repeatable verification script is `audit_purchase_runtime_regions.sql`.

## Source and deployment artifacts

- `build_hspl_purchase_parity.ps1` — deterministic HSPL-to-Ironmart transformer.
- `deploy_purchase_compatibility_views.sql` — read-only schema compatibility layer.
- `deploy_purchase_command_centre_934_940.sql` — complete seven-page deployment.
- `audit_purchase_runtime_regions.sql` — full runtime data-region audit.

