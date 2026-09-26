# Business Insights live audit — 24 September 2026

Scope: HSPL application 105 only. MKSPL was used read-only as the functional reference.

## Defect found and repaired

- Page 922 (`Bill-wise Payable`) failed with `ORA-00942` because the copied MKSPL query joined `CashPurchase`, which does not exist in the HSPL schema.
- The HSPL-compatible query now retains `CASHPURCHASE` as a document/module classification but does not query the unavailable table. Its bill reference falls through to `Voucher.VoucherNo`.
- Repaired source: `business-insights-live-export/f105/application/pages/page_00922.sql`
- Deployment script: `deploy_business_insights_page922_repair_20260924.sql`
- Live retest: 984 open items rendered; no `ORA-00942`.

## Live page audit

All pages below were opened in the live HSPL application and checked for `ORA-*`, `ERR-*`, condition-processing failures, missing-page failures, table/data rendering and scroll behavior.

### Profit and loss

- 904 Profit and Loss Summary — rendered closing control, P&L rows, reconciliation and working navigation to Trial Balance, Monthly and By Location.
- 905 Monthly Profit and Loss — rendered monthly table, totals, reconciliation and download control.
- 906 Location Profitability — rendered location table, totals, cross-check, filters and drill-back links.
- P&L drill-through buckets (Revenue, Direct Cost, Operating Expense, Depreciation, Finance Cost and Tax) were previously retested after adding the scoped `P902_PNLBUCKET` support; no `ERR-1002` remains.

### Accounts receivable

- 907 Accounts Receivable Command Centre
- 908 Party-wise Outstanding
- 909 Bill-wise Outstanding
- 910 Debtor 360
- 911 Receipts and Collections
- 912 Advances and Unapplied Cash
- 913 AR Exceptions and Controls
- 914 AR Reconciliation and Data Health
- 915 AR Bill Detail
- 916 AR Trend Analysis
- 917 Daily Collection MIS
- 918 Weekly AR Review
- 919 Monthly AR Management MIS

The main dashboard rendered primary and secondary KPIs, composition/concentration charts, monthly movement and control cards. The `Cannot Age` KPI was followed with its dashboard parameters and opened page 909 without an APEX/Oracle error.

### Accounts payable

- 920 Accounts Payable Command Centre
- 921 Vendor-wise Payable
- 922 Bill-wise Payable
- 923 Creditor 360
- 924 Payments and Settlement
- 925 Advances and Unapplied Payments
- 926 Unbilled Liability (GRNI)
- 927 AP Exceptions and Controls
- 928 AP Reconciliation and Data Health
- 929 AP Bill Detail
- 930 AP Trends and Cash Forecast
- 931 Daily Payment MIS
- 932 Weekly AP Review
- 933 Monthly AP Management MIS

The main dashboard rendered primary and secondary KPIs, ageing/composition charts, top-vendor and concentration charts, monthly movement and control sections. Parameterized `Total Overdue` and `Payments in Period` targets were opened successfully. Page 924 populated live figures.

## Business Insights hub

- Accounts opens Trial Balance Intelligence.
- Profit and Loss Summary opens page 904.
- Receivable opens page 907.
- Payable opens page 920.
- Modules not yet built remain visibly marked `Coming soon` and are not presented as live dashboards.

## Result

No remaining `ORA-*`, `ERR-*`, `Error processing condition`, or administrator-contact error was found across pages 904–933 during this live pass. Page 922 was the one confirmed schema-variance defect and was repaired and deployed.

## Trial Balance state and first-load repair

- Root cause: P&L drill-through uses `P902_PNLBUCKET`, but the Business Insights Accounts card did not clear page 902. A previous P&L bucket could therefore remain in session state while the visible Account selector still said `Whole chart of accounts`.
- The Accounts card now enters page 902 with `clear=902`, so a normal entry always restores the complete chart.
- A P&L drill now exposes its scope as a visible `P&L Line` field and header chip instead of silently filtering through a hidden item.
- The hidden Balance Control report previously performed a second full ledger scan during initial render. It is now lazy-loaded and refreshed only when `Show Balance Control` is pressed.
- Live sequence verified: Direct Cost drill rendered 12 scoped rows; reopening Accounts cleared the scope and rendered 20 full-view rows with real totals; on-demand Balance Control loaded successfully without an Oracle/APEX error.
- Account scope control is now an inline searchable native Select Many control. It supports colon-separated multi-account state, shows two compact selected chips followed by `+N more`, uses a readable light selected-option treatment, and no longer presents the old dark-blue/strike-style selection ambiguity.
- The Trial Balance query, hierarchy indentation and custom XLS hierarchy map now understand multiple selected account roots. Live verification with `CURRENT ASSETS:FIXEDASSETS` rendered both hierarchies (74 report rows) with no `ORA-*`, `ERR-*`, condition-processing or administrator-contact error.
- Deployment script: `deploy_trial_balance_state_performance_repair_20260924.sql`.
