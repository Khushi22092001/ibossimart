whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 100
set linesize 240
connect -name IMART

prompt === Validate exact current-state backup ===
declare
  l_exists number;
  l_rows number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_REG_PREVCARD_BAK_20261005';
  if l_exists<>1 then raise_application_error(-20001,'Previous-card backup table is missing'); end if;
  select count(*) into l_rows from imart_reg_prevcard_bak_20261005;
  if l_rows=0 then raise_application_error(-20002,'Previous-card backup table is empty'); end if;
end;
/

prompt === Remove only exact V3 and add only immediate-grid fixed tracks ===
declare
  l_v3 clob:=q'~
/* IMART_REGISTER_KPI_CTA_REMOVED_V3: complete KPI card remains the click target */
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-card-bottom{display:none!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-inline-kpi{padding-block:5px!important}
~';
  l_layout clob:=q'~
/* IMART_REGISTER_PREVIOUS_CARD_STABLE_V4: layout-only fixed track for restored V2 cards */
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-grid{grid-template-columns:repeat(auto-fit,252px)!important;grid-auto-columns:252px!important;justify-content:start!important;align-items:start!important;gap:6px!important}
~';
  l_rows number;
begin
  update apex_260100.wwv_flow_steps
     set inline_css=replace(inline_css,l_v3,'')||chr(10)||l_layout
   where flow_id=105
     and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')=0;
  l_rows:=sql%rowcount;
  dbms_output.put_line('PREVIOUS_CARD_PAGES_RESTORED='||l_rows);
end;
/

commit;

prompt === Rollout verification ===
select count(*) responsive_compact_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0;

select count(*) remaining_v3_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')>0;

select count(*) stable_v4_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and dbms_lob.instr(inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')>0;

select count(*) missing_v4_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105
   and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0
   and dbms_lob.instr(inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')=0;
exit
