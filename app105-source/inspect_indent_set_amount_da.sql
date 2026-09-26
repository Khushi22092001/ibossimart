set pagesize 100 linesize 260 long 20000 longchunksize 20000
connect -name IMART
select * from apex_260100.wwv_flow_page_da_events where id=38654365607424864 and flow_id=105;
select * from apex_260100.wwv_flow_page_da_actions where id=38654885063424864 and flow_id=105;
exit
