whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\backups\indent-before-rate-commit-v5-20260926-161107\live-before"
apex export-components -applicationid 105 -expcomponents "PAGE:108" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
