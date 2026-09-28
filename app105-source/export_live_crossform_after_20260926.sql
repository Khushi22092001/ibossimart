whenever sqlerror exit sql.sqlcode
set define off

cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/deployments/crossform-calc-integrity-20260926/live-after

apex export-components -applicationid 105 -expcomponents "PAGE:108" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:118" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:140" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:143" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:146" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:152" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:155" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:69" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files

exit
