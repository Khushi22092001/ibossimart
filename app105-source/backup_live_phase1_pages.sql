whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/p2p-phase1-indent-enquiry-quotation-before-20260926-133354/live-before
apex export-components -applicationid 105 -expcomponents "PAGE:108 PAGE:708 PAGE:710" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
