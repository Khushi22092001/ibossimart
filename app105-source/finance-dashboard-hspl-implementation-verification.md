# HSPL Finance Dashboards — Implementation Verification

Verified on 24 September 2026 against the read-only MKSPL App 105 runtime and deployed only to HSPL App 105.

## Implemented dashboard pages

- 902 — Trial Balance Intelligence
- 904 — Profit and Loss Summary
- 907 — Accounts Receivable Command Centre
- 920 — Accounts Payable Command Centre

Business Insights is page 901. Accounts, Receivable and Payable are live; Purchase Command Center, Sales Lifecycle and Inventory remain intentionally non-clickable.

## Related pages

- 903 — Trial Balance Analytics
- 905 — Monthly Profit and Loss
- 906 — Location Profitability
- 908–919 — all Accounts Receivable drill, analysis, exception, reconciliation and MIS pages
- 921–933 — all Accounts Payable drill, analysis, exception, reconciliation and MIS pages

## Runtime verification

All pages 903, 905–906, 908–919 and 921–933 were opened in the live HSPL runtime. No APEX render error, report error, ORA error, invalid label-span error or JSON parsing error was visible.

The four main dashboards were compared with the corresponding MKSPL runtime structure: filter model, KPI/card order, drill targets, ageing/position sections, chart regions, control sections and sibling-page navigation.

Trial Balance custom Download XLS was executed successfully. The generated file was `trial-balance-20260924-1405.xls` (133,051 bytes) and its SHA-256 hash matched the previously verified reference-format export.

## Required HSPL compatibility adaptations

- Panel is not a concept in HSPL. Panel items, context chips, predicates, visible columns, M01 cards and Panel-only controls are removed. Existing non-Panel controls remain.
- HSPL Party has no `IsCompanyAccount`; internal-account slices safely return no measurable population while ordinary Trade rows continue to work.
- HSPL has no `CreditLimitApproval`; credit-limit fields remain explicitly unavailable while Debtor 360 and its custom export continue to render.
- HSPL has no `OpenGRIRCost` helper view. GRNI-dependent regions use a typed empty compatibility population, returning truthful zero/empty output instead of failing or fabricating data. The rest of Accounts Payable remains live.

## Source and deployment assets

- Converter: `tools/convert_compiled_mkspl_page.ps1`
- Page builder: `tools/build_all_finance_dashboard_pages.ps1`
- Full installer: `deploy_all_finance_dashboards.sql`
- Main dashboard installer: `deploy_finance_dashboard_mains.sql`
- Compatibility-page installer: `deploy_finance_exception_pages.sql`

MKSPL was used only as a read-only runtime/export reference. No MKSPL Builder change was made.
