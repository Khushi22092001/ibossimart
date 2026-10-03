whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
spool app105-source/transaction_kpi_flag_validation.txt
declare q clob;n number;a number;b number;c number;d number;e number;f number;g number;started number;begin
 for r in(select * from imart_tx_kpi_config order by page_id)loop
 q:='select count(*),sum(approval),sum(pending),sum(partial),sum(done),sum(overdue),sum(missing_due),sum(review) from ('||r.classifier_sql||')';
 started:=dbms_utility.get_time;execute immediate q into n,a,b,c,d,e,f,g;
 dbms_output.put_line('page='||r.page_id||' total='||n||' approval='||a||' pending='||b||' partial='||c||' done='||d||' overdue='||e||' missing='||f||' review='||g||' aggregate_ms='||(dbms_utility.get_time-started)*10);
 q:='select count(*) from ('||r.classifier_sql||') where pending+partial+done>1 or (overdue=1 and pending+partial=0)';
 -- GRN/gate-in and approval cards overlap intentionally; workflow progress states must not overlap.
 execute immediate q into n;if n>0 then raise_application_error(-20004,'Invalid workflow flags page '||r.page_id);end if;
 end loop;
end;
/
spool off
exit
