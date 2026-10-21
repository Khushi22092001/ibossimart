# Measuring Unit creator KPI and history fix — 2026-10-20

Deployed and verified in IMART / ORA26PDB, application 105, pages 50 and 51.

## Causes and changes

The form intentionally stores `GLOBAL_LOGINNAME` as Creator. BOSS maps to login name IMART, so `alb` (TNO 57090078) correctly contains IMART. The old Created by me predicate compared that value directly with APP_USER=BOSS. Page 50's report predicate and the shared KPI package's page-50 predicate now recognize the matching BOSSUSER username/login mapping. Other register pages retain their existing behavior.

Creation event 84799 and update event 84867 were captured as BOSS, with their original field values intact. However, the Measuring Unit audit trigger discarded its request's company context, leaving the event company NULL. The existing audit access check classified those events as technical and excluded them. Their matching audit session 12669 records company 1, which BOSS is already allowed to read.

All four page-51 history query paths now recover a missing company only from the event's matching recorded audit session, verifying the audit-session ID, application, APEX session, username, and BOSSUSERCODE. The fallback applies only to APEX_USER events for the root Measuring Unit table. Existing `can_inquire`, document access, and event `can_read` checks remain active; database/technical events do not receive this fallback. Original events and access grants were not modified.

The Measuring Unit trigger now captures the request's company on future APEX changes. Its DML actions and field capture remain unchanged.

## Verification

- Nine compilation checks passed, including the embedded Document History PL/SQL and KPI package logic. The deployed package body and trigger are VALID, with no compilation errors.
- BOSS and case/space-normalized ` boss ` each return four creator records; an unmapped identity returns zero. The actual KPI shows four and its drill-down includes alb, with four rows.
- Document History shows alb's original creation and update as BOSS. Expanding the original update shows Decimal Place 2 to 3 and GST UQC Code NOS to MTS.
- A temporary browser Remark edit and its restore generated audit events 85363 and 85874, both attributed to BOSS/company 1. alb's original name alba, Decimal Place 3, GST UQC MTS, Creator IMART, and blank Remark were verified after restoring the test edit. These two genuine verification activities remain in its history.
- Original audit field values and the company-1 access grant were verified unchanged. Existing Decimal Place constraints still have no invalid rows.

`build.cjs` regenerates the scoped page import, package/trigger scripts, restore scripts, extracted history source, and compile-only checks from the backups. `deploy.sql` applies the fix; `rollback.sql` restores the original components. `verify.sql` and `verify_browser_saves.sql` contain the database checks. `after_pages50_51.sql` is the final live page export.
