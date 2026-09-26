whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/phase2-cs-po-loading-before-20260926-172728/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:712" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:118" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:155" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
