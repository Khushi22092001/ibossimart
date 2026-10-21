// Read-only reference calculations, using the explicitly inspected company-1 scope.
// This is not an application source and does not replace or bypass a secured view.
const fs=require('fs'),path=require('path');const root=__dirname;
const read=f=>fs.readFileSync(path.join(root,f),'utf8'),write=(f,s)=>fs.writeFileSync(path.join(root,f),s);
const sources=JSON.parse(read('source_queries.json')),reports=JSON.parse(read('report_queries.json')),charts=JSON.parse(read('chart_queries.json'));
const ddl=read('audit_event_view.sql');let original=ddl.slice(ddl.indexOf('select e.')).trim().replace(/;\s*$/,'');
if(!original.includes('where IMART_AUDIT.can_read(e.company_code,e.location_code)=1'))throw Error('Original secured view predicate changed');
original=original.replace('where IMART_AUDIT.can_read(e.company_code,e.location_code)=1',"where e.company_code='1'");
const state=n=>n==='FROM'||n==='TO'?"'2026-10-20'":n==='GRAIN'?"'DAY'":'null';
const replaceState=s=>s.replace(/apex_util\.get_session_state\('P1100_([A-Z]+)'\)/g,(_,n)=>state(n)).replace(/:P1100_GRAIN\b/g,"'DAY'");
const rawBase=require('./reference-scope.cjs')(sources);
const cte=`with IMART_ACTIVITY_EVENTS_V as (${rawBase}),IMART_ACTIVITY_SCOPE_V as (${replaceState(sources.scoped)}) `;
function removeURLs(s){let needle='apex_page.get_url(';let start;while((start=s.indexOf(needle))!==-1){let depth=1,quoted=false,j=start+needle.length;for(;j<s.length&&depth;j++){let c=s[j];if(c==="'"){if(quoted&&s[j+1]==="'"){j++;continue;}quoted=!quoted;}else if(!quoted){if(c==='(')depth++;if(c===')')depth--;}}if(depth)throw Error('Unbalanced URL call');s=s.slice(0,start)+'cast(null as varchar2(4000))'+s.slice(j);}return s;}
let sql=`-- Reference scope: inspected BOSS grant company 1 / all locations. No web-context impersonation.\nWHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK\nCONNECT -name IMART\nSET DEFINE OFF\nSET SERVEROUTPUT ON SIZE UNLIMITED\nSET TIMING ON\nSET SQLFORMAT ANSICONSOLE\nSET LINESIZE 240\nSPOOL reconciliation.log\n`;
sql+=`SELECT COUNT(*) EXPECTED_GRANT FROM IMART_AUDIT_ACCESS WHERE BOSSUSERCODE='1' AND COMPANY_SCOPE='1' AND LOCATION_SCOPE='*';\n`;
for(let i=1;i<=4;i++)for(const k of ['D','V'])sql+=`VARIABLE P1113_${k}${i} VARCHAR2(4000)\n`;
sql+=`VARIABLE P1114_EVENT NUMBER\nBEGIN :P1114_EVENT:=85874;END;\n/\n`;
function check(label,actual,expected){sql+=`${cte} select '${label}' test_name,actual,expected,case when actual=expected then 'PASS' else 'FAIL' end result from (select (${actual}) actual,(${expected}) expected from dual);\n`;}
check('No event multiplication','select count(*) from IMART_ACTIVITY_SCOPE_V','select count(distinct audit_event_id) from IMART_ACTIVITY_SCOPE_V');
check('Outcome partition',"select sum(case when outcome='SUCCESS' then 1 when outcome='FAILURE' then 1 when outcome='OBSERVED' then 1 else 1 end) from IMART_ACTIVITY_SCOPE_V",'select count(*) from IMART_ACTIVITY_SCOPE_V');
for(const r of reports){let query=removeURLs(replaceState(r.sql));if(r.page<=1108){check('Summary '+r.page,`select nvl(sum(total_events),0) from (${query})${[1106,1107].includes(r.page)?" where row_kind='Detail'":''}`,'select count(*) from IMART_ACTIVITY_SCOPE_V');}else sql+=`${cte} select '${r.title.replace(/'/g,"''")}' report_name,count(*) result_rows from (${query});\n`;}
for(const ch of charts){const query=replaceState(ch.sql);sql+=`${cte} select '${ch.name}' chart_name,count(*) chart_points,nvl(sum(value),0) event_total from (${query});\n`;}
sql+=`${cte} ${replaceState(sources.kpiSQL)};\n`;
// Timestamp fixture is an in-memory SELECT, never a database insert.
sql+=`WITH boundary_cases(t,expected) AS (
SELECT to_timestamp_tz('2026-10-19 18:29:59 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),0 FROM dual UNION ALL
SELECT to_timestamp_tz('2026-10-19 18:30:00 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),1 FROM dual UNION ALL
SELECT to_timestamp_tz('2026-10-20 18:29:59 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),1 FROM dual UNION ALL
SELECT to_timestamp_tz('2026-10-20 18:30:00 +00:00','YYYY-MM-DD HH24:MI:SS TZH:TZM'),0 FROM dual)
SELECT 'Timezone midnight boundaries' TEST_NAME,CASE WHEN COUNT(*)=4 THEN 'PASS' ELSE 'FAIL' END RESULT FROM boundary_cases WHERE CASE WHEN t>=from_tz(timestamp '2026-10-20 00:00:00','Asia/Kolkata') AND t<from_tz(timestamp '2026-10-21 00:00:00','Asia/Kolkata') THEN 1 ELSE 0 END=expected;
SELECT 'Unchanged secured view outside web' TEST_NAME,CASE WHEN COUNT(*)=0 THEN 'PASS' ELSE 'FAIL' END RESULT FROM IMART_AUDIT_EVENT_V;
SPOOL OFF
EXIT
`;
write('reconcile.sql',sql);console.log('Prepared read-only reference reconciliation; no records or security settings are modified.');
