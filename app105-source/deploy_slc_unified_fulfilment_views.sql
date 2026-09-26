whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off
connect -name IMART

prompt Creating evidence-based unified SLC views

create or replace view imart_slc_so_line_v as
select so.tno salesordertno,
       so.salesorderno,
       so.salesorderdate,
       so.companycode,
       so.financialyearcode,
       so.locationcode,
       so.partycode customercode,
       getpartyname(so.partycode) customername,
       coalesce(
         so.salesquotationtno,
         (select max(pr.salesquotationtno)
            from poreceipt pr
           where pr.tno = so.poreceipttno)
       ) salesquotationtno,
       d.itemcode,
       d.itemspecificationcode,
       getitemname(d.itemcode) itemname,
       getitemspecificationname(d.itemcode,d.itemspecificationcode) specificationname,
       sum(nvl(d.quantity1,0)) ordered_qty,
       sum(nvl(d.quantity2,0)) ordered_qty2,
       sum(nvl(d.ccinvoicequantity1,0)) recorded_invoiced_qty,
       sum(nvl(d.amount,0)) order_value,
       sum(nvl(d.totalamount,nvl(d.amount,0))) order_total_value,
       max(d.ratemeasuringunitcode) rate_unit,
       max(nvl(d.highertolerancepercent,nvl(d.tolerance,0))) higher_tolerance_percent,
       greatest(sum(nvl(d.quantity1,0))-sum(nvl(d.ccinvoicequantity1,0)),0) open_qty,
       case when sum(nvl(d.quantity1,0)) = 0 then 0
            else sum(nvl(d.amount,0))
                 * greatest(sum(nvl(d.quantity1,0))-sum(nvl(d.ccinvoicequantity1,0)),0)
                 / sum(nvl(d.quantity1,0))
       end open_value
  from salesorder so
  join salesorderdetail d on d.tno=so.tno
 group by so.tno,so.salesorderno,so.salesorderdate,so.companycode,
          so.financialyearcode,so.locationcode,so.partycode,
          so.salesquotationtno,so.poreceipttno,
          d.itemcode,d.itemspecificationcode;

create or replace view imart_slc_loading_advice_v as
with
la_detail as (
  select d.tno loadingadvicetno,
         d.itemcode,
         d.itemspecificationcode,
         sum(nvl(d.quantity1,0)) la_qty,
         sum(nvl(d.quantity2,0)) la_qty2
    from loadingadvicedetail d
   group by d.tno,d.itemcode,d.itemspecificationcode
),
so_detail as (
  select d.tno salesordertno,
         d.itemcode,
         d.itemspecificationcode,
         sum(nvl(d.quantity1,0)) so_qty,
         sum(nvl(d.amount,0)) so_value,
         max(d.ratemeasuringunitcode) so_rate_unit,
         max(nvl(d.highertolerancepercent,nvl(d.tolerance,0))) so_tolerance
    from salesorderdetail d
   group by d.tno,d.itemcode,d.itemspecificationcode
),
po_detail as (
  select d.tno purchaseordertno,
         d.itemcode,
         d.itemspecificationcode,
         sum(nvl(d.quantity1,0)) po_qty,
         sum(nvl(d.amount,0)) po_value,
         max(d.ratemeasuringunitcode) po_rate_unit,
         max(nvl(d.highertolerancepercent,nvl(d.tolerance,0))) po_tolerance
    from purchaseorderdetail d
   group by d.tno,d.itemcode,d.itemspecificationcode
),
grn_detail as (
  select g.loadingadvicetno,
         d.itemcode,
         d.itemspecificationcode,
         count(distinct g.tno) grn_count,
         max(g.tno) keep (dense_rank last order by g.grndate,g.tno) grntno,
         max(g.grnno) keep (dense_rank last order by g.grndate,g.tno) grnno,
         max(g.grndate) grndate,
         sum(nvl(d.receivedquantity1,nvl(d.chalanquantity1,0))) grn_qty
    from grn g
    join grndetail d on d.tno=g.tno
   where g.loadingadvicetno is not null
   group by g.loadingadvicetno,d.itemcode,d.itemspecificationcode
),
invoice_detail as (
  select ci.loadingadvicetno,
         d.itemcode,
         d.itemspecificationcode,
         count(distinct ci.tno) invoice_count,
         max(ci.tno) keep (dense_rank last order by ci.ccinvoicedate,ci.tno) ccinvoicetno,
         max(ci.ccinvoiceno) keep (dense_rank last order by ci.ccinvoicedate,ci.tno) ccinvoiceno,
         max(ci.ccinvoicedate) ccinvoicedate,
         sum(nvl(d.quantity1,0)) invoiced_qty,
         sum(nvl(d.amount,0)) invoiced_value
    from ccinvoice ci
    join ccinvoicedetail d on d.tno=ci.tno
   where ci.loadingadvicetno is not null
   group by ci.loadingadvicetno,d.itemcode,d.itemspecificationcode
),
material_in as (
  select loadingadvicetno,count(*) material_in_count,max(tno) materialintno
    from materialin
   where loadingadvicetno is not null
   group by loadingadvicetno
)
select la.tno loadingadvicetno,
       la.loadingadviceno,
       la.loadingadvicedate,
       la.companycode,
       la.financialyearcode,
       la.locationcode,
       la.purchaseordertno,
       po.purchaseorderno,
       po.purchaseorderdate,
       po.partycode suppliercode,
       getpartyname(po.partycode) suppliername,
       la.salesordertno,
       so.salesorderno,
       so.salesorderdate,
       so.partycode customercode,
       getpartyname(so.partycode) customername,
       d.itemcode,
       d.itemspecificationcode,
       getitemname(d.itemcode) itemname,
       getitemspecificationname(d.itemcode,d.itemspecificationcode) specificationname,
       d.la_qty,
       d.la_qty2,
       nvl(sd.so_qty,0) so_qty,
       nvl(sd.so_value,0) so_value,
       nvl(pd.po_qty,0) po_qty,
       nvl(pd.po_value,0) po_value,
       nvl(g.grn_qty,0) grn_qty,
       nvl(g.grn_count,0) grn_count,
       g.grntno,
       g.grnno,
       g.grndate,
       nvl(i.invoiced_qty,0) invoiced_qty,
       nvl(i.invoiced_value,0) invoiced_value,
       nvl(i.invoice_count,0) invoice_count,
       i.ccinvoicetno,
       i.ccinvoiceno,
       i.ccinvoicedate,
       nvl(mi.material_in_count,0) material_in_count,
       mi.materialintno,
       greatest(d.la_qty-nvl(i.invoiced_qty,0),0) pending_invoice_qty,
       case when nvl(sd.so_qty,0)=0 then 0
            else nvl(sd.so_value,0)
                 * least(d.la_qty,nvl(sd.so_qty,0))/sd.so_qty
       end allocated_sales_value,
       case when nvl(pd.po_qty,0)=0 then 0
            else nvl(pd.po_value,0)
                 * least(d.la_qty,nvl(pd.po_qty,0))/pd.po_qty
       end allocated_purchase_value,
       la.ispartylocation,
       la.iswarehouse,
       la.destinationplacecode,
       la.sodeliveryaddress,
       la.vehicleno,
       la.drivername,
       la.drivermobileno,
       la.ewaybillno,
       la.ewaybilldate,
       case
         when la.salesordertno is not null and la.purchaseordertno is not null
          and la.ispartylocation='YES' and nvl(la.iswarehouse,'NO')='NO'
           then 'DIRECT DELIVERY'
         when la.purchaseordertno is not null and la.salesordertno is null
          and la.iswarehouse='YES'
           then 'WAREHOUSE PROCUREMENT'
         when la.purchaseordertno is not null and la.salesordertno is not null
           then 'SALES-BACKED PROCUREMENT'
         else 'LINK EXCEPTION'
       end flow_type,
       case
         when la.salesordertno is not null and so.tno is null then 'INVALID SALES ORDER'
         when la.purchaseordertno is not null and po.tno is null then 'INVALID PURCHASE ORDER'
         when la.salesordertno is null and la.purchaseordertno is null then 'NO DOCUMENT LINK'
         when la.ispartylocation='YES' and la.iswarehouse='YES' then 'DESTINATION CONFLICT'
         when sd.salesordertno is null and la.salesordertno is not null then 'ITEM NOT IN SALES ORDER'
         when pd.purchaseordertno is null and la.purchaseordertno is not null then 'ITEM NOT IN PURCHASE ORDER'
         else 'VALID'
       end link_quality,
       case
         when i.invoice_count>0 and g.grn_count>0 then 'RECEIVED + INVOICED'
         when i.invoice_count>0 then 'INVOICED'
         when g.grn_count>0 then 'RECEIVED / INVOICE PENDING'
         when mi.material_in_count>0 then 'MATERIAL IN / GRN PENDING'
         else 'LOADING ADVICE OPEN'
       end current_status,
       trunc(sysdate)-trunc(la.loadingadvicedate) age_days,
       sd.so_rate_unit,
       pd.po_rate_unit,
       sd.so_tolerance,
       pd.po_tolerance
  from loadingadvice la
  join la_detail d on d.loadingadvicetno=la.tno
  left join salesorder so on so.tno=la.salesordertno
  left join purchaseorder po on po.tno=la.purchaseordertno
  left join so_detail sd
    on sd.salesordertno=la.salesordertno
   and sd.itemcode=d.itemcode
   and nvl(sd.itemspecificationcode,'~')=nvl(d.itemspecificationcode,'~')
  left join po_detail pd
    on pd.purchaseordertno=la.purchaseordertno
   and pd.itemcode=d.itemcode
   and nvl(pd.itemspecificationcode,'~')=nvl(d.itemspecificationcode,'~')
  left join grn_detail g
    on g.loadingadvicetno=la.tno
   and g.itemcode=d.itemcode
   and nvl(g.itemspecificationcode,'~')=nvl(d.itemspecificationcode,'~')
  left join invoice_detail i
    on i.loadingadvicetno=la.tno
   and i.itemcode=d.itemcode
   and nvl(i.itemspecificationcode,'~')=nvl(d.itemspecificationcode,'~')
  left join material_in mi on mi.loadingadvicetno=la.tno;

create or replace view imart_slc_fulfilment_v as
with
so_line as (
  select * from imart_slc_so_line_v
),
direct_evidence as (
  select salesordertno,itemcode,itemspecificationcode,
         sum(la_qty) evidence_qty,
         count(distinct loadingadvicetno) evidence_docs
    from imart_slc_loading_advice_v
   where flow_type='DIRECT DELIVERY' and link_quality='VALID'
   group by salesordertno,itemcode,itemspecificationcode
),
procurement_evidence as (
  select po.pendingsotno salesordertno,
         d.itemcode,d.itemspecificationcode,
         sum(nvl(d.quantity1,0)) evidence_qty,
         count(distinct po.tno) evidence_docs
    from purchaseorder po
    join purchaseorderdetail d on d.tno=po.tno
   where po.pendingsotno is not null
   group by po.pendingsotno,d.itemcode,d.itemspecificationcode
),
stock_evidence as (
  select ci.salesordertno,
         d.itemcode,d.itemspecificationcode,
         case
           when upper(s.stockmodulecode)='PRODUCTION' then 'PRODUCTION-SOURCED'
           when upper(s.stockmodulecode)='INSPECTION' then 'PURCHASED / INSPECTED STOCK'
           when upper(s.stockmodulecode) in ('ITEMOPENING','STOCKJOURNAL') then 'EXISTING STOCK'
           when upper(s.stockmodulecode)='SALESGRN' then 'RETURNED / RE-ENTERED STOCK'
           else 'OTHER STOCK EVIDENCE'
         end evidence_type,
         sum(nvl(csd.quantity1,0)) evidence_qty,
         count(distinct s.tno) evidence_docs
    from ccinvoice ci
    join ccinvoicedetail d on d.tno=ci.tno
    join ccinvoicestockdetail csd on csd.tno=d.tno and csd.sno=d.sno
    join stock s on s.tno=csd.stocktno
   where ci.salesordertno is not null
     and not exists (
       select 1
         from loadingadvice la
        where la.tno=ci.loadingadvicetno
          and la.salesordertno=ci.salesordertno
          and la.purchaseordertno is not null
          and la.ispartylocation='YES'
          and nvl(la.iswarehouse,'NO')='NO'
     )
   group by ci.salesordertno,d.itemcode,d.itemspecificationcode,
            case
              when upper(s.stockmodulecode)='PRODUCTION' then 'PRODUCTION-SOURCED'
              when upper(s.stockmodulecode)='INSPECTION' then 'PURCHASED / INSPECTED STOCK'
              when upper(s.stockmodulecode) in ('ITEMOPENING','STOCKJOURNAL') then 'EXISTING STOCK'
              when upper(s.stockmodulecode)='SALESGRN' then 'RETURNED / RE-ENTERED STOCK'
              else 'OTHER STOCK EVIDENCE'
            end
),
evidence_pivot as (
  select salesordertno,itemcode,itemspecificationcode,
         sum(case when evidence_type='PRODUCTION-SOURCED' then evidence_qty else 0 end) production_qty,
         sum(case when evidence_type='PURCHASED / INSPECTED STOCK' then evidence_qty else 0 end) inspection_qty,
         sum(case when evidence_type='EXISTING STOCK' then evidence_qty else 0 end) existing_qty,
         sum(case when evidence_type='RETURNED / RE-ENTERED STOCK' then evidence_qty else 0 end) returned_qty,
         sum(case when evidence_type='OTHER STOCK EVIDENCE' then evidence_qty else 0 end) other_qty,
         sum(evidence_docs) evidence_docs
    from stock_evidence
   group by salesordertno,itemcode,itemspecificationcode
),
raw_evidence as (
  select s.*,
         nvl(d.evidence_qty,0) direct_raw,
         nvl(d.evidence_docs,0) direct_docs,
         nvl(p.evidence_qty,0) procurement_raw,
         nvl(p.evidence_docs,0) procurement_docs,
         nvl(e.production_qty,0) production_raw,
         nvl(e.inspection_qty,0) inspection_raw,
         nvl(e.existing_qty,0) existing_raw,
         nvl(e.returned_qty,0) returned_raw,
         nvl(e.other_qty,0) other_raw,
         nvl(e.evidence_docs,0) stock_docs
    from so_line s
    left join direct_evidence d
      on d.salesordertno=s.salesordertno and d.itemcode=s.itemcode
     and nvl(d.itemspecificationcode,'~')=nvl(s.itemspecificationcode,'~')
    left join procurement_evidence p
      on p.salesordertno=s.salesordertno and p.itemcode=s.itemcode
     and nvl(p.itemspecificationcode,'~')=nvl(s.itemspecificationcode,'~')
    left join evidence_pivot e
      on e.salesordertno=s.salesordertno and e.itemcode=s.itemcode
     and nvl(e.itemspecificationcode,'~')=nvl(s.itemspecificationcode,'~')
),
alloc as (
  select r.*,
         least(ordered_qty,direct_raw) direct_qty,
         least(greatest(ordered_qty-least(ordered_qty,direct_raw),0),procurement_raw) procurement_qty,
         least(greatest(ordered_qty-least(ordered_qty,direct_raw)-least(greatest(ordered_qty-least(ordered_qty,direct_raw),0),procurement_raw),0),production_raw) production_qty
    from raw_evidence r
),
alloc2 as (
  select a.*,
         least(greatest(ordered_qty-direct_qty-procurement_qty-production_qty,0),inspection_raw) inspection_qty
    from alloc a
),
alloc3 as (
  select a.*,
         least(greatest(ordered_qty-direct_qty-procurement_qty-production_qty-inspection_qty,0),existing_raw) existing_qty
    from alloc2 a
),
alloc4 as (
  select a.*,
         least(greatest(ordered_qty-direct_qty-procurement_qty-production_qty-inspection_qty-existing_qty,0),returned_raw) returned_qty
    from alloc3 a
),
alloc5 as (
  select a.*,
         least(greatest(ordered_qty-direct_qty-procurement_qty-production_qty-inspection_qty-existing_qty-returned_qty,0),other_raw) other_qty
    from alloc4 a
),
facts as (
  select a.*,'DIRECT DELIVERY' strategy,direct_qty classified_qty,
         'LoadingAdvice(SO+PO, party location)' evidence_source,
         'STRONG' evidence_strength,direct_docs evidence_docs
    from alloc5 a where direct_qty>0
  union all
  select a.*,'PROCUREMENT-BACKED',procurement_qty,
         'PurchaseOrder.PendingSOTNo','MEDIUM',procurement_docs
    from alloc5 a where procurement_qty>0
  union all
  select a.*,'PRODUCTION-SOURCED',production_qty,
         'CCInvoiceStockDetail -> Stock(PRODUCTION)','STRONG',stock_docs
    from alloc5 a where production_qty>0
  union all
  select a.*,'PURCHASED / INSPECTED STOCK',inspection_qty,
         'CCInvoiceStockDetail -> Stock(INSPECTION)','STRONG',stock_docs
    from alloc5 a where inspection_qty>0
  union all
  select a.*,'EXISTING STOCK',existing_qty,
         'CCInvoiceStockDetail -> Stock(ITEMOPENING/STOCKJOURNAL)','STRONG',stock_docs
    from alloc5 a where existing_qty>0
  union all
  select a.*,'RETURNED / RE-ENTERED STOCK',returned_qty,
         'CCInvoiceStockDetail -> Stock(SALESGRN)','STRONG',stock_docs
    from alloc5 a where returned_qty>0
  union all
  select a.*,'OTHER STOCK EVIDENCE',other_qty,
         'CCInvoiceStockDetail -> Stock','MEDIUM',stock_docs
    from alloc5 a where other_qty>0
  union all
  select a.*,'UNCLASSIFIED',
         greatest(ordered_qty-direct_qty-procurement_qty-production_qty-inspection_qty-existing_qty-returned_qty-other_qty,0),
         'No defensible transaction relationship','NONE',0
    from alloc5 a
   where greatest(ordered_qty-direct_qty-procurement_qty-production_qty-inspection_qty-existing_qty-returned_qty-other_qty,0)>0
),
order_mix as (
  select salesordertno,count(distinct strategy) strategy_count
    from facts
   group by salesordertno
)
select f.salesordertno,f.salesorderno,f.salesorderdate,f.companycode,f.financialyearcode,
       locationcode,customercode,customername,salesquotationtno,itemcode,
       itemspecificationcode,itemname,specificationname,ordered_qty,order_value,
       open_qty,open_value,strategy fulfilment_strategy,classified_qty,
       case when ordered_qty=0 then 0 else order_value*classified_qty/ordered_qty end classified_value,
       evidence_source,evidence_strength,evidence_docs,
       case when m.strategy_count>1 then 'HYBRID' else strategy end order_strategy
  from facts f
  join order_mix m on m.salesordertno=f.salesordertno;

create or replace view imart_slc_exception_v as
with la_header as (
  select loadingadvicetno,loadingadviceno,loadingadvicedate,companycode,locationcode,
         purchaseordertno,purchaseorderno,suppliername,salesordertno,salesorderno,
         customername,flow_type,
         nvl(max(case when link_quality<>'VALID' then link_quality end),'VALID') link_quality,
         max(current_status) keep (dense_rank last order by invoice_count,grn_count) current_status,
         sum(la_qty) affected_qty,
         sum(allocated_sales_value) affected_value,
         sum(pending_invoice_qty) pending_qty,
         max(grn_count) grn_count,
         max(invoice_count) invoice_count,
         max(age_days) age_days
    from imart_slc_loading_advice_v
   group by loadingadvicetno,loadingadviceno,loadingadvicedate,companycode,locationcode,
            purchaseordertno,purchaseorderno,suppliername,salesordertno,salesorderno,
            customername,flow_type
)
select 'CRITICAL' severity,'DIRECT DELIVERY AWAITING INVOICE' exception_type,
       loadingadvicetno,loadingadviceno,loadingadvicedate,companycode,locationcode,
       salesordertno,salesorderno,purchaseordertno,purchaseorderno,
       customername,suppliername,affected_qty,affected_value,age_days,
       'Create or reconcile the customer CC Invoice against this Loading Advice' next_action
  from la_header
 where flow_type='DIRECT DELIVERY' and invoice_count=0
union all
select 'CRITICAL','PARTY DELIVERY WITHOUT PURCHASE ORDER',loadingadvicetno,loadingadviceno,
       loadingadvicedate,companycode,locationcode,salesordertno,salesorderno,
       purchaseordertno,purchaseorderno,customername,suppliername,affected_qty,
       affected_value,age_days,'Link the supplier Purchase Order or correct the destination flow'
  from la_header
 where salesordertno is not null and purchaseordertno is null and flow_type='LINK EXCEPTION'
union all
select 'HIGH','PARTY DELIVERY WITHOUT SALES ORDER',loadingadvicetno,loadingadviceno,
       loadingadvicedate,companycode,locationcode,salesordertno,salesorderno,
       purchaseordertno,purchaseorderno,customername,suppliername,affected_qty,
       affected_value,age_days,'Link the customer Sales Order or classify this as warehouse procurement'
  from la_header
 where salesordertno is null and purchaseordertno is not null and flow_type='LINK EXCEPTION'
union all
select 'CRITICAL','LOADING ADVICE WITHOUT DOCUMENT LINK',loadingadvicetno,loadingadviceno,
       loadingadvicedate,companycode,locationcode,salesordertno,salesorderno,
       purchaseordertno,purchaseorderno,customername,suppliername,affected_qty,
       affected_value,age_days,'Attach the originating Purchase Order or Sales Order'
  from la_header
 where salesordertno is null and purchaseordertno is null
union all
select 'HIGH','WAREHOUSE LOADING ADVICE WITHOUT GRN',loadingadvicetno,loadingadviceno,
       loadingadvicedate,companycode,locationcode,salesordertno,salesorderno,
       purchaseordertno,purchaseorderno,customername,suppliername,affected_qty,
       affected_value,age_days,'Complete Material In/GRN or cancel the stale Loading Advice'
  from la_header
 where flow_type='WAREHOUSE PROCUREMENT' and grn_count=0
union all
select 'HIGH','LOADING ADVICE LINK QUALITY',loadingadvicetno,loadingadviceno,
       loadingadvicedate,companycode,locationcode,salesordertno,salesorderno,
       purchaseordertno,purchaseorderno,customername,suppliername,affected_qty,
       affected_value,age_days,'Correct: '||link_quality
  from la_header
 where link_quality<>'VALID';

declare
  procedure ensure_index(p_name varchar2,p_table varchar2,p_columns varchar2) is
    l_count number;
  begin
    select count(*) into l_count from user_indexes where index_name=upper(p_name);
    if l_count=0 then
      execute immediate 'create index '||dbms_assert.simple_sql_name(p_name)||
                        ' on '||dbms_assert.simple_sql_name(p_table)||'('||p_columns||')';
    end if;
  end;
begin
  ensure_index('IDX_SLC_LA_SO_PO_DT','LOADINGADVICE','SALESORDERTNO,PURCHASEORDERTNO,LOADINGADVICEDATE');
  ensure_index('IDX_SLC_CI_LA_SO','CCINVOICE','LOADINGADVICETNO,SALESORDERTNO');
  ensure_index('IDX_SLC_GRN_LA_PO','GRN','LOADINGADVICETNO,PURCHASEORDERTNO');
  ensure_index('IDX_SLC_MI_LA','MATERIALIN','LOADINGADVICETNO');
end;
/

commit;
prompt SLC_UNIFIED_FULFILMENT_VIEWS_DEPLOYED
