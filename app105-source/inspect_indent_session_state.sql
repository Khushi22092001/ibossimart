whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
set pages 100
set lines 1000
connect -name IMART

begin
  apex_session.attach(
    p_app_id     => 105,
    p_page_id    => 108,
    p_session_id => 16540462682742);
end;
/

select nvl(apex_util.get_session_state('P108_TNO'), '<NULL>') as p108_tno,
       nvl(apex_util.get_session_state('P108_FORMSTATUS'), '<NULL>') as p108_formstatus,
       nvl(apex_util.get_session_state('P108_ATTACHMENT_TNO'), '<NULL>') as p108_attachment_tno
  from dual;

begin
  apex_session.detach;
end;
/

exit
