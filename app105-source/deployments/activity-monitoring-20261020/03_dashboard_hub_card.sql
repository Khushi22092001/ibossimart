set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
begin
wwv_flow_imp.import_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
end;
/
begin
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92002610209999000),
 p_flow_id=>105,
 p_page_id=>826,
 p_plug_name=>'Activity Monitoring shortcut',
 p_static_id=>'activity-monitoring-shortcut',
 p_plug_template=>wwv_flow_imp.id(3371237801798025892),
 p_region_template_options=>'#DEFAULT#:t-Region--noUI',
 p_plug_display_sequence=>20,
 p_plug_source=>'begin
 if imart_audit.can_inquire then
 htp.p(''<section class="hspl-directory-grid" aria-label="Activity Monitoring dashboard shortcut"><a class="hspl-directory-card hspl-directory-tone-4 hspl-dashboard-card" data-hspl-card-index="5" href="''||apex_escape.html_attribute(apex_page.get_url(p_page=>1100))||''"><span class="hspl-directory-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></span><span class="hspl-directory-title">Activity Monitoring</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span><span class="hspl-dashboard-description">Review recorded ERP activity, audit changes and management reports.</span><span class="hspl-dashboard-meta">ACTIVITY · AUDIT · MIS</span></a></section>'');
 end if;
end;',
 p_plug_source_type=>'NATIVE_PLSQL');
wwv_flow_imp.import_end;
commit;
end;
/
