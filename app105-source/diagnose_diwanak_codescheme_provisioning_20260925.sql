whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 280
set long 200000
connect -name IMART

prompt === CODESCHEME COVERAGE BY COMPANY FY 26-27 ===
select cs.companycode, c.companyname,
       count(*) scheme_count,
       min(cs.creationtime) first_created,
       max(cs.creationtime) last_created
  from codescheme cs
  join company c on c.companycode = cs.companycode
 where cs.financialyearcode = '26-27'
 group by cs.companycode, c.companyname
 order by scheme_count desc, cs.companycode;

prompt === DIWANKA EXISTING SCHEMES WITH TIMES ===
select modulecode, codescheme, creator, creationtime, tno
  from codescheme
 where companycode = '3'
   and financialyearcode = '26-27'
 order by creationtime, modulecode;

prompt === DEFAULT AUTO MODULE TEMPLATES ===
select m.modulecode, m.modulename, m.moduleshortname,
       csm.codescheme
  from codeschememaster csm
  join module m on m.modulecode = csm.modulecode
 where csm.codescheme = 'AUTO'
 order by m.modulename;

prompt === DEFAULT MODULES MISSING FOR DIWANKA ===
select csm.modulecode, m.modulename
  from codeschememaster csm
  join module m on m.modulecode = csm.modulecode
 where csm.codescheme = 'AUTO'
   and not exists (
       select 1
         from codescheme cs
        where cs.companycode = '3'
          and cs.financialyearcode = '26-27'
          and cs.modulecode = csm.modulecode)
 order by m.modulename;

prompt === DATABASE CODE THAT POPULATES CODESCHEME ===
select name, type, line, text
  from user_source
 where upper(text) like '%INSERT%INTO%C%ODESCHEME%'
    or upper(text) like '%MERGE%INTO%C%ODESCHEME%'
 order by name, type, line;

exit
