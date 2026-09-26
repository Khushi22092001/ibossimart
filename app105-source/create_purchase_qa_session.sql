whenever sqlerror exit failure rollback
set define off
set serveroutput on size unlimited
set heading off feedback off pagesize 0 verify off echo off
connect -name IMART

declare
  l_company_code varchar2(100);
  l_company_name varchar2(500);
  l_fy_code varchar2(100);
  l_fy_begin varchar2(100);
  l_fy_end varchar2(100);
  l_boss_code varchar2(100);
begin
  select to_char(companycode), companyname
    into l_company_code, l_company_name
    from company
   where upper(companyname) like '%IRONMART%'
   fetch first 1 row only;

  select to_char(financialyearcode),
         to_char(financialyearbegin,'DD-MM-YYYY'),
         to_char(financialyearend,'DD-MM-YYYY')
    into l_fy_code, l_fy_begin, l_fy_end
    from financialyear
   where date '2026-09-24' between financialyearbegin and financialyearend
   fetch first 1 row only;

  select to_char(bossusercode)
    into l_boss_code
    from bossuser
   where upper(bossusername) = 'BOSS'
   fetch first 1 row only;

  apex_session.create_session(p_app_id=>105,p_page_id=>934,p_username=>'BOSS');
  apex_util.set_session_state('GLOBAL_COMPANYCODE',l_company_code);
  apex_util.set_session_state('GLOBAL_COMPANYNAME',l_company_name);
  apex_util.set_session_state('GLOBAL_FINANCIALYEARCODE',l_fy_code);
  apex_util.set_session_state('GLOBAL_FINANCIALYEARBEGIN',l_fy_begin);
  apex_util.set_session_state('GLOBAL_FINANCIALYEAREND',l_fy_end);
  apex_util.set_session_state('GLOBAL_BOSSUSERCODE',l_boss_code);
  apex_util.set_session_state('GLOBAL_BOSSUSERNAME','BOSS');
  commit;
  dbms_output.put_line(v('APP_SESSION'));
end;
/
exit
