whenever sqlerror exit sql.sqlcode rollback
set define off
set linesize 220
set pagesize 1000
set serveroutput on
connect -name IMART
select p.page_id,a.page_name,p.plug_name,p.plug_source_type from apex_260100.wwv_flow_page_plugs p join apex_application_pages a on a.application_id=p.flow_id and a.page_id=p.page_id where p.flow_id=105 and p.plug_source_type='NATIVE_SQL_REPORT' order by p.page_id;
declare n number;begin
select count(*) into n from apex_260100.wwv_flows f join imart_report_sizing_v7_refs b on b.id=f.id where f.id=105
and trim(regexp_replace(regexp_replace(f.css_file_urls,'#APP_FILES#report-column-sizing[.]css[^[:space:]]*',''),'[[:space:]]+',' '))=trim(regexp_replace(regexp_replace(b.css_file_urls,'#APP_FILES#report-column-sizing[.]css[^[:space:]]*',''),'[[:space:]]+',' '))
and trim(regexp_replace(regexp_replace(f.javascript_file_urls,'#APP_FILES#report-column-sizing[.]js[^[:space:]]*',''),'[[:space:]]+',' '))=trim(regexp_replace(regexp_replace(b.javascript_file_urls,'#APP_FILES#report-column-sizing[.]js[^[:space:]]*',''),'[[:space:]]+',' '));
if n<>1 then raise_application_error(-20001,'Unrelated asset references changed');end if;
dbms_output.put_line('PASS: every unrelated CSS/JS reference is unchanged');
end;
/
select file_name,dbms_lob.getlength(file_content) bytes from apex_application_static_files where application_id=105 and file_name in('report-column-sizing.css','report-column-sizing.js');
exit
