# Interactive document-status cards — App 105

Deployed 2026-10-01. Supersedes the initial data-quality cards described in INLINE_KPI_VERIFICATION.md.

- Total and actual document lifecycle statuses are buttons. Selecting a status filters the server-side register source; Total removes only this additional status filter. Existing interactive report search and saved-report settings remain additional filters.
- Counts are distinct master identities, not joined specification/detail rows. Item Preparing therefore counts one item while the register displays its 55 specification rows. Counts are based on current page filters; text search/saved-report filters are not included in the displayed counts and this limitation is stated in the panel.
- Item uses its existing GETDOCUMENTSTATUSCODE result. Other registers with TNO use the same DocumentStatusDetail mapping that the existing function reads. Unrelated MaritalStatus, PartyStatus, VendorStatusCode and permission fields are not document lifecycle status. Missing mappings appear as No status rather than being guessed as Active. Only statuses present in the current scope are shown. The non-TNO Code Scheme Master register exposes Total only.
- Selection is isolated in a per-register APEX session collection. No business record or document status is updated. Close hides the panel; selection remains until another status or Total is chosen.
- Open cards reload when the associated report refreshes. No KPI payload request runs on initial page load. Initialization is registered once at DOM readiness, without timers/delays.
- The existing application changes IR DOM IDs. Refresh is resolved from the actual KPI opener's enclosing js-apex-region rather than assuming the metadata ID.

## Verification

All 70 live register sources passed Total and first-status count consistency checks, using the actual filter wrapper and restoring test selections to Total: status_filter_verification.txt.

Chrome checks in 13 registers: Account Master, Department, Bank, City, Item Category, Employee, Measuring Unit, Location, Item Group, HSN, Storage Location, Vendor and Item Master. Status clicks, Total reset and Close were exercised. Item Preparing filtered to only Preparing rows; Total restored 1,380 specification rows. Account Prepared filtered to one master. Close returns panel height to zero.

Proof: status-kpi-chrome-proof.jpg. Current live Chrome view is restored to Item Total.

## Deployment and recovery

New affected-source backup: IMART_MR_STATUS_BACKUP (includes the 70 original report sources and KPI panel sources). Earlier full application export remains available.

Final sources: register_status_package.sql and register_kpis.js. Fresh status migration: deploy_status_kpis.sql, then build_status_kpi_update.ps1 to generate update_status_kpis.sql, then run the generated script. deploy_status_kpis.sql is not idempotent. The generated update script is repeatable against the migration backup; do not overwrite intervening user changes blindly. Earlier register_kpis_package.sql describes the superseded data-quality implementation and must not be recompiled over the live status package.
