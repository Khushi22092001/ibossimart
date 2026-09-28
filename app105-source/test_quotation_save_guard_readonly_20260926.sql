whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set serveroutput on size unlimited
declare
  l_source clob;
  l_exec_source clob;
  l_cursor integer;
  l_result integer;
  function literal(p_value varchar2) return varchar2 is
  begin
    if p_value is null then return 'null'; end if;
    return dbms_assert.enquote_literal(p_value);
  end;
begin
  select process_sql_clob into l_source
    from apex_260100.wwv_flow_step_processing
   where flow_id=105 and flow_step_id=710
     and process_name='Verify quotation calculations before commit';
  dbms_output.put_line('GUARD_SOURCE_LENGTH='||dbms_lob.getlength(l_source));
  dbms_output.put_line('GUARD_SOURCE_HEAD='||replace(dbms_lob.substr(l_source,220,1),chr(10),' '));

  for q in (
    select * from (
      select tno, partycode, transactiontypecode
        from quotation
       where exists (select 1 from quotationdetail d where d.tno=quotation.tno)
       order by tno desc
    ) where rownum<=12
  ) loop
    begin
      l_exec_source:=replace(l_source,':P710_TRANSACTIONTYPECODE',literal(q.transactiontypecode));
      l_exec_source:=replace(l_exec_source,':P710_PARTYCODE',literal(q.partycode));
      l_exec_source:=replace(l_exec_source,':P710_TNO',to_char(q.tno,'TM9','NLS_NUMERIC_CHARACTERS=''.,'''));
      l_exec_source:=replace(l_exec_source,':REQUEST','''SAVE''');
      dbms_output.put_line('EXEC_SOURCE_LENGTH='||dbms_lob.getlength(l_exec_source));
      dbms_output.put_line('EXEC_REQUEST_CHECK='||replace(dbms_lob.substr(l_exec_source,180,dbms_lob.instr(l_exec_source,'if upper')),chr(10),' '));
      l_cursor:=dbms_sql.open_cursor;
      dbms_sql.parse(l_cursor,l_exec_source,dbms_sql.native);
      l_result:=dbms_sql.execute(l_cursor);
      dbms_output.put_line('TNO='||q.tno||' PASS');
      dbms_sql.close_cursor(l_cursor);
    exception when others then
      if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
      dbms_output.put_line('TNO='||q.tno||' BLOCKED: '||substr(sqlerrm,1,1800));
    end;
  end loop;

  for q in (
    select * from (
      select tno, partycode, transactiontypecode
        from quotation
       where exists (select 1 from quotationdetail d where d.tno=quotation.tno)
       order by tno desc
    ) where rownum=1
  ) loop
    update quotationdetail
       set amount=nvl(amount,0)+123.45
     where tno=q.tno
       and sno=(select min(sno) from quotationdetail where tno=q.tno);
    dbms_output.put_line('NEGATIVE_TEST rows_changed='||sql%rowcount);
    select count(*) into l_result
      from quotationdetail d
     where d.tno=q.tno
       and abs(nvl(d.amount,0)-nvl(d.rate,0)*nvl(d.quantity1,0))>.01;
    dbms_output.put_line('NEGATIVE_TEST visible_primary_formula_mismatches='||l_result);
    begin
      l_exec_source:=replace(l_source,':P710_TRANSACTIONTYPECODE',literal(q.transactiontypecode));
      l_exec_source:=replace(l_exec_source,':P710_PARTYCODE',literal(q.partycode));
      l_exec_source:=replace(l_exec_source,':P710_TNO',to_char(q.tno,'TM9','NLS_NUMERIC_CHARACTERS=''.,'''));
      l_exec_source:=replace(l_exec_source,':REQUEST','''SAVE''');
      l_cursor:=dbms_sql.open_cursor;
      dbms_sql.parse(l_cursor,l_exec_source,dbms_sql.native);
      l_result:=dbms_sql.execute(l_cursor);
      dbms_output.put_line('NEGATIVE_TEST TNO='||q.tno||' UNEXPECTED_PASS');
      dbms_sql.close_cursor(l_cursor);
    exception when others then
      if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
      dbms_output.put_line('NEGATIVE_TEST TNO='||q.tno||' EXPECTED_BLOCK: '||substr(sqlerrm,1,1800));
    end;
    rollback;
  end loop;
end;
/
rollback;
exit
