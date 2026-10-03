-- Only the 116 exact-title static regions received this class in this deployment.
-- Their original class values are recorded in verification/filter-classes-before-20260929.txt.
whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
update apex_260100.wwv_flow_page_plugs
 set region_css_classes=trim(regexp_replace(region_css_classes,'(^|[[:space:]])hspl-drawer([[:space:]]|$)',' '))
 where flow_id=105 and security_group_id=4744311978888504
 and lower(trim(plug_name)) in ('filter','filters') and plug_source_type='NATIVE_STATIC';
commit;
exit
