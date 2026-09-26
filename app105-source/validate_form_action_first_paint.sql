whenever sqlerror exit failure rollback
connect -name IMART

select file_name,
       mime_type
  from apex_application_static_files
 where application_id = 105
   and file_name = 'hspl-form-action-first-paint.css';

select case
         when dbms_lob.instr(file_content, utl_raw.cast_to_raw('t-ButtonRegion:not')) > 0
         then 'ID_AND_IDLESS_GUARD'
         else 'OLD_ID_ONLY_GUARD'
       end selector_scope,
       case
         when dbms_lob.instr(file_content, utl_raw.cast_to_raw(':is(#buttons,.t-ButtonRegion)')) > 0
         then 'HEADER_REVEAL_READY'
         else 'HEADER_REVEAL_MISSING'
       end reveal_contract
  from apex_application_static_files
 where application_id = 105
   and file_name = 'hspl-form-action-first-paint.css';

select case
         when instr(css_file_urls, '#APP_FILES#hspl-form-action-first-paint.css?cb=20260925c') = 1
         then 'FIRST'
         else 'NOT_FIRST'
       end load_position,
       case
         when instr(css_file_urls, '#APP_FILES#hspl-form-action-first-paint.css?cb=20260925b') = 0
         then 'OLD_REMOVED'
         else 'OLD_PRESENT'
       end previous_version
  from apex_260100.wwv_flows
 where id = 105;

exit
