whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 200
set linesize 240
connect -name IMART

declare
  l_css clob:=q'~/* IMART_REGISTER_GAP_3PX_V2: specificity correction, page-scoped */
body:not(.t-PageBody--login) #t_Body_content .t-Body-contentInner{padding-top:2px!important}
body:not(.t-PageBody--login) #t_Body_content .t-Body-contentInner div.t-IRR-region.imart-register-data{margin-top:0!important}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css=inline_css||chr(10)||l_css
   where flow_id=105
     and dbms_lob.instr(inline_css,'IMART_REGISTER_GAP_3PX_V1')>0
     and dbms_lob.instr(inline_css,'IMART_REGISTER_GAP_3PX_V2')=0;

  dbms_output.put_line('UPDATED_PAGES='||sql%rowcount);
end;
/

commit;

select count(*) scoped_gap_v2_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105
   and dbms_lob.instr(inline_css,'IMART_REGISTER_GAP_3PX_V2')>0;

exit
