set define off
set sqlblanklines on
set sqlformat csv
set long 100000
connect -name IMART
spool app105-source/verification/extra-kpi-sources-20261003.csv
select p.page_id,p.id,p.plug_name,p.query_type,p.query_table,p.query_where,p.query_order_by,p.plug_source from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.plug_source_type='NATIVE_IR' and p.page_id in(90,103,111,113,115,121,139,201,214,216,219,310,351,375,523,613,617);
select modulecode,mastertablename,pageno from module where upper(mastertablename) in('COMPANYVEHICLE','EMPLOYEE','QUALITY','QUALITYTYPE','ITEMQUALITY','CURRENCYUNIT','PAYMENTADVICE','BOM','AGENTCOMMISSIONRATE','SALEINCENTIVERATE','LOCATION','QUALIFICATIONTYPE','QUALIFICATION');
select column_name from all_tab_columns where owner='APEX_260100' and table_name='WWV_FLOW_PAGE_PLUGS' and (column_name like '%BUILD%' or column_name like '%SECURITY%');
spool off
exit
