# O2C Transaction Integrity Findings — 2026-09-27

## Confirmed live data findings

| Family | Rows checked | Material footer mismatch | Material total mismatch | Key finding |
| --- | ---: | ---: | ---: | --- |
| Sales Order | 10,475 | 935 | 35 | 386 duplicate `(TNO,SNO)` identities; footer is keyed by this ambiguous pair. |
| Sales Enquiry | 8,254 | 0 | 0 | No current material discrepancy found. |
| Sales Quotation | 8,251 | 68 | 37 | Historical rows have missing/stale footer or total values. |
| PO Amendment | 10 | 1 | 0 | One historical footer mismatch. |

“Material” means greater than ₹0.01, so normal rounding noise is excluded.

## Root causes confirmed from live APEX and database metadata

1. Pages 702 and 706 rebuilt amount/tax from quantity changes but omitted `RATE` from that same event. A rate-only edit could therefore leave stored tax and totals stale.
2. These forms depend on browser/AJAX footer work before the final save. The prior footer-summary process did not make the detail row's stored footer and total equal the footer rows being saved.
3. `SALESORDERDETAIL` has no unique constraint on `(TNO,SNO)`, while `SALESORDERDETAILFOOTER` is unique on `(TNO,SNO,SN)` and `(TNO,SNO,FOOTERHEADCODE)`. The current data includes 386 duplicated Sales Order `(TNO,SNO)` pairs. A shared footer therefore cannot represent separate lines reliably.
4. The Sales Order cloning procedure `SAVEASSALESORDER` preserves source `SNO` values. This is safe only when the source document is already free of duplicate detail identities; it can propagate legacy malformed documents.

## Deployed prevention

| Deployment | Status | Scope |
| --- | --- | --- |
| `o2c-rate-recalculation-20260927` | Live, verified | Rate edits trigger the existing amount/tax calculation on Sales Enquiry pages 702 and 706. |
| `o2c-final-save-detail-sync-20260927` | Live, verified | At final save, pages 148, 171, 702, 705, and 706 synchronize each valid detail row's stored footer and total from its persisted detail-footer rows, in the same transaction. |
| `salesorder-detail-identity-guard-20260927` | Live, verified | A database guard rejects newly introduced duplicate Sales Order `(TNO,SNO)` identities without rewriting legacy documents. |
| `ccinvoice-final-save-detail-sync-20260927` | Live, verified | CC Invoice page 175 synchronizes saved detail footer and total values from saved detail-footer rows in its existing final footer process. |
| `salesquotation-final-save-integrity-20260927` | Live, verified | Sales Quotation page 705 now synchronizes its detail-derived header aggregates and rejects inconsistent rate/UOM, footer, line-total, or header state on Save/Create. |

Neither deployment altered historical transaction data.

## Sales Quotation server integrity addition

Page 705 previously synchronized detail footer and total values, but did not contain a final server-side verifier. The addition preserves its existing rate/UOM and footer calculations: it first derives `SUMOFAMOUNT`, `SUMOFFOOTERAMOUNT`, and `SALESQUOTATIONAMOUNT` from the saved details, then validates those header values and every line's amount, footer, and total before the Save/Create request can commit. `SUMOFFOOTER` is not changed because the live data shows it has distinct semantics.

The staged/live Page 705 SHA-256 is `0C54D3F9FBDCD163678CD801B146B853CFEC4A0604E129FDA885EB890C9D5003`. The rollback-only SQL compilation succeeded as `SALESQUOTATION_FINAL_SAVE_INTEGRITY_SQL_COMPILED`.

## Sales Enquiry pending authorization

Pages 702 and 706 share the same `SALESENQUIRYDETAIL`/footer family. Their live stored detail values are currently consistent, and both have the earlier rate-trigger and final-detail synchronization corrections, but neither has a final server-side verifier. A staged, rollback-only compiled deployment adds final header synchronization and validates the existing rate/UOM, detail footer, total, and header formulas on Save/Create. The live deployment was withheld pending explicit authorization because it changes two financial save paths.

## PO Amendment and CC Invoice classification

PO Amendment (Page 148) has one historic footer mismatch, but its current line-rate formula and three relevant header aggregates are consistent. Its deployed final-save detail synchronization covers the footer drift; there is no confirmed formula conflict requiring an additional change.

CC Invoice (Page 175) has consistent line-rate calculations but 294 historic detail/footer mismatches, 77 total mismatches, and no final server verifier. Its `CCINVOICEAMOUNT` is not a simple detail-total aggregate: 2,972 historic header rows differ from that naive formula. This must be traced through its established invoice/advance/insurance/rounding accounting path before any header synchronization or generic verifier can safely be added.

## Downstream Despatch Advice and Sales GRN classification

Despatch Advice Page 161 is non-monetary and its `DESPATCHADVICEDETAIL` table already enforces unique line identities. Its apparent unused sequence variable is not a persistence defect because the Interactive Grid submits the existing line key and all 7,568 live rows have non-null, unique keys.

Sales GRN Page 184 has a confirmed client/AJAX UOM-conversion defect: its `set amount new` callback declares `mfactor` but never loads it before calculating secondary, accepted-secondary, and rejected-secondary quantities. The intended lookup is evidenced by the disabled companion action and related bill pages: it is `ITEMSPECIFICATION.MULTIPLYINGFACTOR` for the submitted item specification. A minimal staged page export adds only that lookup. It is deliberately not live: no current item specification has a configured non-null multiplying factor, so a meaningful positive regression test cannot be run. A separate generic total or amount guard is unsafe because the live page's existing amount rule uses rejected quantity and legacy rows may retain amounts where source quantities are absent.

## Historical data remediation needed

Historical financial rows must not be silently rewritten. The read-only classification found 382 reconstructable duplicate identities (1,167 detail rows) with one tax-rule pattern and exact stored arithmetic; four identities require manual review. The next remediation must allocate new line IDs and regenerate their footer rows atomically, after a document-level review/approval, before adding a database uniqueness constraint.

The latest live recheck confirms `SALESORDERDETAIL_BIU_IDENTITY_GUARD` is enabled. The remaining 1,181 rows in legacy duplicate identities and 935 footer mismatches are intentionally not remapped by ordinary final-save logic because their footer ownership is ambiguous.

## Evidence scripts

- `app105-source/audit_o2c_calculation_integrity_readonly_20260927.sql`
- `app105-source/audit_o2c_material_mismatches_readonly_20260927.sql`
- `app105-source/audit_o2c_database_guards_readonly_20260927.sql`
