# Page 167 Material Out Register — default week/KPI scope verification

Verified on 2026-10-03 in Chrome against the live Oracle APEX application.

## Live result

- Fresh register navigation now initializes `P167_FROMDATE` to `27-09-2026`.
- Fresh register navigation now initializes `P167_TODATE` to `03-10-2026`.
- The old cached financial-year range is no longer reused on an ordinary page visit.
- All KPI cards use the same page date scope as the register.
- For the verified week, `Total records`, `ACTIVE`, `NON ACTIVE`, and `INVOICE NOT CREATED` each showed `0`.
- With `Total records` selected, the register showed `No records to display`; the KPI and report therefore matched at `0`.
- Clicking Apply preserved the selected dates (`27-09-2026` through `03-10-2026`) and the matching result state.

## Preserved behavior

- An explicit `P167_MONO` context still initializes the financial-year range.
- A filter Apply request (`REFRESH`) does not overwrite the user's selected dates.
- No global CSS or JavaScript was changed.

## Deployment safety

- Pre-change page export: `app105-source/backups/p167-week-scope-before-20261003/f105_page_167.sql`
- Deployment script: `app105-source/deploy_fix_p167_default_week_kpi_scope_20261003.sql`
- Audit script: `app105-source/audit_p167_default_week_scope_20261003.sql`
