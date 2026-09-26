create or replace package imart_slc_360 authid definer as
  procedure render(p_kind varchar2, p_key varchar2);
end imart_slc_360;
/

create or replace package body imart_slc_360 as
  function e(p_value varchar2) return varchar2 is
  begin
    return apex_escape.html(nvl(p_value, '-'));
  end;

  function n(p_value number) return varchar2 is
  begin
    return to_char(nvl(p_value, 0), 'FM999G999G999G990D00');
  end;

  function app_url(p_page number, p_items varchar2 default null, p_values varchar2 default null) return varchar2 is
  begin
    return apex_page.get_url(
      p_page        => p_page,
      p_clear_cache => to_char(p_page),
      p_items       => p_items,
      p_values      => p_values );
  end;

  procedure open_page(p_eyebrow varchar2, p_title varchar2, p_subtitle varchar2) is
  begin
    htp.p('<div class="slc360-hero"><span class="slc360-eyebrow">'||e(p_eyebrow)||'</span><h1>'||e(p_title)||'</h1><p>'||e(p_subtitle)||'</p></div>');
  end;

  procedure section_start(p_title varchar2, p_subtitle varchar2 default null) is
  begin
    htp.p('<section class="slc360-section"><div class="slc360-section-head"><div><h2>'||e(p_title)||'</h2>'||case when p_subtitle is not null then '<p>'||e(p_subtitle)||'</p>' end||'</div></div>');
  end;

  procedure section_end is begin htp.p('</section>'); end;

  procedure empty_state(p_text varchar2) is
  begin
    htp.p('<div class="slc360-empty"><span class="fa fa-search"></span><b>Select a record to begin</b><p>'||e(p_text)||'</p></div>');
  end;

  procedure render_quotation(p_key varchar2) is
    l_tno number;
    l_no varchar2(200); l_party varchar2(500); l_partycode varchar2(200); l_date date; l_amount number; l_quotes number; l_orders number; l_invoices number;
  begin
    begin l_tno := to_number(p_key); exception when others then l_tno := null; end;
    open_page('Commercial · Order-to-cash','Sales Quotation 360','The live Ironmart quotation, its originating enquiry, customer PO receipt, fulfilment and complete downstream document trail.');
    if l_tno is null then
      empty_state('Choose a recent Sales Quotation below.');
      section_start('Recent Sales Quotations','Open a quotation to see its complete commercial record.');
      htp.p('<div class="slc360-list">');
      for r in (select * from (select tno,salesquotationno,salesquotationdate,partycode,salesquotationamount from salesquotation where companycode=v('GLOBAL_COMPANYCODE') order by salesquotationdate desc,tno desc) where rownum<=60) loop
        htp.p('<a href="'||app_url(722,'P722_TNO',r.tno)||'"><span><b>'||e(r.salesquotationno)||'</b><small>'||e(getpartyname(r.partycode))||'</small></span><span>'||to_char(r.salesquotationdate,'DD-MON-YYYY')||'<br><b>₹ '||n(r.salesquotationamount)||'</b></span></a>');
      end loop;
      htp.p('</div>'); section_end; return;
    end if;
    select salesquotationno,salesquotationdate,getpartyname(partycode),partycode,salesquotationamount into l_no,l_date,l_party,l_partycode,l_amount from salesquotation where tno=l_tno;
    select count(*) into l_quotes from salesquotation where tno=l_tno and salesenquirytno is not null;
    select count(distinct so.tno),count(distinct c.tno) into l_orders,l_invoices from poreceipt p left join salesorder so on so.poreceipttno=p.tno left join ccinvoice c on c.salesordertno=so.tno where p.salesquotationtno=l_tno;
    htp.p('<div class="slc360-actions"><a href="'||app_url(705,'P705_TNO',l_tno)||'"><span class="fa fa-edit"></span> Open Sales Quotation form</a><a href="'||app_url(704)||'"><span class="fa fa-table"></span> Quotation register</a></div>');
    htp.p('<div class="slc360-kpis"><div><small>SALES QUOTATION</small><b>'||e(l_no)||'</b><span>'||to_char(l_date,'DD-MON-YYYY')||'</span></div><div><small>CUSTOMER</small><b>'||e(l_party)||'</b><span>Commercial account</span></div><div><small>QUOTED VALUE</small><b>₹ '||n(l_amount)||'</b><span>Live quotation value</span></div><div><small>DOWNSTREAM</small><b>'||l_quotes||' / '||l_orders||' / '||l_invoices||'</b><span>Source enquiries / orders / invoices</span></div></div>');
    section_start('Quotation Items & Fulfilment','Original quotation lines with ordered, dispatched and invoiced quantities at item/specification grain.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Item</th><th>Specification</th><th>Confirmed Qty</th><th>Ordered Qty</th><th>Dispatched Qty</th><th>Invoiced Qty</th><th>Balance</th></tr></thead><tbody>');
    for r in (select d.itemcode,d.itemspecificationcode,d.quantity1 confirmed_qty,
      (select nvl(sum(sd.quantity1),0) from salesquotation q join poreceipt p on p.salesquotationtno=q.tno join salesorder so on so.poreceipttno=p.tno join salesorderdetail sd on sd.tno=so.tno where q.salesenquirytno=d.tno and sd.itemcode=d.itemcode and nvl(sd.itemspecificationcode,'~')=nvl(d.itemspecificationcode,'~')) ordered_qty,
      (select nvl(sum(dd.quantity1),0) from salesquotation q join poreceipt p on p.salesquotationtno=q.tno join salesorder so on so.poreceipttno=p.tno join despatchadvice da on da.salesordertno=so.tno join despatchadvicedetail dd on dd.tno=da.tno where q.salesenquirytno=d.tno and dd.itemcode=d.itemcode and nvl(dd.itemspecificationcode,'~')=nvl(d.itemspecificationcode,'~')) dispatched_qty,
      (select nvl(sum(cd.quantity1),0) from salesquotation q join poreceipt p on p.salesquotationtno=q.tno join salesorder so on so.poreceipttno=p.tno join ccinvoice c on c.salesordertno=so.tno join ccinvoicedetail cd on cd.tno=c.tno where q.salesenquirytno=d.tno and cd.itemcode=d.itemcode and nvl(cd.itemspecificationcode,'~')=nvl(d.itemspecificationcode,'~')) invoiced_qty
      from salesquotationdetail d where d.tno=l_tno order by d.sno) loop
      htp.p('<tr><td><a href="'||app_url(726,'P726_ITEMCODE',r.itemcode)||'">'||e(getitemname(r.itemcode))||'</a></td><td>'||e(getitemspecificationname(r.itemcode,r.itemspecificationcode))||'</td><td>'||n(r.confirmed_qty)||'</td><td>'||n(r.ordered_qty)||'</td><td>'||n(r.dispatched_qty)||'</td><td>'||n(r.invoiced_qty)||'</td><td><b>'||n(r.confirmed_qty-r.invoiced_qty)||'</b></td></tr>');
    end loop;
    htp.p('</tbody></table></div>'); section_end;
    section_start('Quotation Lifecycle','Complete live trail: enquiry, quotation, customer PO receipt, sales order, dispatch, gate movement, CC invoice and E-invoice.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Stage</th><th>Document</th><th>Date</th><th>Status / Context</th><th>Open</th></tr></thead><tbody>');
    for r in (
      select 1 seq,'Sales Enquiry' stage,se.salesenquiryno doc_no,se.salesenquirydate doc_date,'Customer requirement' context,702 target_page,'P702_TNO' target_item,to_char(se.tno) target_value from salesquotation q join salesenquiry se on se.tno=q.salesenquirytno where q.tno=l_tno
      union all select 2,'Sales Quotation',q.salesquotationno,q.salesquotationdate,'Commercial offer',705,'P705_TNO',to_char(q.tno) from salesquotation q where q.tno=l_tno
      union all select 3,'Customer PO Receipt',p.poreceiptno,p.poreceiptdate,'Customer PO received',274,'P274_TNO',to_char(p.tno) from poreceipt p where p.salesquotationtno=l_tno
      union all select 4,'Sales Order',so.salesorderno,so.salesorderdate,'Execution order',723,'P723_TNO',to_char(so.tno) from poreceipt p join salesorder so on so.poreceipttno=p.tno where p.salesquotationtno=l_tno
      union all select 5,'Dispatch Advice',da.despatchadviceno,da.despatchadvicedate,nvl(da.vehicleno,'Vehicle not recorded'),161,'P161_TNO',to_char(da.tno) from poreceipt p join salesorder so on so.poreceipttno=p.tno join despatchadvice da on da.salesordertno=so.tno where p.salesquotationtno=l_tno
      union all select 6,'Material Out',m.materialoutno,m.materialoutdate,nvl(m.vehicleno,'Vehicle not recorded'),168,'P168_TNO',to_char(m.tno) from poreceipt p join salesorder so on so.poreceipttno=p.tno join despatchadvice da on da.salesordertno=so.tno join materialout m on m.referencetno=da.tno where p.salesquotationtno=l_tno
      union all select 7,'CC Invoice',c.ccinvoiceno,c.ccinvoicedate,'₹ '||to_char(nvl(c.ccinvoiceamount,0),'FM999G999G999G990D00'),175,'P175_TNO',to_char(c.tno) from poreceipt p join salesorder so on so.poreceipttno=p.tno join ccinvoice c on c.salesordertno=so.tno where p.salesquotationtno=l_tno
      union all select 8,'E-Invoice',e.invoiceno,e.invoicedate,case when e.canceldate is null then 'IRN active' else 'Cancelled' end,182,'P182_TNO',to_char(e.tno) from poreceipt p join salesorder so on so.poreceipttno=p.tno join ccinvoice c on c.salesordertno=so.tno join einvoice e on e.ccinvoicetno=c.tno where p.salesquotationtno=l_tno order by 1,3) loop
      htp.p('<tr><td><span class="slc360-badge">'||e(r.stage)||'</span></td><td><b>'||e(r.doc_no)||'</b></td><td>'||to_char(r.doc_date,'DD-MON-YYYY')||'</td><td>'||e(r.context)||'</td><td><a href="'||app_url(r.target_page,r.target_item,r.target_value)||'">Open form →</a></td></tr>');
    end loop;
    htp.p('</tbody></table></div>'); section_end;
    section_start('Customer Receipt & Ledger Context','Canonical Ironmart customer pages for collections, outstanding and complete customer context.');
    htp.p('<div class="slc360-actions"><a href="'||app_url(511,'P511_PARTYCODE',l_partycode)||'">Customer dashboard</a><a href="'||app_url(911)||'">Receipts & collections</a><a href="'||app_url(908)||'">Customer outstanding</a></div>'); section_end;
  exception when no_data_found then empty_state('The selected quotation no longer exists.');
  end;

  procedure render_order(p_key varchar2) is
    l_tno number; l_no varchar2(200); l_party varchar2(500); l_date date; l_amount number; l_qty number; l_dispatches number; l_invoices number;
  begin
    begin l_tno := to_number(p_key); exception when others then l_tno := null; end;
    open_page('Commercial · Fulfilment','Sales Order 360','Master details, item fulfilment, dispatch, gate, weighment, billing and compliance in one view.');
    if l_tno is null then
      empty_state('Choose a recent Sales Order below.'); section_start('Recent Sales Orders','Open an order to see every downstream handoff.'); htp.p('<div class="slc360-list">');
      for r in (select * from (select tno,salesorderno,salesorderdate,partycode,salesorderamount from salesorder where companycode=v('GLOBAL_COMPANYCODE') order by salesorderdate desc,tno desc) where rownum<=60) loop
        htp.p('<a href="'||app_url(723,'P723_TNO',r.tno)||'"><span><b>'||e(r.salesorderno)||'</b><small>'||e(getpartyname(r.partycode))||'</small></span><span>'||to_char(r.salesorderdate,'DD-MON-YYYY')||'<br><b>₹ '||n(r.salesorderamount)||'</b></span></a>');
      end loop; htp.p('</div>'); section_end; return;
    end if;
    select salesorderno,salesorderdate,getpartyname(partycode),salesorderamount,quantity into l_no,l_date,l_party,l_amount,l_qty from salesorder where tno=l_tno;
    select count(*) into l_dispatches from despatchadvice where salesordertno=l_tno;
    select count(*) into l_invoices from ccinvoice where salesordertno=l_tno;
    htp.p('<div class="slc360-actions"><a href="'||app_url(171,'P171_TNO',l_tno)||'"><span class="fa fa-edit"></span> Open Sales Order form</a><a href="'||app_url(170)||'"><span class="fa fa-table"></span> Order register</a><a href="'||app_url(721)||'#unified-fulfilment-trading"><span class="fa fa-dashboard"></span> Back to lifecycle tower</a></div>');
    htp.p('<div class="slc360-kpis"><div><small>SALES ORDER</small><b>'||e(l_no)||'</b><span>'||to_char(l_date,'DD-MON-YYYY')||'</span></div><div><small>CUSTOMER</small><b>'||e(l_party)||'</b><span>Order account</span></div><div><small>ORDER VALUE</small><b>₹ '||n(l_amount)||'</b><span>'||n(l_qty)||' ordered qty</span></div><div><small>FULFILMENT</small><b>'||l_dispatches||' / '||l_invoices||'</b><span>Dispatches / invoices</span></div></div>');
    section_start('Sales Order Item Register','Ordered, dispatched and invoiced quantities at item/specification grain.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Item</th><th>Specification</th><th>Ordered</th><th>Dispatched</th><th>Invoiced</th><th>Open Qty</th><th>Amount</th></tr></thead><tbody>');
    for r in (select d.itemcode,d.itemspecificationcode,d.quantity1 ordered_qty,nvl(d.despatchadvicequantity1,0) dispatched_qty,nvl(d.ccinvoicequantity1,0) invoiced_qty,d.totalamount from salesorderdetail d where d.tno=l_tno order by d.sno) loop
      htp.p('<tr><td><a href="'||app_url(726,'P726_ITEMCODE',r.itemcode)||'">'||e(getitemname(r.itemcode))||'</a></td><td>'||e(getitemspecificationname(r.itemcode,r.itemspecificationcode))||'</td><td>'||n(r.ordered_qty)||'</td><td>'||n(r.dispatched_qty)||'</td><td>'||n(r.invoiced_qty)||'</td><td><b>'||n(r.ordered_qty-r.invoiced_qty)||'</b></td><td>₹ '||n(r.totalamount)||'</td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
    section_start('Fulfilment Strategy & Evidence','Line-level classification is based only on proven Loading Advice, purchase or stock-allocation evidence; unsupported quantities remain Unclassified.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Item</th><th>Specification</th><th>Strategy</th><th>Order roll-up</th><th>Classified Qty</th><th>Classified Value</th><th>Evidence</th><th>Strength</th></tr></thead><tbody>');
    for r in (
      select itemcode,itemspecificationcode,itemname,specificationname,fulfilment_strategy,
             order_strategy,classified_qty,classified_value,evidence_source,evidence_strength
        from imart_slc_fulfilment_v
       where salesordertno=l_tno
       order by itemname,specificationname,
                decode(evidence_strength,'STRONG',1,'MEDIUM',2,'NONE',3,4),fulfilment_strategy
    ) loop
      htp.p('<tr><td><a href="'||app_url(726,'P726_ITEMCODE',r.itemcode)||'">'||e(r.itemname)||'</a></td><td>'||e(r.specificationname)||'</td><td><span class="slc360-badge">'||e(r.fulfilment_strategy)||'</span></td><td>'||e(r.order_strategy)||'</td><td>'||n(r.classified_qty)||'</td><td>₹ '||n(r.classified_value)||'</td><td>'||e(r.evidence_source)||'</td><td>'||case when r.evidence_strength='STRONG' then '<span class="slc360-ok">Strong</span>' when r.evidence_strength='MEDIUM' then '<span class="slc360-warn">Medium</span>' else '<span class="slc360-warn">Unclassified</span>' end||'</td></tr>');
    end loop;
    htp.p('</tbody></table></div>'); section_end;
    section_start('Loading Advice, Purchase & Direct Delivery Trace','The commercial bridge between this Sales Order, its supplier Purchase Order, purchase-side GRN and customer-side CC Invoice.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Loading Advice</th><th>Flow / Status</th><th>Purchase Order</th><th>Supplier</th><th>Item / Specification</th><th>LA Qty</th><th>GRN</th><th>Invoice</th><th>Pending</th><th>Destination</th></tr></thead><tbody>');
    for r in (
      select loadingadvicetno,loadingadviceno,loadingadvicedate,flow_type,current_status,
             purchaseordertno,purchaseorderno,suppliername,itemname,specificationname,
             la_qty,grntno,grnno,grn_qty,ccinvoicetno,ccinvoiceno,invoiced_qty,
             pending_invoice_qty,destinationplacecode,sodeliveryaddress
        from imart_slc_loading_advice_v
       where salesordertno=l_tno
       order by loadingadvicedate desc,loadingadvicetno,itemname,specificationname
    ) loop
      htp.p('<tr><td><a href="'||app_url(155,'P155_TNO',r.loadingadvicetno)||'">'||e(r.loadingadviceno)||'</a><br><small>'||to_char(r.loadingadvicedate,'DD-MON-YYYY')||'</small></td><td><span class="slc360-badge">'||e(r.flow_type)||'</span><br><small>'||e(r.current_status)||'</small></td><td>'||case when r.purchaseordertno is null then '-' else '<a href="'||app_url(118,'P118_TNO',r.purchaseordertno)||'">'||e(r.purchaseorderno)||'</a>' end||'</td><td>'||e(r.suppliername)||'</td><td><b>'||e(r.itemname)||'</b><br><small>'||e(r.specificationname)||'</small></td><td>'||n(r.la_qty)||'</td><td>'||case when r.grntno is null then '<span class="slc360-warn">Pending</span>' else '<a href="'||app_url(146,'P146_TNO',r.grntno)||'">'||e(r.grnno)||'</a><br><small>'||n(r.grn_qty)||'</small>' end||'</td><td>'||case when r.ccinvoicetno is null then '<span class="slc360-warn">Pending</span>' else '<a href="'||app_url(175,'P175_TNO',r.ccinvoicetno)||'">'||e(r.ccinvoiceno)||'</a><br><small>'||n(r.invoiced_qty)||'</small>' end||'</td><td><b>'||n(r.pending_invoice_qty)||'</b></td><td>'||e(coalesce(r.destinationplacecode,r.sodeliveryaddress))||'</td></tr>');
    end loop;
    htp.p('</tbody></table></div><div class="slc360-actions"><a href="'||app_url(154)||'">Loading Advice register</a><a href="'||app_url(117)||'">Purchase Order register</a><a href="'||app_url(145)||'">GRN register</a><a href="'||app_url(174)||'">CC Invoice register</a></div>'); section_end;
    section_start('Dispatch, Gate, Weighment & Invoice Trace','Every downstream document with direct links to Ironmart transaction forms.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Dispatch</th><th>Vehicle</th><th>Gate In</th><th>Gate Out</th><th>Weighment</th><th>Net Weight</th><th>Invoice</th><th>E-Invoice</th></tr></thead><tbody>');
    for r in (select da.tno da_tno,da.despatchadviceno,da.vehicleno,m.tno mo_tno,m.gateintime,m.gateouttime,w.tno w_tno,w.weighmentno,w.netweight,c.tno ci_tno,c.ccinvoiceno,e.tno ei_tno,e.irn from despatchadvice da left join materialout m on m.referencetno=da.tno left join weighment w on w.despatchadvicetno=da.tno left join ccinvoice c on c.salesordertno=da.salesordertno and (c.despatchadvicetno=da.tno or c.despatchadvicetno is null) left join einvoice e on e.ccinvoicetno=c.tno and e.canceldate is null where da.salesordertno=l_tno order by da.despatchadvicedate desc) loop
      htp.p('<tr><td><a href="'||app_url(161,'P161_TNO',r.da_tno)||'">'||e(r.despatchadviceno)||'</a></td><td><a href="'||app_url(724,'P724_VEHICLE',r.vehicleno)||'">'||e(r.vehicleno)||'</a></td><td>'||case when r.gateintime is null then '-' else to_char(r.gateintime,'DD-MON HH24:MI') end||'</td><td>'||case when r.gateouttime is null then '<span class="slc360-warn">Pending</span>' else to_char(r.gateouttime,'DD-MON HH24:MI') end||'</td><td>'||case when r.w_tno is null then '-' else '<a href="'||app_url(133,'P133_TNO',r.w_tno)||'">'||e(r.weighmentno)||'</a>' end||'</td><td>'||n(r.netweight)||'</td><td>'||case when r.ci_tno is null then '-' else '<a href="'||app_url(175,'P175_TNO',r.ci_tno)||'">'||e(r.ccinvoiceno)||'</a>' end||'</td><td>'||case when r.irn is null then '<span class="slc360-warn">Pending</span>' else '<span class="slc360-ok">IRN active</span>' end||'</td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
  exception when no_data_found then empty_state('The selected order no longer exists.');
  end;

  procedure render_vehicle(p_key varchar2) is
    l_vehicle varchar2(200):=trim(p_key); l_trips number; l_customers number; l_last date; l_avg number;
  begin
    open_page('Logistics · Traceability','Vehicle 360','Every trip for one vehicle: gate movement, dispatch, order, customer, weighment and invoice.');
    if l_vehicle is null then
      empty_state('Choose a vehicle below.'); section_start('Recent Vehicles','Vehicles seen in dispatch, gate, weighment or invoice activity.'); htp.p('<div class="slc360-list">');
      for r in (select vehicle,max(event_date) last_event,count(*) events from (select vehicleno vehicle,nvl(gateintime,materialoutdate) event_date from materialout where companycode=v('GLOBAL_COMPANYCODE') and vehicleno is not null union all select vehicleno,weighmentdate from weighment where companycode=v('GLOBAL_COMPANYCODE') and vehicleno is not null union all select vehicleno,ccinvoicedate from ccinvoice where companycode=v('GLOBAL_COMPANYCODE') and vehicleno is not null) group by vehicle order by last_event desc fetch first 80 rows only) loop
        htp.p('<a href="'||app_url(724,'P724_VEHICLE',r.vehicle)||'"><span><b>'||e(r.vehicle)||'</b><small>'||r.events||' recorded events</small></span><span>'||to_char(r.last_event,'DD-MON-YYYY')||'</span></a>');
      end loop; htp.p('</div>'); section_end; return;
    end if;
    select count(*),count(distinct partycode),max(nvl(gateintime,materialoutdate)),round(avg(case when gateintime is not null and gateouttime is not null and gateouttime>=gateintime then (gateouttime-gateintime)*24 end),1) into l_trips,l_customers,l_last,l_avg from materialout where companycode=v('GLOBAL_COMPANYCODE') and upper(trim(vehicleno))=upper(l_vehicle);
    htp.p('<div class="slc360-actions"><a href="'||app_url(167)||'">Material Out register</a><a href="'||app_url(132)||'">Weighment register</a><a href="'||app_url(174)||'">CC Invoice register</a></div>');
    htp.p('<div class="slc360-kpis"><div><small>VEHICLE</small><b>'||e(l_vehicle)||'</b><span>Selected registration</span></div><div><small>CUSTOMERS SERVED</small><b>'||l_customers||'</b><span>Distinct parties carried</span></div><div><small>LAST TRIP</small><b>'||nvl(to_char(l_last,'DD-MON-YYYY'),'-')||'</b><span>Most recent gate activity</span></div><div><small>AVG DWELL</small><b>'||nvl(to_char(l_avg,'FM999G990D0'),'0.0')||' h</b><span>Gate-in to gate-out</span></div></div>');
    section_start('Trip History','Every gate movement for this vehicle, newest first.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Gate Pass</th><th>Dispatch</th><th>Sales Order</th><th>Customer</th><th>Gate In</th><th>Gate Out</th><th>Dwell</th><th>Weighment</th><th>Invoice</th></tr></thead><tbody>');
    for r in (select m.tno mo_tno,m.materialoutno,m.gateintime,m.gateouttime,round((m.gateouttime-m.gateintime)*24,1) dwell,da.tno da_tno,da.despatchadviceno,so.tno so_tno,so.salesorderno,getpartyname(m.partycode) party,w.tno w_tno,w.weighmentno,c.tno ci_tno,c.ccinvoiceno from materialout m left join despatchadvice da on da.tno=m.referencetno left join salesorder so on so.tno=da.salesordertno left join weighment w on w.despatchadvicetno=da.tno left join ccinvoice c on c.despatchadvicetno=da.tno where m.companycode=v('GLOBAL_COMPANYCODE') and upper(trim(m.vehicleno))=upper(l_vehicle) order by nvl(m.gateintime,m.materialoutdate) desc) loop
      htp.p('<tr><td><a href="'||app_url(168,'P168_TNO',r.mo_tno)||'">'||e(r.materialoutno)||'</a></td><td>'||case when r.da_tno is null then '-' else '<a href="'||app_url(161,'P161_TNO',r.da_tno)||'">'||e(r.despatchadviceno)||'</a>' end||'</td><td>'||case when r.so_tno is null then '-' else '<a href="'||app_url(723,'P723_TNO',r.so_tno)||'">'||e(r.salesorderno)||'</a>' end||'</td><td>'||e(r.party)||'</td><td>'||case when r.gateintime is null then '-' else to_char(r.gateintime,'DD-MON HH24:MI') end||'</td><td>'||case when r.gateouttime is null then '<span class="slc360-warn">Pending</span>' else to_char(r.gateouttime,'DD-MON HH24:MI') end||'</td><td>'||n(r.dwell)||' h</td><td>'||case when r.w_tno is null then '-' else '<a href="'||app_url(133,'P133_TNO',r.w_tno)||'">'||e(r.weighmentno)||'</a>' end||'</td><td>'||case when r.ci_tno is null then '-' else '<a href="'||app_url(175,'P175_TNO',r.ci_tno)||'">'||e(r.ccinvoiceno)||'</a>' end||'</td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
  end;

  procedure render_category(p_key varchar2) is
    l_cat varchar2(200):=trim(p_key); l_name varchar2(300); l_value number; l_qty number; l_customers number; l_rate number;
  begin
    open_page('Product · Category intelligence','Category 360','Who it sold to, weighted rate and value trend, specifications inside it, and every bill and order produced.');
    if l_cat is null then
      empty_state('Choose an item category below.'); section_start('Product Categories','Open a category to see its commercial performance.'); htp.p('<div class="slc360-list">');
      for r in (select ic.itemcategorycode,ic.itemcategoryname,count(distinct i.itemcode) item_count from itemcategory ic left join item i on i.itemcategorycode=ic.itemcategorycode group by ic.itemcategorycode,ic.itemcategoryname order by ic.itemcategoryname) loop
        htp.p('<a href="'||app_url(725,'P725_CATEGORY',r.itemcategorycode)||'"><span><b>'||e(r.itemcategoryname)||'</b><small>'||e(r.itemcategorycode)||'</small></span><span>'||r.item_count||' items</span></a>');
      end loop; htp.p('</div>'); section_end; return;
    end if;
    select itemcategoryname into l_name from itemcategory where itemcategorycode=l_cat;
    select nvl(sum(d.amount),0),nvl(sum(d.quantity1),0),count(distinct c.partycode),nvl(sum(d.amount)/nullif(sum(d.quantity1),0),0) into l_value,l_qty,l_customers,l_rate from ccinvoice c join ccinvoicedetail d on d.tno=c.tno join item i on i.itemcode=d.itemcode where c.companycode=v('GLOBAL_COMPANYCODE') and i.itemcategorycode=l_cat and c.ccinvoicedate>=add_months(trunc(sysdate,'MM'),-11);
    htp.p('<div class="slc360-actions"><a href="'||app_url(54)||'">Category register</a><a href="'||app_url(704)||'">Quotation register</a><a href="'||app_url(170)||'">Order register</a><a href="'||app_url(174)||'">Invoice register</a></div>');
    htp.p('<div class="slc360-kpis"><div><small>CATEGORY</small><b>'||e(l_name)||'</b><span>'||e(l_cat)||'</span></div><div><small>INVOICED VALUE</small><b>₹ '||n(round(l_value/10000000,2))||' Cr</b><span>Last 12 months</span></div><div><small>AVG RATE</small><b>₹ '||n(l_rate)||'</b><span>Weighted per unit</span></div><div><small>CUSTOMERS / QTY</small><b>'||l_customers||' / '||n(l_qty)||'</b><span>Distinct parties / sold qty</span></div></div>');
    section_start('Rate & Value Trend','Monthly weighted average rate and invoiced value for the last 12 months.');
    htp.p('<div class="slc360-bars">');
    for r in (select trunc(c.ccinvoicedate,'MM') month_start,sum(d.amount) value_amt,sum(d.amount)/nullif(sum(d.quantity1),0) avg_rate from ccinvoice c join ccinvoicedetail d on d.tno=c.tno join item i on i.itemcode=d.itemcode where c.companycode=v('GLOBAL_COMPANYCODE') and i.itemcategorycode=l_cat and c.ccinvoicedate>=add_months(trunc(sysdate,'MM'),-11) group by trunc(c.ccinvoicedate,'MM') order by 1) loop
      htp.p('<div><span>'||to_char(r.month_start,'MON YYYY')||'</span><i style="--w:'||least(100,greatest(4,round(r.value_amt/nullif(l_value,0)*500)))||'%"></i><b>₹ '||n(round(r.value_amt/10000000,2))||' Cr · rate '||n(r.avg_rate)||'</b></div>');
    end loop; htp.p('</div>'); section_end;
    section_start('Sold To','Every customer billed for this category in the last 12 months.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Customer</th><th>Quantity</th><th>Value</th><th>Average Rate</th><th>Context</th></tr></thead><tbody>');
    for r in (select c.partycode,getpartyname(c.partycode) party,sum(d.quantity1) qty,sum(d.amount) value_amt,sum(d.amount)/nullif(sum(d.quantity1),0) avg_rate from ccinvoice c join ccinvoicedetail d on d.tno=c.tno join item i on i.itemcode=d.itemcode where c.companycode=v('GLOBAL_COMPANYCODE') and i.itemcategorycode=l_cat and c.ccinvoicedate>=add_months(trunc(sysdate,'MM'),-11) group by c.partycode order by value_amt desc) loop
      htp.p('<tr><td><b>'||e(r.party)||'</b></td><td>'||n(r.qty)||'</td><td>₹ '||n(r.value_amt)||'</td><td>₹ '||n(r.avg_rate)||'</td><td><a href="'||app_url(511,'P511_PARTYCODE',r.partycode)||'">Customer dashboard →</a></td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
    section_start('Specifications Inside','Items and specifications that make up this category.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Item</th><th>Specification</th><th>Quantity</th><th>Value</th><th>Average Rate</th></tr></thead><tbody>');
    for r in (select d.itemcode,d.itemspecificationcode,sum(d.quantity1) qty,sum(d.amount) value_amt,sum(d.amount)/nullif(sum(d.quantity1),0) avg_rate from ccinvoice c join ccinvoicedetail d on d.tno=c.tno join item i on i.itemcode=d.itemcode where c.companycode=v('GLOBAL_COMPANYCODE') and i.itemcategorycode=l_cat and c.ccinvoicedate>=add_months(trunc(sysdate,'MM'),-11) group by d.itemcode,d.itemspecificationcode order by value_amt desc) loop
      htp.p('<tr><td><a href="'||app_url(726,'P726_ITEMCODE',r.itemcode)||'">'||e(getitemname(r.itemcode))||'</a></td><td>'||e(getitemspecificationname(r.itemcode,r.itemspecificationcode))||'</td><td>'||n(r.qty)||'</td><td>₹ '||n(r.value_amt)||'</td><td>₹ '||n(r.avg_rate)||'</td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
    section_start('Bills & Orders','Every invoice line in this category, newest first.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Invoice</th><th>Date</th><th>Customer</th><th>Item</th><th>Qty</th><th>Value</th><th>Sales Order</th></tr></thead><tbody>');
    for r in (select * from (select c.tno ci_tno,c.ccinvoiceno,c.ccinvoicedate,c.partycode,d.itemcode,d.quantity1,d.amount,so.tno so_tno,so.salesorderno from ccinvoice c join ccinvoicedetail d on d.tno=c.tno join item i on i.itemcode=d.itemcode left join salesorder so on so.tno=c.salesordertno where c.companycode=v('GLOBAL_COMPANYCODE') and i.itemcategorycode=l_cat order by c.ccinvoicedate desc) where rownum<=200) loop
      htp.p('<tr><td><a href="'||app_url(175,'P175_TNO',r.ci_tno)||'">'||e(r.ccinvoiceno)||'</a></td><td>'||to_char(r.ccinvoicedate,'DD-MON-YYYY')||'</td><td>'||e(getpartyname(r.partycode))||'</td><td><a href="'||app_url(726,'P726_ITEMCODE',r.itemcode)||'">'||e(getitemname(r.itemcode))||'</a></td><td>'||n(r.quantity1)||'</td><td>₹ '||n(r.amount)||'</td><td>'||case when r.so_tno is null then '-' else '<a href="'||app_url(723,'P723_TNO',r.so_tno)||'">'||e(r.salesorderno)||'</a>' end||'</td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
  exception when no_data_found then empty_state('The selected category no longer exists.');
  end;

  procedure render_item(p_key varchar2) is
    l_item varchar2(200):=trim(p_key); l_item_tno number; l_name varchar2(300); l_cat varchar2(200); l_value number; l_qty number; l_customers number; l_rate number;
  begin
    open_page('Product · Item intelligence','Item Sales Analysis','Sales value, customer mix, specification performance and source transactions for one Ironmart item.');
    if l_item is null then
      empty_state('Choose an item below.'); section_start('Top Invoiced Items','Open an item to inspect its commercial performance.'); htp.p('<div class="slc360-list">');
      for r in (select * from (select d.itemcode,getitemname(d.itemcode) item_name,sum(d.amount) value_amt from ccinvoice c join ccinvoicedetail d on d.tno=c.tno where c.companycode=v('GLOBAL_COMPANYCODE') and c.ccinvoicedate>=add_months(trunc(sysdate,'MM'),-11) group by d.itemcode order by value_amt desc) where rownum<=100) loop
        htp.p('<a href="'||app_url(726,'P726_ITEMCODE',r.itemcode)||'"><span><b>'||e(r.item_name)||'</b><small>'||e(r.itemcode)||'</small></span><span>₹ '||n(round(r.value_amt/10000000,2))||' Cr</span></a>');
      end loop; htp.p('</div>'); section_end; return;
    end if;
    select i.tno,i.itemname,nvl(ic.itemcategoryname,i.itemcategorycode) into l_item_tno,l_name,l_cat from item i left join itemcategory ic on ic.itemcategorycode=i.itemcategorycode where i.itemcode=l_item;
    select nvl(sum(d.amount),0),nvl(sum(d.quantity1),0),count(distinct c.partycode),nvl(sum(d.amount)/nullif(sum(d.quantity1),0),0) into l_value,l_qty,l_customers,l_rate from ccinvoice c join ccinvoicedetail d on d.tno=c.tno where c.companycode=v('GLOBAL_COMPANYCODE') and d.itemcode=l_item and c.ccinvoicedate>=add_months(trunc(sysdate,'MM'),-11);
    htp.p('<div class="slc360-actions"><a href="'||app_url(59,'P59_TNO',l_item_tno)||'">Open Item form</a><a href="'||app_url(174)||'">Invoice register</a><a href="'||app_url(170)||'">Order register</a></div>');
    htp.p('<div class="slc360-kpis"><div><small>ITEM</small><b>'||e(l_name)||'</b><span>'||e(l_item)||'</span></div><div><small>CATEGORY</small><b>'||e(l_cat)||'</b><span>Product classification</span></div><div><small>INVOICED VALUE</small><b>₹ '||n(round(l_value/10000000,2))||' Cr</b><span>'||n(l_qty)||' quantity</span></div><div><small>CUSTOMERS / RATE</small><b>'||l_customers||' / ₹ '||n(l_rate)||'</b><span>Distinct parties / weighted rate</span></div></div>');
    section_start('Customer Performance','Who bought this item in the last 12 months.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Customer</th><th>Quantity</th><th>Value</th><th>Average Rate</th><th>Context</th></tr></thead><tbody>');
    for r in (select c.partycode,getpartyname(c.partycode) party,sum(d.quantity1) qty,sum(d.amount) value_amt,sum(d.amount)/nullif(sum(d.quantity1),0) avg_rate from ccinvoice c join ccinvoicedetail d on d.tno=c.tno where c.companycode=v('GLOBAL_COMPANYCODE') and d.itemcode=l_item and c.ccinvoicedate>=add_months(trunc(sysdate,'MM'),-11) group by c.partycode order by value_amt desc) loop
      htp.p('<tr><td><b>'||e(r.party)||'</b></td><td>'||n(r.qty)||'</td><td>₹ '||n(r.value_amt)||'</td><td>₹ '||n(r.avg_rate)||'</td><td><a href="'||app_url(511,'P511_PARTYCODE',r.partycode)||'">Customer dashboard →</a></td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
    section_start('Invoices & Orders','Source transaction lines for this item.');
    htp.p('<div class="slc360-scroll"><table><thead><tr><th>Invoice</th><th>Date</th><th>Customer</th><th>Specification</th><th>Qty</th><th>Rate</th><th>Amount</th><th>Sales Order</th></tr></thead><tbody>');
    for r in (select * from (select c.tno ci_tno,c.ccinvoiceno,c.ccinvoicedate,c.partycode,d.itemspecificationcode,d.quantity1,d.rate,d.amount,so.tno so_tno,so.salesorderno from ccinvoice c join ccinvoicedetail d on d.tno=c.tno left join salesorder so on so.tno=c.salesordertno where c.companycode=v('GLOBAL_COMPANYCODE') and d.itemcode=l_item order by c.ccinvoicedate desc) where rownum<=200) loop
      htp.p('<tr><td><a href="'||app_url(175,'P175_TNO',r.ci_tno)||'">'||e(r.ccinvoiceno)||'</a></td><td>'||to_char(r.ccinvoicedate,'DD-MON-YYYY')||'</td><td>'||e(getpartyname(r.partycode))||'</td><td>'||e(getitemspecificationname(l_item,r.itemspecificationcode))||'</td><td>'||n(r.quantity1)||'</td><td>₹ '||n(r.rate)||'</td><td>₹ '||n(r.amount)||'</td><td>'||case when r.so_tno is null then '-' else '<a href="'||app_url(723,'P723_TNO',r.so_tno)||'">'||e(r.salesorderno)||'</a>' end||'</td></tr>');
    end loop; htp.p('</tbody></table></div>'); section_end;
  exception when no_data_found then empty_state('The selected item no longer exists.');
  end;

  procedure render(p_kind varchar2, p_key varchar2) is
  begin
    case upper(p_kind)
      when 'QUOTATION' then render_quotation(p_key);
      when 'ORDER' then render_order(p_key);
      when 'VEHICLE' then render_vehicle(p_key);
      when 'CATEGORY' then render_category(p_key);
      when 'ITEM' then render_item(p_key);
      else empty_state('Unsupported lifecycle view.');
    end case;
  end;
end imart_slc_360;
/

show errors package body imart_slc_360
