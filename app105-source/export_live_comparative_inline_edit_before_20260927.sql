whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/comparative-inline-edit-before-20260927-200000/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:712" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
