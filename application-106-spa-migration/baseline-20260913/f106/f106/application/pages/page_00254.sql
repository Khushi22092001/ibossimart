prompt --application/pages/page_00254
begin
--   Manifest
--     PAGE: 00254
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>254
,p_name=>'Procure to Pay'
,p_alias=>'PROCURE-TO-PAY1'
,p_step_title=>'Procure to Pay'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Cards--compact .t-Card-wrap{',
'    display: grid;',
'    grid-template-columns: auto 1fr auto;',
'    grid-template-rows: auto 1fr auto;',
'    grid-template-areas: "cardlist-icon cardlist-title cardlist-icon2" "cardlist-body cardlist-body cardlist-body";',
'}',
'',
'.t-Cards--displayIcons .t-Card-icon {',
'    margin-left: 8px;',
'}',
'.t-Card-icon2{',
'    margin-top: 15px;',
'    margin-bottom: 15px;',
'    margin-right: 8px;',
'    padding-left: 15px;',
'    padding-right: 15px;',
'    display: flex;',
'    align-items: center;',
'    border-radius: 5px;',
'}',
'.t-Card-desc{',
'    font-style: italic;',
'    color: var(--u-color-15);',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(452422091545276619)
,p_plug_name=>'Information:'
,p_static_id=>'information'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p style="font-weight: bold; color: var(--u-color-15); margin: 0px; "> PO Amendment:</p>',
'<p style="font-style: Italic; color: var(--u-color-15);">To modify a Purchase Order, use the PO Amendment form before or after creating Goods Received Notes (GRNs) and Purchase Bills, unless all quantities have been consumed.</p>',
'<p style="font-weight: bold; color: var(--u-color-15); margin: 0px; "> Payment Advice:</p>',
'<p style="font-style: Italic; color: var(--u-color-15);">1. For Advance Payment against Purchase Order, Payment Advice can be used after creation and approval of Purchase Order.<br>',
'2. For Freight Advance against Loading Advice, Payment Advice can be used after creation and approval of Loading Advice.<br>',
'3. For Payment Processing against Purchase Bill, Payment Advice can be used after creation and approval of Purchase Bill Passing.<br></p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(458590376089932109)
,p_name=>'PR to PAY'
,p_static_id=>'pr-to-pay'
,p_template=>3371237801798025892
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--5cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''INDENT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:107:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Indent''                as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-file-text''               as CARD_ICON,',
'    ''This is a Sample Card Text'' as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
'Union All',
'Select',
'    2                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ENQUIRY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:707:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Purchase Enquiry''      as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-search''             as CARD_ICON,',
'    ''This is a Sample Card Text'' as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'union all',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''QUOTATION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:709:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Purchase Quotation''    as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-file-text''               as CARD_ICON,',
'    ''This is a Sample Card Text'' as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'union all',
'Select',
'    4                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''COMPARATIVESTATEMENT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:711:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Comparative Statement''    as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-analytics''          as CARD_ICON,',
'    ''This is a Sample Card Text'' as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'union all',
'Select',
'    5                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''RATECONTRACT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:713:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Rate Contract''        as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-inr''                as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'    ',
'From Dual',
'',
'union all',
'Select',
'    5                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''PURCHASEORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:117:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Purchase Order''        as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-cart-plus''          as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'    ',
'From Dual',
'',
'Union All',
'',
'Select',
'    6                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''POAMENDMENT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:147:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''PO Amendment''          as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-cart-edit''          as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'    ',
'From Dual',
'',
'Union All',
'',
'Select',
'    7                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOADINGADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:154:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Loading Advice''        as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-download-alt''       as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
'Union All',
'',
'Select',
'    8                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''MATERIALIN'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:68:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Materail In''           as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-clipboard-check-alt''as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
'Union All',
'',
'Select',
'    9                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''GRN'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:145:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''GRN''                   as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-cubes''              as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
'Union All',
'',
'Select',
'    10                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''FREIGHTADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:198:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Freight Advice''        as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-truck''              as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
'Union All',
'',
'Select',
'    11                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''PURCHASEBILL'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:142:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Purchase Bill''         as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-notebook''           as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'Union All',
'',
'Select',
'    12 as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''PBPASS'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:151:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Purchase Bill Pass''    as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-cart-check''         as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
'Union All',
'',
'Select',
'    13                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''PAYMENTADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:139:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Payment Advice''        as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-inr''              as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
'',
'Union All',
'',
'Select',
'    14                      as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''VOUCHER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:153:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:254:&APP_SESSION.'')',
'    END                     as CARD_LINK,',
'    ''Voucher Posting''       as CARD_TITLE,',
'    null                    as CARD_SUBTITLE,',
'    ''fa-credit-card''        as CARD_ICON,',
'    null                    as CARD_TEXT,',
'    null                    as CARD_SUBTEXT,',
'    ''fa-arrow-right-alt''    as CARD_ICON2,',
'    ''u-color-14''            as CARD_COLOR2',
'From Dual',
'',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(373753425870635784)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298253524598830452)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>150
,p_column_heading=>'Card Color2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298251891795830445)
,p_query_column_id=>5
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>120
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298253146203830451)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>140
,p_column_heading=>'Card Icon2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298250704264830437)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>80
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298252703160830449)
,p_query_column_id=>7
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>70
,p_column_heading=>'Card Subtext'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298251563715830440)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298252353488830447)
,p_query_column_id=>6
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>130
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298251134237830439)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>110
,p_column_heading=>'Card Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(298250322705830434)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(298265511557855173)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298265911389855173)
,p_event_id=>wwv_flow_imp.id(298265511557855173)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(298254439626830466)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(458590376089932109)
,p_condition_element=>'CARD_TEXT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298254898876830466)
,p_event_id=>wwv_flow_imp.id(298254439626830466)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CARD_TEXT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 't-Cards--desc-4ln')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298255408744830466)
,p_event_id=>wwv_flow_imp.id(298254439626830466)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-add-class-2'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CARD_TEXT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 't-Cards--hideBody')).to_clob
);
wwv_flow_imp.component_end;
end;
/
