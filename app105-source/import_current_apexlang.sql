set define off
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

apex import -debug -input "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\apexlang" -workspace IMART -id 105 -deployment "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\apexlang\deployments\default.json"

exit
