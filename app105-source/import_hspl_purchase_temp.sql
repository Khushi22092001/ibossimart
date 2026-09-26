whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
apex import -input "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-temp-app" -workspace IMART -id 1900 -schema IMART -name "HSPL Purchase Source Temporary" -alias HSPL-PURCHASE-SOURCE-TEMP
exit
