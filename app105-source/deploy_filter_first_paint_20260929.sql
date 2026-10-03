whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
set linesize 250
connect -name IMART
spool app105-source/verification/filter-classes-before-20260929.txt
select id,page_id,region_css_classes from apex_260100.wwv_flow_page_plugs
 where flow_id=105 and security_group_id=4744311978888504
 and lower(trim(plug_name)) in ('filter','filters') and plug_source_type='NATIVE_STATIC';
spool off
begin
 update apex_260100.wwv_flow_page_plugs
 set region_css_classes=trim(region_css_classes||' hspl-drawer')
 where flow_id=105 and security_group_id=4744311978888504
 and lower(trim(plug_name)) in ('filter','filters') and plug_source_type='NATIVE_STATIC'
 and not regexp_like(region_css_classes,'(^|[[:space:]])(hspl-drawer|js-filter-drawer)([[:space:]]|$)')
 or (flow_id=105 and security_group_id=4744311978888504
 and lower(trim(plug_name)) in ('filter','filters') and plug_source_type='NATIVE_STATIC'
 and region_css_classes is null);
 dbms_output.put_line('FILTER_FIRST_PAINT_REGIONS_UPDATED='||sql%rowcount);
 commit;
end;
/
exit
