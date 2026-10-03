whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
@app105-source/report_kpis_package_20261003.sql
update imart_rkpi_config set state='READY',issue=null where issue='ORA-00923: FROM keyword not found where expected';
update imart_rkpi_config set state='READY',issue=null where issue='ORA-32034: unsupported use of WITH clause';
update imart_rkpi_config c set status_expression='(select ds.documentstatuscode from documentstatusdetail ds where ds.modulecode='''||replace(c.module_code,'''','''''')||''' and ds.moduletno=rk_source.TNO fetch first 1 row only)'
where (status_expression is null or status_expression='trim(cast(rk_source.STATUS as varchar2(4000)))') and key_expression like '%rk_source.TNO%' and exists(select 1 from documentstatusdetail ds where ds.modulecode=c.module_code);
update imart_rkpi_config set key_expression='cast(rk_source.TNO as varchar2(100))||chr(31)||cast(rk_source.SNO as varchar2(100))',grain_label='Rows in this report scope' where page_id=20;
declare c integer;q clob;errs number;msg varchar2(4000);begin
 select count(*) into errs from user_errors where name='IMART_REPORT_KPIS';if errs>0 then raise_application_error(-20001,'KPI compilation errors');end if;
 for r in(select region_id,page_id from imart_rkpi_config where state='READY')loop
 c:=dbms_sql.open_cursor;
 begin q:=imart_report_kpis.report_sql(r.region_id);dbms_sql.parse(c,q,dbms_sql.native);q:=imart_report_kpis.count_sql(r.region_id);dbms_sql.parse(c,q,dbms_sql.native);
 exception when others then msg:=sqlerrm;update imart_rkpi_config set state='REVIEW',issue=msg where region_id=r.region_id;end;
 dbms_sql.close_cursor(c);
 end loop;
end;
/
commit;
set sqlformat csv
spool app105-source/verification/report-kpi-preflight-20261003.csv
select region_id,page_id,module_code,region_label,key_expression,status_expression,recent_predicate,mine_predicate,grain_label,state,issue from imart_rkpi_config order by page_id;
spool off
exit
