# App 105 — transactional KPIs, procurement phase

Implemented 1 October 2026 on six existing Interactive Reports only:

| Page | Register | Workflow cards |
|---|---|---|
| 107 | Indent | Sanction pending, PO not created, partially/fully ordered, ordering overdue, deadline missing |
| 117 | Purchase Order | Approval pending, supply not started, partially fulfilled, supply complete, delivery overdue, due date missing, quantity review |
| 68 | Material In | GRN pending, partially linked, GRN created |
| 145 | GRN | Approval pending, inspection not created, bill not created, partially billed, bill created |
| 142 | Purchase Bill | Approval pending, bill pass pending/created |
| 151 | Purchase Bill Pass | Posting review, settlement pending, partially/fully settled, payment overdue, due date missing |

Always-visible compact cards use the existing master-card visual pattern, without heading/open/close controls. One reusable client/package/configuration supports all six registers; CSS is scoped to `.tx-register-kpis` and does not target dashboards, navigation or existing master KPI sections.

## Counting and filtering

- Count distinct original report TNOs, not joined detail rows. Original report SQL, columns, access predicates and existing page filters remain inside a wrapper.
- Clicking a card stores only a per-page, per-session KPI filter and refreshes its resolved APEX report. Total clears only that KPI selection. Native report search/saved-report filters are additional, clearly explained under “How counts work”.
- Indent ordering uses native sanctioned/ordered detail quantities. User explicitly confirmed deadlines start at sanction/approval, not Indent Date. Implemented as recorded final ACTIVE status timestamp + pending line requirement days. Missing timestamp/days are not treated as overdue.
- PO pending quantities use the existing amendment/BOM-aware function. Candidate items include original, effective amendment and BOM detail pairs. Unknown native quantities cannot be marked complete.
- Gate-in/GRN links follow existing register data; GRN billing uses GRN TNO/SNO links from PurchaseBillGRNDetail. Partial billing is partial line linkage, not an inferred partial amount.
- Bill pass settlement uses supplier credit voucher lines and signed DrCrAllocation amounts, excluding future-dated vouchers/allocations. Deadline honours explicit Bill Pass Due Date first; otherwise follows the existing creditor open-item report: Purchase Bill Date + PO/party credit days. All 1,111 current bill passes had null explicit due dates when audited. No fallback to an invented due date. Allocations may include adjustments as well as payments, so labels say “settled”.
- Workflow pending/partial/done states are exclusive; approval/overdue/missing-date indicators may overlap progress states. Cards are not an exhaustive status partition; closed/cancelled/unsupported documents can remain in Total without a pending-workflow classification.

## Verification performed

SQL parsing and compilation passed for all six report wrappers. All classifiers produce at most one row per TNO. Real aggregate checks passed: progress states do not overlap and no overdue document lacks pending workflow.

Unfiltered classifier aggregate runtimes observed: gate-in 100ms, Indent 20ms, PO 930ms, Bill 230ms, GRN 330ms, Bill Pass 110ms. These are database aggregate measurements, not end-to-end browser-load promises.

Chrome, authenticated BOSS session, existing 28 Sep–1 Oct scope:

| Register | Observed distinct documents / drill-down |
|---|---|
| Indent | Total 9; PO Not Created 1; Fully Ordered 5; Deadline Missing 1 (`57065650`) |
| PO | Total 4; Supply Not Started 3; Supply Complete 1 (`57011965`) |
| Material In | Total 1; GRN Created 1 (`57011997`); GRN Pending 0 removes existing rows |
| GRN | Total 1; Bill Created 1 (`57028108`) |
| Purchase Bill | Total 3; Bill Pass Created 3 (`57068204`, `57065503`, `57065184`) |
| Bill Pass | Total 3; Payment Overdue 1 (`57068232`); Due Date Missing 2 (`57065535`, `57065217`) |

Total restored on each register. Bill Pass reload retained Total and correct counts. Tested 1024px viewport: cards wrap into rows with no horizontal page overflow; native report horizontal scroll remains. Temporary viewport override reset.

Positive partial-order/supply and Indent-overdue cases exist in the full database and passed SQL classification checks, but are absent from the current narrow Chrome date scope. A wider Indent date submission was blocked by the application's existing required Company/Location/DocType validation; did not bypass validation or modify business records.

No transaction records, validations, business Dynamic Actions, dashboard components, navigation assets or master KPI files changed by this deployment. Existing report sources backed up in `IMART_TX_KPI_BACKUP`; reusable metadata lives in `IMART_TX_KPI_CONFIG` / `IMART_TX_KPI_CARDS`.

## Scope still pending

This is the procurement phase, not an assertion that every transactional module is complete. Sales/order-to-cash, freight and other transaction registers require their own linkage/deadline audit before rollout. Payment-advice-specific KPIs are not deployed; settlement cards currently live on Bill Pass.

## Replay order

1. `transaction_kpis_setup.sql`
2. `transaction_kpis_procurement.sql`
3. `transaction_kpis_indent_due.sql`
4. `transaction_kpis_po_items.sql`
5. `validate_transaction_kpis.sql`
6. Run `build_transaction_kpis.ps1`, then generated `deploy_transaction_kpis.sql`.
7. `validate_transaction_kpi_flags.sql`

Preserve the initial backup table on replay; never rebuild it from already wrapped live sources.
