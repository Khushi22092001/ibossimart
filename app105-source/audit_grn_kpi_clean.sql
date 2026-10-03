set define off
set serveroutput on size unlimited
set feedback off
connect -name IMART
spool app105-source/grn_kpi_source_clean.txt
begin
for r in(select source_sql,classifier_sql from imart_tx_kpi_config where page_id=145)loop
dbms_output.put_line('SOURCE');dbms_output.put_line(r.source_sql);
dbms_output.put_line('CLASSIFIER');dbms_output.put_line(r.classifier_sql);
end loop;
for r in(select name,text from user_source where name in ('GETDOCUMENTSTATUSCODE','GETDINSPECTIONNO') order by name,line)loop dbms_output.put_line(r.name||' '||r.text);end loop;
end;
/
spool off
exit
