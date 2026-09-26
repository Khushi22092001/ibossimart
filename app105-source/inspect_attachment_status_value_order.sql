set pagesize 100 linesize 180 feedback off verify off heading on
select page_id
  from apex_260100.wwv_flow_worksheets
 where flow_id = 105
   and security_group_id = 4744311978888504
   and regexp_like(detail_link, '#SNO#,' || chr(38) || 'P[0-9]+_FORMSTATUS[.]$')
 order by page_id;
exit
