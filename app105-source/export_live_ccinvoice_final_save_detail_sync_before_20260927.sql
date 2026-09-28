connect -name IMART
cd app105-source/deployments/ccinvoice-final-save-detail-sync-20260927/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:175" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
