whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 100
set linesize 240
connect -name IMART

prompt === Preserve the exact pre-change inline CSS for every responsive compact register ===
declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_REG_KPICTA_BAK_20261003';
  if l_exists=0 then
    execute immediate q'~create table imart_reg_kpicta_bak_20261003 as
      select flow_id,id page_id,name page_name,inline_css,last_updated_by,last_updated_on
        from apex_260100.wwv_flow_steps
       where flow_id=105
         and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0~';
  end if;
end;
/

prompt === Pilot: remove redundant KPI CTA footer on Comparative Statement Register ===
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
   where flow_id=105 and id=711
     and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')=0;
  l_rows:=sql%rowcount;
  if l_rows=0 then
    select count(*) into l_rows
      from apex_260100.wwv_flow_steps
     where flow_id=105 and id=711
       and dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')>0;
    if l_rows<>1 then raise_application_error(-20001,'Page 711 CTA pilot was not applied'); end if;
  end if;
end;
/

commit;

select id page_id,name page_name,
       case when dbms_lob.instr(inline_css,'IMART_REGISTER_KPI_CTA_REMOVED_V3')>0 then 'YES' else 'NO' end cta_removed_v3
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=711;

select count(*) backup_pages from imart_reg_kpicta_bak_20261003;
exit
