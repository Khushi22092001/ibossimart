whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/*
  Home links must open the register/list page for each workflow.  This keeps
  the server-side privilege check intact and only changes the target page.
*/
declare
  l_count number;
begin
  update apex_260100.wwv_flow_processing
     set process_sql_clob = replace(
           process_sql_clob,
           'select nvl(m.entrypageno, m.pageno)',
           'select m.pageno')
   where flow_id = 105
     and process_name = 'OPEN_INBOUND_WORKFLOW_MODULE'
     and process_point = 'ON_DEMAND'
     and security_group_id = 4744311978888504
     and dbms_lob.instr(process_sql_clob, 'select nvl(m.entrypageno, m.pageno)') > 0;

  l_count := sql%rowcount;
  if l_count <> 1 then
    raise_application_error(-20001, 'Expected one workflow launcher process to update; found ' || l_count);
  end if;
end;
/

/*
  Popular Pages is activity-driven.  If the recorded visit is a form page
  (MODULE.ENTRYPAGENO), return its MODULE.PAGENO register instead.
*/
declare
  l_popular_sql clob := q'~
declare
begin
  apex_json.initialize_clob_output;
  apex_json.open_object;
  apex_json.open_array('pages');
  for r in (
    select target_page_id as page_id,
           max(page_name) keep (dense_rank last order by view_timestamp) as page_name,
           count(*) as visit_count
      from (
        select nvl((select max(m.pageno)
                      from module m
                     where m.entrypageno = a.page_id), a.page_id) as target_page_id,
               a.page_name,
               a.view_timestamp
          from apex_260100.apex_workspace_activity_log a
         where a.workspace_id = 4744311978888504
           and a.application_id = 105
           and upper(a.apex_user) = upper(v('APP_USER'))
           and a.page_id not in (0, 1)
           and a.page_name is not null
      )
     group by target_page_id
     order by count(*) desc, max(view_timestamp) desc
     fetch first 8 rows only
  ) loop
    apex_json.open_object;
    apex_json.write('pageId', r.page_id);
    apex_json.write('pageName', r.page_name);
    apex_json.write('visitCount', r.visit_count);
    apex_json.close_object;
  end loop;
  apex_json.close_array;
  apex_json.close_object;
  sys.htp.prn(apex_json.get_clob_output);
  apex_json.free_output;
end;
~';
begin
  update apex_260100.wwv_flow_processing
     set process_sql_clob = l_popular_sql
   where flow_id = 105
     and process_name = 'GET_POPULAR_PAGES'
     and process_point = 'ON_DEMAND'
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Expected one Popular Pages process to update; found ' || sql%rowcount);
  end if;
end;
/
commit;

/* Verification: every launcher module now resolves to its register page. */
select case
         when dbms_lob.instr(process_sql_clob, 'select m.pageno') > 0
          and dbms_lob.instr(process_sql_clob, 'entrypageno, m.pageno') = 0
         then 'REGISTER_TARGETS_OK'
         else 'WORKFLOW_TARGET_CHECK_FAILED'
       end as workflow_launcher_check
  from apex_260100.wwv_flow_processing
 where flow_id = 105
   and process_name = 'OPEN_INBOUND_WORKFLOW_MODULE'
   and process_point = 'ON_DEMAND'
   and security_group_id = 4744311978888504;

select case
         when dbms_lob.instr(process_sql_clob, 'where m.entrypageno = a.page_id') > 0
         then 'POPULAR_PAGES_REGISTER_MAPPING_OK'
         else 'POPULAR_PAGES_MAPPING_CHECK_FAILED'
       end as popular_pages_check
  from apex_260100.wwv_flow_processing
 where flow_id = 105
   and process_name = 'GET_POPULAR_PAGES'
   and process_point = 'ON_DEMAND'
   and security_group_id = 4744311978888504;

select modulecode, pageno as register_page, entrypageno as form_page
  from module
 where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                      'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                      'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
 order by modulecode;

exit
