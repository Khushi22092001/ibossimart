whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set sqlformat csv
connect -name IMART
spool app105-source/verification/kpi-source-shapes-20261003.csv
select p.page_id,p.id,p.plug_name,p.query_type,p.query_table,p.query_where,p.query_order_by,dbms_lob.substr(p.plug_source,2000,1) source_start
from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id in(20,707,709,713,134,224,276,319,341,347,623,627,655,661,663,719) and p.plug_source_type='NATIVE_IR';
spool off
spool app105-source/verification/kpi-ig-editability-20261003.csv
select page_id,region_id,region_name,is_editable from apex_260100.apex_appl_page_igs where application_id=105 and page_id in(select to_number(pageno default null on conversion error) from module where isactive='YES');
spool off
exit
