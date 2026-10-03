whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/all_active_modules.csv
select mg.modulegroupname,
       mg.serialno module_group_order,
       m.serialno module_order,
       m.modulecode,
       m.modulename,
       m.formname,
       m.moduletype,
       m.moduletypecode,
       m.mastertablename,
       m.detailtablename,
       m.labelcolumnname,
       m.pageno register_page,
       rs.name register_page_name,
       rs.alias register_page_alias,
       m.entrypageno form_page,
       fs.name form_page_name,
       fs.alias form_page_alias,
       m.isactive
  from module m
  left join modulegroup mg
    on mg.modulegroupcode = m.modulegroupcode
  left join apex_260100.wwv_flow_steps rs
    on rs.flow_id = 105
   and regexp_like(m.pageno, '^\d+$')
   and rs.id = to_number(m.pageno)
  left join apex_260100.wwv_flow_steps fs
    on fs.flow_id = 105
   and regexp_like(m.entrypageno, '^\d+$')
   and fs.id = to_number(m.entrypageno)
 where m.isactive = 'YES'
 order by mg.serialno, m.serialno, m.modulecode;
spool off

spool app105-source/master-insights-plan/apex_native_form_pages.csv
select s.id page_id,
       s.name page_name,
       s.alias page_alias,
       s.page_mode,
       p.id region_id,
       p.plug_name region_name,
       p.static_id region_static_id,
       p.plug_source_type,
       p.query_owner,
       p.query_table,
       dbms_lob.substr(p.plug_source, 3900, 1) region_source,
       p.attribute_01,
       p.attribute_02,
       p.attribute_03,
       p.attribute_04,
       p.attribute_05,
       p.attribute_06,
       p.attribute_07,
       p.attribute_08,
       p.attribute_09,
       p.attribute_10
  from apex_260100.wwv_flow_steps s
  join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = s.flow_id
   and p.page_id = s.id
 where s.flow_id = 105
   and p.plug_source_type = 'NATIVE_FORM'
 order by s.id, p.plug_display_sequence, p.id;
spool off

spool app105-source/master-insights-plan/apex_form_dml_processes.csv
select s.id page_id,
       s.name page_name,
       s.alias page_alias,
       pr.id process_id,
       pr.process_sequence,
       pr.process_point,
       pr.process_type,
       pr.process_name,
       pr.region_id,
       pr.return_key_into_item1,
       pr.return_key_into_item2,
       pr.item_name,
       dbms_lob.substr(pr.process_sql_clob, 3900, 1) process_source,
       pr.attribute_01,
       pr.attribute_02,
       pr.attribute_03,
       pr.attribute_04,
       pr.attribute_05,
       pr.attribute_06,
       pr.attribute_07,
       pr.attribute_08,
       pr.attribute_09,
       pr.attribute_10,
       pr.attribute_11,
       pr.attribute_12,
       pr.attribute_13,
       pr.attribute_14,
       pr.attribute_15
  from apex_260100.wwv_flow_steps s
  join apex_260100.wwv_flow_step_processing pr
    on pr.flow_id = s.flow_id
   and pr.flow_step_id = s.id
 where s.flow_id = 105
   and (pr.process_type like '%FORM%'
        or pr.process_type like '%DML%'
        or upper(pr.process_name) like '%FORM%'
        or upper(pr.process_name) like '%DML%')
 order by s.id, pr.process_sequence, pr.id;
spool off

spool app105-source/master-insights-plan/apex_primary_key_items.csv
select s.id page_id,
       s.name page_name,
       s.alias page_alias,
       i.name item_name,
       i.prompt,
       i.source,
       i.source_type,
       i.data_type,
       i.source_data_type,
       i.is_primary_key,
       i.is_query_only,
       i.item_source_plug_id,
       i.display_as
  from apex_260100.wwv_flow_steps s
  join apex_260100.wwv_flow_step_items i
    on i.flow_id = s.flow_id
   and i.flow_step_id = s.id
 where s.flow_id = 105
   and (i.is_primary_key = 'Y'
        or regexp_like(i.name, '_(TNO|SNO|ID|CODE|CODEID)$', 'i'))
 order by s.id, case when i.is_primary_key = 'Y' then 0 else 1 end, i.item_sequence, i.name;
spool off

spool app105-source/master-insights-plan/apex_metadata_object_names.csv
select object_type, object_name
  from all_objects
 where owner = 'APEX_260100'
   and (object_name like 'WWV_FLOW%BRANCH%'
        or object_name like 'WWV_FLOW%LINK%')
 order by object_type, object_name;
spool off

exit
