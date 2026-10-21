# Module Doc Type focus and Creator correction

Deployed 21-10-2026 to IMART APEX application 105, page 75 (Module Doc Type Master).

- Initial focus uses native `apex.item('P75_MODULECODE').setFocus()` once after initialization.
- Creator uses native Display Only with plain text formatting and its existing submit value, database source and default retained.
- Other page components, processes, validations, authorization and layout remain unchanged.
- Fresh live backup: `before-pages.sql`; scoped native import: `pages.sql`; deployed export: `deployed-pages.sql`.
- `build.cjs` regenerates the patch. `deploy.sql` checks schema/container and original form/item IDs, imports page 75 with offset 0, then exports the deployed page. Run SQLcl from this directory using saved connection IMART.

Validation: successful Oracle import; browser Add New opens focused on Module Code; Creator renders as SPAN with no visible input; Tab from Remark goes directly to the detail grid toolbar; no browser console errors. No business records were created or modified during testing. Screenshot: `form-verified.png`.

Other pending repository changes are preserved.
