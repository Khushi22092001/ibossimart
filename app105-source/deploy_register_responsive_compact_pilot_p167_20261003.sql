whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 100
set linesize 240
connect -name IMART

prompt === Preserve the exact pre-change inline CSS for every compact register page ===
declare
  l_exists number;
begin
  select count(*) into l_exists
    from user_tables
   where table_name='IMART_REG_RESP_BAK_20261003';

  if l_exists=0 then
    execute immediate q'~create table imart_reg_resp_bak_20261003 as
      select flow_id,id page_id,name page_name,inline_css,last_updated_by,last_updated_on
        from apex_260100.wwv_flow_steps
       where flow_id=105
         and dbms_lob.instr(inline_css,'IMART_REGISTER_COMPACT_V1')>0~';
  end if;
end;
/

prompt === Pilot responsive compact rules on Material Out Register only ===
declare
  l_css clob:=q'~
/* IMART_REGISTER_RESPONSIVE_COMPACT_V2: page-scoped responsive register sizing */
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card{box-sizing:border-box!important;height:70px!important;min-height:70px!important;margin:2px 8px 0!important;padding:6px 12px 6px 14px!important;gap:9px!important;border-radius:0 0 10px 10px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card .hspl-hero-icon{width:38px!important;height:38px!important;flex:0 0 38px!important;border-radius:9px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card .hspl-hero-icon svg{width:19px!important;height:19px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card .hspl-page-title{font-size:20px!important;line-height:1.1!important;letter-spacing:-.3px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card .hspl-page-desc{margin-top:1px!important;font-size:11px!important;line-height:1.2!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card :is(.hspl-filter-trigger,.hspl-hero-add-new){min-height:34px!important;height:34px!important;padding-block:0!important;padding-inline:12px!important;border-radius:8px!important;font-size:12px!important;line-height:1!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis){margin:0 0 2px!important;padding:6px 8px!important;border-radius:10px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-grid{grid-template-columns:repeat(auto-fit,minmax(min(100%,180px),clamp(190px,18vw,252px)))!important;justify-content:start!important;gap:6px!important;min-height:0!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-inline-kpi{min-height:0!important;padding:5px 8px 4px!important;border-radius:9px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-card-body{min-height:0!important;gap:6px!important;padding:0!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-card-icon{width:24px!important;height:24px!important;border-radius:8px!important;font-size:14px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-status{margin:0!important;font-size:10px!important;line-height:1.2!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-inline-kpi strong{margin:0!important;font-size:20px!important;line-height:1!important;letter-spacing:-.3px!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-share{margin:1px 0!important;font-size:9.5px!important;line-height:1.2!important;white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-card-bottom{padding-top:3px!important;gap:5px!important;font-size:9.5px!important;line-height:1.2!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-wave{width:40px!important;height:15px!important;bottom:4px!important;opacity:.24!important}
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-method{margin-top:3px!important;font-size:10px!important;line-height:1.15!important}
@media(max-width:700px){html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card{height:auto!important;min-height:64px!important;margin-inline:4px!important;padding:6px 8px!important;flex-wrap:wrap!important}html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-grid{grid-template-columns:repeat(2,minmax(0,1fr))!important}}
@media(max-width:420px){html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-grid{grid-template-columns:1fr!important}}
~';
  l_rows number;
begin
  update apex_260100.wwv_flow_steps
     set inline_css=inline_css||chr(10)||l_css
   where flow_id=105
     and id=167
     and dbms_lob.instr(inline_css,'IMART_REGISTER_COMPACT_V1')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')=0;
  l_rows:=sql%rowcount;

  if l_rows=0 then
    select count(*) into l_rows
      from apex_260100.wwv_flow_steps
     where flow_id=105 and id=167
       and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0;
    if l_rows<>1 then
      raise_application_error(-20001,'Page 167 pilot target was not updated and has no V2 marker');
    end if;
  end if;
end;
/

declare
  l_stable_css clob:=q'~
/* IMART_REGISTER_RESPONSIVE_COMPACT_V2_STABLE: keep helper text to one compact line */
html.hspl-compact-form body:not(.t-PageBody--login) #t_Body_content :is(.coverage-register-kpis,.tx-register-kpis) .mr-kpi-share{white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css=inline_css||chr(10)||l_stable_css
   where flow_id=105 and id=167
     and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2_STABLE')=0;
end;
/

commit;

prompt === Pilot verification ===
select id page_id,name page_name,
       case when dbms_lob.instr(inline_css,'IMART_REGISTER_RESPONSIVE_COMPACT_V2')>0 then 'YES' else 'NO' end responsive_compact_v2
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=167;

select count(*) backup_pages from imart_reg_resp_bak_20261003;

exit
