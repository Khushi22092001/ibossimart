const fs=require('fs');let s=fs.readFileSync('before-date-format-drill-pages.sql','utf8').replace(/\r\n/g,'\n');const stop=s.indexOf('prompt --application/pages/delete_01093');if(stop<0)throw Error('Unexpected drill export');s=s.slice(0,stop);s=s.replace(/p_default_id_offset=>\d+/,'p_default_id_offset=>0');
const old="p_source=>'with e as(select audit_event_id,event_timestamp,user_name";
if(s.split(old).length!==2)throw Error('Expected one event-details source');
s=s.replace(old,"p_source=>'with e as(select audit_event_id,to_char(event_timestamp at time zone ''Asia/Kolkata'',''DD-MM-YYYY HH24:MI:SS TZH:TZM'') event_timestamp,user_name");
s=s.replace("p_source=>'select audit_event_id,event_timestamp,user_name","p_source=>'select audit_event_id,event_timestamp at time zone ''Asia/Kolkata'' event_timestamp,user_name");
s=s.replace(/(,p_column_alias=>'EVENT_TIMESTAMP'[\s\S]*?,p_column_heading=>'event timestamp')/,"$1\n,p_column_format=>'DD-MM-YYYY HH24:MI:SS TZH:TZM'");
s+='begin wwv_flow_imp.import_end;commit;end;\n/\n';
fs.writeFileSync('date-drill-pages.sql',s);
let wrapper=`WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
BEGIN APEX_UTIL.SET_SECURITY_GROUP_ID(4744311978888504); END;
/
DECLARE n number;begin select count(*) into n from apex_application_page_regions where application_id=105 and page_id=1091 and region_id in(91004000000000044,91004000000002001,91004000000002004,91004000000000087);if n<>4 then raise_application_error(-20841,'Unexpected event drill components');end if;end;
/
SET TERMOUT OFF
SPOOL before-date-drill-update-${Date.now()}.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('PAGE:1091')));
SPOOL OFF
SET TERMOUT ON
@date-drill-pages.sql
SET TERMOUT OFF
SPOOL deployed-date-drill-pages.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('PAGE:1091','PAGE:1093')));
SPOOL OFF
SET TERMOUT ON
EXIT
`;fs.writeFileSync('update-date-drills.sql',wrapper);console.log('Prepared date-only update for event drill 1091; raw field viewer 1093 is preserved.');
