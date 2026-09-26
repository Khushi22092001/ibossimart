set define off
set heading on
connect -name IMART
begin
  apex_util.set_security_group_id(4744311978888504);
end;
/
select apex_util.get_preference(
         p_preference => 'IMART_SIDEBAR_STATE',
         p_user       => 'BOSS') as sidebar_state
  from dual;
exit
