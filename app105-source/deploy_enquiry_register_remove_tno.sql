whenever sqlerror exit failure rollback
set define off

begin
  delete from apex_260100.wwv_flow_step_items
   where id = 164197267715361148
     and flow_id = 105
     and flow_step_id = 707
     and name = 'P707_TNO';

  if sql%rowcount != 1 then
    raise_application_error(-20001, 'Expected exactly one Enquiry Register Tno item.');
  end if;

  commit;
end;
/
exit
