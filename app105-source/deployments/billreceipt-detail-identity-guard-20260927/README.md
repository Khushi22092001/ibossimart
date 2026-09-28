# Bill Receipt detail line-identity guard — 2026-09-27

## Confirmed defect

`DFREIGHTBILLRECEIPTDETAIL` lacks database constraints for its line identity. The live audit found one historic detail row with a null `SNO`. The normal `CREATEDFREIGHTBILLRECEIPTFORCN` procedure assigns `GLOBALTNO.NEXTVAL`, confirming that a null identity is not intended for new records.

## Change

`DFREIGHTBILLRECEIPTDETAIL_BIU_IDENTITY_GUARD` rejects new null or duplicate `(TNO,SNO)` line identities and rejects attempts to change a key to null or a collision. It uses an after-statement check to avoid mutating-table errors.

Existing legacy rows retain their key during ordinary edits and are deliberately allowed; no historic data is rewritten. Any side effects from existing receipt triggers are rolled back with the failed DML statement.

## Verify / rollback

Run `app105-source/deploy_billreceipt_detail_identity_guard_20260927.sql`, then `app105-source/verify_billreceipt_detail_identity_guard_20260927.sql`. If necessary, `app105-source/rollback_billreceipt_detail_identity_guard_20260927.sql` drops only this new guard.
