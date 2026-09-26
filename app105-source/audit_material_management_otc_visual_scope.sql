whenever sqlerror exit sql.sqlcode rollback
set pagesize 200
set linesize 260
set feedback on
connect -name IMART

/* Read-only inventory for the Material Management and Order to Cash
   launcher forms. It intentionally performs no DML. */
with workflow_modules as (
  select 'MATERIAL MANAGEMENT' module_area, 'INDENT' modulecode from dual union all
  select 'MATERIAL MANAGEMENT', 'ENQUIRY' from dual union all
  select 'MATERIAL MANAGEMENT', 'QUOTATION' from dual union all
  select 'MATERIAL MANAGEMENT', 'COMPARATIVESTATEMENT' from dual union all
  select 'MATERIAL MANAGEMENT', 'RATECONTRACT' from dual union all
  select 'MATERIAL MANAGEMENT', 'PURCHASEORDER' from dual union all
  select 'MATERIAL MANAGEMENT', 'POAMENDMENT' from dual union all
  select 'MATERIAL MANAGEMENT', 'LOADINGADVICE' from dual union all
  select 'MATERIAL MANAGEMENT', 'MATERIALIN' from dual union all
  select 'MATERIAL MANAGEMENT', 'GRN' from dual union all
  select 'MATERIAL MANAGEMENT', 'FREIGHTADVICE' from dual union all
  select 'MATERIAL MANAGEMENT', 'PURCHASEBILL' from dual union all
  select 'MATERIAL MANAGEMENT', 'PBPASS' from dual union all
  select 'MATERIAL MANAGEMENT', 'PAYMENTADVICE' from dual union all
  select 'MATERIAL MANAGEMENT', 'VOUCHER' from dual union all
  select 'ORDER TO CASH', 'SALESENQUIRY' from dual union all
  select 'ORDER TO CASH', 'SALESQUOTATION' from dual union all
  select 'ORDER TO CASH', 'PORECEIPT' from dual union all
  select 'ORDER TO CASH', 'SALESORDER' from dual union all
  select 'ORDER TO CASH', 'DESPATCHADVICE' from dual union all
  select 'ORDER TO CASH', 'CCINVOICE' from dual union all
  select 'ORDER TO CASH', 'BILLRECEIPT' from dual
), workflow_pages as (
  select wm.module_area, m.modulecode, 'REGISTER' page_kind, m.pageno page_id
    from workflow_modules wm join module m on m.modulecode = wm.modulecode
  union all
  select wm.module_area, m.modulecode, 'FORM', m.entrypageno
    from workflow_modules wm join module m on m.modulecode = wm.modulecode
   where m.entrypageno is not null
)
select w.module_area,
       w.modulecode,
       w.page_kind,
       w.page_id,
       s.name page_name,
       (select count(*) from apex_260100.wwv_flow_page_plugs p
         where p.flow_id=105 and p.page_id=w.page_id and p.plug_source_type='NATIVE_IG') interactive_grids,
       (select count(*) from apex_260100.wwv_flow_page_plugs p
         where p.flow_id=105 and p.page_id=w.page_id and p.plug_source_type='NATIVE_FORM') form_regions
  from workflow_pages w
  join apex_260100.wwv_flow_steps s
    on s.flow_id=105 and s.id=w.page_id and s.security_group_id=4744311978888504
 order by w.module_area, w.modulecode, case w.page_kind when 'REGISTER' then 1 else 2 end;

/* The editable detail grids that require a visible selected-row check. */
with workflow_modules as (
  select column_value modulecode
    from table(sys.odcivarchar2list(
      'INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
      'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
      'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER',
      'SALESENQUIRY','SALESQUOTATION','PORECEIPT','SALESORDER',
      'DESPATCHADVICE','CCINVOICE','BILLRECEIPT'
    ))
), workflow_pages as (
  select pageno page_id from module where modulecode in (select modulecode from workflow_modules)
  union
  select entrypageno from module where modulecode in (select modulecode from workflow_modules) and entrypageno is not null
)
select p.page_id,
       p.plug_name grid_region,
       p.plug_display_sequence
  from apex_260100.wwv_flow_page_plugs p
 where p.flow_id=105
   and p.page_id in (select page_id from workflow_pages)
   and p.plug_source_type='NATIVE_IG'
 order by p.page_id, p.plug_display_sequence;

/* Page-local grid styling that can override the shared light selection theme. */
with workflow_modules as (
  select column_value modulecode
    from table(sys.odcivarchar2list(
      'INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
      'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
      'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER',
      'SALESENQUIRY','SALESQUOTATION','PORECEIPT','SALESORDER',
      'DESPATCHADVICE','CCINVOICE','BILLRECEIPT'
    ))
), workflow_pages as (
  select pageno page_id from module where modulecode in (select modulecode from workflow_modules)
  union
  select entrypageno from module where modulecode in (select modulecode from workflow_modules) and entrypageno is not null
)
select s.id page_id,
       s.name page_name,
       case when dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-w-scroll') > 0
            then 'YES' else 'NO' end as has_local_scroll_override,
       case when dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-cell') > 0
                 or dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-row') > 0
            then 'YES' else 'NO' end as has_local_row_cell_style,
       case when dbms_lob.instr(nvl(s.javascript_code,to_clob('')), 'a-GV-cell') > 0
                 or dbms_lob.instr(nvl(s.javascript_code,to_clob('')), 'a-GV-row') > 0
            then 'YES' else 'NO' end as has_local_grid_js
  from apex_260100.wwv_flow_steps s
 where s.flow_id=105
   and s.id in (select page_id from workflow_pages)
   and (dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-w-scroll') > 0
        or dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-cell') > 0
        or dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-row') > 0
        or dbms_lob.instr(nvl(s.javascript_code,to_clob('')), 'a-GV-cell') > 0
        or dbms_lob.instr(nvl(s.javascript_code,to_clob('')), 'a-GV-row') > 0)
 order by s.id;

exit
