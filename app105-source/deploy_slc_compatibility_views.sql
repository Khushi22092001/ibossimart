whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off
connect -name IMART

create or replace view slc_salesconfirm as
select q.*,
       q.salesquotationno     salesconfirmno,
       q.salesquotationdate   salesconfirmdate,
       q.salesquotationamount salesconfirmamount,
       cast('A' as varchar2(10)) panel
  from salesquotation q;

create or replace view slc_salesconfirmdetail as
select d.*,
       i.itemcategorycode,
       d.rate withoutdiscountrate
  from salesquotationdetail d
  left join item i
    on i.itemcode = d.itemcode;

create or replace view slc_salesorder as
select s.*,
       coalesce(
         s.salesquotationtno,
         (select max(pr.salesquotationtno)
            from poreceipt pr
           where pr.tno=s.poreceipttno)
       ) salesconfirmtno,
       (select max(da.vehicleno)
          from despatchadvice da
         where da.salesordertno = s.tno) vehicleno,
       cast('A' as varchar2(10)) panel
  from salesorder s;

create or replace view slc_despatchadvice as
select d.*, cast('A' as varchar2(10)) panel from despatchadvice d;

create or replace view slc_materialout as
select m.*, cast('A' as varchar2(10)) panel from materialout m;

create or replace view slc_weighment as
select w.*,
       (select max(da.partycode)
          from despatchadvice da
         where da.tno = w.despatchadvicetno) partycode,
       (select max(da.salesordertno)
          from despatchadvice da
         where da.tno = w.despatchadvicetno) salesordertno,
       cast('A' as varchar2(10)) panel
  from weighment w;

create or replace view slc_itemspecification as
with spec_category as (
  select x.itemspecificationcode,
         max(i.itemcategorycode) itemcategorycode
    from (
      select itemcode, itemspecificationcode from salesquotationdetail
      union all
      select itemcode, itemspecificationcode from salesorderdetail
      union all
      select itemcode, itemspecificationcode from ccinvoicedetail
    ) x
    join item i on i.itemcode = x.itemcode
   where x.itemspecificationcode is not null
   group by x.itemspecificationcode
)
select isp.*,
       sc.itemcategorycode
  from itemspecification isp
  left join spec_category sc
    on sc.itemspecificationcode = isp.itemspecificationcode;

create or replace view slc_ccinvoice as
select c.*, cast('A' as varchar2(10)) panel from ccinvoice c;

create or replace view slc_ccinvoicedetail as
select d.*,
       d.rate basicrate,
       cast(1 as number) conversionrate
  from ccinvoicedetail d;

create or replace view slc_einvoice as
select e.*, cast('A' as varchar2(10)) panel from einvoice e;

create or replace view slc_voucherdetail as
select v.*, cast('A' as varchar2(10)) panel from voucherdetail v;

create or replace view slc_creditlimitapproval as
select cast(null as number)        tno,
       cast(null as varchar2(100)) partycode,
       cast(null as varchar2(100)) companycode,
       cast(null as varchar2(100)) locationcode,
       cast(null as varchar2(10))  panel,
       cast(null as date)          creditlimitapprovaldate,
       cast(null as varchar2(100)) creditlimitapprovalno,
       cast(null as date)          tilldate,
       cast(null as number)        creditamount,
       cast(null as number)        creditdays,
       cast(null as number)        salesordertno,
       cast(null as varchar2(5))   isgroupofparty
  from dual where 1=0;

create or replace view slc_scbalance as
with confirmed as (
  select d.tno, sum(nvl(d.quantity1,0)) scqty
    from slc_salesconfirmdetail d group by d.tno
), ordered as (
  select so.salesconfirmtno tno, sum(nvl(d.quantity1,0)) soqty
    from slc_salesorder so
    join salesorderdetail d on d.tno=so.tno
   group by so.salesconfirmtno
), dispatched as (
  select so.salesconfirmtno tno, sum(nvl(d.quantity1,0)) daqty
    from slc_salesorder so
    join despatchadvice da on da.salesordertno=so.tno
    join despatchadvicedetail d on d.tno=da.tno
   group by so.salesconfirmtno
), invoiced as (
  select so.salesconfirmtno tno, sum(nvl(d.quantity1,0)) ccqty
    from slc_salesorder so
    join ccinvoice ci on ci.salesordertno=so.tno
    join ccinvoicedetail d on d.tno=ci.tno
   group by so.salesconfirmtno
)
select sc.tno,
       sc.salesconfirmno,
       sc.salesconfirmdate,
       getpartyname(sc.partycode) partyname,
       nvl(c.scqty,0) scqty,
       nvl(o.soqty,0) soqty,
       nvl(d.daqty,0) daqty,
       nvl(i.ccqty,0) ccqty,
       greatest(nvl(c.scqty,0)-nvl(i.ccqty,0),0) balanceqty
  from slc_salesconfirm sc
  left join confirmed c on c.tno=sc.tno
  left join ordered o on o.tno=sc.tno
  left join dispatched d on d.tno=sc.tno
  left join invoiced i on i.tno=sc.tno;

commit;
prompt SLC_COMPATIBILITY_VIEWS_DEPLOYED
