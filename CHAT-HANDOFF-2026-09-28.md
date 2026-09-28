# ERP APEX Correctness Audit and Purchase Order FD Repair Handoff

Date: 2026-09-28

## Objective and non-negotiable constraints

The overall objective is an application-wide correctness and regression-hardening audit of Oracle APEX transactional/master-detail forms. Purchase Quotation is the known-good behavioural reference. It may be inspected but must not be modified without explicit user authorization. Existing business logic, tax rules, workflows, permissions, navigation, layout and intended CRUD functionality must be preserved.

The main defect families are disappearing/overwritten detail rows, stale or incorrect tax/footer totals, competing client/server calculations, incorrect values being saved after AJAX or session-state failure, partial saves, create/edit divergence, stale dependent values, rounding differences, source-document balance corruption and refresh races.

The user expects every code change to be committed and pushed to the Git repository. Do not leave implementation changes only on the test server or only in the local worktree.

## Environment

- Repository: `C:\Users\shree\Documents\git projects\ibosssagar`
- Git branch: `main`
- Remote: `origin` -> `https://github.com/Khushi22092001/ibosssagar.git`
- Oracle APEX application: App 105 / Imart
- Test company used in the browser: IRONMART PRIVATE LIMITED
- Test location requested by the user: Raipur
- Purchase Order page: Page 118
- Purchase Quotation reference page: Page 710
- Purchase Order test document used for the final FD regression: TNO `56974227`
- The user supplied login credentials in the original chat. They are intentionally not copied into this repository file; request them again if the new chat cannot access the existing signed-in browser session.

## Work and artefacts already present

The worktree contains audit reports, read-only audit SQL, backups, staged/live-after APEX exports, deployment wrappers, rollback scripts and verification scripts covering Purchase Quotation reference work and multiple P2P/O2C forms. Important report files include:

- `Purchase Quotation Detail CRUD Audit - 2026-09-26.md`
- `Cross-Form Calculation and Save Integrity Audit - 2026-09-26.md`
- `Cross-Form Transaction Integrity Findings - 2026-09-27.md`
- `Extended Transaction Integrity Inventory - 2026-09-27.md`
- `Procure-to-Pay Detail Re-Audit - 2026-09-27.md`
- `O2C Transaction Integrity Findings - 2026-09-27.md`
- `app105-source/P2P Transaction Integrity Findings - 2026-09-27.md`

There are deployment/verification families for Purchase Order, PO Receipt, Bill Receipt, CC Invoice, Sales Order, Sales Enquiry, Sales Quotation, Indent, comparative statement, downstream calculations and related row-identity/final-save guards. A new chat must not assume that the entire application-wide goal is complete merely because these artefacts exist. Review each report and verification result before declaring any form complete.

## Latest Purchase Order Page 118 repair

The most recent live work focused on Purchase Order detail calculations and Footer Detail (FD) behaviour.

Primary implementation files:

- `app105-source/deployments/po-crud-repair-20260927/build-page118.js`
- `app105-source/deployments/po-crud-repair-20260927/staged/f105_page_118.sql`
- `app105-source/deploy_po_crud_repair_20260927.sql`

The builder generates the staged Page 118 export. Deployment is performed with SQLcl using the saved `IMART` connection and the wrapper above.

### Required FD behaviour preserved

- The FD modal uses the native editable Oracle APEX Interactive Grid.
- Search, Go, Actions, Reset, Edit and Add Row remain available.
- The FD UI was not replaced with a custom read-only HTML table.
- The modal opens immediately as a shell and shows an APEX loader while exact data for the clicked row loads.
- Purchase Quotation Page 710 was not modified as part of this latest Purchase Order repair.

### Root causes found and fixed

1. The native FooterDetail child grid depends on the selected master Detail row. Earlier code could resolve the clicked database row but leave the child grid bound to a stale master selection, causing every FD modal to show the first row's tax data.

2. A later implementation both notified the master-detail selection change and manually refreshed the FooterDetail region. Those two refresh paths could overlap. APEX then raised `TypeError: Cannot read properties of null (reading 'observe')`, the modal could fail to render, and switching rows could become unreliable.

3. The FooterDetail model subscription treated the temporary empty model during refresh as a real edit and wrote zero back into the parent row's `FOOTERAMOUNT`/`TOTALAMOUNT`. This temporarily reduced document totals and risked contaminating the client model.

### Final lifecycle

- Clicking FD resolves the exact grid record and validates TNO/SNO.
- An APEX spinner masks stale child-grid content.
- `P118_PREPARE_FD` prepares the clicked row's footer data.
- Parent selection is updated without moving focus.
- Only one refresh path is used: selection notification refreshes a newly selected row; an explicit refresh is used only when the clicked row was already selected.
- `state.fdLoading` suppresses FooterDetail change propagation during model refresh.
- The modal is unmasked only when the loaded child-row count and footer total match the prepared response.
- Genuine editable FooterDetail model changes still recalculate the owning parent row after loading completes.

The final code was syntax-checked, generated and deployed successfully to the test server.

## Final live regression result for Purchase Order TNO 56974227

All three FD buttons were clicked sequentially with Back navigation between them. The loader completed and each modal showed the clicked row's own values. Parent totals remained stable throughout the post-fix run.

| Row | Item | Amount | FD rows | FD total | Total amount |
|---|---|---:|---|---:|---:|
| 1 | HR COIL | 979,500.00 | CGST 9% = 88,155.00; SGST 9% = 88,155.00 | 176,310.00 | 1,155,810.00 |
| 2 | HR SHEET | 390,600.00 | CGST 9% = 35,154.00; SGST 9% = 35,154.00 | 70,308.00 | 460,908.00 |
| 3 | PM PLATE | 384,000.00 | CGST 9% = 34,560.00; SGST 9% = 34,560.00 | 69,120.00 | 453,120.00 |

Stable document totals after each switch:

- Sum of Amount: 1,754,100.00
- Sum of Footer Amount: 315,738.00
- Purchase Order Amount: 2,069,838.00

The pre-fix `null.observe` errors remain in the browser's historical console log, but no new occurrence was generated during the final post-fix three-row run.

No manual field edit or form save was performed in this final FD click test.

## Other specific user expectations to retain

- Quantity/rate/detail calculations should refresh immediately; users should not need to Tab through to the last column.
- Primary quantity must not incorrectly overwrite secondary quantity.
- FD must open quickly with a loader, show the clicked row's correct tax data and preserve editable functionality.
- CS reference + Get Item must fetch the correct items, other amounts and row-specific FD data.
- CRUD fluency should match the behavioural standard of Purchase Quotation while preserving each form's business rules.
- Testing should cover multiple rows/items and realistic variations, including the user's earlier examples Channel and Angle, vendor Aayum and Raipur location when entry testing is explicitly resumed.

## Important caution about status

Do not state that all Procure-to-Pay and Order-to-Cash forms are fully audited or defect-free unless the required create/edit/delete/save/reload/invalid-state matrices have actually been completed and documented for every form. The latest evidence conclusively verifies the three-row Purchase Order FD scenario above. The broader application-wide audit remains a continuing programme unless the reports and live verification demonstrate completion form by form.

## Recommended next steps for another chat

1. Read the original audit goal and the report files listed above.
2. Confirm the Git commit containing this handoff and the Page 118 repair is present on `origin/main`.
3. Continue Page 118 tests for immediate quantity/rate/discount recalculation, primary/secondary quantity separation, editable FooterDetail changes, save/reload parity and invalid-state rejection.
4. Test CS reference + Get Item with multiple items and verify FD ownership and totals for every imported row.
5. Continue the P2P form matrix through PO Receipt, Purchase Bill, Purchase Bill Pass and Payment Advice.
6. Continue O2C verification separately, using the existing reports and staged/verification artefacts.
7. Keep Purchase Quotation read-only unless the user explicitly authorizes a named change.
8. For every new code change: generate/verify as applicable, deploy only to the test server, commit and push to the repository, and report the commit hash.

