whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

apex import -debug -input "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\apexlang-live-20260914\infomartics123125126125126101100" -workspace IMART -id 105 -deployment "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\apexlang-live-20260914\infomartics123125126125126101100\deployments\default.json"

exit
