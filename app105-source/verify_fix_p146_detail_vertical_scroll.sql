set heading off
set feedback off
set pagesize 0
set trimspool on
connect -name IMART

select case
         when dbms_lob.instr(inline_css, 'GRN Detail: remove only the unnecessary inner vertical scroll.') > 0
           then 'P146_DETAIL_VERTICAL_SCROLL_CSS_PRESENT'
         else 'P146_DETAIL_VERTICAL_SCROLL_CSS_MISSING'
       end
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146
   and security_group_id = 4744311978888504;

exit
