set define off
set linesize 180
set pagesize 1000
connect -name IMART
spool app105-source/indent_ordered_rules.txt
select name,line,text from user_source where upper(text) like '%ORDEREDQUANTITY1%' and (upper(text) like '%INDENT%' or name like '%PURCHASEORDER%' or name like '%POAMEND%') order by name,line;
select trigger_name,triggering_event,table_name,status from user_triggers where table_name in ('INDENTDETAIL','PURCHASEORDERDETAILINDENT','POAMENDMENTDETAIL');
select documentstatuscode,count(*) from indentdetail group by documentstatuscode;
select count(*) total, count(requirementtimeindays) deadlines, count(case when orderedquantity1>0 then 1 end) ordered from indentdetail;
spool off
exit
