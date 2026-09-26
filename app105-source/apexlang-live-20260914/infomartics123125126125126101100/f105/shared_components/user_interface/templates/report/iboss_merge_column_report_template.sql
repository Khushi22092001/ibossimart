prompt --application/shared_components/user_interface/templates/report/iboss_merge_column_report_template
begin
--   Manifest
--     ROW TEMPLATE: iboss-merge-column-report-template
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(52542550599688852)
,p_row_template_name=>'iboss merge column report template'
,p_static_id=>'iboss-merge-column-report-template'
,p_internal_name=>'IBOSS_MERGE_COLUMN_REPORT_TEMPLATE'
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# #ACCESSIBLE_HEADERS#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" id="report_table_#REGION_STATIC_ID#" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ARIA_SORT# #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
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
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52551030757702981)
,p_theme_id=>42
,p_name=>'MERGE_COLUMN_1'
,p_static_id=>'merge-column-1'
,p_display_name=>'Merge Column 1'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-report-merge-column1'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52550772879702981)
,p_theme_id=>42
,p_name=>'MERGE_COLUMN_2'
,p_static_id=>'merge-column-2'
,p_display_name=>'Merge Column 2'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-report-merge-column2'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52543727965688859)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_static_id=>'stretchreport'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52545304799688859)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_static_id=>'altrowcolorsdisable'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(52544915207688859)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52545943564688860)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_static_id=>'altrowcolorsenable'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_imp.id(52544915207688859)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52546657563688860)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_static_id=>'horizontalborders'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(52542967770688858)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52543403802688859)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_static_id=>'removeallborders'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(52542967770688858)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52544448916688859)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_static_id=>'removeouterborders'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_imp.id(52542967770688858)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52547329061688860)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_static_id=>'verticalborders'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(52542967770688858)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52548158002688860)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_static_id=>'enable'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(52547779866688860)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(52548864517688860)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_static_id=>'rowhighlightdisable'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(52542550599688852)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_imp.id(52547779866688860)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
);
wwv_flow_imp.component_end;
end;
/
