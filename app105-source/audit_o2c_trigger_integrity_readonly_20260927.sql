whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 320 long 20000 longchunksize 20000 trimspool on feedback on verify off

prompt === O2C DETAIL/FOOTER TABLE TRIGGERS ===
select t.owner,t.table_name,t.trigger_name,t.triggering_event,t.trigger_type,t.status,
       case when exists (select 1 from all_source s
                         where s.owner=t.owner and s.type='TRIGGER' and s.name=t.trigger_name
                           and regexp_like(s.text,'(^|[[:space:]])commit[[:space:]]*;','i')) then 'Y' else 'N' end has_commit,
       case when exists (select 1 from all_source s
                         where s.owner=t.owner and s.type='TRIGGER' and s.name=t.trigger_name
                           and regexp_like(s.text,'insert[[:space:]]+into|update[[:space:]]+|delete[[:space:]]+from','i')) then 'Y' else 'N' end has_dml,
       case when exists (select 1 from all_source s
                         where s.owner=t.owner and s.type='TRIGGER' and s.name=t.trigger_name
                           and regexp_like(s.text,'amount|footer|total|tax|rate|quantity','i')) then 'Y' else 'N' end calculation_signal
  from all_triggers t
 where upper(table_name) in (
   'POAMENDMENT','POAMENDMENTDETAIL','POAMENDMENTDETAILFOOTER',
   'SALESORDER','SALESORDERDETAIL','SALESORDERDETAILFOOTER',
   'SALESENQUIRY','SALESENQUIRYDETAIL','SALESENQUIRYDETAILFOOTER',
   'SALESQUOTATION','SALESQUOTATIONDETAIL','SALESQUOTATIONDETAILFOOTER',
   'PORECEIPT','PORECEIPTDETAIL','PORECEIPTDETAILFOOTER',
   'CCINVOICE','CCINVOICEDETAIL','CCINVOICEDETAILFOOTER',
   'BILLRECEIPT','BILLRECEIPTDETAIL')
 order by table_name,trigger_name;

prompt === O2C KEY / RELATIONSHIP CONSTRAINTS ===
select ac.owner,ac.table_name,ac.constraint_name,ac.constraint_type,ac.status,
       listagg(acc.column_name,',') within group(order by acc.position) columns
  from all_constraints ac
  left join all_cons_columns acc on acc.owner=ac.owner and acc.constraint_name=ac.constraint_name
 where ac.table_name in (
   'POAMENDMENT','POAMENDMENTDETAIL','POAMENDMENTDETAILFOOTER',
   'SALESORDER','SALESORDERDETAIL','SALESORDERDETAILFOOTER',
   'SALESENQUIRY','SALESENQUIRYDETAIL','SALESENQUIRYDETAILFOOTER',
   'SALESQUOTATION','SALESQUOTATIONDETAIL','SALESQUOTATIONDETAILFOOTER',
   'PORECEIPT','PORECEIPTDETAIL','PORECEIPTDETAILFOOTER',
   'CCINVOICE','CCINVOICEDETAIL','CCINVOICEDETAILFOOTER',
   'BILLRECEIPT','BILLRECEIPTDETAIL')
 group by ac.owner,ac.table_name,ac.constraint_name,ac.constraint_type,ac.status
 order by ac.table_name,ac.constraint_type,ac.constraint_name;

exit
