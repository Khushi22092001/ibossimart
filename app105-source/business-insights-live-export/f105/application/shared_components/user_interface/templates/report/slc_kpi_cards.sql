prompt --application/shared_components/user_interface/templates/report/slc_kpi_cards
begin
--   Manifest
--     ROW TEMPLATE: slc-kpi-cards
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(71000000000000000200)
,p_row_template_name=>'SLC KPI Cards'
,p_static_id=>'slc-kpi-cards'
,p_internal_name=>'SLC_KPI_CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="slct-report-card">',
'  <a class="slct-report-card-link slct-hover" href="#CARD_LINK#" data-tooltip="#CARD_TITLE#: #CARD_SUBTITLE#. #CARD_TEXT#">',
'    <span class="slct-report-card-top"><i class="fa #CARD_ICON#"></i><b>#CARD_TITLE#</b></span>',
'    <strong>#CARD_SUBTITLE#</strong>',
'    <small>#CARD_TEXT#</small>',
'    <span class="slct-report-card-foot"><em>#CARD_SUBTEXT#</em><span>Open <i class="fa #CARD_ICON2#"></i></span></span>',
'  </a>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="slct-report-card">',
'  <div class="slct-report-card-link">',
'    <span class="slct-report-card-top"><i class="fa #CARD_ICON#"></i><b>#CARD_TITLE#</b></span>',
'    <strong>#CARD_SUBTITLE#</strong>',
'    <small>#CARD_TEXT#</small>',
'    <span class="slct-report-card-foot"><em>#CARD_SUBTEXT#</em></span>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="slct-report-card-grid #COMPONENT_CSS_CLASSES#" id="#REGION_STATIC_ID#_cards">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_theme_id=>42
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_imp.component_end;
end;
/
