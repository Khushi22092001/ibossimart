whenever sqlerror exit sql.sqlcode rollback
set pagesize 500
set linesize 240
set trimspool on
connect -name IMART

/* Read-only: Item-code Popup LOV editors whose HTML DOM ID is blank.
   This is the same configuration signature as the visually confirmed P708
   floating editor.  It is a review cohort, not an assertion of a defect. */
select c.page_id,
       c.page_name,
       c.region_name,
       c.name column_name,
       c.heading,
       ig.is_editable,
       ig.fixed_row_height,
       ig.fixed_header,
       c.item_width,
       c.item_height,
       c.html_dom_id,
       case
         when c.page_id in (69,108,118,130,138,143,146,148,150,152,155,
                            159,161,168,171,179,181,184,189,195,202,208,
                            213,221,223,274,708,710,712,714)
           then 'P2P / O2C PRIORITY'
         when c.page_id in (59,13,53,100)
           then 'MASTER PRIORITY'
         else 'OTHER APP FORM'
       end audit_scope
  from apex_260100.apex_appl_page_ig_columns c
  join apex_260100.apex_appl_page_igs ig
    on ig.application_id = c.application_id
   and ig.page_id = c.page_id
   and ig.region_id = c.region_id
 where c.application_id = 105
   and c.name = 'ITEMCODE'
   and c.item_type = 'NATIVE_POPUP_LOV'
   and c.html_dom_id is null
 order by audit_scope, c.page_id, c.region_name;

/* The user's requested Procure-to-Pay and Order-to-Cash scope, resolved from
   the live module catalogue (entry forms only). */
with requested_modules as (
  select column_value modulecode
    from table(sys.odcivarchar2list(
      'INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
      'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
      'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER',
      'SALESENQUIRY','SALESQUOTATION','PORECEIPT','SALESORDER',
      'DESPATCHADVICE','CCINVOICE','BILLRECEIPT'
    ))
), requested_pages as (
  select m.modulecode, m.entrypageno page_id
    from module m join requested_modules r on r.modulecode=m.modulecode
   where m.entrypageno is not null
)
select rp.modulecode,
       c.page_id,
       c.page_name,
       c.region_name,
       c.html_dom_id,
       ig.fixed_row_height,
       'VISUAL REVIEW REQUIRED' audit_status
  from requested_pages rp
  join apex_260100.apex_appl_page_ig_columns c
    on c.application_id=105 and c.page_id=rp.page_id
  join apex_260100.apex_appl_page_igs ig
    on ig.application_id=c.application_id
   and ig.page_id=c.page_id
   and ig.region_id=c.region_id
 where c.name='ITEMCODE'
   and c.item_type='NATIVE_POPUP_LOV'
   and c.html_dom_id is null
 order by rp.modulecode, c.page_id, c.region_name;

exit
