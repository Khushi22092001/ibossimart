whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/crossform-calc-integrity-before-20260926-224201/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:108" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:708" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:712" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:118" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:155" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:69" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:146" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:143" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:152" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:140" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
