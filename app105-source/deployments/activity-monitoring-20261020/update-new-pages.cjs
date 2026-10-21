// Native page update limited to the sixteen pages created by this approved module.
const fs=require('fs'),path=require('path');const p=__dirname;
const full=fs.readFileSync(path.join(p,'02_apex_pages.sql'),'utf8');
const first=full.indexOf('begin\nwwv_flow_imp_page.create_page(');
const last=full.lastIndexOf('begin\nwwv_flow_imp_shared.create_security_scheme');
if(first<0||last<0)throw Error('Unexpected generated page boundaries');
const reports=JSON.parse(fs.readFileSync(path.join(p,'report_queries.json'),'utf8'));
const pages=[1100,...new Set(reports.map(r=>r.page)),1115];
if(pages.length!==16||new Set(pages).size!==16)throw Error('Unexpected page allocation');
const timestamp=Date.now();
let s=`WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SQLFORMAT DEFAULT
SET HEADING OFF FEEDBACK OFF PAGESIZE 0 LINESIZE 32767 LONG 1000000 LONGCHUNKSIZE 1000000 TRIMSPOOL ON
BEGIN APEX_UTIL.SET_SECURITY_GROUP_ID(4744311978888504); END;
/
SET TERMOUT OFF
SPOOL before-module-page-update-${timestamp}.sql
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2(${pages.map(n=>"'PAGE:"+n+"'").join(',')})));
SPOOL OFF
SET TERMOUT ON
SPOOL module-page-update.log
DECLARE n number;begin
 select count(*) into n from apex_application_pages where application_id=105 and page_id between 1100 and 1115 and page_alias like 'ACTIVITY-%';
 if n<>16 then raise_application_error(-20841,'Expected only the sixteen newly installed Activity pages.');end if;
end;
/
`;
s+=full.slice(full.indexOf('begin\nwwv_flow_imp.import_begin'),first);
s+=`begin\n${pages.map(n=>`wwv_flow_imp_page.remove_page(p_flow_id=>105,p_page_id=>${n});`).join('\n')}\nend;\n/\n`;
s+=full.slice(first,last);
s+='begin wwv_flow_imp.import_end;commit;end;\n/\nSPOOL OFF\nEXIT\n';
fs.writeFileSync(path.join(p,'update-new-pages.sql'),s);console.log('Prepared backed-up native update for new Activity pages only; existing hub and security schemes remain unchanged.');
