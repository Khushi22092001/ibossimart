whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on size unlimited
connect -name IMART

prompt This rollback is intentionally not executed by deployment.
prompt It restores only INLINE_CSS from the exact pre-V4 backup.

declare
  l_exists number;
begin
  select count(*) into l_exists from user_tables where table_name='IMART_REG_PREVCARD_BAK_20261005';
  if l_exists<>1 then raise_application_error(-20001,'Previous-card backup table is missing'); end if;

  update apex_260100.wwv_flow_steps s
     set s.inline_css=(select b.inline_css
                         from imart_reg_prevcard_bak_20261005 b
                        where b.flow_id=s.flow_id and b.page_id=s.id)
   where s.flow_id=105
     and exists(select 1
                  from imart_reg_prevcard_bak_20261005 b
                 where b.flow_id=s.flow_id and b.page_id=s.id)
     and dbms_lob.instr(s.inline_css,'IMART_REGISTER_PREVIOUS_CARD_STABLE_V4')>0;
  dbms_output.put_line('PREVIOUS_CARD_V4_PAGES_ROLLED_BACK='||sql%rowcount);
end;
/

commit;
exit
