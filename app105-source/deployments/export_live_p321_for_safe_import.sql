set define off
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

/* Export only the currently deployed Page 321 metadata. This produces a safe
   page-specific source for a round-trip import without touching other pages. */
apex export-components -applicationid 105 -expcomponents "PAGE:321" -exptype SQL -skipexportdate -exporiginalids -overwrite-files

exit
