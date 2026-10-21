const fs=require('fs'),path=require('path'),assert=require('assert');const root=__dirname;
const read=f=>fs.readFileSync(path.join(root,f),'utf8'),write=(f,s)=>fs.writeFileSync(path.join(root,f),s);
const sources=JSON.parse(read('source_queries.json')),reports=JSON.parse(read('report_queries.json')),charts=JSON.parse(read('chart_queries.json'));
const sqlLiteral=s=>"q'!"+s+"!'";
let tests=[];function test(name,code){code();tests.push(name);}
test('No destructive database statements',()=>assert(!/\b(drop|truncate|delete from|alter table|create or replace|grant)\b/i.test(read('01_reporting_views.sql').replace(/^--.*$/gm,''))));
test('No wildcard production projections',()=>assert(!/select\s+\*/i.test(read('01_reporting_views.sql'))&&!/select\s+e\.\*/i.test(read('01_reporting_views.sql'))));
test('All reports share the secured scope',()=>reports.forEach(r=>assert(r.sql.includes('IMART_ACTIVITY_SCOPE_V'))));
test('Central permission function retained with statement-local caching only',()=>{assert(sources.base.includes(sources.securityPredicate));assert.equal(sources.base.split('IMART_AUDIT.can_read').length,2);assert(!/result_cache/i.test(sources.base));});
test('Fifteen report queries and six native chart queries',()=>{assert.equal(reports.length,15);assert.equal(charts.length,6);});
test('APEX page IDs are unique and confined to allocation',()=>{const pages=[...read('02_apex_pages.sql').matchAll(/create_page\(\s*p_id=>(\d+)/g)].map(x=>+x[1]);assert.equal(pages.length,16);assert.equal(new Set(pages).size,16);assert(pages.every(p=>p>=1100&&p<=1115));});
test('No page removal or security weakening',()=>assert(!/remove_page|protection_level=>'N'|required_role=>null/.test(read('02_apex_pages.sql'))));
test('Exports use authorization and no email delivery',()=>{assert.equal((read('02_apex_pages.sql').match(/p_download_auth_scheme/g)||[]).length,15);assert(!/p_enable_mail_download=>'Y'/.test(read('02_apex_pages.sql')));});
test('No raw payloads or client IP in new report projections',()=>reports.forEach(r=>assert(!/old_value|new_value|ip_address|user_agent|password/i.test(r.sql))));
test('No filter concatenation into executable SQL',()=>assert(!/execute immediate/i.test(read('02_apex_pages.sql')+read('01_reporting_views.sql'))));
test('Maximum 366 days and explicit timezone boundaries',()=>{assert(sources.scoped.includes('<=365'));assert(sources.scoped.includes("'Asia/Kolkata'"));assert(sources.scoped.includes('e.event_timestamp<'));});
test('Matrix grand totals use grouping sets',()=>[1106,1107].forEach(p=>assert(reports.find(r=>r.page===p).sql.includes('grouping sets'))));
const withSources=`with IMART_ACTIVITY_EVENTS_V as (${sources.base}),IMART_ACTIVITY_SCOPE_V as (${sources.scoped}) `;
let out=`WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK\nCONNECT -name IMART\nSET DEFINE OFF\nSET SERVEROUTPUT ON SIZE UNLIMITED\nSET SQLFORMAT ANSICONSOLE\nSET LINESIZE 240\nSPOOL validation.log\n`;
function parseBlock(name,sql){const chunks=sql.match(/[\s\S]{1,10000}/g);return `declare c integer:=dbms_sql.open_cursor;a dbms_sql.varchar2a;begin\n${chunks.map((s,i)=>`a(${i+1}):=${sqlLiteral(s)};`).join('\n')}\ndbms_sql.parse(c,a,1,${chunks.length},false,dbms_sql.native);dbms_sql.close_cursor(c);dbms_output.put_line('PASS parse: ${name}');exception when others then if dbms_sql.is_open(c) then dbms_sql.close_cursor(c);end if;raise;end;\n/\n`;}
for(const r of reports)out+=parseBlock('report '+r.page,withSources+r.sql);
for(const r of charts)out+=parseBlock('chart '+r.name,withSources+r.sql);
for(const r of sources.seriesQueries)out+=parseBlock('chart drill '+r.name,withSources+r.sql);
for(const r of sources.lovQueries)out+=parseBlock('bounded filter LOV '+r.name,withSources+r.sql);
out+=parseBlock('KPI aggregation',withSources+sources.kpiSQL);
// Parse native API calls without executing imports or changing application metadata.
let componentBlocks=(read('02_apex_pages.sql')+'\n'+read('03_dashboard_hub_card.sql')).split(/^\/\s*$/m).map(x=>x.trim()).filter(x=>/^begin\b/i.test(x));
componentBlocks.forEach((b,i)=>out+=parseBlock('native component block '+i,b));
sources.codeSources.forEach((r,i)=>out+=parseBlock('PLSQL source '+i,r.source.replace('for r in (select ',`for r in (${withSources}select `)));
out+=parseBlock('Scope application process',sources.applyCode);
out+=`SELECT COUNT(*) SECURED_ROWS_OUTSIDE_WEB FROM IMART_AUDIT_EVENT_V;\nSELECT PAGE_ID,PAGE_NAME FROM APEX_APPLICATION_PAGES WHERE APPLICATION_ID=105 AND PAGE_ID BETWEEN 1100 AND 1115;\nSPOOL OFF\nEXIT\n`;
write('validate.sql',out);write('static-validation.json',JSON.stringify({at:new Date().toISOString(),passed:tests,liveExecution:false},null,2));console.log(tests.map(x=>'PASS '+x).join('\n'));console.log('Prepared read-only Oracle parse validation; no imports or DDL are executed.');
