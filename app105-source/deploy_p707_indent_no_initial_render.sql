whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_expression constant varchar2(32767) := '<div data-hspl-p707="indent-no-v1" style="display:block; width:170px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis" title="#INDENTNO#">#INDENTNO#</div>';
begin
  update apex_260100.wwv_flow_worksheet_columns
     set column_html_expression = l_expression
   where flow_id = 105
     and page_id = 707
     and db_column_name = 'INDENTNO'
     and nvl(column_html_expression, ' ') not like '%data-hspl-p707="indent-no-v1"%';
  if sql%rowcount > 1 then raise_application_error(-20001, 'More than one Enquiry Register column was updated'); end if;
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

set pagesize 100
set linesize 220
column column_html_expression format a180
select column_html_expression
  from apex_260100.wwv_flow_worksheet_columns
 where flow_id = 105
   and page_id = 707
   and db_column_name = 'INDENTNO';
exit
