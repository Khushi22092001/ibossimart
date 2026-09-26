whenever sqlerror exit sql.sqlcode rollback
set define off pagesize 100 linesize 260
connect -name IMART

select id page_id,
       case when dbms_lob.instr(javascript_code,'HSPL_PHASE1_FORM_CALC_SAFE_V1')>0
            then 'OK' else 'MISSING' end runtime,
       case when id<>708 or (dbms_lob.instr(javascript_code,'R179881005997839575')>0
                         and dbms_lob.instr(javascript_code,'B40530680715907070')>0)
            then 'OK' else 'MISSING' end live_binding
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id in (108,708,710)
   and security_group_id=4744311978888504
 order by id;

select page_id,name,triggering_element,nvl(display_when_type,'ENABLED') display_status
  from apex_260100.wwv_flow_page_da_events
 where flow_id=105
   and ((page_id=108 and name='Set Amount') or (page_id=710 and name='set amount'))
 order by page_id;

select case when dbms_lob.instr(process_sql_clob,
                  'AMOUNT=nvl(:INDENTQUANTITY1,0) * nvl(:RATE,0)')>0
            then 'OK' else 'MISSING' end indent_server_amount
  from apex_260100.wwv_flow_step_processing
 where flow_id=105 and flow_step_id=108
   and process_name='Item Detail - Save Interactive Grid Data';

select count(*) decimal_footer_actions
  from apex_260100.wwv_flow_page_da_actions
 where flow_id=105 and page_id=710
   and id in (41135801765923806,41137529958923806)
   and dbms_lob.instr(attributes,'parseFloat')>0
   and dbms_lob.instr(attributes,'parseInt')=0;

select count(*) changed_pages
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id in (108,708,710)
   and dbms_lob.instr(javascript_code,'HSPL_PHASE1_FORM_CALC_SAFE_V1')>0;
exit
