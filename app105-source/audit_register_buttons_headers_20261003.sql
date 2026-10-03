whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 2000
set linesize 500
set long 4000
set trimspool on
connect -name IMART

prompt === Raw metadata columns ===
select table_name, column_id, column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name in ('WWV_FLOW_STEPS','WWV_FLOW_PAGE_PLUGS','WWV_FLOW_STEP_BUTTONS')
   and (column_name like '%CSS%'
     or column_name like '%BUTTON%'
     or column_name like '%PLUG%'
     or column_name like '%DISPLAY%'
     or column_name in ('ID','FLOW_ID','FLOW_STEP_ID','NAME','STEP_TITLE','STEP_ALIAS','PARENT_PLUG_ID','STATIC_ID'))
 order by table_name, column_id;

prompt === Procurement register buttons ===
select b.flow_step_id page_id,
       s.name page_name,
       b.id button_id,
       b.button_name,
       b.button_image_alt,
       b.button_position,
       b.button_plug_id,
       p.plug_name button_region,
       p.static_id button_region_static_id,
       b.button_sequence,
       b.button_action,
       dbms_lob.substr(b.button_redirect_url, 1000, 1) redirect_url
  from apex_260100.wwv_flow_step_buttons b
  join apex_260100.wwv_flow_steps s
    on s.flow_id = b.flow_id
   and s.id = b.flow_step_id
  left join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = b.flow_id
   and p.page_id = b.flow_step_id
   and p.id = b.button_plug_id
 where b.flow_id = 105
   and b.flow_step_id in (68,107,117,139,142,145,147,151,154,707,709,711,713)
 order by b.flow_step_id, b.button_sequence, b.id;

prompt === Procurement register regions ===
select p.page_id,
       s.name page_name,
       p.id region_id,
       p.plug_name,
       p.static_id,
       p.plug_display_point,
       p.plug_display_sequence,
       p.parent_plug_id,
       p.region_template_options,
       p.plug_source_type
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s
    on s.flow_id = p.flow_id
   and s.id = p.page_id
 where p.flow_id = 105
   and p.page_id in (68,107,117,139,142,145,147,151,154,707,709,711,713)
 order by p.page_id, p.plug_display_point, p.plug_display_sequence, p.id;

exit
