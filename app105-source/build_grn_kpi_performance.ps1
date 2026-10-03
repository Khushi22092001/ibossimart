$ErrorActionPreference='Stop'
$kpiRoot='C:/Users/shree/Documents/git projects/ibosssagar/app105-source'
$kpiClient=Get-Content -Raw "$kpiRoot/transaction_kpis.js"
$kpiSql=@'
whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
begin execute immediate 'create table imart_grn_kpi_perf_bak_20261001 as select id,page_id,plug_source from apex_260100.wwv_flow_page_plugs where flow_id=105 and page_id=145 and (static_id=''tx-kpi-shell-145'' or plug_source_type=''NATIVE_IR'')';exception when others then if sqlcode<>-955 then raise;end if;end;
/
begin execute immediate 'create table imart_tx_pkg_perf_bak_20261001 as select type,line,text from user_source where name=''IMART_TRANSACTION_KPIS''';exception when others then if sqlcode<>-955 then raise;end if;end;
/
@app105-source/transaction_kpis_package.sql
declare n number;c integer;js clob:=q'~__CLIENT__~';src clob;i number;j number;q clob;begin
select count(*) into n from user_errors where name='IMART_TRANSACTION_KPIS';if n>0 then raise_application_error(-20001,'KPI package compile errors');end if;
q:=imart_transaction_kpis.report_sql(145);c:=dbms_sql.open_cursor;dbms_sql.parse(c,q,dbms_sql.native);dbms_sql.close_cursor(c);
select plug_source into src from apex_260100.wwv_flow_page_plugs where flow_id=105 and page_id=145 and static_id='tx-kpi-shell-145';
i:=instr(src,'<script>');j:=instr(src,'</script>',i);
if i=0 or j=0 then raise_application_error(-20002,'Expected existing inline client missing');end if;
src:=substr(src,1,i+7)||js||substr(src,j);
update apex_260100.wwv_flow_page_plugs set plug_source=src where flow_id=105 and page_id=145 and static_id='tx-kpi-shell-145';
update apex_260100.wwv_flow_page_plugs set plug_source=q where flow_id=105 and id=(select region_id from imart_tx_kpi_config where page_id=145);
commit;
end;
/
exit
'@
$kpiSql.Replace('__CLIENT__',$kpiClient) | Set-Content -Encoding utf8 "$kpiRoot/deploy_grn_kpi_performance.sql"
