connect -name IMART
set sqlformat csv
set pagesize 50000
spool app105-source/verification/creator-column-scope-20261003.csv
select 'IR' kind,c.page_id,s.name page_name,c.id,c.worksheet_id region_key,c.db_column_name column_name,c.report_label heading,c.display_order sequence,c.display_in_default_rpt visible
from apex_260100.wwv_flow_worksheet_columns c join apex_260100.wwv_flow_steps s on s.flow_id=c.flow_id and s.id=c.page_id
where c.flow_id=105 and c.page_id<800 and regexp_like(s.name,'register|list|master|report','i') and not regexp_like(s.name,'dashboard|analytics|insights|360|command|control tower|prototype|testing','i')
and not exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=c.flow_id and p.page_id=c.page_id and p.plug_source_type='NATIVE_FORM')
and regexp_like(c.db_column_name||' '||c.report_label,'creator|created.?by|creation.?time|creation.?date|created.?on|created.?at','i')
union all
select 'IG',c.page_id,s.name,c.id,c.region_id,c.name,c.heading,c.display_sequence,c.is_visible
from apex_260100.wwv_flow_region_columns c join apex_260100.wwv_flow_steps s on s.flow_id=c.flow_id and s.id=c.page_id
where c.flow_id=105 and c.page_id<800 and regexp_like(s.name,'register|list|master|report','i') and not regexp_like(s.name,'dashboard|analytics|insights|360|command|control tower|prototype|testing','i')
and not exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=c.flow_id and p.page_id=c.page_id and p.plug_source_type='NATIVE_FORM')
and regexp_like(c.name||' '||c.heading,'creator|created.?by|creation.?time|creation.?date|created.?on|created.?at','i')
order by 2,1,8;
spool off
select table_name,column_name from all_tab_columns where owner='APEX_260100' and (table_name='WWV_FLOW_REPORT_COLUMNS' or table_name='WWV_FLOW_WORKSHEETS' or table_name='WWV_FLOW_IG_REPORT_VIEWS') order by table_name,column_id;
exit
