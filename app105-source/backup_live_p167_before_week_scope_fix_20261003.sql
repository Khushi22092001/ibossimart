whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/p167-week-scope-before-20261003
apex export-components -applicationid 105 -expcomponents "PAGE:167" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
