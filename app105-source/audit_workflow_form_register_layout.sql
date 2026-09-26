set pagesize 200
set linesize 260
set feedback on
connect -name IMART

/* Read-only audit for the workflow launcher modules and their paired pages. */
with workflow_pages as (
  select modulecode, pageno as page_id, 'REGISTER' as page_kind
    from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                        'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                        'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
  union all
  select modulecode, entrypageno, 'FORM'
    from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                        'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                        'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
     and entrypageno is not null
)
select w.modulecode,
       w.page_kind,
       w.page_id,
       (select count(*)
          from apex_260100.wwv_flow_page_plugs p
         where p.flow_id = 105
           and p.page_id = w.page_id
           and p.plug_source_type = 'NATIVE_IG') as interactive_grids,
       (select count(*)
          from apex_260100.wwv_flow_page_plugs p
         where p.flow_id = 105
           and p.page_id = w.page_id
           and lower(nvl(p.plug_name, '-')) in ('tabs', 'tabcontainer')) as tab_containers,
       case when dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'margin-top') > 0
            then 'YES' else 'NO' end as page_has_gap_css,
       case when dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'overflow-y: hidden') > 0
            then 'YES' else 'NO' end as page_hides_vertical_grid_scroll,
       case when dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'overflow-x: scroll') > 0
            then 'YES' else 'NO' end as page_forces_horizontal_grid_scroll,
       case when dbms_lob.instr(nvl(s.javascript_code, to_clob('')), 'HORIZONTAL') > 0
            then 'YES' else 'NO' end as page_has_horizontal_sync_js
  from workflow_pages w
  join apex_260100.wwv_flow_steps s
    on s.flow_id = 105
   and s.id = w.page_id
   and s.security_group_id = 4744311978888504
 order by w.modulecode, case w.page_kind when 'REGISTER' then 1 else 2 end;

/* Interactive Grid regions that need visual scrollbar review. */
with workflow_pages as (
  select pageno as page_id from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                        'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                        'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
  union
  select entrypageno from module
   where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                        'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                        'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
     and entrypageno is not null
)
select p.page_id,
       p.plug_name as grid_region,
       p.plug_display_sequence
  from apex_260100.wwv_flow_page_plugs p
 where p.flow_id = 105
   and p.page_id in (select page_id from workflow_pages)
   and p.plug_source_type = 'NATIVE_IG'
 order by p.page_id, p.plug_display_sequence;

exit
