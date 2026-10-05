whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 100
set linesize 240
connect -name IMART

prompt === Preserve exact current inline CSS before restoring the prior card ===
declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_REG_PREVCARD_BAK_20261005';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_prevcard_bak_20261005 as
      select flow_id,id page_id,name page_name,inline_css,last_updated_by,last_updated_on
        from apex_260100.wwv_flow_steps
       where flow_id=105
         and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')>0~';
  end if;
end;
/

prompt === Pilot: remove only the exact latest V3 card regression ===
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
   where flow_id=105 and id=711
     and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')=0;
  l_rows:=sql%rowcount;
  if l_rows<>1 then raise_application_error(-20001,'Page 711 exact V3 pilot target mismatch'); end if;
end;
/

commit;

prompt === Pilot verification ===
select id page_id,name page_name,
       case when dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')=0 then 'YES' else 'NO' end latest_v3_removed,
       case when dbms_lob.instr(inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')>0 then 'YES' else 'NO' end stable_layout_v4
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=711;

select count(*) backup_pages from imart_reg_prevcard_bak_20261005;
exit
