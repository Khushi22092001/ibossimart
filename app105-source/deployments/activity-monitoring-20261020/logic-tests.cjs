// Execute actual generated filter-processing code with SQL bind variables only.
// REQUEST is always APPLY: no APEX session state is created or impersonated.
const fs=require('fs'),path=require('path');const root=__dirname;
const read=f=>fs.readFileSync(path.join(root,f),'utf8');
const sources=JSON.parse(read('source_queries.json')),reports=JSON.parse(read('report_queries.json'));
const lit=s=>"'"+s.replace(/'/g,"''")+"'";
let sql=`WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK\nCONNECT -name IMART\nSET DEFINE OFF\nSET SERVEROUTPUT ON SIZE UNLIMITED\nSET SQLFORMAT ANSICONSOLE\nSET LINESIZE 200\nSPOOL logic-tests.log\n`;
sql+=`declare
 d date:=trunc(cast(systimestamp at time zone 'Asia/Kolkata' as date));
 procedure run_case(p_name varchar2,p_quick varchar2,p_from varchar2,p_to varchar2,p_grain varchar2,p_expected_from varchar2,p_expected_to varchar2,p_error boolean default false) is
 c integer;ret integer;f varchar2(100):=p_from;t varchar2(100):=p_to;g varchar2(100):=p_grain;k varchar2(100):=p_quick;
 begin
 c:=dbms_sql.open_cursor;
 dbms_sql.parse(c,q'!${sources.applyCode}!',dbms_sql.native);
 dbms_sql.bind_variable(c,':REQUEST','APPLY');
 dbms_sql.bind_variable(c,':P1100_QUICK',k,100);
 dbms_sql.bind_variable(c,':P1100_GRAIN',g,100);
 dbms_sql.bind_variable(c,':P1100_FROM',f,100);
 dbms_sql.bind_variable(c,':P1100_TO',t,100);
 begin ret:=dbms_sql.execute(c);
 exception when others then
 if sqlcode=-20840 and p_error then dbms_sql.close_cursor(c);dbms_output.put_line('PASS logic: '||p_name);return;else raise;end if;
 end;
 if p_error then raise_application_error(-20842,'Expected validation error: '||p_name);end if;
 dbms_sql.variable_value(c,':P1100_FROM',f);dbms_sql.variable_value(c,':P1100_TO',t);dbms_sql.close_cursor(c);
 if f<>p_expected_from or t<>p_expected_to or f is null or t is null then raise_application_error(-20842,'Date mismatch: '||p_name);end if;
 dbms_output.put_line('PASS logic: '||p_name);
 exception when others then if c is not null and dbms_sql.is_open(c) then dbms_sql.close_cursor(c);end if;raise;
 end;
begin
 run_case('Today','TODAY',null,null,'DAY',to_char(d,'YYYY-MM-DD'),to_char(d,'YYYY-MM-DD'));
 run_case('Yesterday','YESTERDAY',null,null,'HOUR',to_char(d-1,'YYYY-MM-DD'),to_char(d-1,'YYYY-MM-DD'));
 run_case('This week (ISO Monday)','WEEK',null,null,'DAY',to_char(trunc(d,'IW'),'YYYY-MM-DD'),to_char(d,'YYYY-MM-DD'));
 run_case('This month','MONTH',null,null,'DAY',to_char(trunc(d,'MM'),'YYYY-MM-DD'),to_char(d,'YYYY-MM-DD'));
 run_case('Previous month','PREVIOUS',null,null,'MONTH',to_char(add_months(trunc(d,'MM'),-1),'YYYY-MM-DD'),to_char(trunc(d,'MM')-1,'YYYY-MM-DD'));
 run_case('Custom leap day','CUSTOM','2024-02-29','2024-02-29','DAY','2024-02-29','2024-02-29');
 run_case('366 inclusive days allowed','CUSTOM','2025-10-20','2026-10-20','DAY','2025-10-20','2026-10-20');
 run_case('Null date rejected','CUSTOM',null,'2026-10-20','DAY',null,null,true);
 run_case('Invalid calendar date rejected','CUSTOM','2026-02-30','2026-10-20','DAY',null,null,true);
 run_case('Inverted range rejected','CUSTOM','2026-10-21','2026-10-20','DAY',null,null,true);
 run_case('367 inclusive days rejected','CUSTOM','2025-10-19','2026-10-20','DAY',null,null,true);
 run_case('Unknown date preset rejected','FORGED',null,null,'DAY',null,null,true);
 run_case('Unknown time grouping rejected','TODAY',null,null,'FORGED',null,null,true);
 run_case('Null time grouping rejected','TODAY',null,null,null,null,null,true);
end;
/\n`;
const safeExpr=reports.find(r=>r.page===1102).sql.match(/case when regexp_like\(to_char\(user_name\)[\s\S]*? end user_name/)[0].replace(/ end user_name$/,' end').replace(/\buser_name\b/g,'text_value');
const formulaCases=[['Plain label',"'Kilograms'","'Kilograms'"],['Formula equals',"'=1+1'","chr(39)||'=1+1'"],['Formula plus',"'+SUM(A1:A2)'","chr(39)||'+SUM(A1:A2)'"],['Formula minus',"'-1+2'","chr(39)||'-1+2'"],['Formula at',"'@SUM(A1:A2)'","chr(39)||'@SUM(A1:A2)'"],['Leading whitespace',"'  =1+1'","chr(39)||'  =1+1'"],['Leading tab',"chr(9)||'=1+1'","chr(39)||chr(9)||'=1+1'"],['Internal equals retained',"'ABC=2'","'ABC=2'"],['Null retained','cast(null as varchar2(100))','cast(null as varchar2(100))']];
for(const[name,input,expected]of formulaCases)sql+=`declare n number;begin select count(*) into n from (select ${safeExpr} protected_value,${expected} expected from (select ${input} text_value from dual)) where protected_value=expected or (protected_value is null and expected is null);if n<>1 then raise_application_error(-20842,'Formula protection mismatch');end if;dbms_output.put_line('PASS logic: ${name}');end;\n/\n`;
sql+=`declare s varchar2(100):='entity,%2C,%25,key';v varchar2(100);begin v:=replace(replace(s,'%','%25'),',','%2C');v:=replace(replace(v,'%2C',','),'%25','%');if v<>s then raise_application_error(-20842,'Drill key punctuation round-trip failed');end if;dbms_output.put_line('PASS logic: drill key punctuation round-trip');end;\n/\n`;
// Use the already-inspected BOSS company-1 grant only as a read-only reference.
const ddl=read('audit_event_view.sql');let raw=ddl.slice(ddl.indexOf('select e.')).trim().replace(/;\s*$/,'');
const security='where IMART_AUDIT.can_read(e.company_code,e.location_code)=1';if(!raw.includes(security))throw Error('Expected original view security predicate');
raw=raw.replace(security,"where e.company_code='1'");
const state=n=>n==='FROM'||n==='TO'?"'2026-10-20'":n==='GRAIN'?"'DAY'":'null';
const scope=sources.scoped.replace(/apex_util\.get_session_state\('P1100_([A-Z]+)'\)/g,(_,n)=>state(n));
const cte=`with IMART_ACTIVITY_EVENTS_V as (${require('./reference-scope.cjs')(sources)}),IMART_ACTIVITY_SCOPE_V as (${scope}) `;
const detail=reports.find(r=>r.page===1113).sql;
const predicate=detail.slice(detail.indexOf('where 1=1')+'where 1=1'.length);
const cases=[['Insert drill','ACTION','INSERT',"operation='INSERT'"],['Failure drill','OUTCOME','FAILURE',"outcome='FAILURE'"],['Successful row drill','ROW_SUCCESS','1','successful_row_operation=1'],['Keyed records drill','KEYED','1','record_identity is not null'],['Other operations drill','OTHEROPS','1',"operation not in ('INSERT','UPDATE','DELETE')"],['Unspecified location drill','LOCATION','~NULL~','location_code is null'],['Unknown drill dimension fails closed','FORGED','1','1=0'],['Forged company cannot broaden scope','COMPANY','UNAUTHORIZED_COMPANY','1=0']];
for(const[name,dim,value,expected]of cases){let p=predicate.replace(/:P1113_D1\b/g,lit(dim)).replace(/:P1113_V1\b/g,lit(value)).replace(/:P1113_[DV][234]\b/g,'null');sql+=`declare a number;e number;begin ${cte} select (select count(*) from IMART_ACTIVITY_SCOPE_V where 1=1 ${p}),(select count(*) from IMART_ACTIVITY_SCOPE_V where ${expected}) into a,e from dual;if a<>e then raise_application_error(-20842,'Drill count mismatch');end if;dbms_output.put_line('PASS logic: ${name} ('||a||' events)');end;\n/\n`;}
sql+='SPOOL OFF\nEXIT\n';fs.writeFileSync(path.join(root,'logic-tests.sql'),sql);console.log('Prepared 32 read-only date, formula and drill-filter logic checks.');
