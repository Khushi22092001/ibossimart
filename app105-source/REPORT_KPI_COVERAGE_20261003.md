# Application 105 report KPI rollout — 3 October 2026

## Published, not a claim of complete coverage

159 previously missing report regions now have isolated, compact, always-visible KPI cards. Existing master and six procurement transaction implementations were preserved. Dashboards, navigation, theme assets, business processes, validations and DML processes were not changed by this rollout.

The previous inventory relied on `MODULE.PAGENO`. Live navigation also opens other pages; for example, procurement Payment Advice opens page 139 while the module mapping identifies page 314. Sixteen additional live named report pages were onboarded after inspecting their original sources.

New cards provide Total, actual available statuses, recent seven-day creation and current-user creation when backed by reliable source/table metadata. They are not new workflow-specific overdue/downstream-process KPIs. Existing transaction workflow KPIs remain in their original implementation. No invented “No Status” or literal “STATUS” cards are displayed.

## Implementation and safeguards

- `IMART_RKPI_CONFIG` stores original sources and grain/predicate metadata.
- `IMART_RKPI_BAK_20261003` backs up original APEX report-region metadata, including the additional 17 discovered pages.
- `IMART_REPORT_KPIS` counts the unfiltered original source and wraps it with only a session-scoped KPI predicate for report refresh.
- Distinct projected primary keys are preferred; document IDs or report rows are explicitly identified when appropriate. Item Specification uses TNO + SNO, not its parent item alone.
- The shell inherits original region authorization and display conditions. Callback context checks app, page, signed-in user and original backed-up region guards. Re-capture guard metadata if report authorization/conditions are subsequently changed.
- Scoped inline assets affect only `.coverage-register-kpis`. No dashboard/global theme stylesheet was edited.
- Cards retain existing values during refresh; initial failure offers Retry. The placeholder does not reserve a tall empty panel.
- The original source predicates remain intact. Existing report search and saved-report filters are additional to KPI counts; this is disclosed under How counts work.

## Verification evidence

`verification/report-kpi-publication-20261003.txt`: 159 READY configurations, 159 shells, zero guard mismatches, no package compilation errors. Employee payload returned Total 54, Active 50 and available native statuses. A wrong-page callback was rejected.

Count preflights passed for all published adapters. Additional 16 queries took 0–510 ms in the tested session/default-filter scope. Many transaction queries returned zero records; these tests do not establish large date-range performance. The previous GRN-specific performance fix was not overwritten.

Chrome observed cards on 18 registers/reports:

1. Payment Advice Register
2. Purchase Enquiry
3. Purchase Quotation
4. Comparative Statement
5. Rate Contract
6. PO Amendment
7. Loading Advice
8. Freight Advice
9. Voucher Posting
10. Challan
11. Account Opening
12. Cheque Receipt
13. Hold Salary
14. Loan Sanction
15. Reimbursement Policy (existing master implementation)
16. Issue
17. Item Specification
18. Requisition

Payment Advice Created by me became selected and refreshed the empty report. Total restored its scope. Account Opening Active reduced native pagination from 788 to 498 records; Total restored the scope. Voucher Posting was verified as a native Interactive Grid with one scoped KPI panel, not an IR. Item Specification returned 1,380 distinct specifications. Business records were not edited or saved.

Screenshots: `verification/payment-advice-kpis-20261003.png`, `verification/account-opening-kpi-filter-20261003.png`.

## Remaining 15 REVIEW regions

Thirteen editable grids were not wrapped because refresh could discard unsaved edits or affect inferred native DML targets. Some are embedded form/detail grids rather than standalone registers. They require a native editable-grid adapter and safe edit/save verification, not indiscriminate query replacement:

- 10 Item Ledger
- 40 Code Scheme and Detail
- 45 Module
- 249 Monthly Summary grid
- 251 Payable Bills/RTGS detail
- 252 Bank/Cash/RTGS detail
- 267 Boss User Employee
- 281 Pending Sales Order Followup
- 413 Account Position in Trial Balance
- 416 Expense and Income
- 673 Bank Reconciliation detail

Two original report sources already fail independently of KPI generation:

- 296: invalid identifier `F.IGSTRCMINPUTACCOUNTCODE`.
- 351: missing `IMART.GSTR9` table/view.

These business-query errors were left unchanged. Full coverage is not complete, and large date-range performance has not been comprehensively verified.

## Recovery

Restore only the affected report source/query-type/query-table/query-where/query-order-by fields from `IMART_RKPI_BAK_20261003`; remove only `coverage-kpi-shell-*` components and the two `IMART_REPORT_KPI*` callbacks through APEX-supported component tooling. Preserve existing master/transaction components. This recovery was documented, not executed. Do not run older blanket transaction KPI builders, which can overwrite the separate GRN optimization.
