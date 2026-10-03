whenever sqlerror exit sql.sqlcode rollback
cd C:/Users/shree/Documents/git projects/ibosssagar/app105-source/backups/p152-compact-v1-before-20261003-1245
apex export-components -applicationid 105 -expcomponents "PAGE:152" -exptype APPLICATION_SOURCE -skipexportdate -overwrite-files
exit
