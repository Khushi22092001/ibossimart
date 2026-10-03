whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Restore the original Home lifecycle: only Popular Pages stays changed. */
declare
  l_onload       clob;
  l_early        clob;
  l_popular      clob;
  l_new_onload   clob;
  l_new_early    clob;
  l_start        pls_integer;
  l_finish       pls_integer;
begin
  select javascript_code_onload, javascript_code
    into l_onload, l_early
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504
   for update;

  l_start := dbms_lob.instr(l_early, '/* Home: user-specific popular pages sourced from APEX activity history. */');
  l_finish := dbms_lob.instr(l_early, '}());', l_start);
  if l_start = 0 or l_finish = 0 then
    raise_application_error(-20001, 'Early Popular Pages initializer was not found.');
  end if;

  l_popular := dbms_lob.substr(l_early, l_finish - l_start + 5, l_start);

  dbms_lob.createtemporary(l_new_early, true);
  dbms_lob.copy(l_new_early, l_early, l_start - 1, 1, 1);
  dbms_lob.copy(l_new_early,
                l_early,
                dbms_lob.getlength(l_new_early) + 1,
                l_finish + 5,
                dbms_lob.getlength(l_early) - l_finish - 4);

  dbms_lob.createtemporary(l_new_onload, true);
  dbms_lob.append(l_new_onload, l_popular);
  dbms_lob.writeappend(l_new_onload, 2, chr(10) || chr(10));
  dbms_lob.copy(l_new_onload, l_onload, dbms_lob.getlength(l_new_onload) + 1, 1, dbms_lob.getlength(l_onload));

  update apex_260100.wwv_flow_steps
     set javascript_code = l_new_early,
         javascript_code_onload = l_new_onload,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected one Home page to update; found ' || sql%rowcount);
  end if;

  dbms_lob.freetemporary(l_new_early);
  dbms_lob.freetemporary(l_new_onload);
end;
/
commit;

select case when dbms_lob.instr(javascript_code_onload, 'Home: user-specific popular pages') > 0
                   and dbms_lob.instr(nvl(javascript_code, empty_clob()), 'Home: user-specific popular pages') = 0
             then 'POPULAR_ONLOAD_RESTORED'
             else 'POPULAR_ONLOAD_RESTORE_FAILED'
        end as popular_onload_restore_check
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 1 and security_group_id = 4744311978888504;

exit
