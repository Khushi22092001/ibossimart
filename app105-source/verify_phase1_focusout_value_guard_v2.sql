whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 200 linesize 300
connect -name IMART

select id page_id,
       case when dbms_lob.instr(javascript_code,
              'HSPL_PHASE1_UNCHANGED_FOCUS_GUARD_V2')>0 then 'OK' else 'MISSING' end guard_status
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id in (108,710)
   and security_group_id=4744311978888504
 order by id;

select page_id,count(*) guarded_actions
  from apex_260100.wwv_flow_page_da_actions
 where flow_id=105
   and security_group_id=4744311978888504
   and client_condition_type='JAVASCRIPT_EXPRESSION'
   and client_condition_expression like 'window.hsplPhase1WasEdited(this)%'
   and id in (
       38674977479424870,38675816645424870,38676751442424870,
       38677667579424870,38685440064424873,38686357986424873,
       38687277287424873,38689969188424874,38694503624424875,
       38696787679424876,38696237413424875,38697635604424876,
       38698594956424876,41133498461923805,41133945231923805,
       41134826836923806,41135801765923806,41168478745923814,
       41168971108923814,41169483388923814)
 group by page_id order by page_id;

select page_id,bind_event_type,count(*) event_count
  from apex_260100.wwv_flow_page_da_events
 where flow_id=105
   and security_group_id=4744311978888504
   and ((page_id=108 and id in (
          38674434078424870,38675385466424870,38676216658424870,
          38677161981424870,38685015215424872,38685850495424873,
          38686755567424873,38689496568424874,38693986569424875,
          38695799794424875,38697214257424876,38698059739424876))
     or (page_id=710 and id in (
          41132957840923805,41134401336923805,41135242887923806,
          41168016454923814)))
 group by page_id,bind_event_type order by page_id,bind_event_type;

select count(*) unsafe_change_events
  from apex_260100.wwv_flow_page_da_events
 where flow_id=105
   and security_group_id=4744311978888504
   and bind_event_type='change'
   and id in (
       38674434078424870,38675385466424870,38676216658424870,
       38677161981424870,38685015215424872,38685850495424873,
       38686755567424873,38689496568424874,38693986569424875,
       38695799794424875,38697214257424876,38698059739424876,
       41132957840923805,41134401336923805,41135242887923806,
       41168016454923814);

exit
