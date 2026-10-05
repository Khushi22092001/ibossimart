whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 260
connect -name IMART

prompt === FINAL RECEIPT LINK COLUMNS ===
select table_name,column_id,column_name,data_type
  from user_tab_columns
 where table_name in('INVOICE','DFREIGHTBILLRECEIPT','DFREIGHTBILLRECEIPTDETAIL')
   and (column_name='TNO' or column_name like '%MODULE%' or column_name like '%INVOICE%' or column_name like '%RECEIPT%' or column_name like '%STATUS%')
 order by table_name,column_id;

prompt === DOCUMENT STATUS COUNTS ===
select module_name,status_code,count(*) documents
  from(
    select 'SALESENQUIRY' module_name,nvl(getdocumentstatuscode('SALESENQUIRY',tno),'NONACTIVE') status_code from salesenquiry
    union all select 'SALESQUOTATION',nvl(getdocumentstatuscode('SALESQUOTATION',tno),'NONACTIVE') from salesquotation
    union all select 'PORECEIPT',nvl(getdocumentstatuscode('PORECEIPT',tno),'NONACTIVE') from poreceipt
    union all select 'SALESORDER',nvl(getdocumentstatuscode('SALESORDER',tno),'NONACTIVE') from salesorder
    union all select 'LOADINGADVICE',nvl(getdocumentstatuscode('LOADINGADVICE',tno),'NONACTIVE') from loadingadvice
    union all select 'DESPATCHADVICE',nvl(getdocumentstatuscode('DESPATCHADVICE',tno),'NONACTIVE') from despatchadvice
    union all select 'CCINVOICE',nvl(getdocumentstatuscode('CCINVOICE',tno),'NONACTIVE') from ccinvoice
    union all select 'BILLRECEIPT',nvl(getdocumentstatuscode('BILLRECEIPT',tno),'NONACTIVE') from dfreightbillreceipt
  )
 group by module_name,status_code
 order by module_name,status_code;

prompt === VERIFIED NEXT-DOCUMENT GAPS AT DOCUMENT GRAIN ===
select flow_step,total_documents,active_documents,not_created
  from(
    select 1 seq,'SALES ENQUIRY -> SALES QUOTATION' flow_step,
           count(*) total_documents,
           count(case when getdocumentstatuscode('SALESENQUIRY',e.tno)='ACTIVE' then 1 end) active_documents,
           count(case when getdocumentstatuscode('SALESENQUIRY',e.tno)='ACTIVE'
                       and not exists(select 1 from salesquotation q where q.salesenquirytno=e.tno) then 1 end) not_created
      from salesenquiry e
    union all
    select 2,'SALES QUOTATION -> PO RECEIPT',count(*),
           count(case when getdocumentstatuscode('SALESQUOTATION',q.tno)='ACTIVE' then 1 end),
           count(case when getdocumentstatuscode('SALESQUOTATION',q.tno)='ACTIVE'
                       and not exists(select 1 from poreceipt p where p.salesquotationtno=q.tno) then 1 end)
      from salesquotation q
    union all
    select 3,'PO RECEIPT -> SALES ORDER',count(*),
           count(case when getdocumentstatuscode('PORECEIPT',p.tno)='ACTIVE' then 1 end),
           count(case when getdocumentstatuscode('PORECEIPT',p.tno)='ACTIVE'
                       and not exists(select 1 from salesorder s where s.poreceipttno=p.tno) then 1 end)
      from poreceipt p
    union all
    select 4,'SALES ORDER -> FULFILMENT',count(*),
           count(case when getdocumentstatuscode('SALESORDER',s.tno)='ACTIVE' then 1 end),
           count(case when getdocumentstatuscode('SALESORDER',s.tno)='ACTIVE'
                       and not exists(select 1 from loadingadvice l where l.salesordertno=s.tno)
                       and not exists(select 1 from despatchadvice d where d.salesordertno=s.tno or d.referencetno=s.tno)
                       and not exists(select 1 from ccinvoice c where c.salesordertno=s.tno) then 1 end)
      from salesorder s
    union all
    select 5,'LOADING ADVICE -> CC INVOICE',count(*),
           count(case when getdocumentstatuscode('LOADINGADVICE',l.tno)='ACTIVE' and l.salesordertno is not null then 1 end),
           count(case when getdocumentstatuscode('LOADINGADVICE',l.tno)='ACTIVE' and l.salesordertno is not null
                       and not exists(select 1 from ccinvoice c where c.loadingadvicetno=l.tno) then 1 end)
      from loadingadvice l
    union all
    select 6,'DISPATCH ADVICE -> CC INVOICE',count(*),
           count(case when getdocumentstatuscode('DESPATCHADVICE',d.tno)='ACTIVE' then 1 end),
           count(case when getdocumentstatuscode('DESPATCHADVICE',d.tno)='ACTIVE'
                       and not exists(select 1 from ccinvoice c where c.despatchadvicetno=d.tno or c.despatchtno=d.tno) then 1 end)
      from despatchadvice d
    union all
    select 7,'CC INVOICE -> BILL RECEIPT',count(*),
           count(case when getdocumentstatuscode('CCINVOICE',c.tno)='ACTIVE' then 1 end),
           count(case when getdocumentstatuscode('CCINVOICE',c.tno)='ACTIVE'
                       and not exists(
                         select 1
                           from invoice i
                           join dfreightbillreceiptdetail r on r.moduletno=i.tno
                          where i.moduletno=c.tno
                       ) then 1 end)
      from ccinvoice c
  )
 order by seq;

exit
