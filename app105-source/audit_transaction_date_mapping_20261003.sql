set define off
set sqlformat csv
connect -name IMART
spool app105-source/verification/transaction-date-mapping-20261003.csv
select modulecode,modulename,moduletype,moduletypecode,transactiondatecolumn,mastertablename,pageno,entrypageno from module where isactive='YES' order by modulecode;
spool off
exit
