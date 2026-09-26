whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 280
set long 200000
connect -name IMART

prompt === RELEVANT TRIGGER SOURCE ===
select name, type, line, text
  from user_source
 where name in ('FINANCIALYEARAI','MODULELOCATIONAI','MODULELOCATIONAU','MODULEAI')
 order by name, type, line;

prompt === COMPANY TRIGGERS ===
select trigger_name, status, triggering_event
  from user_triggers
 where table_name = 'COMPANY'
 order by trigger_name;

prompt === COMPANY TRIGGER SOURCE ===
select s.name, s.type, s.line, s.text
  from user_source s
 where s.name in (
       select trigger_name from user_triggers where table_name = 'COMPANY')
 order by s.name, s.line;

prompt === MODULELOCATION COVERAGE FY/COMPANY ===
select companycode, count(*) modulelocation_count,
       count(distinct modulecode) distinct_modules
  from modulelocation
 where companycode in ('1','3')
 group by companycode
 order by companycode;

prompt === DIWANKA MODULELOCATIONS ===
select modulecode, locationcode, creator, creationtime, tno
  from modulelocation
 where companycode = '3'
 order by creationtime, modulecode, locationcode;

prompt === COMPANY AND FY CREATION DATES ===
select companycode, companyname, creationtime from company where companycode in ('1','3');
select financialyearcode, financialyearbegin, financialyearend, creationtime
  from financialyear
 where financialyearcode = '26-27';

exit
