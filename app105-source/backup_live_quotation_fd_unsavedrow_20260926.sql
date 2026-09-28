whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/quotation-fd-unsavedrow-before-20260926-210609/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:710" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
