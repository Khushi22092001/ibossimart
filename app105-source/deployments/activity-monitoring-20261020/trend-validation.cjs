const fs=require('fs');const sources=JSON.parse(fs.readFileSync('source_queries.json','utf8'));const trend=JSON.parse(fs.readFileSync('chart_queries.json','utf8')).find(x=>x.name==='Activity trend').sql;const raw=require('./reference-scope.cjs')(sources);let out=`WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
SET SQLFORMAT ANSICONSOLE
SPOOL trend-validation.log
`;
for(const [label,from,to,grain,buckets] of [['Single day hourly','2026-10-20','2026-10-20','DAY',24],['Seven daily buckets','2026-10-14','2026-10-20','DAY',7],['Seven hourly days','2026-10-14','2026-10-20','HOUR',168],['Long hourly selection adapts','2026-10-01','2026-10-20','HOUR',20],['Monthly buckets','2026-10-01','2026-10-20','MONTH',1],['Empty historical period','2026-09-01','2026-09-30','DAY',0]]){
 const replace=s=>s.replace(/apex_util\.get_session_state\('P1100_([A-Z]+)'\)/g,(_,n)=>n==='FROM'?`'${from}'`:n==='TO'?`'${to}'`:'null').replace(/:P1100_GRAIN\b/g,`'${grain}'`);
 const cte=`with IMART_ACTIVITY_EVENTS_V as (${raw}),IMART_ACTIVITY_SCOPE_V as (${replace(sources.scoped)}),trend as (${replace(trend)}) `;
 out+=`declare actual number;expected number;periods number;points number;begin ${cte}select nvl((select sum(value) from trend),0),(select count(*) from IMART_ACTIVITY_SCOPE_V where operation in ('INSERT','UPDATE','DELETE')),(select count(distinct label) from trend),(select count(*) from trend) into actual,expected,periods,points from dual;if actual<>expected or periods<>${buckets} or points<>${buckets*3} then raise_application_error(-20842,'Trend reconciliation failed: ${label}');end if;dbms_output.put_line('PASS ${label}: events='||actual||', buckets='||periods||', points='||points);end;\n/\n`;
}
out+='SPOOL OFF\nEXIT\n';fs.writeFileSync('trend-validation.sql',out);console.log('Prepared six real-data trend reconciliation cases.');
