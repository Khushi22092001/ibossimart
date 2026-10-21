const fs=require('fs'),path=require('path');const p=__dirname;
const original=fs.readFileSync(path.join(p,'audit_event_view.sql'),'utf8').trim();
const ddl=fs.readFileSync(path.join(p,'01_reporting_views.sql'),'utf8').replace(/^--.*$/gm,'').replace(/^create view /gm,'create or replace view ');
const timestamp=Date.now();
const sql=`-- Update only the two reporting views introduced by this approved module.
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
DECLARE current_ddl clob;previous_ddl clob:=q'!${original}!';n number;
BEGIN
 if user<>'IMART' then raise_application_error(-20841,'Expected IMART');end if;
 current_ddl:=dbms_metadata.get_ddl('VIEW','IMART_AUDIT_EVENT_V');
 if dbms_lob.instr(lower(current_ddl),'select e.')=0 or dbms_lob.instr(lower(previous_ddl),'select e.')=0 then raise_application_error(-20841,'Cannot locate inspected view query');end if;
 current_ddl:=substr(current_ddl,dbms_lob.instr(lower(current_ddl),'select e.'));
 previous_ddl:=substr(previous_ddl,dbms_lob.instr(lower(previous_ddl),'select e.'));
 current_ddl:=regexp_replace(regexp_replace(replace(current_ddl,chr(13),''),'^[[:space:]]+|[[:space:]]+$',''),';$','');
 previous_ddl:=regexp_replace(regexp_replace(replace(previous_ddl,chr(13),''),'^[[:space:]]+|[[:space:]]+$',''),';$','');
 if dbms_lob.compare(current_ddl,previous_ddl)<>0 then
 dbms_output.put_line('Query lengths: current='||dbms_lob.getlength(current_ddl)||', inspected='||dbms_lob.getlength(previous_ddl));
 for i in 1..least(dbms_lob.getlength(current_ddl),dbms_lob.getlength(previous_ddl)) loop
 if dbms_lob.substr(current_ddl,1,i)<>dbms_lob.substr(previous_ddl,1,i) then
 dbms_output.put_line('First difference at '||i||'; current: '||dbms_lob.substr(current_ddl,120,greatest(1,i-30)));
 dbms_output.put_line('Inspected: '||dbms_lob.substr(previous_ddl,120,greatest(1,i-30)));exit;end if;end loop;
 raise_application_error(-20841,'Existing secured view query differs from inspected source; review before optimizing');end if;
 select count(*) into n from user_objects where object_name in ('IMART_ACTIVITY_EVENTS_V','IMART_ACTIVITY_SCOPE_V') and object_type='VIEW' and status='VALID';
 if n<>2 then raise_application_error(-20841,'Expected both newly installed reporting views');end if;
 dbms_output.put_line('PASS: existing secured source matches inspected source; central can_read remains authoritative.');
END;
/
SET TERMOUT OFF
SPOOL before-reporting-optimization-${timestamp}.sql
SELECT dbms_metadata.get_ddl('VIEW','IMART_ACTIVITY_EVENTS_V') FROM dual;
SELECT dbms_metadata.get_ddl('VIEW','IMART_ACTIVITY_SCOPE_V') FROM dual;
SPOOL OFF
SET TERMOUT ON
SPOOL reporting-optimization.log
${ddl}
SELECT OBJECT_NAME,STATUS FROM USER_OBJECTS WHERE OBJECT_NAME IN('IMART_ACTIVITY_EVENTS_V','IMART_ACTIVITY_SCOPE_V');
SELECT COUNT(*) SECURED_REPORT_ROWS_OUTSIDE_WEB FROM IMART_ACTIVITY_EVENTS_V;
SPOOL OFF
EXIT
`;
fs.writeFileSync(path.join(p,'optimize-reporting.sql'),sql);console.log('Prepared guarded reporting-view optimization and backup; existing security view is not altered.');
