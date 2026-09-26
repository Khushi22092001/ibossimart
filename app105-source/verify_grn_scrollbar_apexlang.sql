set heading off
set feedback off
set pagesize 0
set trimspool on
connect -name IMART

select case
         when dbms_lob.instr(inline_css, 'GRN Detail has many entry columns') > 0
          and dbms_lob.instr(inline_css, 'html.page-146 #GrnDetail_ig .a-GV-w-scroll') > 0
           then 'P146_GRN_HORIZONTAL_ONLY_SCROLLBAR_APEXLANG_IMPORT_OK'
         else 'P146_GRN_SCROLLBAR_APEXLANG_IMPORT_MISSING'
       end
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146
   and security_group_id = 4744311978888504;

exit
