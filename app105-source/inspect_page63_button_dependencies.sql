set pagesize 500 linesize 300 trimspool on feedback off verify off heading on
column table_name format a40
column column_name format a40
column constraint_name format a45

select c.owner, c.table_name, cc.column_name, c.constraint_name, c.delete_rule
  from all_constraints c
  join all_cons_columns cc
    on cc.owner = c.owner and cc.constraint_name = c.constraint_name
 where c.constraint_type = 'R'
   and c.r_owner = 'APEX_260100'
   and c.r_constraint_name in (
       select constraint_name
         from all_constraints
        where owner = 'APEX_260100'
          and table_name = 'WWV_FLOW_STEP_BUTTONS'
          and constraint_type in ('P','U'))
 order by c.table_name, cc.position;

select id, flow_id, flow_step_id, button_name, button_position,
       button_sequence, button_action, database_action
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 63
 order by button_sequence, button_name;

exit
