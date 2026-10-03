# GRN KPI date-range performance fix — 2026-10-01

Scope: App 105, GRN Register page 145 only. No dashboard, theme, navigation, report presentation, classifier rules, source register SQL, access predicates, data or validations changed. Other transaction KPI package branches are unchanged.

## Measured cause

Using existing session filters 01-01-2026 through 01-10-2026, the original six-card aggregate took 69,920 ms. A lean projection/scalar-subquery candidate still took 69,200 ms and was rejected. DBMS_XPLAN for SQL_ID badw0dd3jva7x showed a NESTED LOOPS OUTER / VIEW PUSHED PREDICATE plan. The billing classifier rescanned PurchaseBill and PurchaseBillGRNDetail for each scoped GRN, including repeated GetDocumentStatusCode calls. The standalone classifier's recorded runtime was about 0.336 seconds.

## Fix and tests

GRN payload and the existing KPI report-filter wrapper now evaluate the unchanged classifier once through a materialized CTE, then join/reference that result. This is request-local computation, not a stale shared cache. The base source SQL, dates, permissions and card meanings are unchanged. GRN KPI clicks no longer trigger a second count request after refreshing the report; date/full-page reloads still fetch counts normally.

- Candidate aggregate: 720 ms. All six counts unchanged: 1227 / 2 / 22 / 15 / 0 / 1212.
- Deployed complete payload: 940 ms, repeated run 960 ms; valid JSON, no package compile errors.
- Chrome: fresh load completed with all six cards; Total returned 2323 detail rows representing 1227 GRN documents. A changed September date range updated counts to 2 documents; returning to January restored 1227 and the original six counts. Report/KPI data are distinct-document vs detail-row counts by design.
- Browser automation's navigation/CDP delays prevent a precise end-to-end UI timing claim; the sub-second measurement is database payload time, not total page load.
- No business records were edited/saved. Original January date scope and Approval Pending selection were restored.

Backups: IMART_GRN_KPI_PERF_BAK_20261001 (GRN region sources), IMART_TX_PKG_PERF_BAK_20261001 (package source). Deployment: deploy_grn_kpi_performance.sql. Proof screenshot: verification/grn-kpi-performance-fixed.png.
