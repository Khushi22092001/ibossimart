set define off
set sqlformat csv
connect -name IMART
spool app105-source/verification/transaction-module-types-20261003.csv
select column_name,data_type from user_tab_columns where table_name='MODULE' and (column_name like '%TYPE%' or column_name like '%DATE%' or column_name like '%TRAN%' or column_name like '%NATURE%' or column_name like '%DOCUMENT%');
select p.page_id,s.name page_name,p.static_id from apex_260100.wwv_flow_page_plugs p join apex_260100.wwv_flow_steps s on s.flow_id=p.flow_id and s.id=p.page_id where p.flow_id=105 and p.static_id like 'mr-kpi-shell-%' and exists(select 1 from apex_260100.wwv_flow_step_items i where i.flow_id=105 and i.flow_step_id=p.page_id and regexp_like(i.name,'^P[0-9]+_FROM_?DATE$'));
spool off
exit
