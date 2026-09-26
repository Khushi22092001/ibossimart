whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_css       clob;
  l_js        clob;
  l_css_at    pls_integer;
  l_css_next  pls_integer;
  l_js_at     pls_integer;
  l_native_css clob := q'~

/* P156_NATIVE_HEADERS_NO_RENDER_JS_V1 */
html.page-156 #R841841470566831271,
html.page-156 #VOUCHERDETAIL,
html.page-156 #R803352458305679688 {
  width: 100% !important;
  max-width: none !important;
  margin-bottom: 16px !important;
  background: #fff !important;
  border: 1px solid #dfe5ef !important;
  border-radius: 14px !important;
  overflow: hidden;
}
html.page-156 #R841841470566831271 > .t-Region-header,
html.page-156 #VOUCHERDETAIL > .t-Region-header,
html.page-156 #R803352458305679688 > .t-Region-header {
  display: flex !important;
  align-items: center !important;
  min-height: 50px !important;
  padding: 0 18px !important;
  background: #fff !important;
  color: #151b2b !important;
  border: 0 !important;
  border-bottom: 1px solid #e5eaf3 !important;
  box-shadow: none !important;
}
html.page-156 #R841841470566831271 .t-Region-title,
html.page-156 #VOUCHERDETAIL .t-Region-title,
html.page-156 #R803352458305679688 .t-Region-title {
  margin: 0 !important;
  padding: 0 !important;
  color: #151b2b !important;
  font-size: 18px !important;
  font-weight: 700 !important;
  line-height: 1.2 !important;
}
~';
begin
  select inline_css, javascript_code
    into l_css, l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504
   for update;

  l_css_at := nvl(dbms_lob.instr(l_css, '/* P156_STANDARD_SECTION_HEADERS_V1 */'), 0);
  l_css_next := nvl(dbms_lob.instr(l_css, '/* P156_FULL_WIDTH_OUTER_ROWS_V3 */', l_css_at + 1), 0);
  l_js_at := nvl(dbms_lob.instr(l_js, '/* P156_STANDARD_SECTION_HEADERS_V1 */'), 0);

  if l_css_at = 0 or l_css_next = 0 or l_js_at = 0 then
    raise_application_error(-20001, 'Expected custom Voucher render-time header code was not found.');
  end if;

  l_css := to_clob(dbms_lob.substr(l_css, l_css_at - 1, 1)) ||
           to_clob(dbms_lob.substr(l_css, dbms_lob.getlength(l_css) - l_css_next + 1, l_css_next)) ||
           l_native_css;
  l_js := to_clob(dbms_lob.substr(l_js, l_js_at - 1, 1));

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         javascript_code = l_js,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504;

  update apex_260100.wwv_flow_page_plugs
     set title = plug_name,
         plug_header = 'Y',
         plug_template = case when plug_name = 'Voucher Detail'
                              then 4072358936313175081
                              else plug_template end,
         region_template_options = replace(region_template_options, 't-Region--removeHeader', ''),
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 156
     and security_group_id = 4744311978888504
     and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically');

  if sql%rowcount <> 3 then
    raise_application_error(-20002, 'Expected three Voucher regions were not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(javascript_code, 'P156_STANDARD_SECTION_HEADERS_V1') = 0
                  and dbms_lob.instr(inline_css, 'P156_STANDARD_SECTION_HEADERS_V1') = 0
                  and dbms_lob.instr(inline_css, 'P156_NATIVE_HEADERS_NO_RENDER_JS_V1') > 0
            then 'P156_NATIVE_HEADERS_DEPLOYED'
            else 'P156_NATIVE_HEADERS_CHECK_FAILED'
       end as deployment_status,
       dbms_lob.getlength(javascript_code) as javascript_bytes
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
