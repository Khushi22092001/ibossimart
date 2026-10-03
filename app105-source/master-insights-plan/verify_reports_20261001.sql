whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
set feedback off
connect -name IMART
spool app105-source/master-insights-plan/reports_verification_20261001.txt
begin apex_session.attach(p_app_id=>105,p_page_id=>943,p_session_id=>3275667854335); end;
/
declare n number; total number; t number; failures number:=0;
begin
 select count(*) into n from imart_mr_catalog;
 dbms_output.put_line('CATALOGUE='||n);
 t:=dbms_utility.get_time;
 select count(*) into n from table(imart_master_reports.report_rows('OVERVIEW'));
 dbms_output.put_line('OVERVIEW='||n||'; ELAPSED_MS='||(dbms_utility.get_time-t)*10);
 select linked_rows into n from table(imart_master_reports.report_rows('OVERVIEW','PARTY'));
 select count(*) into total from party;
 if n<>total then raise_application_error(-20010,'Party overview mismatch'); end if;
 dbms_output.put_line('PARTY_COUNT_RECONCILED='||n);
 for c in (select module_code from imart_mr_catalog where module_code in ('PARTY','ITEM','ITEMCATEGORY','ITEMTYPE','LOCATION','STORAGELOCATION','EMPLOYEE','DEPARTMENT','HSN','MEASURINGUNIT','MODULE','ASSET')) loop
  for m in (select column_value report_mode from table(apex_t_varchar2('QUALITY','DUPLICATES','USAGE','UNUSED','CHANGES','MAPPINGS'))) loop
   begin
    t:=dbms_utility.get_time;
    select count(*) into n from table(imart_master_reports.report_rows(m.report_mode,c.module_code));
    dbms_output.put_line(c.module_code||'/'||m.report_mode||'='||n||'; MS='||(dbms_utility.get_time-t)*10);
   exception when others then failures:=failures+1; dbms_output.put_line('FAIL '||c.module_code||'/'||m.report_mode||' '||sqlerrm); end;
  end loop;
 end loop;
 select count(*) into n from table(imart_master_reports.report_rows('ACCESS'));
 dbms_output.put_line('ACCESS_ROWS='||n);
 if failures>0 then raise_application_error(-20011,'Report verification failures='||failures); end if;
end;
/
begin apex_session.detach; end;
/
declare n number;
begin
 select count(*) into n from table(imart_master_reports.report_rows('OVERVIEW'));
 if n<>0 then raise_application_error(-20012,'Unauthenticated access returned records'); end if;
 dbms_output.put_line('UNAUTHENTICATED_DENIED');
end;
/
spool off
exit
