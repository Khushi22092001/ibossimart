whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_css clob := q'~

/* P156_AUTOMATIC_HEADER_VERTICAL_ALIGN_V1 */
html.page-156 #R803352458305679688 > .t-Region-header > .t-Region-headerItems--title {
  top: 0 !important;
  height: 50px !important;
  display: flex !important;
  align-items: center !important;
}

html.page-156 #R803352458305679688 > .t-Region-header .t-Region-title {
  margin: 0 !important;
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, to_clob('')) || l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504
     and nvl(dbms_lob.instr(inline_css, 'P156_AUTOMATIC_HEADER_VERTICAL_ALIGN_V1'), 0) = 0;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Automatic voucher header alignment CSS already exists or Page 156 was not found.');
  end if;
end;
/
commit;

select case when dbms_lob.instr(inline_css, 'P156_AUTOMATIC_HEADER_VERTICAL_ALIGN_V1') > 0
            then 'P156_AUTOMATIC_HEADER_ALIGNMENT_DEPLOYED'
            else 'P156_AUTOMATIC_HEADER_ALIGNMENT_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
