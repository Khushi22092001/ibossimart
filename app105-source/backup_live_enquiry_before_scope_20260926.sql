whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/enquiry-before-tab-scope-20260926-165531/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:708" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
