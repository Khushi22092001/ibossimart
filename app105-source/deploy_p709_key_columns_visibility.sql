whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

begin
  update apex_260100.wwv_flow_worksheet_columns
     set column_html_expression = case db_column_name
       when 'QUOTATIONNO' then '<div data-hspl-p709="key-column-v1" style="display:block; width:240px; white-space:normal; overflow-wrap:anywhere">#QUOTATIONNO#</div>'
       when 'ENQUIRYNO'   then '<div data-hspl-p709="key-column-v1" style="display:block; width:240px; white-space:normal; overflow-wrap:anywhere">#ENQUIRYNO#</div>'
       when 'PARTYNAME'   then '<div data-hspl-p709="key-column-v1" style="display:block; width:260px; white-space:normal; overflow-wrap:anywhere">#PARTYNAME#</div>'
     end
   where flow_id = 105
     and page_id = 709
     and db_column_name in ('QUOTATIONNO', 'ENQUIRYNO', 'PARTYNAME');
  if sql%rowcount <> 3 then raise_application_error(-20001, 'Expected to update three Quotation Register columns, updated ' || sql%rowcount); end if;
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
set linesize 240
column db_column_name format a20
column column_html_expression format a180
select db_column_name, column_html_expression
  from apex_260100.wwv_flow_worksheet_columns
 where flow_id = 105
   and page_id = 709
   and db_column_name in ('QUOTATIONNO', 'ENQUIRYNO', 'PARTYNAME')
 order by db_column_name;
exit
