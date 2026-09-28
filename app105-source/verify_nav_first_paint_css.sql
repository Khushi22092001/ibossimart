set heading on
connect -name IMART

select case
         when dbms_lob.instr(file_content,
              utl_raw.cast_to_raw('First-paint hierarchy contract')) > 0
         then 'FIRST_PAINT_RULE_PRESENT'
         else 'FIRST_PAINT_RULE_MISSING'
       end as static_file_check
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and id = 7711000000000001;

select case
         when instr(css_file_urls,
              '#APP_FILES#hspl-nav-hierarchy-v22.css?cb=20260928navfirstpaint1') > 0
         then 'FIRST_PAINT_ASSET_ACTIVE'
         else 'FIRST_PAINT_ASSET_INACTIVE'
       end as application_check
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
