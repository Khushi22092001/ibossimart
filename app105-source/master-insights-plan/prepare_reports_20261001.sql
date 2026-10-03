whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlformat csv
set pagesize 50000
set linesize 32767
set feedback off
connect -name IMART
spool app105-source/master-insights-plan/report_catalog_metadata.csv
select m.modulecode,m.modulename,m.mastertablename,m.labelcolumnname,m.pageno,m.entrypageno,m.isactive,
 c.column_name,c.data_type,c.column_id
from module m join user_tab_columns c on c.table_name=upper(m.mastertablename)
where m.entrypageno in ('4','8','13','22','25','28','30','32','34','37','40','42','44','45','47','49','51','53','55','57','59','61','65','71','73','75','77','79','81','83','85','87','89','91','93','95','97','99','102','106','110','120','124','128','136','173','177','204','206','211','225','248','264','266','287','308','326','332','340','342','350','367','369','371','373','602','604','608','610','612','616','624','628','649','654','656','662','664','668','675','679','716','718','720')
order by m.modulecode,c.column_id;
spool off
spool app105-source/master-insights-plan/report_permissions_metadata.txt
select id,name,required_role from apex_260100.wwv_flow_steps where flow_id=105 and id in (49,59,825,901,935,936);
select id,list_id,parent_list_item_id,list_item_link_text,list_item_link_target,security_scheme,list_item_disp_cond_type,list_item_disp_condition from apex_260100.wwv_flow_list_items where flow_id=105 and list_id=441488469590062652;
spool off
apex export -applicationid 105 -exptype SQL -dir app105-source/backups/master-reports-before-20261001
exit
