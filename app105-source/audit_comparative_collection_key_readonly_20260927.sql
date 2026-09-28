set pagesize 200
set linesize 260
set trimspool on

prompt === Purchase vendor parameter ===
select nvl(getmyparametervalue('VENDORAPPLICABLEINPURCHASE'),'NO') vendor_applicable
  from dual;

prompt === Recent comparative headers ===
select *
  from (
        select tno,
               comparativestatementno,
               comparativestatementdate,
               enquirytno
          from comparativestatement
         order by tno desc
       )
 where rownum <= 20;

prompt === Exact eligible quotation rows for latest enquiry as of today ===
select q.enquirytno,
       q.tno quotationtno,
       q.quotationno,
       q.partycode,
       v.vendorname,
       q.validitydate,
       d.itemcode,
       d.itemspecificationcode,
       d.rate,
       d.amount
  from quotation q
  join quotationdetail d on d.tno=q.tno
  join vendor v on v.vendorcode=q.partycode
 where q.enquirytno=(select max(enquirytno) from quotation where enquirytno is not null)
   and q.validitydate >= trunc(sysdate)
   and nvl(getmyparametervalue('VENDORAPPLICABLEINPURCHASE'),'NO')='YES'
 order by q.tno,d.sno;

exit
