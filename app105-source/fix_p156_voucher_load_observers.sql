whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_rows number;
begin
  update apex_260100.wwv_flow_steps
     set javascript_code = regexp_replace(
           regexp_replace(
             javascript_code,
             q'~[[:space:]]*document\.addEventListener\('click', scheduleBinding\);[[:space:]]*new MutationObserver\(scheduleBinding\)\.observe\(document\.documentElement, \{[[:space:]]*childList: true,[[:space:]]*subtree: true[[:space:]]*\}\);~',
             chr(10)
           ),
           q'~[[:space:]]*new MutationObserver\(schedule\)\.observe\(document\.documentElement, \{[[:space:]]*childList: true,[[:space:]]*subtree: true[[:space:]]*\}\);~',
           chr(10)
         ),
         last_updated_on = sysdate
   where flow_id = 105
     and id = 156
     and security_group_id = 4744311978888504
     and (dbms_lob.instr(javascript_code, 'new MutationObserver(scheduleBinding)') > 0
          or dbms_lob.instr(javascript_code, 'new MutationObserver(schedule)') > 0);

  l_rows := sql%rowcount;
  if l_rows <> 1 then
    raise_application_error(-20001, 'Expected Page 156 startup observers were not found.');
  end if;
end;
/
commit;

select case
         when dbms_lob.instr(javascript_code, 'new MutationObserver(scheduleBinding)') = 0
          and dbms_lob.instr(javascript_code, 'new MutationObserver(schedule)') = 0
         then 'P156_LOAD_OBSERVERS_REMOVED'
         else 'P156_LOAD_OBSERVERS_STILL_PRESENT'
       end as deployment_status,
       dbms_lob.getlength(javascript_code) as javascript_bytes
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;

exit
