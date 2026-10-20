# Measuring Unit form update — 2026-10-20

Deployed to IMART / ORA26PDB, workspace IMART, application 105, page 51.

- Decimal Place defaults to 0, is required, and accepts one digit from 0 through 9. The database column has a default, NOT NULL constraint, and validated check constraint. The five existing NULL values (TNO 10600, 10602, 50236, 54940972, 55007380) were set to 0.
- Shared LOV `GST_UQC` displays `UQC_CODE - DESCRIPTION` and returns `UQC_CODE`. The form uses a native Popup LOV with Fetch on Search enabled, case-insensitive contains matching, and no manual entries. Existing legacy code `KG` was preserved; it is not automatically remapped to `KGS`.
- Creator is Display Only, with submission enabled to preserve the existing form source and DML behavior, and is excluded from keyboard focus.
- Exit is sequence 95, immediately before the existing Cancel/Back button at 100. It uses the native Cancel Dialog action and does not submit the form.

`before_page51.sql` is the fresh live backup. `build.cjs` generates `page51_and_lov.sql` and a compile-only `check.sql`. `deploy.sql` applies the database rules and imports the scoped page and shared LOV. It is a one-time migration; do not rerun it after successful deployment. `after_page51_and_lov.sql` is the final live export.

## Validation

All six PL/SQL import blocks compiled before deployment. `verify.log` records 10 measuring units, no invalid decimal values, both constraints enabled and validated, and no saved `UQC_VALIDATION_TEST` record. Transactional checks rejected NULL, -1, 10, and 1.5; accepted all integers 0–9; and rolled back every test write.

Browser checks confirmed default 0, rejection of blank/nonnumeric input, automatic filtering of `kil` to `KGS - Kilograms` and `KLR - Kilolitre`, selection displaying code and description, Tab from Remark skipping Creator, Exit appearing before Back, and Exit closing an invalid/unsaved form without creating a record.

The source is based on the fresh live page rather than the older repository page export, preserving the existing save-receipt and audit-history processes. Unrelated page 901 changes were untouched.
