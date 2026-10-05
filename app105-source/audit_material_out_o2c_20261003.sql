whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 500
set linesize 320
set long 1000000
set longchunksize 1000000
connect -name IMART

prompt === Existing KPI configuration for Material Out and O2C ===
select c.page_id,p.name page_name,c.region_id,c.state,
       case when c.status_expression is not null then 'YES' else 'NO' end has_status,
       case when c.process_expression is not null then 'YES' else 'NO' end has_process,
       c.scope_note
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps p on p.flow_id=105 and p.id=c.page_id
 where c.page_id in(154,160,167,170,174,190,273,701,704)
 order by c.page_id;

select s.region_id,s.status_code,s.display_order,s.card_mode
  from imart_rkpi_status_catalog s
 where s.region_id in(select region_id from imart_rkpi_config where page_id=167)
 order by s.display_order,s.status_code;

prompt === Material Out base table columns ===
select table_name,column_id,column_name,data_type,data_length
  from user_tab_columns
 where table_name in('MATERIALOUT','MATERIALOUTDETAIL','GATEOUTREGISTER_VIEW')
 order by table_name,column_id;

prompt === Candidate downstream foreign-key-style columns in application schema ===
select table_name,column_name,data_type
  from user_tab_columns
 where column_name in('MATERIALOUTTNO','MATERIALOUTDETAILTNO','REFERENCETNO','DESPATCHADVICETNO','DESPATCHTNO')
 order by table_name,column_name;

prompt === Stored source references to Material Out linkage ===
select owner,name,type,line,substr(text,1,260) text
  from all_source
 where owner=user
   and (upper(text) like '%MATERIALOUTTNO%'
        or upper(text) like '%MATERIALOUTDETAILTNO%'
        or upper(text) like '%MATERIALOUT%REFERENCE%'
        or upper(text) like '%REFERENCE%MATERIALOUT%')
 order by name,type,line;

prompt === Material Out sample linkage values and document status ===
select * from (
  select m.tno,m.materialoutno,m.materialoutdate,m.referencetno,m.modulecode,m.moduletno,
         getdocumentstatuscode('MATERIALOUT',m.tno) doc_status
    from materialout m
   order by m.tno desc
) where rownum<=30;

prompt === Material Out -> candidate downstream counts ===
select count(*) material_out_total,
       sum(case when getdocumentstatuscode('MATERIALOUT',m.tno)='ACTIVE' then 1 else 0 end) active_count,
       sum(case when getdocumentstatuscode('MATERIALOUT',m.tno)<>'ACTIVE' or getdocumentstatuscode('MATERIALOUT',m.tno) is null then 1 else 0 end) non_active_count
  from materialout m;

prompt === APEX references on Material Out form page 168 ===
select component_type,component_name,substr(component_value,1,1000) component_value
  from (
    select 'BRANCH' component_type,b.branch_name component_name,
           to_clob(b.branch_action)||' '||to_clob(b.branch_action_text) component_value
      from apex_260100.wwv_flow_step_branches b
     where b.flow_id=105 and b.flow_step_id=168
    union all
    select 'BUTTON',btn.button_name,to_clob(btn.button_redirect_url)
      from apex_260100.wwv_flow_step_buttons btn
     where btn.flow_id=105 and btn.flow_step_id=168
    union all
    select 'PROCESS',pr.process_name,to_clob(pr.process_sql_clob)
      from apex_260100.wwv_flow_step_processing pr
     where pr.flow_id=105 and pr.flow_step_id=168
    union all
    select 'DA_ACTION',da.action_name,to_clob(da.attribute_01)||' '||to_clob(da.attribute_02)||' '||to_clob(da.attribute_03)
      from apex_260100.wwv_flow_page_da_acts da
      join apex_260100.wwv_flow_page_da_events de on de.id=da.event_id
     where de.flow_id=105 and de.page_id=168
  )
 where upper(component_value) like '%MATERIALOUT%'
    or upper(component_value) like '%WEIGH%'
    or upper(component_value) like '%CCINVOICE%'
    or upper(component_value) like '%GATE%'
 order by component_type,component_name;

exit
