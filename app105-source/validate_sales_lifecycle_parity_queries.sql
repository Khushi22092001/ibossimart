whenever sqlerror exit failure rollback
set define off
connect -name IMART
set pages 200 lines 240 trimspool on

prompt === Additional exception counts ===
select
  (select count(*) from despatchadvice d
    where d.companycode = (select min(companycode) from company)
      and not exists (select 1 from materialout m where m.referencetno=d.tno)) dispatch_without_gate,
  (select count(*) from weighment w
    where w.companycode = (select min(companycode) from company)
      and w.secondweight is null and nvl(w.iscanceled,'N') not in ('Y','YES')) awaiting_final_weigh,
  (select count(*) from materialout m
    where m.companycode = (select min(companycode) from company)
      and m.gateintime <= sysdate-2 and m.gateintime > sysdate-400 and m.gateouttime is null) stale_gate,
  (select count(*) from materialout m
    where m.companycode = (select min(companycode) from company)
      and m.gateouttime is not null
      and not exists (select 1 from ccinvoice c where c.despatchadvicetno=m.referencetno)) gateout_without_invoice
from dual;

prompt === Vehicle operational query ===
select * from (
  select m.vehicleno vehicle,
         nvl(getpartyname(m.partycode),m.partycode) customer,
         d.despatchadviceno dispatch_advice,
         s.salesorderno sales_order,
         m.gateintime event_time,
         round((nvl(m.gateouttime,sysdate)-m.gateintime)*24,1) hours_dwell,
         case when m.gateouttime is null and m.gateintime > sysdate-2 then 'Inside'
              when m.gateouttime is null then 'Delayed / data gap'
              else 'Completed' end status
    from materialout m
    left join despatchadvice d on d.tno=m.referencetno
    left join salesorder s on s.tno=d.salesordertno
   where m.gateintime is not null
   order by case when m.gateouttime is null then 0 else 1 end, m.gateintime desc
) where rownum <= 5;

prompt === Category flow query ===
with qcat as (
  select d.tno,
         listagg(distinct nvl(ic.itemcategoryname,'Uncategorised'), ', ')
           within group (order by nvl(ic.itemcategoryname,'Uncategorised')) category
    from salesquotationdetail d
    left join item i on i.itemcode=d.itemcode
    left join itemcategory ic on ic.itemcategorycode=i.itemcategorycode
   group by d.tno
), ocat as (
  select d.tno,
         listagg(distinct nvl(ic.itemcategoryname,'Uncategorised'), ', ')
           within group (order by nvl(ic.itemcategoryname,'Uncategorised')) category
    from salesorderdetail d
    left join item i on i.itemcode=d.itemcode
    left join itemcategory ic on ic.itemcategorycode=i.itemcategorycode
   group by d.tno
)
select * from (
  select qcat.category quoted_category,
         ocat.category ordered_category,
         case when qcat.category=ocat.category then 'Same' else 'Changed' end match_status,
         count(*) linked_orders
    from salesorder s
    join qcat on qcat.tno=s.salesquotationtno
    join ocat on ocat.tno=s.tno
   group by qcat.category,ocat.category,
            case when qcat.category=ocat.category then 'Same' else 'Changed' end
   order by case when qcat.category=ocat.category then 1 else 0 end, count(*) desc
) where rownum <= 20;

exit
