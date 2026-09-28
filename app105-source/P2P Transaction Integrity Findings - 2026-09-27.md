# P2P Transaction Integrity Findings — 2026-09-27

This is a working integrity record for the purchase-side transaction audit. Counts below are read-only observations from the live IMART schema. No historic financial record was mass-corrected.

## PO Receipt (Page 274) — remediated for future writes

| Check | Live finding | Resolution |
|---|---:|---|
| Detail rows | 6,419 | Audited |
| Material detail/footer mismatch | 94 | Final-save reconciliation added for unambiguous identities |
| Material detail total mismatch | 10 | Final-save reconciliation added for unambiguous identities |
| Duplicate `(TNO,SNO)` detail rows | 8 rows across 3 identities | Future duplicates blocked by database guard; legacy rows preserved |
| Existing line-key constraint/trigger before change | None | `PORECEIPTDETAIL_BIU_IDENTITY_GUARD` deployed and enabled |

Page 274's existing `save footer` submit process now first sets each unique line's `FOOTERAMOUNT` to the sum of its stored footer values and `TOTALAMOUNT` to `AMOUNT + FOOTERAMOUNT`. It then performs the existing header-footer aggregation, all in the same submit transaction and without a new commit.

The three historic duplicate identities are intentionally excluded from that reconciliation. Their single footer set cannot safely be distributed between multiple items. The guard permits normal changes that retain a legacy key, but rejects a new/null/colliding line identity with error `-20032`.

Deployment proof:

- SQL validation: `PORECEIPT_FINAL_SAVE_DETAIL_SYNC_SQL_COMPILED`
- Trigger rollback-only verification: `UNCHANGED_IDENTITY_ALLOWED`, `DUPLICATE_IDENTITY_REJECTED`, `ENABLED`
- Staged/live Page 274 SHA-256: `F5268B0A1CEEF9C395641CDA80137E11EFEE146130A7CD1EA2202FCFD3285159`

Relevant deployment material:

- `deploy_poreceipt_detail_identity_guard_20260927.sql`
- `verify_poreceipt_detail_identity_guard_20260927.sql`
- `deploy_poreceipt_final_save_detail_sync_20260927.sql`
- `validate_poreceipt_final_save_detail_sync_20260927.sql`

## Purchase Order (Page 118) — final-save reconciliation added

The live audit found 1,842 detail rows, no duplicate line identities, 147 material detail/footer mismatches, and no independently inconsistent totals. Page 118 already had a server verifier at after-submit sequence 165, but it was validating `FOOTERAMOUNT` without first reconciling it to the submitted detail-footer grid.

The existing `SavePurchaseOrderFooter` process at sequence 160 now first reconciles each detail row's `FOOTERAMOUNT` and `TOTALAMOUNT` from `PURCHASEORDERDETAILFOOTER`, then derives the three header sums from those details. The original header-footer aggregation and sequence-165 verifier remain unchanged and immediately follow.

This does not change any tax, discount, rate, UOM, or quantity rule. It does not issue a commit. A wrong amount/discount/UOM/tax basis still produces the existing meaningful server error instead of saving. The staged/live Page 118 SHA-256 is `47C1D21546C5EEFE2B43084D8E97C39F428163C12FEA15E82767B7DBFE1C1E07`.

The historical Page 118 tax-rebuild action still contains an explicit pre-save commit. It is a separate preview/persistence architecture risk; its behavior was not removed or changed by this correction.

## Purchase Bill (Page 143) — existing safeguard verified

The deployed package `IMART_PURCHASEBILL_CALC` is valid. Page 143 runs `Reconcile Purchase Bill financials` at after-submit sequence 85, then `Verify Purchase Bill calculations before commit` at sequence 86, before header footer insertion at sequence 90. The verifier checks line amount against the correct rate UOM, footer amount against detail-footer rows, totals, and header aggregates.

The live schema contains eight historic material detail/footer or total mismatches. No historical row was changed. A genuine future save of a document runs reconciliation before the verifier.

## Purchase Bill Pass (Page 152) — guard verified, reconciliation not duplicated

Page 152 has unique detail keys and an existing server-side `Verify Purchase Bill Pass calculations before commit` process at sequence 125. It checks detail amount, footer, total, and header aggregation, and raises an error before the request can commit when any check fails.

The live data contains 31 material detail/footer mismatches and 14 total mismatches from historic records. The page does not have a separate reconciliation process before its verifier. I have not added one blindly: Page 152's header totals are updated elsewhere in the save chain, and adding a second detail rewrite without reproducing that entire dependency ordering could make the existing header verifier reject otherwise valid saves. This needs a focused staging test of the full Page 152 save chain before a change.

## Other observed data semantics requiring no automatic rewrite

- Indent: 149 current-FY rows differ from the simplistic `INDENTQUANTITY1 × RATE` audit formula. Page 108 does not contain a detail amount calculation event; its `RATE` is sourced from historical stock. These rows require business-rule confirmation before any calculation is asserted or data changed.
- GRN: five current-FY rows differ from `RECEIVEDQUANTITY1 × RATE`. Page 146 calculates amount from those fields on change, but the historic rows contain absent/inconsistent rate UOM data. They are candidates for review, not automatic correction.
- Payment Advice: `AMOUNT` equals `AMOUNTENTERED` in all 771 rows. The `TDSDEDUCTABLEAMOUNT` field is not equivalent to document amount in the stored data, so treating every row as a calculation error would be wrong.

Payment Advice (Page 140) was also inspected live. Its change-driven calculations wait for server results and stop on errors. The page has no generic final calculation verifier; its server save chain performs TDS/threshold, amount, and payment-advice updates in separate ordered processes. A new generic formula guard would need an approved business rule for the reference/TDS semantics, so none was added from an invalid field-equality assumption.

## Bill Receipt (Pages 190/191) — identity guard added

Page 191 has a master/detail receipt save flow with client-side display aggregation. The underlying receipt, detail, and penalty tables had no declared constraints. The live audit found one historic detail row with a null `SNO`; normal procedure-based creation uses `GLOBALTNO.NEXTVAL`, so the null is a defect rather than an optional business value.

`DFREIGHTBILLRECEIPTDETAIL_BIU_IDENTITY_GUARD` is deployed and enabled. It rejects future null or duplicate `(TNO,SNO)` identities and lets existing legacy rows retain their key during ordinary edits. The rollback-only verification passed both `UNCHANGED_IDENTITY_ALLOWED` and `DUPLICATE_IDENTITY_REJECTED`.

The receipt header's `SUMOFTDSAMOUNT`, `SUMOFGSTAMOUNT`, and penalty total match their detail aggregates. The separate `TDSAMOUNT` field has different semantics and one historic difference from detail TDS; it was not wrongly rewritten as a duplicate aggregate.

## Remaining architectural risk

The Page 274 live `set amount` AJAX action still rebuilds `PORECEIPTDETAILFOOTER` and explicitly commits before the user performs the final save. The new final-save reconciliation prevents detail/footer divergence at a subsequent normal save, but it does not make that preview interaction atomic. Replacing persisted preview work with a non-persisting preview would require a dedicated dialog/UI contract review and regression test; it should not be removed blindly.
