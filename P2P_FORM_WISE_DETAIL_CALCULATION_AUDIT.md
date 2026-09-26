# Procure-to-Pay Forms — Detail & Calculation Audit

**Date:** 26 September 2026  
**Scope:** Indent, Purchase Enquiry, Purchase Quotation, Comparative Statement, Purchase Order, Loading Advice, Material In, GRN, Purchase Bill, Purchase Bill Pass, Payment Advice  
**Mode:** Static APEX source audit + earlier read-only Chrome verification. No Save/Submit/Delete was executed.

## Reading guide

- **Confirmed defect/pattern:** Source mein directly visible hai.
- **Probable defect:** Architecture unsafe hai; exact wrong row prove karne ke liye staging Save test chahiye.
- **Runtime test required:** Production mein data change kiye bina final outcome prove nahi ho sakta.
- Declarative validation count zero hone ka matlab yeh nahi ki validation bilkul nahi hai. Kai pages custom PL/SQL processes use karte hain. Problem consistency, order aur transaction boundary ki hai.

---

# Quick severity summary

| Form | Page | Main detail/calculation problem | Priority |
|---|---:|---|---|
| Indent | 108 | Quantity/rate calculations many focusout DAs mein; custom detail DML; three separate commits | P1 |
| Purchase Enquiry | 708 | Page-ready/unload cleanup plus click-based detail generation; five grids | P1 |
| Purchase Quotation | 710 | Focusout amount calculation performs DML + COMMIT; duplicated footer calculations | P0 |
| Comparative Statement | 712 | Three separate CS detail processes with large DML blocks; selection/detail is pre-persisted | P1 |
| Purchase Order | 118 | Detail/footer calculations and inserts occur before final Save; six commits and cross-module side effects | P0 |
| Loading Advice | 155 | Pending quantity check and final save are separate; concurrent over-allocation possible | P1 |
| Material In | 69 | Many source flows, balance/weight calculations and master lost-update protection explicitly disabled | P0/P1 |
| GRN | 146 | Received/accepted/rejected/storage quantity spread across many DAs and grids | P0/P1 |
| Purchase Bill | 143 | Two no-wait server calls, ten commits, duplicated amount/footer/tax calculations | P0 |
| Purchase Bill Pass | 152 | TDS/quality/advance/net-pay calculation dispersed; five focusout/DA commits | P0 |
| Payment Advice | 140 | Net/total/TDS calculations split between browser and server; weak declarative validation | P1 |

---

# 1. Indent — Page 108

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 41 |
| Dynamic Actions | 46 |
| DA actions | 73 |
| Processes | 13 |
| Interactive Grids | 2 |
| Explicit DML statements | 5 |
| Explicit commits | 3 |
| Explicit rollbacks | 0 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Detail section problems

1. **Item detail uses custom DML.** `Item Detail - Save Interactive Grid Data` manually handles create/update/delete using `APEX$ROW_STATUS`.
2. **Quality detail is a separate grid/process.** `IndentDetailQuality - Save Interactive Grid Data` is saved independently from the main item detail.
3. **Master, item detail and quality detail are separate processing units.** If process ordering/exception handling is incomplete, one part may save while another fails.
4. `Delete Detail` and `Delete master if Detail is not saved` show that cleanup is being used after partially constructed form data. This is a Forms-style recovery pattern, not a guaranteed atomic transaction.
5. Unsaved-change warning is disabled, so browser Back/refresh/navigation can lose unsaved grid work.

## Quantity/rate/calculation problems

The page has separate DAs for:

- `Set Amount`
- `set rate`
- `Set Primary Stock Qty`
- `Set Quantity1`
- multiple `Set Quantity2...` actions
- separate decimal/rounding actions for indent quantity and stock quantity
- `check Indent and sanction qty`
- `checkDuplicate`

Problems:

1. **Same logical quantity is calculated by multiple focusout events.** If user rapidly changes Quantity 1/2, leaves cell, then saves, calculation sequence can depend on which focusout request/action completed last.
2. **Duplicate-looking DA names** such as `Set Quantity2`, `Set Quantity2_1`, `Set Quantity2_1_1`, `Set Quantity2_1_2` make rule ownership unclear.
3. `set rate` fires on page initialization. A load/refresh can recalculate a displayed value; verify it does not overwrite stored/manual rate.
4. Duplicate and sanction checks are browser-event-driven. Final server Save must repeat them using current database values.
5. Three commits exist in Pass/Fail-related flows, separate from final form Save. Status/workflow update may commit even if later detail processing fails.

## Problem that may occur now

- Amount calculated using old rate or old quantity.
- Quality rows saved without corresponding final item row.
- Duplicate item accepted if focusout validation did not fire before Save.
- Pass/Fail status committed while document data later fails.

## Required fix

- Quantity/rate/amount formula should have one server function and one client preview implementation generated from the same rule.
- Final Save must recalculate and validate every detail row.
- Master + detail + quality + workflow status must commit together.
- Add optimistic locking to the custom detail process.

---

# 2. Purchase Enquiry — Page 708

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 30 |
| Dynamic Actions | 26 |
| DA actions | 60 |
| Processes | 14 |
| Interactive Grids | 5 |
| Explicit DML | 36 |
| Explicit commits | 3 |
| Explicit rollbacks | 0 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Detail section problems

1. Five grids are involved, including item, indent reference and quality data. They are not one physical transaction component by default.
2. `Get Indent Data`, `Get Deals in Supplier`, `Get economic supplier`, `get last supplier`, `Get TAC` and `Set item detail` populate/alter detail through click DAs.
3. `Set item detail` performs server-side DML and then refreshes regions before final Save.
4. `delete unsaved record from detail table` runs on page ready, and another cleanup runs on unload/click.
5. **Unload is not reliable.** Browser close, crash, network loss or session expiry may prevent cleanup. Conversely, a delayed unload request can run after newer work.
6. If temporary rows are keyed only by session/user/TNO without a unique draft token, two tabs can interfere. Exact keying requires code-by-code staging test.
7. Custom `Item Detail - Save Interactive Grid Data` is separate from native IG processes used for other grids, so concurrency behavior is inconsistent.

## Calculation/selection problems

1. Supplier/deal/economic-supplier selection is spread across separate click events. The page can hold a mix of results produced at different times.
2. Item/party validation happens in an after-submit PL/SQL process, while detail population happens earlier through DAs.
3. Source indent balance can change between “Get Indent Data” and final enquiry Save.
4. Three explicit commits exist in workflow Pass/Fail paths, outside a single enquiry transaction boundary.

## Problem that may occur now

- Enquiry contains old indent quantity after another user changes/sanctions the indent.
- Duplicate/partial supplier detail if user clicks Get buttons more than once.
- Ready/unload cleanup deletes another tab’s draft or fails to remove abandoned rows.
- Header saves but one of the five related grids fails.

## Required fix

- Use a draft UUID for all temporary detail rows.
- “Get Indent” should be idempotent and replace/merge rows deterministically.
- Final Save rechecks current indent status/balance under lock/version.
- Remove database cleanup from unload; use scheduled expiry of draft rows.

---

# 3. Purchase Quotation — Page 710

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 51 |
| Dynamic Actions | 46 |
| DA actions | 76 |
| Processes | 12 |
| Interactive Grids | 4 |
| Explicit DML | 30 |
| Explicit commits | 4 |
| Explicit rollbacks | 0 |
| Declarative validations | 2 |

## Confirmed critical detail problem

The `set amount` **focusout** DA performs:

- server-side PL/SQL,
- three visible DML operations,
- an explicit `COMMIT`,
- region refresh,
- client summary update.

This means leaving an amount field can permanently change database data before the user presses final Save.

## Other detail problems

1. Custom `QuotationDetail - Save Interactive Grid Data` manually handles detail DML and is not visibly version-checked like native lost-update protection.
2. Footer and quality are separate IG processes.
3. `Detail` click performs delete/insert-style server DML and refreshes the grid.
4. Page-ready and unload DAs delete unsaved records. Unload cleanup is timing-dependent.
5. `Insert into tac` creates terms/conditions through a separate request.

## Calculation problems

Calculation is divided among:

- `Set Amount` on change
- `set amount` on focusout
- `Set discount rate`
- two `Set Rate After Discount` DAs
- `Calculate Detail Footer Amount`
- footer total on focusin, focusout and click
- `Calculate Sum of Amount Value on Loose focus`
- `Set Other and Total Amount`
- `Set DFAMOUNT`
- final footer value JavaScript

Problems:

1. **Multiple sources of truth:** amount, discounted rate, footer amount and grand total are calculated by different client/server actions.
2. **Event-order dependency:** focusout may commit before later change/click calculations complete.
3. **Refresh risk:** region refresh after committed focusout can replace unsaved client values.
4. **Rounding drift:** repeated calculation in JavaScript and PL/SQL may use different number/rounding semantics.

## Problem that may occur now

- Database amount differs from value currently visible in grid.
- Discount changes but previously committed amount remains.
- Footer/grand total reflects only some rows.
- Closing/navigating away leaves committed quotation detail even without final Save.

## Required fix

- Immediately remove COMMIT/DML from `set amount` focusout.
- Calculate row preview in client only; calculate authoritative row/footer totals in final server transaction.
- One quotation API must save master, details, quality, TAC and footer together.

---

# 4. Comparative Statement — Page 712

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 24 |
| Dynamic Actions | 21 |
| DA actions | 49 |
| Processes | 11 |
| Interactive Grids | 1 |
| Explicit DML | 45 |
| Explicit commits | 3 |
| Explicit rollbacks | 0 |
| Declarative validations | 0 |

## Detail section problems

1. Three separate processes are named `CS Detail - Save Interactive Grid Data`, `_1`, and `_2`.
2. The first two contain approximately 25 and 10 explicit DML statements. This is a large, hard-coded denormalized update surface for one grid.
3. `set detail table` runs on focusout, so comparison detail may be written/changed before final Save.
4. Page-ready cleanup deletes unsaved detail data.
5. No declarative validations exist; correctness depends on custom page process conditions and database rules.

## Calculation/selection problems

1. Comparative statement values depend on quotations that may change after this page loads.
2. Lowest/economic supplier selection must be recomputed server-side using a single snapshot of rate, tax, freight, discount and quantity.
3. If comparison columns are stored through many explicit updates, a failure in the middle can leave only some supplier columns updated.
4. Three commits in Pass/Fail/workflow actions are separate from complete comparison persistence.

## Problem that may occur now

- Different suppliers compared using values captured at different times.
- Lowest supplier selection excludes late footer/tax changes.
- Partial comparative row after one DML statement fails.
- Status committed although full statement is incomplete.

## Required fix

- Build comparison from a server query/view using quotation version IDs.
- Store selected supplier/result once, with source quotation versions.
- Avoid dozens of page-level update statements; use one package transaction.

---

# 5. Purchase Order — Page 118

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 118 |
| Dynamic Actions | 71 |
| DA actions | 122 |
| Processes | 32 |
| Interactive Grids | 4 |
| Explicit DML | 40 |
| Explicit commits | 6 |
| Explicit rollbacks | 0 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Detail section problems

1. `Insert into detail` fires on focusout, and another similarly named action fires on click.
2. `Insert into tac` populates terms and conditions through a separate request.
3. `insert footer detail` performs DML and an explicit commit.
4. `Detail - Save Interactive Grid Data` is custom `APEX$ROW_STATUS` DML and updates rows without a visible original-row checksum/version predicate.
5. Footer, special note and TAC grids are saved through separate processes.
6. `Delete Detail` contains multiple delete operations, while `Delete master if Detail is not saved` is a later cleanup step.

## Calculation problems

PO amount is split among:

- `set amount` focusout, which performs DML + COMMIT
- quantity conversion DAs
- balance quantity focusout
- detail footer calculation
- footer total on click/focusout
- discount rate and final footer JavaScript
- advance amount and PO advance calculation

Confirmed issues:

1. **Focusout calculation commits database state before Save.**
2. `DocumentStatus` DA contains a commit.
3. Email-related DA/process contains commits; notification side effect is mixed with PO transaction.
4. `Insert into Payment Advice`, `Insert into indent`, and vendor acceptance processes create cross-module side effects from PO processing.
5. `validate qty`, `validate qty_1`, and `validate balance LA` run after submit, but source quantity could change between earlier focusout check and final DML.

## Problem that may occur now

- PO detail/footer saved but TAC/special note fails.
- Advance/payment advice is created while PO later fails.
- Old indent/loading-advice balance used by another concurrent PO.
- Email commit changes transaction boundary or reports success independently.
- User sees recalculated amount while committed database row contains earlier value.

## Required fix

- One `purchase_order_api.save_order` transaction for master, detail, footer, TAC, notes and source references.
- Email/payment advice should be post-commit queued work, idempotently linked to PO version.
- Recheck source balance with row lock/version during final Save.
- Remove focusout/click DML and commits.

---

# 6. Loading Advice — Page 155

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 50 |
| Dynamic Actions | 41 |
| DA actions | 87 |
| Processes | 14 |
| Interactive Grids | 1 |
| Explicit DML | 19 |
| Explicit commits | 1 |
| Explicit rollbacks | 1 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Detail section problems

1. Detail can be inserted from PO, Sales Order and Sales GRN through different click DAs.
2. `Insert Detail against PO`, `Insert detail against SO`, duplicated SO action, and Sales GRN action create different paths into the same detail table.
3. Custom detail DML uses `APEX$ROW_STATUS` and is not visibly protected by original-row version comparison.
4. `delete unsave data` runs on page ready.
5. One explicit commit and rollback exist, but complete transaction coverage across all actions is not demonstrated.

## Quantity/calculation problems

1. `Check Pending Qty` happens on focusout, while final `Validations Quantity From P.O.` happens after submit.
2. This creates a time-of-check/time-of-use gap. Another user can consume PO balance after the focusout check but before Save.
3. Quantity1/Quantity2 conversion and decimal adjustment happen through multiple focusout DAs.
4. Detail source changes (`Enable Get Item when PO Change`) can leave rows loaded from an earlier source if clearing is not perfectly sequenced.

## Problem that may occur now

- Loading quantity exceeds current PO balance under concurrent users.
- Detail rows from previous PO/SO remain after source change.
- Different source paths apply different validations.
- User navigates away and loses/retains partially created detail rows.

## Required fix

- One source type/reference contract.
- Final Save locks/version-checks PO/SO/source lines and reserves quantity atomically.
- “Get Item” only creates draft rows keyed by draft UUID.
- Common quantity conversion function for all source paths.

---

# 7. Material In — Page 69

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 85 |
| Dynamic Actions | 47 |
| DA actions | 79 |
| Processes | 21 |
| Interactive Grids | 3 |
| Explicit DML | 31 |
| Explicit commits | 1 |
| Explicit rollbacks | 1 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Confirmed concurrency problem

`Process form Material In` explicitly has:

- `lock_row = Y`
- `prevent_lost_updates = N`

This means the master form does not use APEX lost-update prevention.

## Detail section problems

Items can be loaded from:

- PO
- Loading Advice
- CC Invoice
- Delivery Intimation
- Job Order

Problems:

1. Each source path has its own click DA and server DML. Business rules can diverge.
2. Custom main detail process plus separate Equipment and Personal Belonging grid processes make one material-in transaction multi-part.
3. Main detail custom update lacks visible version protection.
4. `Delete records` and `Delete master if Detail is not saved` indicate post-failure cleanup rather than guaranteed atomic construction.

## Quantity/weight calculation problems

1. `Check Pending Qty` occurs before Save; source balance can change before commit.
2. `Check Net weight and sum of quantity` and a second `_1` process exist. Duplicate validation variants may run under different conditions and produce inconsistent acceptance.
3. Quantity1/Quantity2 and decimal conversion are focusout-driven.
4. LR number and reference number checks are split between focusout and after-submit processes.

## Problem that may occur now

- User A overwrites User B’s master changes.
- Material In quantity exceeds source balance.
- Net weight equals one browser calculation but not the final detail set.
- Different source types produce inconsistent detail/rate/reference values.

## Required fix

- Enable lost-update prevention or add explicit row version.
- Consolidate all source imports into one normalized draft API.
- Final Save recomputes quantity/weight and locks source allocation.
- Master, detail, equipment and belongings commit together.

---

# 8. GRN — Page 146

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 78 |
| Dynamic Actions | 71 |
| DA actions | 109 |
| Processes | 20 |
| Interactive Grids | 5 |
| Explicit DML | 32 |
| Explicit commits | 3 |
| Explicit rollbacks | 3 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Detail section problems

1. GRN uses main detail, storage detail, stock storage, job and equipment-related grids/processes.
2. `Insert into Grn Detail`, `Insert through JO and Mat-In`, and `Insert through LoadingAdvice and Mat-In` create multiple entry routes.
3. Main `GrnDetail - Save Interactive Grid Data` is custom row-status DML with no visible old-version predicate.
4. Native storage grids have lost-update prevention, but main detail uses different concurrency behavior.
5. `Create DInspection`, storage-location logic and Fail flow contain separate commits.
6. `update FREIGHTPOSTEDTOSTOCK` is a separate after-submit update; stock/freight status can diverge if processing fails around it.

## Quantity/calculation problems

Many separate events set/check:

- challan quantity
- received quantity
- inspected quantity
- accepted quantity
- rejected quantity
- shortage
- detail/storage rejected quantity
- balance quantity
- Quantity1/Quantity2 conversion
- amount/rate
- total/sum of quantities

Problems:

1. The same physical receipt is represented by several derived quantities updated on focusout/click.
2. A user can Save while a prior focusout calculation is still settling.
3. `Check received qty`, `Check qty`, `Check shortage` and final `Validation with Detail and Stock Detail` are separate layers.
4. Source balance and stock storage allocation may be based on different snapshots.

## Problem that may occur now

- Received ≠ accepted + rejected/shortage.
- GRN detail quantity differs from storage allocation total.
- Freight-posted-to-stock status changes without complete GRN posting.
- Another user receives against the same remaining source quantity.

## Required fix

- Server derives all quantity relationships in one final validation.
- Enforce equations and non-negative values in database/service.
- Save GRN header, detail, inspection, storage and stock movement atomically.
- Use one row-version strategy for every grid.

---

# 9. Purchase Bill — Page 143

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 68 |
| Dynamic Actions | 62 |
| DA actions | 166 |
| No-wait DA server actions | 2 |
| Processes | 16 |
| Interactive Grids | 5 |
| Explicit DML | 66 |
| Explicit commits | 10 |
| Explicit rollbacks | 0 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Confirmed critical detail problems

1. Two server-side DA actions have `Wait for Result = N`.
2. At least one no-wait path performs DML and commit.
3. `Detail - Save Interactive Grid Data` manually updates by `TNO + ROWID`; there is no visible original-row version in the update predicate.
4. GRN selection, GRN grid, detail, footer and TAC are separate grid/process paths.
5. `Insert Into GRNSelection`, `Get Item`, `Insert into tac`, and footer insertion perform database work outside one final Save boundary.
6. Ten explicit commits exist with no explicit rollback in page source.

## Calculation problems

The same bill amount chain is handled through:

- multiple `set amount` focusout DAs
- `Set Amount`
- `Recalculate Amounts`
- `Set DFAMOUNT`
- detail footer amount
- footer total on click/focusin/focusout/change
- tax-round-off change
- bill-round-off change
- PB total change
- total amount focusout
- final footer JavaScript

Problems:

1. **Race condition:** no-wait request can finish after a later calculation or Save.
2. **Premature commit:** focusout calculation can commit intermediate data.
3. **Different calculation layers:** JavaScript, Set Value SQL/PLSQL and direct DML all participate.
4. **Rounding order risk:** tax rounding, bill rounding, footer and total may execute in different orders depending on user movement.
5. **Region refresh risk:** refresh can replace unsaved grid model values with committed intermediate values.
6. **No single authoritative final recalculation process is evident for the whole bill.**

## Problem that may occur now

- Footer calculated from an older amount/rate.
- Bill total visible on screen differs from saved total.
- GRN selection/detail saved but footer/TAC fails.
- Same detail row overwritten by a stale browser tab.
- User sees false success after one intermediate commit even if final Save fails.

## Required fix

- Highest-priority refactor: remove all mutating focusout/no-wait actions.
- Create `purchase_bill_api.save_bill` to recalculate detail, tax, footer, rounding and payable value on server.
- Lock/version-check selected GRNs and prevent duplicate billing.
- Commit once after header, detail, GRN links, footer, TAC and accounting preparation succeed.

---

# 10. Purchase Bill Pass — Page 152

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 113 |
| Required items | 0 in export metadata |
| Dynamic Actions | 72 |
| DA actions | 138 |
| Processes | 21 |
| Interactive Grids | 6 |
| Explicit DML | 42 |
| Explicit commits | 5 |
| Explicit rollbacks | 0 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Detail section problems

1. Detail, footer, Paid in Advance, TDS Deducted in Advance, TDS and other data are separate grids/processes.
2. Main detail uses custom `APEX$ROW_STATUS` DML without visible original-row version check.
3. `Update PBPASSGRN` is a separate process after bill-pass work.
4. `Insert Into Detail`, `Insert Into Footer` and footer selection actions build database state before/around final Save.
5. No item is marked required in exported metadata, and no declarative validation exists. Custom process validation may exist, but the page lacks a clear uniform field contract.

## Calculation problems

The page separately calculates:

- quality and bonus
- TDS threshold and TDS amount
- four `set amount...` focusout paths, each containing an explicit commit
- detail footer
- bill amount
- debit note amount
- paid in advance
- TDS deducted in advance
- TDS deductible amount
- net pay amount
- currency value
- footer/total/rounding

Problems:

1. **Five commits, no rollback:** four amount-focusout commits plus workflow/other commit paths fragment the bill-pass transaction.
2. TDS, bonus, quality, debit note and advance deductions depend on execution order.
3. Changing rate/quantity after TDS calculation can leave TDS/net pay stale.
4. `set PAIDINADVANCE and tds deducted in advance` performs multiple DML actions on focusout before final Save.
5. GRN/bill-pass link update is not visibly part of one package transaction with all financial calculations.

## Problem that may occur now

- Net payable does not equal bill amount ± footer/quality/bonus − TDS − advances − debit note.
- TDS committed using earlier taxable amount.
- Advance/TDS rows persist even when final bill pass fails.
- PBPASSGRN link status differs from saved financial detail.

## Required fix

- One `purchase_bill_pass_api.post` service must recompute all deductions and net payable.
- Required fields and server validations must be explicit and named.
- TDS rule/version/effective date stored with calculation.
- Advance/debit-note consumption locked and idempotent.
- One commit only.

---

# 11. Payment Advice — Page 140

## Evidence snapshot

| Component | Count |
|---|---:|
| Items | 108 |
| Required items | 1 |
| Dynamic Actions | 36 |
| DA actions | 58 |
| Processes | 18 |
| Interactive Grids | 1 |
| Explicit DML | 4 |
| Explicit commits | 1 |
| Explicit rollbacks | 0 |
| Declarative validations | 0 |
| Unsaved-change warning | Disabled |

## Detail section problems

1. `INSERT PAYMENTADVICE DETAIL` performs explicit detail DML, while master is saved through a separate form DML process.
2. `Delete Records` deletes master/detail-related rows separately.
3. `Update Payment Advice` is a separate process after other calculations.
4. Only one required item and no declarative validation are visible; custom `Validate Detail Field` must carry most server validation responsibility.
5. Retry/idempotency protection is not evident in page source.

## Calculation problems

Calculation is divided among:

- `Calculate Net Amount` on focusout
- another net amount DA on change
- `Calculate total amount` with Set Value plus two JavaScript actions
- `Set Amount` on change and page initialization
- `set amount and amount entered`
- `set amountcr`
- `CalculateAmountCR` after submit
- `SetTDSandThreshold`
- TDS nature/location processing

Problems:

1. Same net/total concept is calculated on both change and focusout.
2. Browser JavaScript and after-submit PL/SQL both contribute to totals.
3. TDS and credit amount calculation order is not one clearly owned formula.
4. One commit exists without page-level rollback.
5. If response is lost after commit, user retry can create/update payment advice again unless database uniqueness/idempotency stops it.

## Problem that may occur now

- Amount entered, amount credit, TDS and net amount do not reconcile.
- Detail is inserted twice on retry.
- Advice master saves but calculated detail/update fails.
- Payment mode validation happens too late or under different conditions from client calculation.

## Required fix

- One server-side payment allocation calculation.
- Unique advice/request key and source-bill allocation constraints.
- Final service validates payment mode, TDS, amount limits and outstanding balance under lock.
- Master/detail/update commit once.

---

# Cross-form root causes

## 1. Detail rows are treated as working tables

Many pages delete/insert detail rows through DAs before final Save, then use cleanup processes if the master or final Save fails. This can work in a synchronous Forms session but is fragile in a browser.

## 2. Calculations are event-driven instead of transaction-driven

Amount/quantity/footer calculations are distributed across change, focusin, focusout, click, page-ready, JavaScript, Set Value and PL/SQL. A correct result depends on every event firing in the expected order.

## 3. Intermediate commits

Quotation, PO, PB and PB Pass contain calculation/detail-related commits before the whole business document is known to be valid.

## 4. Mixed concurrency standards

Some native IG processes enable lost-update prevention; custom detail DML often updates by ROWID/business key without visible original-version comparison. Material In master explicitly disables lost-update prevention.

## 5. Source-balance checks are not the same as source reservation

Checking pending quantity on focusout does not reserve it. PO/Loading/Material-In/GRN/PB flows need database locking/versioning during final transaction.

## 6. Declarative validation is not standardized

Most pages rely on custom PL/SQL processes. Validation process order and button conditions must be verified page by page; there is no consistent visible contract.

---

# Recommended calculation architecture

For every document:

1. Browser calculates only a preview.
2. No database DML on focusout/change for core transaction data.
3. Final Save sends the complete master/detail document and request UUID.
4. Server reloads current source balances/rates/rules.
5. Server performs all quantity, rate, discount, tax, footer, rounding and net calculations.
6. Server compares client preview with authoritative result and returns corrected values/errors.
7. Source rows are locked or version-checked.
8. Master, details, links, stock/accounting effects and audit trail save atomically.
9. One commit occurs.
10. Same request UUID retry returns the original result.

---

# Recommended remediation order

1. **Purchase Bill 143** — remove no-wait and focusout commits.
2. **Purchase Bill Pass 152** — centralize TDS/advance/net-pay calculation and remove four focusout commits.
3. **Purchase Order 118** — remove detail/footer commits and separate email/payment side effects.
4. **Purchase Quotation 710** — remove committed focusout amount calculation.
5. **GRN 146** — centralize received/accepted/rejected/storage equations and atomic stock posting.
6. **Material In 69** — enable concurrency protection and unify source-import logic.
7. **Loading Advice 155** — atomic source quantity reservation.
8. **Payment Advice 140** — idempotent allocation and central net/TDS calculation.
9. **Comparative Statement 712** — replace many DML statements with versioned comparison service.
10. **Purchase Enquiry 708** — draft UUID and safe cleanup.
11. **Indent 108** — standard quantity/rate/detail validation template.

No ERP code, data or settings were changed while preparing this list.
