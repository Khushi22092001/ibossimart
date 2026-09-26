whenever sqlerror exit sql.sqlcode rollback
set define off
set verify off
set feedback on
set serveroutput on

connect -name IMART

prompt Compiling the Purchase Bill financial calculation engine...
@imart_purchasebill_calc.sql

declare
  l_status user_objects.status%type;
begin
  select status
    into l_status
    from user_objects
   where object_name = 'IMART_PURCHASEBILL_CALC'
     and object_type = 'PACKAGE BODY';

  if l_status <> 'VALID' then
    raise_application_error(-20001, 'IMART_PURCHASEBILL_CALC is ' || l_status);
  end if;
end;
/

prompt Importing Purchase Bill page 143 only...
@export/f105/application/pages/page_00143.sql

commit;

prompt Validating deployed Purchase Bill components...
select object_name, object_type, status
  from user_objects
 where object_name = 'IMART_PURCHASEBILL_CALC'
 order by object_type;

exit
