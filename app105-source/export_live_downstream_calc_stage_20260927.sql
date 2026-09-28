whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/deployments/downstream-calc-20260927-200500/staged
apex export-components -applicationid 105 -expcomponents "PAGE:69" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:118" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:140" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:143" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:146" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:152" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:155" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:171" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:175" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:190" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:191" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:274" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:710" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
