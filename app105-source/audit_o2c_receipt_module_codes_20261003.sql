whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 200
set linesize 220
connect -name IMART
select nvl(i.modulecode,'<NULL>') invoice_module,
       nvl(r.modulecode,'<NULL>') receipt_detail_module,
       count(*) linked_rows
  from ccinvoice c
  join invoice i on i.moduletno=c.tno
  join dfreightbillreceiptdetail r on r.moduletno=i.tno
 group by nvl(i.modulecode,'<NULL>'),nvl(r.modulecode,'<NULL>')
 order by linked_rows desc;
exit
