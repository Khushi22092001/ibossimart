whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 200
set linesize 240
connect -name IMART

declare
  l_exists number;
begin
  select count(*) into l_exists
    from user_tables
   where table_name='IMART_REG_GAP_STEP_BAK_20261003';

  if l_exists=0 then
    execute immediate q'~create table imart_reg_gap_step_bak_20261003 as
      select *
        from apex_260100.wwv_flow_steps
       where flow_id=105
         and dbms_lob.instr(inline_css,'IMART_REGISTER_COMPACT_V1')>0~';
  end if;
end;
/

declare
  l_css clob:=q'~/* IMART_REGISTER_GAP_3PX_V1: page-scoped register spacing */
body:not(.t-PageBody--login) #t_Body_title.t-Body-title.hspl-hero-card{
  margin-top:2px!important;margin-bottom:0!important;padding-top:8px!important;padding-bottom:8px!important
}
body:not(.t-PageBody--login) #t_Body_content .t-Body-contentInner{padding-top:2px!important}
body:not(.t-PageBody--login) .coverage-register-kpis,
body:not(.t-PageBody--login) .tx-register-kpis{margin-bottom:2px!important}
body:not(.t-PageBody--login) .t-Body-contentInner .row:has(.imart-register-data){
  margin-top:0!important;padding-top:0!important
}
body:not(.t-PageBody--login) #t_Body_content .t-Body-contentInner div.t-IRR-region.imart-register-data{margin-top:0!important}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css=inline_css||chr(10)||l_css
   where flow_id=105
     and dbms_lob.instr(inline_css,'IMART_REGISTER_COMPACT_V1')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_GAP_3PX_V1')=0;

  dbms_output.put_line('UPDATED_PAGES='||sql%rowcount);
end;
/

commit;

select count(*) scoped_gap_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105
   and dbms_lob.instr(inline_css,'IMART_REGISTER_GAP_3PX_V1')>0;

select count(*) application_static_asset_changes
  from apex_260100.wwv_flow_files
 where flow_id=105
   and filename like '%IMART_REGISTER_GAP_3PX_V1%';

exit
