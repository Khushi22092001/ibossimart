whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 1000
set linesize 300
set long 4000
set trimspool on
connect -name IMART

prompt === Relevant APEX metadata columns ===
select table_name, column_id, column_name, data_type
  from user_tab_columns
 where table_name in ('WWV_FLOW_STEPS','WWV_FLOW_PAGE_PLUGS','WWV_FLOW_STEP_BUTTONS')
   and (column_name like '%CSS%'
     or column_name like '%BUTTON%'
     or column_name like '%PLUG%'
     or column_name like '%DISPLAY%'
     or column_name in ('ID','FLOW_ID','FLOW_STEP_ID','NAME','STEP_TITLE','STEP_ALIAS','PARENT_PLUG_ID','REGION_NAME','STATIC_ID'))
 order by table_name, column_id;

prompt === READY register status expressions ===
select c.page_id,
       s.name page_name,
       c.region_id,
       c.region_label,
       case when c.status_expression is null then 'NO' else 'YES' end has_status,
       case
         when c.status_expression is null then 'NONE'
         when regexp_like(c.status_expression, 'NOT CREATED', 'i') then 'PROCESS_ONLY_OR_MIXED'
         else 'DOCUMENT_STATUS'
       end status_kind,
       dbms_lob.substr(c.status_expression, 1000, 1) status_expression
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
 where c.state = 'READY'
 order by c.page_id, c.region_id;

prompt === Buttons on READY register pages ===
select distinct c.page_id,
       s.name page_name,
       b.id button_id,
       b.button_name,
       b.button_image_alt,
       b.button_position,
       b.button_plug_id,
       p.plug_name button_region,
       p.static_id button_region_static_id,
       b.button_sequence,
       b.button_action
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
  join apex_260100.wwv_flow_step_buttons b
    on b.flow_id = 105
   and b.flow_step_id = c.page_id
  left join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = 105
   and p.page_id = c.page_id
   and p.id = b.button_plug_id
 where c.state = 'READY'
   and (regexp_like(nvl(b.button_image_alt, ' '), 'add new|create|filter', 'i')
     or regexp_like(nvl(b.button_name, ' '), 'add|create|filter', 'i'))
 order by c.page_id, b.button_sequence, b.id;

prompt === Header-like regions and KPI/report ordering ===
select distinct c.page_id,
       s.name page_name,
       p.id region_id,
       p.plug_name,
       p.static_id,
       p.plug_display_point,
       p.plug_display_sequence,
       p.parent_plug_id,
       p.region_template_options,
       p.plug_source_type,
       case
         when p.id = c.region_id then 'REPORT'
         when p.static_id = 'coverage-kpi-shell-' || c.region_id then 'KPI'
         when regexp_like(nvl(p.plug_name, ' '), 'header|hero|title', 'i') then 'HEADER_LIKE'
         else 'OTHER'
       end region_role
  from imart_rkpi_config c
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = c.page_id
  join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = 105
   and p.page_id = c.page_id
 where c.state = 'READY'
   and (p.id = c.region_id
     or p.static_id = 'coverage-kpi-shell-' || c.region_id
     or regexp_like(nvl(p.plug_name, ' '), 'header|hero|title', 'i'))
 order by c.page_id, p.plug_display_point, p.plug_display_sequence, p.id;

exit
