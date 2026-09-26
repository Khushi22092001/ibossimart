whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 300
set long 200000
connect -name IMART

prompt === MODULELOCATION COLUMNS ===
select column_id, column_name, data_type
  from user_tab_columns
 where table_name = 'MODULELOCATION'
 order by column_id;

prompt === DIWANKA MODULELOCATION ROWS ===
select * from modulelocation where companycode = '3' order by modulecode;

prompt === MODULELOCATIONAI SOURCE ===
select line, text from user_source where name = 'MODULELOCATIONAI' order by line;

prompt === IRONMART MODULE SET VS MODULE MASTER ===
select count(*) total_modules,
       sum(case when locationapplied = 'YES' then 1 else 0 end) location_applied_yes,
       sum(case when locationapplied = 'NO' then 1 else 0 end) location_applied_no
  from module;
select m.locationapplied,
       count(*) module_count,
       sum(case when ml.modulecode is not null then 1 else 0 end) in_ironmart_modulelocation
  from module m
  left join modulelocation ml
    on ml.modulecode = m.modulecode and ml.companycode = '1'
 group by m.locationapplied
 order by m.locationapplied;

prompt === IRONMART MODULELOCATIONS NOT IN DEFAULT TEMPLATE ===
select ml.modulecode, m.modulename, m.locationapplied
  from modulelocation ml
  join module m on m.modulecode = ml.modulecode
 where ml.companycode = '1'
   and not exists (
       select 1 from codeschememaster csm
        where csm.modulecode = ml.modulecode and csm.codescheme = 'AUTO')
 order by m.modulename;

exit
