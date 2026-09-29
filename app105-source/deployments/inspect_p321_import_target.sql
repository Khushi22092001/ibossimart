set define off
set serveroutput on
connect -name IMART

select application_id, page_id, page_name, last_updated_by, last_updated_on
  from apex_260100.apex_application_pages
 where application_id in (100, 105)
   and page_id = 321
 order by application_id;

select flow_id, id as page_id,
       case when dbms_lob.instr(inline_css, 'P321_HIDE_REDUNDANT_DETAIL_FOOTER_BACK_V1') > 0
            then 'MARKER_PRESENT' else 'MARKER_ABSENT' end as css_marker
       ,case when dbms_lob.instr(inline_css, 'html.page-321 #back') > 0
             then 'STABLE_SELECTOR_PRESENT' else 'STABLE_SELECTOR_ABSENT' end as back_selector
  from apex_260100.wwv_flow_steps
 where flow_id in (100, 105)
   and id = 321
 order by flow_id;

exit
