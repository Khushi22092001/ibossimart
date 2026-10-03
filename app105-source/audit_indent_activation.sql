set define off
set long 30000
set linesize 220
set pagesize 1000
connect -name IMART
spool app105-source/indent_activation.txt
select name,type,line,text from user_source where upper(text) like '%ACTIVETIME%' order by name,line;
select documentstatuscode,count(*) from documentstatusdetail where modulecode='INDENT' group by documentstatuscode;
select count(*) lines,count(requirementtimeindays) with_days from indentdetail;
select count(*) supplier_lines from pbpass p join purchasebill b on b.tno=p.purchasebilltno join voucher v on v.modulecode='PBPASS' and v.moduletno=p.tno join voucherdetail d on d.tno=v.tno and d.accountcode=b.partycode where d.amount>0;
spool off
exit
