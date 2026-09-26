prompt --application/pages/page_00695
begin
--   Manifest
--     PAGE: 00695
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
 p_id=>695
,p_name=>'Full and Final List'
,p_alias=>'FULL-AND-FINAL-LIST'
,p_step_title=>'Full and Final List'
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
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 0.90rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(488227292182126200)
,p_plug_name=>'Full and Final List'
,p_static_id=>'full-and-final-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       getdoctypename(A.DOCTYPECODE) doctypename,',
'       getlocationname(A.LOCATIONCODE) locationname,',
'       getcompanyname(A.COMPANYCODE) companyname,',
'       A.FINANCIALYEARCODE,',
'       A.FULLANDFINALNO,',
'       A.FULLANDFINALDATE,',
'       A.RESIGNATIONACCEPTENCEDATE,',
'       getemployeename(A.EMPLOYEECODE) employeename,',
'       A.STATUTORYRATE,',
'       A.EMPLOYEECONTRIBUTION,',
'       getMONEYTRANSFERMODEname(A.MONEYTRANSFERMODECODE) MONEYTRANSFERMODEname,',
'       getpartyname(A.BANKCODE) bankname,',
'       A.REASONOFRESIGNATION,',
'       A.SALARYFROMDATE,',
'       A.SALARYTODATE,',
'       A.LEAVESALARYAMOUNT,',
'       A.VISA,',
'       A.GRATUITYAMOUNT,',
'       A.BONUSAMOUNT,',
'       A.LTAAMOUNT,',
'       A.MEDICALAMOUNT,',
'       A.SECURITYDEPOSITEAMOUNT,',
'       A.GRATUITYDAYS,',
'       A.NARRATION,',
'       A.OTHERAMOUNT,',
'       A.NOCDATE,',
'       A.NOCNO,',
'       A.ATTACHMENTFILENAME,',
'       A.REMARK,',
'       A.CREATOR,',
'       A.CREATIONTIME,',
'       A.DATEOFLEAVING,',
'       A.NOTICEPERIODREMAININGDAYS,',
'       A.BASICSALARY,',
'       A.DEDUCTIONRATE,',
'       A.DEDUCTIONAMOUNT,',
'       A.ISGRATUITYALLOWED,',
'       A.ISDEDUCTIONALLOWED,',
'       A.NOTICEPERIODFROMTERMINATION,',
'       A.EARNINGAMOUNT,',
'       A.REFERENCEMODULE,',
'       A.ISALLOWEDPAYMENT,',
'       A.NETPAYABLE,',
'       A.ISALLOWSALARY,',
'       A.NETBASICSALARY,',
'       A.NETGRATUITYAMOUNT,',
'       A.LEAVEINCASH,',
'       A.OTHER,',
'       A.LOAN,',
'       A.TOOL,',
'       A.UNIFORMPERIOD,',
'       A.OTHERDEDUCTION,',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''FullAndFinal''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="Act'
||'ion"></span</span></a>'' AS Print',
'',
'  from FULLANDFINAL a'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Full and Final List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(488227461376126200)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:696:&APP_SESSION.::&DEBUG.:RP:P696_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>49242592176428216
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488239044573126212)
,p_db_column_name=>'ATTACHMENTFILENAME'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Attachmentfilename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(490579299738102488)
,p_db_column_name=>'BANKNAME'
,p_display_order=>113
,p_column_identifier=>'BG'
,p_column_label=>'Bankname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488241413795126213)
,p_db_column_name=>'BASICSALARY'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Basicsalary'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488235437817126211)
,p_db_column_name=>'BONUSAMOUNT'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Bonus amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(490579051047102485)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>83
,p_column_identifier=>'BD'
,p_column_label=>'Companyname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488240202848126213)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488239771962126212)
,p_db_column_name=>'CREATOR'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488240606298126213)
,p_db_column_name=>'DATEOFLEAVING'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Dateofleaving'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488242180481126213)
,p_db_column_name=>'DEDUCTIONAMOUNT'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Deductionamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488241780242126213)
,p_db_column_name=>'DEDUCTIONRATE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Deductionrate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(489275679834308533)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>63
,p_column_identifier=>'BB'
,p_column_label=>'Doctypename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488243846955126214)
,p_db_column_name=>'EARNINGAMOUNT'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Earningamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488231828667126210)
,p_db_column_name=>'EMPLOYEECONTRIBUTION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Employee contribution'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(490579155195102486)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>93
,p_column_identifier=>'BE'
,p_column_label=>'Employeename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488229458338126209)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Financial year'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488230259050126209)
,p_db_column_name=>'FULLANDFINALDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Full and final date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488229810012126209)
,p_db_column_name=>'FULLANDFINALNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Full and final no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488235052840126211)
,p_db_column_name=>'GRATUITYAMOUNT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Gratuity amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488236971133126211)
,p_db_column_name=>'GRATUITYDAYS'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Gratuity days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488244638136126214)
,p_db_column_name=>'ISALLOWEDPAYMENT'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Isallowedpayment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488245402903126218)
,p_db_column_name=>'ISALLOWSALARY'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Isallowsalary'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488242999173126214)
,p_db_column_name=>'ISDEDUCTIONALLOWED'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Isdeductionallowed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488242603993126213)
,p_db_column_name=>'ISGRATUITYALLOWED'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Isgratuityallowed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488246511265126218)
,p_db_column_name=>'LEAVEINCASH'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Leaveincash'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488234176428126210)
,p_db_column_name=>'LEAVESALARYAMOUNT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Leave salary amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488247283532126219)
,p_db_column_name=>'LOAN'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Loan'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(489275783726308534)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>73
,p_column_identifier=>'BC'
,p_column_label=>'Locationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488235782975126211)
,p_db_column_name=>'LTAAMOUNT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Lta amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488236181035126211)
,p_db_column_name=>'MEDICALAMOUNT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Medical amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(490579220538102487)
,p_db_column_name=>'MONEYTRANSFERMODENAME'
,p_display_order=>103
,p_column_identifier=>'BF'
,p_column_label=>'Moneytransfermodename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488237452726126212)
,p_db_column_name=>'NARRATION'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488245694464126218)
,p_db_column_name=>'NETBASICSALARY'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Netbasicsalary'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488246071859126218)
,p_db_column_name=>'NETGRATUITYAMOUNT'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Netgratuityamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488245029206126215)
,p_db_column_name=>'NETPAYABLE'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Netpayable'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488238198530126212)
,p_db_column_name=>'NOCDATE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'NOC date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488238627933126212)
,p_db_column_name=>'NOCNO'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Nocno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488243383443126214)
,p_db_column_name=>'NOTICEPERIODFROMTERMINATION'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Noticeperiodfromtermination'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488241001975126213)
,p_db_column_name=>'NOTICEPERIODREMAININGDAYS'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Noticeperiodremainingdays'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488246926555126219)
,p_db_column_name=>'OTHER'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Other'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488237827962126212)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Other amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488248499237126219)
,p_db_column_name=>'OTHERDEDUCTION'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Otherdeduction'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(303334280940845539)
,p_db_column_name=>'PRINT'
,p_display_order=>123
,p_column_identifier=>'BH'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488232997092126210)
,p_db_column_name=>'REASONOFRESIGNATION'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Reason of resignation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488244192345126214)
,p_db_column_name=>'REFERENCEMODULE'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Referencemodule'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488239451920126212)
,p_db_column_name=>'REMARK'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488230602750126209)
,p_db_column_name=>'RESIGNATIONACCEPTENCEDATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Resignation acceptence date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488233421679126210)
,p_db_column_name=>'SALARYFROMDATE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Salary from date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488233830761126210)
,p_db_column_name=>'SALARYTODATE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Salary to date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488236629617126211)
,p_db_column_name=>'SECURITYDEPOSITEAMOUNT'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Security deposite amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488231446207126210)
,p_db_column_name=>'STATUTORYRATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Statutory rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488227844757126205)
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
 p_id=>wwv_flow_imp.id(488247761768126219)
,p_db_column_name=>'TOOL'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Tool'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488248084473126219)
,p_db_column_name=>'UNIFORMPERIOD'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Uniformperiod'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(488234574442126211)
,p_db_column_name=>'VISA'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Visa'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(488249345184135450)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'492645'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:BANKNAME:COMPANYNAME:DOCTYPENAME:EMPLOYEENAME:LOCATIONNAME:MONEYTRANSFERMODENAME:FINANCIALYEARCODE:FULLANDFINALNO:FULLANDFINALDATE:RESIGNATIONACCEPTENCEDATE:STATUTORYRATE:EMPLOYEECONTRIBUTION:REASONOFRESIGNATION:SALARYFROMDATE:SALARYTODATE:LEAV'
||'ESALARYAMOUNT:VISA:GRATUITYAMOUNT:BONUSAMOUNT:LTAAMOUNT:MEDICALAMOUNT:SECURITYDEPOSITEAMOUNT:GRATUITYDAYS:NARRATION:OTHERAMOUNT:NOCDATE:NOCNO:ATTACHMENTFILENAME:REMARK:CREATOR:CREATIONTIME:DATEOFLEAVING:NOTICEPERIODREMAININGDAYS:BASICSALARY:DEDUCTION'
||'RATE:DEDUCTIONAMOUNT:ISGRATUITYALLOWED:ISDEDUCTIONALLOWED:NOTICEPERIODFROMTERMINATION:EARNINGAMOUNT:REFERENCEMODULE:ISALLOWEDPAYMENT:NETPAYABLE:ISALLOWSALARY:NETBASICSALARY:NETGRATUITYAMOUNT:LEAVEINCASH:OTHER:LOAN:TOOL:UNIFORMPERIOD:OTHERDEDUCTION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(488249005233126219)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(488227292182126200)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:696:&APP_SESSION.::&DEBUG.:696::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(488115977199992999)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(488227292182126200)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(488852838135832903)
,p_name=>'P695_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(488227292182126200)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(488115570931992995)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(488115726459992996)
,p_event_id=>wwv_flow_imp.id(488115570931992995)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(488115813995992997)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(488115944627992998)
,p_event_id=>wwv_flow_imp.id(488115813995992997)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
