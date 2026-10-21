# Module Location form and list correction

Deployed to IMART application 105, pages 76 (Module Location List) and 77 (Module Location Master), on 21-10-2026.

## Changes

- Page 77 explicitly focuses `P77_MODULECODE` after APEX initialization using the native item `setFocus()` API. It runs once when the form opens and does not interfere with later keyboard navigation.
- `P77_CREATOR` uses native Display Only, plain escaped text, with its existing value submitted for form persistence. Creator is no longer an editable or keyboard-focusable text control. Its existing default and database source are preserved.
- Page 76 no longer replaces repeated module/location names with NULL using `ROW_NUMBER`. Each row retains both values, so filtering and sorting remain meaningful.
- Named locations appear first. Missing Location master references display the saved location code followed by `(location unavailable)`. A module without a detail location displays `No location assigned`.
- The existing company predicate, KPI wrapper, links, component IDs, processes, validations, authorization and UI templates are preserved.

## Verified data limitation

The current company 1 mappings contain 773 rows: 292 match a Location master name and 481 reference missing location codes. The Location master currently contains only RC / RAIPUR and MD / MOUDA. Unmatched saved codes are HO, NAGPUR, RM, RP and RS. No names were invented, no mappings were deleted, and no business data was changed. Resolving those references requires a separately reviewed business-data decision.

## Validation

- Imported scoped native page exports successfully and exported the deployed definitions to `deployed-pages.sql`.
- Parsed the complete live page 76 region query using Oracle DBMS_SQL successfully.
- Confirmed native Creator display type is Display Only.
- Reconciled 773 list source rows and confirmed zero blank location display values.
- Browser: reproduced original Remark focus; after deployment, Add New opened focused on Module Code twice.
- Browser: pressing Tab from Remark moved directly to the detail grid toolbar, skipping Creator.
- Browser: existing Account Ledger record opened successfully with its Module Code populated.
- Browser: named locations and unmatched-code labels rendered correctly; console error list was empty.
- No business records were created, edited or deleted during testing.

Evidence: `form-verified.png`, `list-verified.png`, `validation.log`, `mapping-details.log`.

## Deployment artifacts

`before-pages.sql` is the fresh live backup. `build.cjs` generates `pages.sql` from that backup and uses offset 0 to retain verified component IDs. `deploy.sql` checks schema, container and the three target region IDs, imports pages 76/77, then captures a fresh deployed export. Run through the established SQLcl saved connection IMART. No credentials are included.

The first import attempt rejected a first-item metadata value and rolled back. The successful final import uses the supported native JavaScript item focus API instead.

Prior Activity Monitoring date-format changes in the repository were left untouched. This directory contains the reviewed Module Location deployment artifacts.
