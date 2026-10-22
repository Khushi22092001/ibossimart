# Production Pass correction — 21 October 2026

Target: IMART / ORA26PDB, APEX application 105, page 197.
Deployment and browser posting completed in the user-designated test database.

## Root cause and change

The Pass dynamic action joined Module to all configured location rows and selected into scalar variables, causing ORA-01422. It also used literal strings such as ':P197_TNO' instead of saved document values, compared the database USER rather than ERP identity, and contained an unrelated Purchase Order payment-advice call.

Only Pass action 443390428449794154 was changed (PL/SQL, submitted items and returned items). It uses the saved Production row and authenticated ERP company/user context, checks existing view and location mapping, passes only assigned pending workflow stages, and calls the existing Production posting procedure when ACTIVE. The existing SendPassFailForward routine handles configured workflows. With no Production workflow configured, existing Status permission is required for direct Pass posting.

Saved raw/finished quantities and allocations must match. The existing source GRN/Purchase Bill posting prerequisite remains enforced. A savepoint rolls back partial work on errors. Already ACTIVE documents are checked for exactly one balanced voucher rather than posted again. The existing save receipt contract remains in place.

No business table, trigger or database package was modified by this Pass deployment. Earlier voucher-rounding changes are documented in ../voucher-rounding-20261021/README.md. Historical vouchers were not rewritten.

## Validation

- DBMS_SQL parse: PASS_ACTION_PARSE_OK.
- APEX page import: completed with ID offset 0.
- Re-export comparison: all 78 dynamic actions retained; semantic attributes changed only for Pass sequence 20. Item, region, process, workflow-event, action and grid-column counts are unchanged.
- Browser: created a new Production entry and posted through Pass → Pass Fail Note → OK. Status button was not used.
- Production TNO: 57092564; number IMPL/PRD/26-27/PRD/000214; final status ACTIVE.
- Voucher TNO: 57092574; exactly one voucher with four ledger lines.
- Raw and finished quantity: 0.003 each. Source stock: 57083878.
- Exact raw cost: 174.062531017369727047146401985111662531. Each paired ledger amount: 174.06.
- Total debit 348.12; total credit 348.12; difference 0.00; zero lines exceeding two decimal places.
- Finished stock quantity and full-precision valuation rate verified. Source stock cumulative usage is 0.006, including the earlier 0.003 test.
- Assertions: e2e-assertions.log; queries/results: verify-e2e.sql and e2e-verification.json.
- Evidence: production-posted.jpg, voucher-header.jpg, voucher-lines.jpg.
- The test entry is retained and clearly marked CODEX Pass verification for review.

Configured multi-stage workflow execution was compile-checked and reviewed against existing sources, but could not be exercised end to end because this company's Production workflow has no configured stages. No workflow configuration or user privileges were changed to manufacture a test.

A post-check found 74 invalid schema objects versus an earlier task's 72-object baseline. The additional objects are unrelated CCINVOICEDETAILBD and CCINVOICEDETAILBU triggers; this page-only deployment did not alter them. No claim is made that those unrelated invalids are resolved.

## Files and deployment

pass-action.sql contains the replacement action. page197.sql is the import prepared from a fresh live export; deployed-page197.sql is the post-deployment export. deploy.sql guards schema/container and the original action attributes before importing. Run from this directory with the established SQLcl saved connection IMART. Inspect the import log for errors; SQLcl can continue after a missing @ file.

before-page197.sql is the original export. rollback-page197.sql restores that page with ID offset 0; use only after checking for subsequent page changes. Both full page exports preserve existing legacy page content and should be reviewed for sensitive legacy code before any source-control commit. The reviewed source, migration driver, validation scripts and test results are included in the repository. Raw exports, session context, screenshots and diagnostics remain local.

## Source-controlled deployment preparation

Full page exports are excluded from Git because existing unrelated page code contains legacy credentials. The reviewed Pass source and guarded deploy.sql are tracked. Before a new deployment:

1. Run export-page.sql in this directory through the established SQLcl connection. It creates local page-before.json.
2. Extract its results[0].items[0].contents as a local UTF-8 SQL file (for example before-page197.sql).
3. Run node prepare-page.cjs before-page197.sql. This generates page197.sql and rollback-page197.sql locally while changing only the Pass action and ID offset.
4. Review the generated diff, run validate.sql, then run deploy.sql from this directory. Its original-action guard intentionally rejects drift and already-applied deployments.
5. Run verify-deployment.sql and verify-e2e.sql as appropriate. The latter asserts the retained, marked test record; it does not create or post a new entry.

Do not add the generated full-page exports or raw JSON to Git. Deployment is already applied in the test database; these steps document reproducibility, not a request to rerun it.
