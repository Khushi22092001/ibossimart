# Purchase Enquiry unordered-indent picker

- Removed the extra `All Unordered Indents` checkbox.
- Renamed the existing action to `Filter Indents by Date`.
- Added `Show All Unordered Indents` as a separate action.
- The new action ignores From/To Date but preserves the existing company, enquiry-date ceiling, Active status, location, and pending-quantity eligibility rules.
- Results use the existing selectable indent grid, including multi-select and the existing Get Item workflow.
- Enquiry Number remains outside the Tab sequence.

Backup: `../../backups/enquiry-before-indent-picker-20260926-180210/live-before/f105_page_708.sql`

Rollback: `../../rollback_enquiry_indent_picker_20260926.sql`
