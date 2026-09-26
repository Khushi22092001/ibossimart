set pages 100
set lines 200
select s.id,
       dbms_lob.instr(s.inline_css, 'imart-home-shell') as css_found,
       p.static_id,
       p.region_css_classes,
       dbms_lob.instr(p.plug_source, 'Make every movement') as markup_found
  from apex_260100.wwv_flow_steps s
  join apex_260100.wwv_flow_page_plugs p
    on p.flow_id = s.flow_id and p.page_id = s.id
 where s.flow_id = 105
   and s.id = 1
   and p.static_id = 'iron-mart';

select table_name
  from all_tables
 where owner = 'APEX_260100'
   and table_name like '%FLOW%FILE%'
 order by table_name;
exit
