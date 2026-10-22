# Voucher currency precision and balance fix — 21-10-2026

Status: deployed and source-verified in IMART / ORA26PDB. The user confirmed this is a test database and authorized any item/party for test entries. No historical voucher amounts were changed. A new marked Production test entry has now been created and posted through APEX.

## Verified cause

VOUCHERDETAIL.AMOUNT is unrestricted Oracle NUMBER. POSTPRODUCTION sent quantity × stock rate and finished-goods allocation amounts directly to four ledger insert expressions without currency rounding. The division used to calculate the finished-goods stock rate legitimately retains precision; this precision was leaking into accounting amounts. POSTPBPASS also contains an explicit ROUND(amount,5), and purchase/job/freight routines include high precision exchange/cost/revaluation arithmetic.

The existing IMART_VOUCHER_BALANCE checked rounded aggregate debit/credit totals with a 0.0051 source tolerance; it did not require each ledger amount to have currency precision. Negative amounts are Debit, positive amounts are Credit.

## Deployed changes

- POSTPRODUCTION rounds each generated finished-goods and raw-material ledger amount to 2 decimals. Each stock/consumption pair uses the identical rounded amount on opposite sides. Stock rates and stock quantity calculations retain their existing precision.
- Existing IMART_VOUCHER_BALANCE now finalizes newly created vouchers at the outermost posting boundary. Header capture records which voucher IDs were inserted in that scope; it does not infer newness from dates or rewrite existing vouchers.
- Finalization first checks the unrounded source totals using the existing checks. Genuine mismatches are rejected. Each side is rounded to its aggregate currency total, distributing residual cents deterministically among fractional lines by largest remainder. Already exact-cent lines are unchanged. Adjustments do not change account identity, create a balancing account, or exceed one cent relative to ordinary per-line rounding.
- Final validation requires every line to have at most 2 decimals and the full voucher Debit total to equal Credit exactly, with both sides present. Existing touched vouchers are validated but never automatically normalized.
- VOUCHERDETAILBI rejects new/changed amounts with excess precision outside a posting scope. This is rejection, not silent rounding. In particular a manual/unscoped writer must supply a rounded amount before DML. Changing :NEW silently inside this trigger would risk inconsistent BEFORE-trigger accounting balance updates due to trigger execution order.
- Normalization uses normal VOUCHERDETAIL updates. All existing audit, freeze-date, account, settlement, AccountBalance and TrialBalance triggers remain in force. A settled line requiring a change is rejected by the existing IMART_ALLOC_LEDGER_BUD; no settlement restrictions were bypassed. Existing fractional lines in the reviewed population had zero settlement links.
- No COMMIT was added. Existing posting callers retain their savepoint/rollback handling. Nested scopes finalize at the outer boundary; abort clears the scope state.

## Changed objects

1. IMART_VOUCHER_BALANCE package specification and body
2. IMART_VB_CAPTURE_HEADER trigger
3. VOUCHERDETAILBI trigger
4. POSTPRODUCTION procedure

Source files: after/. Original versions of the five changed source units: before/. deploy.sql contains schema/container and original-source fingerprint checks, compilation assertions and dependent-object revalidation. rollback.sql restores the original five source units without deleting objects or changing business data. Deployment is intentionally guarded against rerunning on different source.

## Executed validation

- Read-only Oracle NUMBER arithmetic replay of all 971 affected vouchers, including every detail line on both sides, not only the fractional rows.
- 967 originally balanced vouchers passed currency normalization and exact Dr=Cr checks; this includes 870 Production vouchers.
- 4 pre-existing source mismatches were explicitly rejected. See below.
- 1,941 side-level tests passed, including seven explicit empty/exact-cent/tie/remainder/high-precision cases and the two sides of each eligible voucher. Negative and NULL amount inputs were also confirmed rejected.
- Deployed package checks passed: pure rounding, nested/end/abort scope handling, invalid scope rejection, unequal/missing/zero side rejection, valid stored-voucher acceptance, and stored fractional-voucher rejection. These checks performed no business DML; read locks were rolled back.
- All five deployed source units match after/ and are VALID.
- All six checked accounting capture/balance/settlement triggers remain ENABLED.
- No new invalid database objects. Baseline had 72 pre-existing invalid objects; these were not represented as fixed by this deployment. For example, POSTJBPASSPURCHASE already reports a missing BALANCEQUANTITY2 reference; this unrelated schema dependency remains outside the precision fix.
- Historical excess-precision population remains 971 vouchers / 6,045 detail lines after deployment.

Tracked validation logs: test-pure.log, test-deployed.log, deploy.log. Machine-readable result: validation-summary.json.

## Existing source mismatches — unchanged

| Voucher | Module | Date | Difference (Cr minus Dr) |
| --- | --- | --- | --- |
| IMPL/PUR/26-27/000762 | PBPASS | 06-07-2026 | 0.006 |
| IMPL/PRD/26-27/CONV/001080 | PRODUCTION | 13-07-2026 | 41561.61147683902039079470216574765198 |
| IMPL/PUR/26-27/000929 | PBPASS | 21-07-2026 | 0.0056 |
| IMPL/PUR/26-27/001064 | PBPASS | 03-08-2026 | -0.0076 |

existing-source-mismatches.json and existing-source-mismatches.csv include TNO, Module TNO and resolved Module No along with exact amounts. JSON preserves the amount strings; spreadsheet software may coerce long numeric CSV values and lose precision. The earlier full Excel review remains available separately.

The large Production mismatch is not a currency-rounding residual. Its historical cause has not been established; no old accounting entries were repaired or reposted.

## Practical limits and follow-up

A new Production entry was subsequently created through the APEX form and posted through the existing authorized Status → ACTIVE action in the user-confirmed test database. Production end-to-end posting and stock checks passed as detailed below. Separate Purchase Bill Pass / Job Bill Pass tax and settlement end-to-end workflows were not executed; replay tests must not be described as those workflows.

Existing source/authorization checks may reject a document before the outer finalizer, and a fractional settled ledger line remains protected. Genuine source discrepancies must be corrected at their source rather than hidden by balancing adjustments. Existing historical fractional vouchers may require a separately reviewed source correction before they can pass the stricter validation when edited/revalidated.

Controls apply to the application's existing posting scopes and voucher validation paths; they are not a claim of a database-wide deferred commit-time constraint for arbitrary external SQL. Unscoped excess-precision writes fail immediately.

Financial extracts and logs may contain business information. No credentials are included. Reviewed migration sources, rollback, validation scripts and selected test evidence are source controlled. Raw financial extracts and diagnostic dumps remain local.

## Actual APEX Production test — completed

- Production TNO: 57092429. Document and voucher number: IMPL/PRD/26-27/PRD/000213. Voucher TNO: 57092555. Final document status: ACTIVE.
- Marked remark: CODEX precision test 21-10-2026 — verify 2-decimal voucher and Dr/Cr balance. Entry was created under the signed-in BOSS session using the normal APEX Create action. No SQL inserts were used to fabricate this entry.
- Input: HR COIL / COIL 08MM E250BR 1250, 0.003 MT, source stock 57083878, GODOWN. Output: HR SHEET / 2MM E250BR 1250X6300, 0.003 MT, GODOWN.
- Exact source cost: 174.062531017369727047146401985111662531. Posted currency amount: 174.06 per matching stock/consumption line.
- Exactly one voucher, four lines, Debit 348.12, Credit 348.12, net 0, zero excess-precision lines. Values were verified both in VOUCHERDETAIL and the visible voucher grid.
- Source stock quantity stayed 20.15; used stock moved from 0 to 0.003. Finished stock 57092484 has quantity 0.003. Rate retained 58020.8436724565756823821339950372208437.
- Evidence: e2e-verification.json, e2e-assertions.log, fixture-baseline.json, e2e-voucher-header.jpg and e2e-voucher-lines.jpg. Assertions were executed against the persisted transaction and passed.
- The clearly marked test entry and its posted voucher remain in the test database for review.

### Separate issue uncovered during testing

The Production Pass button failed before posting with ORA-01422 in dynamic action 443390428449794154. Its module lookup joins all module/location rows without narrowing the current location and returns multiple rows; its existing code also contains literal item-name strings and SQL USER references. No voucher/status change from that failed action was found before using the existing Status action. There are no configured PRODUCTION ModuleFlow rows in this schema snapshot. At the time of this rounding test the approval action was not modified. It was subsequently corrected and tested separately; see ../production-pass-20261021/README.md. No approval rules were created and no security controls were disabled. The successful posting used the normal Status control already available to this signed-in user. The failed-action trace is in e2e-outcome.json.

Temporary session tracing was enabled to diagnose that failure and disabled after verification. No fresh production-form validation failure was bypassed; the initial missing detail/allocation errors stopped saving until all linked raw and finished rows were entered.

## Repository artifact scope

Only the five changed source units, original versions needed for rollback, guarded deploy/rollback scripts, pure SQL checks, validation SQL, test-record assertions and summarized results are tracked. Broad schema dumps, raw financial extracts, session diagnostics and screenshots remain local. References above to those local investigation artifacts describe the original validation evidence; they are not required to deploy. Use deploy.sql only against matching original source; it intentionally rejects an already-applied deployment.
