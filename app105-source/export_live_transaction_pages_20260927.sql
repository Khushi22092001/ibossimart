whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/verification/live-transaction-pages-20260927
apex export-components -applicationid 105 -expcomponents "PAGE:140" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:146" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:148" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:171" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:175" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:190" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:191" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:274" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:702" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:705" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:706" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
apex export-components -applicationid 105 -expcomponents "PAGE:712" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
