whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 220 feedback off verify off

select h.hsncode,
       count(distinct tr.tno) tax_rules,
       count(*) tax_footer_lines,
       listagg(distinct tr.transactiontypecode, ', ') within group (order by tr.transactiontypecode) transaction_types
  from taxrule tr
  join taxrulehsn h on h.tno=tr.tno
  join taxruledetail a on a.tno=tr.tno
  join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno
 where h.hsncode in ('72169990','72163100')
 group by h.hsncode
 order by h.hsncode;

exit
