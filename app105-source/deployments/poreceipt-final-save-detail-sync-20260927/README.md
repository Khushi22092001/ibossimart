# PO Receipt final-save detail synchronization — 2026-09-27

## Problem

The Page 274 final process rebuilt the document footer but did not reconcile each saved detail row's `FOOTERAMOUNT` and `TOTALAMOUNT` from `PORECEIPTDETAILFOOTER`. The read-only audit found 94 material detail/footer mismatches and 10 total mismatches.

## Change

At the beginning of Page 274's existing `save footer` after-submit process, detail rows for the current document are reconciled from their stored footer rows before the header footer is aggregated. It stays in the existing submit transaction and issues no commit.

Rows with historic duplicate `(TNO,SNO)` identities are deliberately excluded: one stored footer is ambiguous across multiple detail rows, so assigning it automatically would risk wrong financial values. The new `PORECEIPTDETAIL_BIU_IDENTITY_GUARD` prevents such future collisions.

## Scope and safety

- Does not change tax formulas, footer rules, workflow, or user interface behavior.
- Does not issue an early or independent commit.
- Applies only during a real final save for the active document.
- Does not repair historic documents unless they are subsequently saved; even then, historic duplicate identities remain skipped.

## Deployment and verification

Run `app105-source/validate_poreceipt_final_save_detail_sync_20260927.sql`, then `app105-source/deploy_poreceipt_final_save_detail_sync_20260927.sql`. Export the live page afterward and compare it with `staged/f105_page_274.sql`.
