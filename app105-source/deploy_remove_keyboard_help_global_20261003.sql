whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 200
set linesize 240
connect -name IMART

declare
  l_exists number;
  l_page_count number;
begin
  select count(*) into l_page_count
    from apex_260100.wwv_flow_steps
   where flow_id=105 and id=0;

  if l_page_count<>1 then
    raise_application_error(-20001,'Application 105 Global Page mismatch');
  end if;

  select count(*) into l_exists
    from user_tables
   where table_name='IMART_KEYHELP_P0_BAK_20261003';

  if l_exists=0 then
    execute immediate q'~create table imart_keyhelp_p0_bak_20261003 as
      select flow_id,id,name,inline_css
        from apex_260100.wwv_flow_steps
       where flow_id=105 and id=0~';
  end if;
end;
/

declare
  l_css clob:=q'~/* IMART_HIDE_KEYBOARD_HELP_V1: explicitly removed application-wide */
#hspl-keyboard-help{display:none!important}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css=case when inline_css is null then l_css else inline_css||chr(10)||l_css end
   where flow_id=105
     and id=0
     and dbms_lob.instr(nvl(inline_css,to_clob(' ')),'IMART_HIDE_KEYBOARD_HELP_V1')=0;

  dbms_output.put_line('UPDATED_GLOBAL_PAGES='||sql%rowcount);
end;
/

commit;

select count(*) hide_rule_count
  from apex_260100.wwv_flow_steps
 where flow_id=105
   and id=0
   and dbms_lob.instr(inline_css,'IMART_HIDE_KEYBOARD_HELP_V1')>0;

exit
