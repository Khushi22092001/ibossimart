whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_count number;
begin
  select count(*)
    into l_count
    from apex_260100.wwv_flow_step_processing
   where flow_id = 105
     and flow_step_id = 167
     and id = 448640454367961423
     and process_point = 'BEFORE_BOX_BODY'
     and dbms_lob.instr(process_sql_clob, 'P167_FROMDATE') > 0
     and dbms_lob.instr(process_sql_clob, 'FINANCIALYEARBEGIN') > 0;

  if l_count <> 1 then
    raise_application_error(-20167, 'Expected one Material Out date-initialization process; found ' || l_count);
  end if;

  update apex_260100.wwv_flow_step_processing
     set process_sql_clob = q'~begin
  if :P167_MONO is not null then
    select x.financialyearbegin, x.financialyearend
      into :P167_FROMDATE, :P167_TODATE
      from financialyear x
     where trunc(sysdate) between x.financialyearbegin and x.financialyearend;
  elsif upper(nvl(v('REQUEST'), 'NO_REQUEST')) <> 'REFRESH' then
    /* A fresh register visit must not reuse an old fiscal-year date cache. */
    :P167_FROMDATE := trunc(sysdate) - 6;
    :P167_TODATE   := trunc(sysdate);
  end if;
end;~',
         last_updated_on = sysdate,
         last_updated_by = user
   where flow_id = 105
     and flow_step_id = 167
     and id = 448640454367961423
     and process_point = 'BEFORE_BOX_BODY'
     and dbms_lob.instr(process_sql_clob, 'P167_FROMDATE') > 0
     and dbms_lob.instr(process_sql_clob, 'FINANCIALYEARBEGIN') > 0;

  if sql%rowcount <> 1 then
    raise_application_error(-20168, 'Material Out date-initialization update affected an unexpected row count.');
  end if;

  select count(*)
    into l_count
    from apex_260100.wwv_flow_step_processing
   where flow_id = 105
     and flow_step_id = 167
     and id = 448640454367961423
     and dbms_lob.instr(process_sql_clob, ':P167_FROMDATE := trunc(sysdate) - 6') > 0
     and dbms_lob.instr(process_sql_clob, 'v(''REQUEST'')') > 0;

  if l_count <> 1 then
    raise_application_error(-20169, 'Material Out rolling-week postcondition failed.');
  end if;

  commit;
  dbms_output.put_line('P167_DEFAULT_WEEK_SCOPE_FIXED');
exception
  when others then
    rollback;
    raise;
end;
/

select case
         when dbms_lob.instr(process_sql_clob, ':P167_FROMDATE := trunc(sysdate) - 6') > 0
          and dbms_lob.instr(process_sql_clob, ':P167_TODATE   := trunc(sysdate)') > 0
          and dbms_lob.instr(process_sql_clob, 'v(''REQUEST'')') > 0
         then 'P167_WEEK_SCOPE_OK'
         else 'P167_WEEK_SCOPE_FAILED'
       end as p167_week_scope_check
  from apex_260100.wwv_flow_step_processing
 where flow_id = 105
   and flow_step_id = 167
   and id = 448640454367961423;

exit
