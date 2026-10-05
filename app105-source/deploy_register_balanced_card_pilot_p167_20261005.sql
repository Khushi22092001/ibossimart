whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 100
set linesize 240
connect -name IMART

prompt === Create exact pre-V5 backup once ===
declare
  l_exists number;
begin
  select count(*) into l_exists
    from user_tables
   where table_name='IMART_REG_BALCARD_BAK_20261005';

  if l_exists=0 then
    execute immediate q'~
      create table imart_reg_balcard_bak_20261005 as
      select flow_id, id page_id, inline_css
        from apex_260100.wwv_flow_steps
       where flow_id=105
         and dbms_lob.instr(inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')>0
    ~';
  end if;
end;
/

prompt === Apply card-only balanced sizing to pilot page 167 ===
declare
  l_v5 clob:=q'~
/* IMART_REGISTER_BALANCED_CARD_V5: card-only approved balanced sizing */
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-grid{grid-template-columns:repeat(auto-fit,270px)!important;grid-auto-columns:270px!important;justify-content:start!important;align-items:start!important;gap:8px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-inline-kpi{box-sizing:border-box!important;width:270px!important;min-width:270px!important;max-width:270px!important;height:82px!important;min-height:82px!important;max-height:82px!important;padding:8px 10px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-card-icon{width:26px!important;height:26px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-inline-kpi strong{font-size:22px!important}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css=inline_css||chr(10)||l_v5
   where flow_id=105
     and id=167
     and dbms_lob.instr(inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_BALANCED_CARD_V5')=0;
  dbms_output.put_line('PILOT_PAGES_UPDATED='||sql%rowcount);
end;
/

commit;

select case when dbms_lob.instr(inline_css,'IMART_REGISTER_BALANCED_CARD_V5')>0
            then 'YES' else 'NO' end balanced_card_v5
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=167;
exit
