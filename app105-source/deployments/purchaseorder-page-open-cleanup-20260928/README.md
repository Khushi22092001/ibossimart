# Purchase Order page-open cleanup — staged repair

## Scope

Page 118 currently runs a page-ready dynamic action named `delete unsaved record from detail table`. It deletes `PURCHASEORDERDETAILFOOTER`, `PURCHASEORDERDETAIL`, and `PURCHASEORDERTAC` for every orphaned Purchase Order, regardless of the document being opened.

The staged page export removes that page-ready action and scopes the separate Cancel-click cleanup to `P118_TNO`. It does not alter the Purchase Order form process, detail grid, calculation rules, final-save reconciliation, or historic data.

## Evidence and deployment boundary

The live audit found two detail rows and four footer rows for orphaned Purchase Order `57011729` that the current action can delete whenever Page 118 opens. Those rows require an authorised, auditable remediation decision; this page repair deliberately preserves them.

`live-before` is an exact current component export. `staged` is its page-local repair and must be reviewed and explicitly approved before import.

The staged Cancel statements compiled in a rollback-only test using non-existent transaction `-1` (`P118_CANCEL_SCOPED_CLEANUP_SQL_COMPILED`).
