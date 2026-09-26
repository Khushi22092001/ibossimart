whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
set feedback on

declare
  l_count number;
begin
  select count(*)
    into l_count
    from user_objects
   where object_name in (
           'IMART_SLC_SO_LINE_V',
           'IMART_SLC_LOADING_ADVICE_V',
           'IMART_SLC_FULFILMENT_V',
           'IMART_SLC_EXCEPTION_V',
           'IMART_SLC_360')
     and status <> 'VALID';
  if l_count <> 0 then
    raise_application_error(-20001,'Unified SLC has invalid database objects: '||l_count);
  end if;

  select count(*)
    into l_count
    from (
      select salesordertno,itemcode,nvl(itemspecificationcode,'~') specification_key,
             sum(classified_qty) classified_qty,max(ordered_qty) ordered_qty
        from imart_slc_fulfilment_v
       group by salesordertno,itemcode,nvl(itemspecificationcode,'~')
      having sum(classified_qty) > max(ordered_qty) + 0.0001
    );
  if l_count <> 0 then
    raise_application_error(-20002,'Fulfilment allocation exceeds SO-line quantity for '||l_count||' lines');
  end if;

  select count(*)
    into l_count
    from (
      select salesordertno,max(order_strategy) order_strategy,
             count(distinct fulfilment_strategy) strategy_count
        from imart_slc_fulfilment_v
       group by salesordertno
    )
   where (strategy_count > 1 and order_strategy <> 'HYBRID')
      or (strategy_count = 1 and order_strategy = 'HYBRID');
  if l_count <> 0 then
    raise_application_error(-20003,'Incorrect Hybrid roll-up for '||l_count||' Sales Orders');
  end if;

  select count(*)
    into l_count
    from imart_slc_exception_v
   where exception_type = 'DIRECT DELIVERY AWAITING INVOICE';
  if l_count <> 2 then
    raise_application_error(-20004,'Expected 2 direct-delivery invoice exceptions; found '||l_count);
  end if;

  select count(*)
    into l_count
    from apex_application_page_regions
   where application_id=105
     and page_id=721
     and static_id in (
       'unified-fulfilment-trading',
       'trading-fulfilment-kpis',
       'fulfilment-mix-chart',
       'direct-delivery-funnel',
       'loading-advice-destination',
       'direct-supplier-customer-matrix',
       'order-book-bottleneck',
       'margin-coverage-chart',
       'fulfilment-evidence-register',
       'direct-delivery-register',
       'loading-advice-exceptions');
  if l_count <> 11 then
    raise_application_error(-20005,'Expected 11 unified Page 721 regions; found '||l_count);
  end if;

  select count(*)
    into l_count
    from apex_application_page_items
   where application_id=105
     and page_id=721
     and item_name in ('P721_PANEL','P721_FULFILMENT_FOCUS')
     and display_as='Hidden';
  if l_count <> 2 then
    raise_application_error(-20006,'Panel compatibility/focus items are not hidden');
  end if;

  dbms_output.put_line('SLC_UNIFIED_FULFILMENT_VERIFIED');
end;
/

select flow_type,count(distinct loadingadvicetno) document_count,
       round(sum(la_qty),2) quantity,round(sum(invoiced_value)/1e7,2) invoiced_cr
  from imart_slc_loading_advice_v
 group by flow_type
 order by flow_type;

select fulfilment_strategy,count(distinct salesordertno) sales_orders,
       round(sum(classified_qty),2) classified_qty,
       round(sum(classified_value)/1e7,2) classified_cr
  from imart_slc_fulfilment_v
 group by fulfilment_strategy
 order by fulfilment_strategy;

select exception_type,count(*) document_count
  from imart_slc_exception_v
 group by exception_type
 order by exception_type;
