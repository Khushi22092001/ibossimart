set pagesize 500
set linesize 260
set trimspool on
set feedback on
set verify off
connect -name IMART

begin
  apex_session.attach(
    p_app_id     => 105,
    p_page_id    => 1,
    p_session_id => 22102041901353
  );
end;
/

column boss_user format a20
column company_code format a20
select v('GLOBAL_BOSSUSERCODE') boss_user,
       v('GLOBAL_COMPANYCODE') company_code
  from dual;

column menu_path format a90
column myboxkey format a28
column parentkey format a28
column iconname format a28
select level tree_level,
       lpad(' ',2*(level-1)) || myboxlabel menu_path,
       pageno,
       myboxkey,
       parentkey,
       iconname,
       serialno
  from myboxtree_apexmenu
 where bossusercode = v('GLOBAL_BOSSUSERCODE')
   and companycode = v('GLOBAL_COMPANYCODE')
 start with parentkey = 'ROOT'
connect by prior myboxkey = parentkey
       and prior bossusercode = bossusercode
       and prior companycode = companycode
 order siblings by serialno;

begin
  apex_session.detach;
end;
/

exit
