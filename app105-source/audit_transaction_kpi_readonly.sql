set define off
set serveroutput on size unlimited
set long 1000000
set longchunksize 1000000
set linesize 250
set pagesize 1000
connect -name IMART
spool app105-source/transaction_kpi_audit.txt
select page_id,page_name from apex_application_pages where application_id=105 and (page_id in (107,117,145,142,923) or upper(page_name) like '%BILL PASS%' or upper(page_name) like '%MATERIAL IN%') order by page_id;
begin
for r in (select page_id,region_id,region_name,static_id,region_source from apex_application_page_regions where application_id=105 and page_id in (68,107,117,145,142,151) and source_type in ('Interactive Report','Interactive Grid')) loop
dbms_output.put_line('REGION '||r.page_id||' '||r.region_id||' '||r.static_id||' '||r.region_name);
for i in 0..trunc(dbms_lob.getlength(r.region_source)/30000) loop dbms_output.put_line(dbms_lob.substr(r.region_source,30000,1+i*30000));end loop;
end loop;
end;
/
select table_name,column_name,data_type from user_tab_columns where table_name in ('INDENT','INDENTDETAIL','PURCHASEORDERDETAILINDENT','GRNDETAIL','MATERIALINDETAIL') order by table_name,column_id;
select name,text from user_source where name in ('GETPENDINGINDENTQUANTITY1','GETPENDINGPOQUANTITY1','GETPENDINGINDENTQTY1','GETPENDINGGRNQUANTITY1') order by name,line;
select object_name from user_objects where object_type='FUNCTION' and (object_name like '%PENDING%INDENT%' or object_name like '%PENDING%GRN%' or object_name like '%PENDING%PO%');
spool off
exit
