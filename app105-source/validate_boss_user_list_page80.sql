whenever sqlerror exit failure rollback
connect -name IMART

select page_id, page_name, instr(inline_css, 'html.page-80 #t_Body_title') as hero_hidden_rule
  from apex_application_pages
 where application_id = 105
   and page_id = 80;

exit
