whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 100
set linesize 240
connect -name IMART

prompt === Validate the exact pre-change backup ===
declare
  l_exists number;
  l_rows number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_REG_KPICTA_BAK_20261003';
  if l_exists<>1 then raise_application_error(-20001,'KPI CTA backup table is missing'); end if;
  select count(*) into l_rows from imart_reg_kpicta_bak_20261003;
  if l_rows=0 then raise_application_error(-20002,'KPI CTA backup table is empty'); end if;
end;
/

prompt === Remove redundant KPI CTA footer from remaining responsive compact registers ===
declare
  l_css clob:=q'~
/* IMART_REGISTER_KPI_CTA_REMOVED_V3: complete KPI card remains the click target */
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-card-bottom{display:none!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-inline-kpi{padding-block:5px!important}
~';
  l_rows number;
begin
  update apex_260100.wwv_flow_steps
     set inline_css=inline_css||chr(10)||l_css
   where flow_id=105
     and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')=0;
  l_rows:=sql%rowcount;
  dbms_output.put_line('KPI_CTA_REMOVED_PAGES_UPDATED='||l_rows);
end;
/

commit;

prompt === Rollout verification ===
select count(*) responsive_compact_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0;

select count(*) cta_removed_v3_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')>0;

select count(*) missing_v3_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105
   and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0
   and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')=0;
exit
