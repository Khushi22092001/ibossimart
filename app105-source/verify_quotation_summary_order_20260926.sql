whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 50 linesize 180
select name, item_sequence
  from apex_260100.wwv_flow_step_items
 where flow_id=105 and flow_step_id=710
   and name in ('P710_SUMOFAMOUNT','P710_SUMOFFOOTERAMOUNT','P710_QUOTATIONAMOUNT')
 order by item_sequence;
exit
