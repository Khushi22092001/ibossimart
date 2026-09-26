# Internal TNO/SNO visibility fix — 26 Sep 2026

## Cause

`TNO` and `SNO` are internal transaction/row keys. On Purchase Quotation several Interactive Grid column definitions used visible Number Field metadata and depended only on the default saved report to hide them. A report reset, saved user layout, or regenerated report could therefore expose the columns.

## Fix

- Page 710: all eight TNO/SNO columns across Quotation Detail, Detail Quality, Detail Footer, and Terms and Condition are real `NATIVE_HIDDEN` columns and excluded from export.
- Global Page 0: `HSPL_HIDE_INTERNAL_IG_KEYS_V1` hides TNO/SNO from every Interactive Grid view after initialization, report changes, and refreshes. It does not remove the fields from the model, so existing DML and Dynamic Actions can still use the keys.
- Page 710 calculation AJAX: single-row item/UOM and HSN lookups were changed to aggregate lookups so an incomplete/fast-entered row returns null instead of raising ORA-01403. Calculation formulas were not changed.

## Backup and rollback

Fresh pre-change live exports are in:

`app105-source/backups/internal-keys-guard-before-20260926-181342/live-before/`

Rollback entry point:

`app105-source/rollback_internal_keys_guard_20260926.sql`
