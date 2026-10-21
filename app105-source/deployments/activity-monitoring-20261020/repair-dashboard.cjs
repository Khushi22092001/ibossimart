const fs=require('fs'),path=require('path');const p=__dirname;
const full=fs.readFileSync(path.join(p,'02_apex_pages.sql'),'utf8');
const start=full.indexOf('begin\nwwv_flow_imp_page.create_page('),end=full.indexOf('\n/\n',start)+3;
if(!full.slice(start,end).includes('p_id=>1100'))throw Error('Unexpected page block');
let s=`WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
BEGIN APEX_UTIL.SET_SECURITY_GROUP_ID(4744311978888504); END;
/
SET TERMOUT OFF
SPOOL before-runtime-repair-1100-${Date.now()}.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('PAGE:1100')));
SPOOL OFF
SET TERMOUT ON
SPOOL dashboard-runtime-repair.log
DECLARE n number;begin select count(*) into n from apex_application_pages where application_id=105 and page_id=1100 and page_alias='ACTIVITY-MONITORING';if n<>1 then raise_application_error(-20841,'Expected newly installed Activity Monitoring page');end if;end;
/
`;
s+=full.slice(full.indexOf('begin\nwwv_flow_imp.import_begin'),start);
s+=`begin wwv_flow_imp_page.remove_page(p_flow_id=>105,p_page_id=>1100);end;\n/\n`;
s+=full.slice(start,end);
s+=`begin wwv_flow_imp.import_end;commit;end;\n/\nSPOOL OFF\nEXIT\n`;
fs.writeFileSync(path.join(p,'repair-dashboard.sql'),s);console.log('Prepared native update of newly installed dashboard 1100 only, with live backup.');
