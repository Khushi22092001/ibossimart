whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/*
  Start GET_POPULAR_PAGES at DOMContentLoaded instead of APEX's late page-onload
  queue. The initializer already waits for DOMContentLoaded when needed.
*/
declare
  l_onload       clob;
  l_early        clob;
  l_popular      clob;
  l_remainder    clob;
  l_start        pls_integer;
  l_end          pls_integer;
begin
  select javascript_code_onload, javascript_code
    into l_onload, l_early
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504
   for update;

  l_start := dbms_lob.instr(l_onload, '/* Home: user-specific popular pages sourced from APEX activity history. */');
  l_end := dbms_lob.instr(l_onload, '/* Home: full inbound workflow launcher with server-side rights checks. */', l_start);
  if l_start = 0 or l_end = 0 then
    raise_application_error(-20001, 'Popular Pages onload initializer boundaries were not found.');
  end if;

  l_popular := dbms_lob.substr(l_onload, l_end - l_start, l_start);
  dbms_lob.createtemporary(l_remainder, true);
  dbms_lob.copy(l_remainder, l_onload, l_start - 1, 1, 1);
  dbms_lob.copy(l_remainder,
                l_onload,
                dbms_lob.getlength(l_remainder) + 1,
                l_end,
                dbms_lob.getlength(l_onload) - l_end + 1);

  update apex_260100.wwv_flow_steps
     set javascript_code = nvl(javascript_code, empty_clob()) || chr(10) || l_popular,
         javascript_code_onload = l_remainder,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected one Home page to update; found ' || sql%rowcount);
  end if;

  dbms_lob.freetemporary(l_remainder);
end;
/
commit;

select case when dbms_lob.instr(javascript_code, 'Home: user-specific popular pages') > 0
                   and dbms_lob.instr(javascript_code_onload, 'Home: user-specific popular pages') = 0
             then 'POPULAR_EARLY_START_OK'
             else 'POPULAR_EARLY_START_FAILED'
        end as popular_early_start_check
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 1 and security_group_id = 4744311978888504;

exit
