set define off
set serveroutput on

declare
  l_css clob;
  l_js clob;
begin
  select inline_css, javascript_code
    into l_css, l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 175
     and security_group_id = 4744311978888504;
  dbms_output.put_line('CSS_NULL=' || case when l_css is null then 'Y' else 'N' end);
  dbms_output.put_line('JS_NULL=' || case when l_js is null then 'Y' else 'N' end);
  dbms_output.put_line('CSS_MARKER=' || nvl(to_char(dbms_lob.instr(l_css, 'P175_CCINVOICE_DETAIL_HORIZONTAL_SCROLL_V1')), 'NULL'));
  dbms_output.put_line('JS_MARKER=' || nvl(to_char(dbms_lob.instr(l_js, 'P175_CCINVOICE_DETAIL_HORIZONTAL_SYNC_V1')), 'NULL'));
  dbms_output.put_line('CSS_LENGTH=' || nvl(to_char(dbms_lob.getlength(l_css)), 'NULL'));
  dbms_output.put_line('JS_LENGTH=' || nvl(to_char(dbms_lob.getlength(l_js)), 'NULL'));
end;
/

exit
