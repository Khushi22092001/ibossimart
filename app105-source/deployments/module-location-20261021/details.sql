WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET SQLFORMAT JSON
SET PAGESIZE 0
SPOOL mapping-details.log
select c.locationcode,count(*) mappings,max(d.locationname) location_name from modulelocation a join modulelocationdetail c on c.tno=a.tno left join location d on d.locationcode=c.locationcode where a.companycode='1' group by c.locationcode order by c.locationcode;
select locationcode,locationname,companycode from location;
select column_name from all_tab_columns where table_name='APEX_APPLICATION_PAGES' and (column_name like '%FOCUS%' or column_name like '%FIRST%');
SPOOL OFF
EXIT
