prompt --application/shared_components/user_interface/templates/report/cards_with_chart_iboss
begin
--   Manifest
--     ROW TEMPLATE: cards-with-chart-iboss
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(65705268026768590)
,p_row_template_name=>'Cards with Chart iBoss'
,p_static_id=>'cards-with-chart-iboss'
,p_internal_name=>'CARDS_WITH_CHART_IBOSS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="i-Cards-item #CARD_MODIFIERS#">',
'  <div class="i-Card" style="background-color: #BACKGROUND_COLOR#; border: 2px solid #BORDER_COLOR#;">',
'    <a href="#CARD_LINK#" class="i-Card-wrap">',
'      <div class="i-Card-titleWrap">',
'        <h3 class="i-Card-title" style="color: #TEXT_COLOR#;">#CARD_TITLE#</h3>',
'        <span class="i-Icon fa #CARD_ICON#" style="color: #TEXT_COLOR#;"></span>',
'      </div>',
'      <div class="i-Card-body">',
'        <div class="i-Card-desc" style="color: #TEXT_COLOR#;"><span id="iboss-card-pre-text">#CARD_PRE_TEXT#</span>#CARD_TEXT#<span id="iboss-card-post-text">#CARD_POST_TEXT#</span></div>',
'        ',
'        <div class="i-Card-chartContainer">',
'          <canvas class="kpi-sparkline" ',
'                  data-chart-type="#CHART_TYPE#" ',
'                  data-chart-values="#CHART_DATA#" ',
'                  data-chart-labels="#CHART_LABELS#"',
'                  data-chart-color="#TEXT_COLOR#">',
'          </canvas>',
'        </div>',
'',
'        <div class="i-Card-info" style="color: #TREND_COLOR#; background-color: #BORDER_COLOR#; font-weight: bold; display: flex; align-items: center; gap: 5px;">',
'          <span class="fa #TREND_ICON#"></span>',
'          <span>#CARD_SUBTEXT#</span>',
'        </div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="i-Cards-item #CARD_MODIFIERS#">',
'  <div class="i-Card" style="background-color: #BACKGROUND_COLOR#; border: 2px solid #BORDER_COLOR#;">',
'    <a href="#CARD_LINK#" class="i-Card-wrap">',
'      <div class="i-Card-titleWrap">',
'        <h3 class="i-Card-title" style="color: #TEXT_COLOR#;">#CARD_TITLE#</h3>',
'        <span class="i-Icon fa #CARD_ICON#" style="color: #TEXT_COLOR#;"></span>',
'      </div>',
'      <div class="i-Card-body">',
'        <div class="i-Card-desc" style="color: #TEXT_COLOR#;"><span id="iboss-card-pre-text">#CARD_PRE_TEXT#</span>#CARD_TEXT#<span id="iboss-card-post-text">#CARD_POST_TEXT#</span></div>',
'        ',
'        <div class="i-Card-chartContainer">',
'          <canvas class="kpi-sparkline" ',
'                  data-chart-type="#CHART_TYPE#" ',
'                  data-chart-values="#CHART_DATA#" ',
'                  data-chart-labels="#CHART_LABELS#"',
'                  data-chart-color="#TEXT_COLOR#">',
'          </canvas>',
'        </div>',
'',
'        <div class="i-Card-info" style="color: #TREND_COLOR#; background-color: #BORDER_COLOR#; font-weight: bold; display: flex; align-items: center; gap: 5px;">',
'          <span class="fa #TREND_ICON#"></span>',
'          <span>#CARD_SUBTEXT#</span>',
'        </div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(65734052611895424)
,p_theme_id=>42
,p_name=>'DISABLE_CHART_VIEW'
,p_static_id=>'disable-chart-view'
,p_display_name=>'Disable Chart View'
,p_display_sequence=>2
,p_report_template_id=>wwv_flow_imp.id(65705268026768590)
,p_css_classes=>'iboss-disable-chart'
,p_template_types=>'REPORT'
,p_help_text=>'Disable the Chart view within the card'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(65951982003642018)
,p_theme_id=>42
,p_name=>'DISABLE_ICON'
,p_static_id=>'disable-icon'
,p_display_name=>'Disable Icon'
,p_display_sequence=>3
,p_report_template_id=>wwv_flow_imp.id(65705268026768590)
,p_css_classes=>'iboss-disable-icon'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(65954799994668990)
,p_theme_id=>42
,p_name=>'DISABLE_POST_TEXT'
,p_static_id=>'disable-post-text'
,p_display_name=>'Disable Post Text'
,p_display_sequence=>4
,p_report_template_id=>wwv_flow_imp.id(65705268026768590)
,p_css_classes=>'iboss-disable-post-text'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(65759345270251381)
,p_theme_id=>42
,p_name=>'DISABLE_TRENDS_STYLE'
,p_static_id=>'disable-trends-style'
,p_display_name=>'Disable Trends Style'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(65705268026768590)
,p_css_classes=>'iboss-disable-trends'
,p_template_types=>'REPORT'
);
wwv_flow_imp.component_end;
end;
/
