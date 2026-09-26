whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Remove the early browser-layout override that caused a loading flash. */
declare
  l_css clob;
  l_js  clob;
  l_css_at pls_integer;
  l_js_at  pls_integer;
begin
  select inline_css, javascript_code
    into l_css, l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504
   for update;

  l_css_at := nvl(dbms_lob.instr(l_css, '/* P156_VERTICAL_SECTION_STACK_V2 */'), 0);
  l_js_at  := nvl(dbms_lob.instr(l_js,  '/* P156_VERTICAL_SECTION_STACK_V2 */'), 0);
  if l_css_at > 0 then l_css := dbms_lob.substr(l_css, l_css_at - 1, 1); end if;
  if l_js_at  > 0 then l_js  := dbms_lob.substr(l_js,  l_js_at - 1, 1); end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         javascript_code = l_js,
         last_updated_on = sysdate
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

  /* Native APEX grid placement: each visible section starts a fresh full row. */
  update apex_260100.wwv_flow_page_plugs
     set plug_new_grid_row = 'Y',
         plug_new_grid_column = 'Y',
         plug_display_column = null,
         plug_grid_column_span = 12,
         plug_display_sequence = case plug_name
           when 'Voucher' then 20
           when 'Voucher Detail' then 30
           when 'Voucher Created Automatically' then 40
           when 'Cost Centre' then 50
           when 'Reference' then 60
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 156
     and security_group_id = 4744311978888504
     and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically', 'Cost Centre', 'Reference');
  if sql%rowcount <> 5 then
    raise_application_error(-20001, 'Expected five Voucher regions; found ' || sql%rowcount);
  end if;
end;
/
commit;

select plug_name, plug_display_sequence, plug_new_grid_row, plug_new_grid_column,
       plug_display_column, plug_grid_column_span
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105 and page_id = 156 and security_group_id = 4744311978888504
   and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically', 'Cost Centre', 'Reference')
 order by plug_display_sequence;

select case when nvl(dbms_lob.instr(inline_css, 'P156_VERTICAL_SECTION_STACK_V2'), 0) = 0
                  and nvl(dbms_lob.instr(javascript_code, 'P156_VERTICAL_SECTION_STACK_V2'), 0) = 0
            then 'P156_LOADING_OVERRIDE_REMOVED'
            else 'P156_CLEANUP_CHECK_FAILED'
       end as loading_cleanup_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
