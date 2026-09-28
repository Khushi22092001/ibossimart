connect -name IMART
cd app105-source/deployments/o2c-final-save-detail-sync-20260927/live-after
apex export-components -applicationid 105 -expcomponents "PAGE:148 PAGE:171 PAGE:702 PAGE:705 PAGE:706" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
