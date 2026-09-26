set pagesize 200 linesize 420 trimspool on feedback off verify off heading on
column page_id format 99999
column old_link format a180
column new_link format a220

select page_id,
       detail_link old_link,
       regexp_replace(
         detail_link,
         '^(.*:1063:)([^:]+):(.*)$',
         '\1\2,P1063_PARENT_FORMSTATUS:\3,' || chr(38) || 'P' || page_id || '_FORMSTATUS.') new_link
  from apex_260100.wwv_flow_worksheets
 where flow_id = 105
   and security_group_id = 4744311978888504
   and instr(detail_link, ':1063:') > 0
 order by page_id;

exit
