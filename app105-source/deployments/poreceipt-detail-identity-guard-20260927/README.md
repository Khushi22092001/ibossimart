# PO Receipt detail line-identity guard — 2026-09-27

## Problem

`PORECEIPTDETAIL` had neither a constraint nor trigger ensuring that `(TNO,SNO)` uniquely identifies one line. The read-only audit found three historic duplicate identities covering eight detail rows. Their distinct items share a small number of footer rows, making a footer join ambiguous.

## Change

The compound trigger `PORECEIPTDETAIL_BIU_IDENTITY_GUARD` rejects future inserts or key changes that would duplicate `(TNO,SNO)`, and rejects null keys. It checks after the statement to avoid mutating-table errors. Updates that retain an existing legacy key are deliberately permitted, so historic documents remain editable without being rewritten.

## Scope and safety

- No historic transaction, footer, or tax amount is altered.
- No commit is issued by the trigger.
- The guard applies only to PO Receipt detail line identities.
- Rollback verification performs only rolled-back test updates.

## Deployment and verification

Run `app105-source/deploy_poreceipt_detail_identity_guard_20260927.sql`, then `app105-source/verify_poreceipt_detail_identity_guard_20260927.sql`.

If a rollback is required, run `app105-source/rollback_poreceipt_detail_identity_guard_20260927.sql`. It removes only this newly added trigger and does not touch transaction data.
