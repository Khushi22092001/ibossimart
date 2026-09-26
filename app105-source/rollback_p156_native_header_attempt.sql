whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_css clob;
  l_new_css clob;
  l_at  pls_integer;
begin
  select inline_css into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504
   for update;

  l_at := nvl(dbms_lob.instr(l_css, '/* P156_NATIVE_HEADERS_NO_RENDER_JS_V1 */'), 0);
  if l_at = 0 then
    raise_application_error(-20001, 'Native header rollback marker not found.');
  end if;

  dbms_lob.createtemporary(l_new_css, true);
  dbms_lob.copy(l_new_css, l_css, l_at - 1, 1, 1);

  update apex_260100.wwv_flow_steps
     set inline_css = l_new_css,
         last_updated_on = sysdate
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

  update apex_260100.wwv_flow_page_plugs
     set title = null,
         plug_header = null,
         plug_template = case plug_name
                           when 'Voucher Detail' then 2100526641005906379
                           else 4072358936313175081
                         end,
         region_template_options = case plug_name
           when 'Voucher' then '#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
           when 'Voucher Detail' then '#DEFAULT#'
           when 'Voucher Created Automatically' then '#DEFAULT#:t-Region--scrollBody'
         end,
         last_updated_on = sysdate
   where flow_id = 105 and page_id = 156 and security_group_id = 4744311978888504
     and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically');

  if sql%rowcount <> 3 then
    raise_application_error(-20002, 'Expected Voucher regions were not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P156_NATIVE_HEADERS_NO_RENDER_JS_V1') = 0
            then 'P156_NATIVE_HEADER_ATTEMPT_ROLLED_BACK'
            else 'P156_NATIVE_HEADER_ROLLBACK_FAILED'
       end as rollback_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
