# Purchase Order final-save detail synchronization — 2026-09-27

## Confirmed defect

The live audit found 147 `PURCHASEORDERDETAIL` rows where stored `FOOTERAMOUNT` did not equal the sum of `PURCHASEORDERDETAILFOOTER`. The existing final verifier correctly detects this, but did not reconcile the already-persisted footer-grid values before rejecting the save.

## Change

At the start of the existing Page 118 `SavePurchaseOrderFooter` after-submit process, the active document's detail `FOOTERAMOUNT` and `TOTALAMOUNT` are derived from its stored detail footer values. The three Purchase Order header summaries are then derived from those details, before the existing header-footer aggregation and final integrity verifier.

It does not calculate tax, discount, rate, or quantities. The existing sequence-165 verifier remains authoritative for those business calculations and rejects any genuine mismatch. No new commit is issued.

## Verification

Run `app105-source/validate_purchaseorder_final_save_detail_sync_20260927.sql`, then `app105-source/deploy_purchaseorder_final_save_detail_sync_20260927.sql`. Export Page 118 afterward and compare it with `staged/f105_page_118.sql`.
