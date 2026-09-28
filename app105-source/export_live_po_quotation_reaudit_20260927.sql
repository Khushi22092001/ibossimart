whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/po-quotation-reaudit-before-20260927/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:118" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:710" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
