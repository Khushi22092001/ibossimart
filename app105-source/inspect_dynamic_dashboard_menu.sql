connect -name IMART
set pagesize 300 linesize 280 trimspool on
column column_name format a30
column data_type format a18
column myboxkey format a30
column parentkey format a30
column myboxlabel format a34
column bossusercode format a20
column companycode format a18

select column_id,column_name,data_type
  from user_tab_columns
 where table_name='MYBOXTREE_APEXMENU'
 order by column_id;

prompt === dashboard tree rows ===
select distinct bossusercode,companycode,myboxkey,parentkey,myboxlabel,pageno,serialno,iconname
  from myboxtree_apexmenu
 where upper(myboxlabel) like '%DASHBOARD%'
    or upper(myboxlabel) in ('PORTLET','TASK','360 VIEW','360 DASHBOARD')
 order by bossusercode,companycode,parentkey,serialno;
exit
