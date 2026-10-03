whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page 1 renders the region's generated wrapper id, not its static id. */
update apex_260100.wwv_flow_steps
   set javascript_code_onload = replace(
         javascript_code_onload,
         '#iron-mart .imart-home-section',
         '.imart-home-shell .imart-home-section'),
       last_updated_on = sysdate
 where flow_id = 105
   and id = 1
   and security_group_id = 4744311978888504
   and dbms_lob.instr(javascript_code_onload, '#iron-mart .imart-home-section') > 0;

begin
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected one Popular Pages selector update; found ' || sql%rowcount);
  end if;
end;
/
commit;

select case when dbms_lob.instr(javascript_code_onload, '.imart-home-shell .imart-home-section') > 0
              and dbms_lob.instr(javascript_code_onload, '#iron-mart .imart-home-section') = 0
            then 'POPULAR_SELECTOR_OK'
            else 'POPULAR_SELECTOR_FAILED'
       end as popular_selector_check
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 1 and security_group_id = 4744311978888504;

exit
