connect -name IMART
cd app105-source/deployments/o2c-rate-recalculation-20260927/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:702 PAGE:706" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
