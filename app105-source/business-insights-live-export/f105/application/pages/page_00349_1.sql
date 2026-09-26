prompt --application/pages/page_00349
begin
--   Manifest
--     PAGE: 00349
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>349
,p_name=>'Vendor Register'
,p_alias=>'VENDOR-REGISTER'
,p_step_title=>'Vendor Register'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(627223253812804561)
,p_plug_name=>'Vendor List'
,p_static_id=>'vendor-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'   a.Tno,',
'   a.VendorCode,',
'   a.VendorName,',
'   a.ContactPerSon,',
'   a.OfficeAddress,',
'   a.OfficePhoneNo,',
'   a.OfficeMobileNo,',
'   a.OfficeEmailID,',
'   a.Website,',
'   GetLocationName(a.LocationCode) as LocationCode,',
'   a.Remark,',
'   a.Creator,',
'   a.CreationTime,',
'   a.RegistrationNo,',
'   a.RegistrationDate,',
'   a.VendorSiteVisitTno,',
'   a.ApproveByEmployeeCode,',
'   GetCityName(a.OfficeCityCode) as OfficeCityCode,',
'   a.ModuleCode,',
'   a.ModuleTno,',
'   a.OfficeStateCode,',
'   a.OfficeCountryCode,',
'   a.OfficePincode,',
'   a.ContactPersonAddress,',
'   GetCityName(a.ContactPersonCityCode) as ContactPersonCityCode,',
'   GetStateName(a.ContactPersonStateCode) as ContactPersonStateCode,',
'   a.ContactPersonCountryCode,',
'   a.ContactPersonPincode,',
'   a.ContactPersonPhoneNo,',
'   a.ContactPersonMobileNo,',
'   a.ContactPersonEmailID,',
'   a.VendorStatusCode,',
'   a.BusinessNatureCode,',
'   a.IndustryTypeCode,',
'   a.VendorCategory,',
'   b.TaxRegistrationTypeName,',
'   a.ImportTno',
'From Vendor a, TaxRegistrationtype b',
'Where a.TaxRegistrationtypeCode = b.TaxRegistrationtypeCode(+);',
'   '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Reverse Charge List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(627223330659804561)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:350:&SESSION.::&DEBUG.:RP,350:P350_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>518941796859422254
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455168181439920)
,p_db_column_name=>'APPROVEBYEMPLOYEECODE'
,p_display_order=>158
,p_column_identifier=>'AN'
,p_column_label=>'Approvebyemployeecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456578456439934)
,p_db_column_name=>'BUSINESSNATURECODE'
,p_display_order=>298
,p_column_identifier=>'BB'
,p_column_label=>'Businessnaturecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454207608439910)
,p_db_column_name=>'CONTACTPERSON'
,p_display_order=>58
,p_column_identifier=>'AD'
,p_column_label=>'CONTACT PERSON'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455649031439925)
,p_db_column_name=>'CONTACTPERSONADDRESS'
,p_display_order=>208
,p_column_identifier=>'AS'
,p_column_label=>'CONTACT PERSON ADDRESS'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455831113439926)
,p_db_column_name=>'CONTACTPERSONCITYCODE'
,p_display_order=>218
,p_column_identifier=>'AT'
,p_column_label=>'CONTACT PERSON CITY '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455981040439928)
,p_db_column_name=>'CONTACTPERSONCOUNTRYCODE'
,p_display_order=>238
,p_column_identifier=>'AV'
,p_column_label=>'Contactpersoncountrycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456387425439932)
,p_db_column_name=>'CONTACTPERSONEMAILID'
,p_display_order=>278
,p_column_identifier=>'AZ'
,p_column_label=>'Contactpersonemailid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456237359439931)
,p_db_column_name=>'CONTACTPERSONMOBILENO'
,p_display_order=>268
,p_column_identifier=>'AY'
,p_column_label=>'Contactpersonmobileno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456179798439930)
,p_db_column_name=>'CONTACTPERSONPHONENO'
,p_display_order=>258
,p_column_identifier=>'AX'
,p_column_label=>'CONTACT PERSON PHONE NO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456108286439929)
,p_db_column_name=>'CONTACTPERSONPINCODE'
,p_display_order=>248
,p_column_identifier=>'AW'
,p_column_label=>'CONTACT PERSON PINCODE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455907671439927)
,p_db_column_name=>'CONTACTPERSONSTATECODE'
,p_display_order=>228
,p_column_identifier=>'AU'
,p_column_label=>'CONTACT PERSON STATE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(627229303311804576)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'CREATION TIME'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(627229756144804576)
,p_db_column_name=>'CREATOR'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'CREATOR'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181457006534439938)
,p_db_column_name=>'IMPORTTNO'
,p_display_order=>338
,p_column_identifier=>'BF'
,p_column_label=>'Importtno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456722977439935)
,p_db_column_name=>'INDUSTRYTYPECODE'
,p_display_order=>308
,p_column_identifier=>'BC'
,p_column_label=>'Industrytypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454816504439916)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>118
,p_column_identifier=>'AJ'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(627230082417804576)
,p_db_column_name=>'MODULECODE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'MODULE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(627230518316804576)
,p_db_column_name=>'MODULETNO'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454254749439911)
,p_db_column_name=>'OFFICEADDRESS'
,p_display_order=>68
,p_column_identifier=>'AE'
,p_column_label=>'OFFICE ADDRESS'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455317499439921)
,p_db_column_name=>'OFFICECITYCODE'
,p_display_order=>168
,p_column_identifier=>'AO'
,p_column_label=>'OFFICE CITY '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455517368439923)
,p_db_column_name=>'OFFICECOUNTRYCODE'
,p_display_order=>188
,p_column_identifier=>'AQ'
,p_column_label=>'Officecountrycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454549427439914)
,p_db_column_name=>'OFFICEEMAILID'
,p_display_order=>98
,p_column_identifier=>'AH'
,p_column_label=>'OFFICE EMAIL ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454449692439913)
,p_db_column_name=>'OFFICEMOBILENO'
,p_display_order=>88
,p_column_identifier=>'AG'
,p_column_label=>'OFFICE MOBILE NO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454429288439912)
,p_db_column_name=>'OFFICEPHONENO'
,p_display_order=>78
,p_column_identifier=>'AF'
,p_column_label=>'OFFICE PHONE NO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455616363439924)
,p_db_column_name=>'OFFICEPINCODE'
,p_display_order=>198
,p_column_identifier=>'AR'
,p_column_label=>'OFFICE PINCODE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455385633439922)
,p_db_column_name=>'OFFICESTATECODE'
,p_display_order=>178
,p_column_identifier=>'AP'
,p_column_label=>'OFFICE STATE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454965361439918)
,p_db_column_name=>'REGISTRATIONDATE'
,p_display_order=>138
,p_column_identifier=>'AL'
,p_column_label=>'REGISTRATION DATE'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454862458439917)
,p_db_column_name=>'REGISTRATIONNO'
,p_display_order=>128
,p_column_identifier=>'AK'
,p_column_label=>'REGISTRATION NO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(627227309682804575)
,p_db_column_name=>'REMARK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'REMARK'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181480958962569320)
,p_db_column_name=>'TAXREGISTRATIONTYPENAME'
,p_display_order=>348
,p_column_identifier=>'BG'
,p_column_label=>'TAX REGISTRATION TYPE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(627223675148804570)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456778774439936)
,p_db_column_name=>'VENDORCATEGORY'
,p_display_order=>318
,p_column_identifier=>'BD'
,p_column_label=>'VENDOR CATEGORY'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181453988268439908)
,p_db_column_name=>'VENDORCODE'
,p_display_order=>48
,p_column_identifier=>'AB'
,p_column_label=>'VENDOR CODE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454067230439909)
,p_db_column_name=>'VENDORNAME'
,p_display_order=>38
,p_column_identifier=>'AC'
,p_column_label=>'VENDOR NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181455118989439919)
,p_db_column_name=>'VENDORSITEVISITTNO'
,p_display_order=>148
,p_column_identifier=>'AM'
,p_column_label=>'Vendorsitevisittno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181456444855439933)
,p_db_column_name=>'VENDORSTATUSCODE'
,p_display_order=>288
,p_column_identifier=>'BA'
,p_column_label=>'Vendorstatuscode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181454678204439915)
,p_db_column_name=>'WEBSITE'
,p_display_order=>108
,p_column_identifier=>'AI'
,p_column_label=>'Website'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(627236462670809142)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'997540'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATIONCODE:VENDORNAME:VENDORCODE:VENDORCATEGORY:CONTACTPERSON:CONTACTPERSONADDRESS:CONTACTPERSONPHONENO:CONTACTPERSONPINCODE:CONTACTPERSONCITYCODE:CONTACTPERSONSTATECODE:OFFICEADDRESS:OFFICECITYCODE:OFFICEEMAILID:OFFICEMOBILENO:OFFICEPHONENO:OFFICE'
||'PINCODE:OFFICESTATECODE:REGISTRATIONNO:REGISTRATIONDATE:MODULECODE:TAXREGISTRATIONTYPENAME:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(181364736715127774)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(627223253812804561)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:350:&SESSION.::&DEBUG.:350:P350_FORMSTATUS:NEWRECORD'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(181364433790127774)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(627223253812804561)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(627113072204808968)
,p_name=>'P349_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(627223253812804561)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(181365679433127783)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(181366230793127783)
,p_event_id=>wwv_flow_imp.id(181365679433127783)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
