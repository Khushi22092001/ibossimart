whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_old constant varchar2(4000) :=
    '"P118_PURCHASEORDERDATE_input","P118_PARTYCODE","P118_DELIVERYDATE_input"';
  l_new constant varchar2(4000) :=
    '"P118_PURCHASEORDERDATE_input","P118_DELIVERYDATE_input","P118_PARTYCODE"';
  l_before number;
  l_after  number;
begin
  select count(*)
    into l_before
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504
     and dbms_lob.instr(javascript_code, 'HSPL_PURCHASE_ORDER_TAB_AUDIT_V1') > 0
     and dbms_lob.instr(javascript_code, l_old) > 0;

  if l_before <> 1 then
    raise_application_error(
      -20001,
      'Expected exactly one page 118 Party/Delivery Date tab-order signature; found ' || l_before);
  end if;

  update apex_260100.wwv_flow_steps
     set javascript_code = replace(javascript_code, l_old, l_new),
         last_updated_on = sysdate,
         last_updated_by = user
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504
     and dbms_lob.instr(javascript_code, 'HSPL_PURCHASE_ORDER_TAB_AUDIT_V1') > 0
     and dbms_lob.instr(javascript_code, l_old) > 0;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Page 118 tab-order update did not affect exactly one page row.');
  end if;

  select count(*)
    into l_after
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504
     and dbms_lob.instr(javascript_code, l_new) > 0
     and dbms_lob.instr(javascript_code, l_old) = 0;

  if l_after <> 1 then
    raise_application_error(-20003, 'Page 118 tab-order postcondition failed.');
  end if;

  commit;
  dbms_output.put_line('P118_TAB_ORDER_FIXED');
exception
  when others then
    rollback;
    raise;
end;
/

select case
         when dbms_lob.instr(
                javascript_code,
                '"P118_PURCHASEORDERDATE_input","P118_DELIVERYDATE_input","P118_PARTYCODE"') > 0
          and dbms_lob.instr(
                javascript_code,
                '"P118_PURCHASEORDERDATE_input","P118_PARTYCODE","P118_DELIVERYDATE_input"') = 0
         then 'P118_TAB_ORDER_OK'
         else 'P118_TAB_ORDER_FAILED'
       end as p118_tab_order_check
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 118
   and security_group_id = 4744311978888504;

exit
