set pagesize 200
set linesize 240
connect -name IMART

with workflow_pages as (
  select modulecode, pageno as page_id, 'REGISTER' as page_kind from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT','PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN','FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
  union all
  select modulecode, entrypageno, 'FORM' from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT','PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN','FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
     and entrypageno is not null
), grid_pages as (
  select distinct page_id from apex_260100.wwv_flow_page_plugs
   where flow_id = 105 and plug_source_type = 'NATIVE_IG'
     and page_id in (select page_id from workflow_pages)
)
select w.modulecode, w.page_kind, w.page_id,
       case when dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'WORKFLOW_LAYOUT_STANDARD_GAP_V1') > 0
                 or dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'P142_PURCHASE_BILL_REPORT_TOOLBAR_GAP_V1') > 0
                 or dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'P143_DETAIL_HORIZONTAL_SCROLL_AND_TAB_GAP_V1') > 0
            then 'OK' else 'MISSING' end as gap_status,
       case when g.page_id is null then 'N/A'
            when dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'overflow-y: hidden') > 0
             and dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'overflow-x: scroll') > 0 then 'OK'
            else 'MISSING' end as scroll_status,
       case when g.page_id is null then 'N/A'
            when dbms_lob.instr(nvl(s.javascript_code, to_clob('')), 'HORIZONTAL') > 0 then 'OK'
            else 'MISSING' end as sync_status
  from workflow_pages w
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105 and s.id = w.page_id and s.security_group_id = 4744311978888504
  left join grid_pages g on g.page_id = w.page_id
 order by w.modulecode, w.page_kind;

exit
