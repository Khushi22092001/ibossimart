# Sales Order detail identity guard — 2026-09-27

## Defect

`SALESORDERDETAIL` has no unique `(TNO,SNO)` constraint, although its footer table is unique by that pair. The live data contains 386 duplicate Sales Order detail identities. A shared footer can therefore be associated with multiple different detail lines.

## Prevention deployed

`SALESORDERDETAIL_BIU_IDENTITY_GUARD` is an `INSERT OR UPDATE OF TNO,SNO` compound trigger that:

- rejects null line identities;
- serializes identity allocation against an existing document header when one exists;
- validates the complete SQL statement after its rows are visible, avoiding a row-trigger mutating-table query;
- rejects a newly introduced duplicate with a clear `-20031` error;
- permits ordinary updates to legacy duplicate rows when their identity is unchanged; and
- permits receipt-driven detail prefilling before the new header is persisted.

It has no commits and does not rewrite historical data.

## Evidence

- Before deployment, `SALESORDERDETAIL` had no trigger (`live-before/trigger-inventory.txt`).
- The trigger compiled with no errors and is enabled.
- `verify_salesorder_detail_identity_guard_20260927.sql` passed inside rollback-only transactions:
  - `UNCHANGED_IDENTITY_ALLOWED`
  - `DUPLICATE_IDENTITY_REJECTED`

The historical repair classification is read-only: `audit_salesorder_duplicate_repair_candidates_readonly_20260927.sql`.
