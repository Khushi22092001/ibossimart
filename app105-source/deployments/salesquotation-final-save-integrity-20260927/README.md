# Sales Quotation final-save integrity — 2026-09-27

## Confirmed defect

Page 705 reconciled detail footer values during final save but had no server-side calculation verifier. The live audit found three material rate/UOM amount mismatches, 68 footer mismatches, 37 total mismatches, and drift in detail-derived header totals.

## Change

The existing `SaveSalesquotationFooter` process now also derives `SUMOFAMOUNT`, `SUMOFFOOTERAMOUNT`, and `SALESQUOTATIONAMOUNT` from saved detail rows. The unrelated `SUMOFFOOTER` field is not changed.

New sequence-85 `Verify Sales Quotation calculations before commit` applies only to SAVE/CREATE. It verifies the existing rate/UOM formula, detail-footer sum, line total, and those three header aggregates. It raises `-20054` with a specific save-blocked error on inconsistency. No tax, rate, rounding, or footer formula is replaced, and no commit is added.

## Verification

Run `app105-source/validate_salesquotation_final_save_integrity_20260927.sql`, deploy with `app105-source/deploy_salesquotation_final_save_integrity_20260927.sql`, then export Page 705 and compare it with `staged/f105_page_705.sql`.
