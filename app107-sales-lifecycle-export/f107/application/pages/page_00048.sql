prompt --application/pages/page_00048
begin
--   Manifest
--     PAGE: 00048
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>48
,p_name=>'Account Master'
,p_alias=>'ACCOUNT-MASTER'
,p_step_title=>'Account Master'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(764382165518119915)
,p_plug_name=>'Account Master Report'
,p_static_id=>'account-master-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.PARTYCODE,',
'       a.PARTYNAME,',
'       a.PARTYTYPECODE,',
'       d.partytypename,',
'       a.PARTYGRADECODE,',
'       a.PARTYSTATUS,',
'       getpartyname(a.PARENTCODE) parentname,',
'       a.OWNERNAME,',
'       a.CONTACTPERSON,',
'       a.DESIGNATIONCODE,',
'       a.TINNO,',
'       a.OFFICEADDRESS,',
'       a.OFFICECITYCODE,',
'       a.OFFICESTATECODE,',
'       a.OFFICEPINCODE,',
'       a.OFFICEPHONENO,',
'       a.OFFICEFAXNO,',
'       a.OFFICEEMAIL,',
'       a.WORKSADDRESS,',
'       a.WORKSCITYCODE,',
'       a.WORKSSTATECODE,',
'       a.WORKSPINCODE,',
'       a.WORKSPHONENO,',
'       a.WORKSFAXNO,',
'       a.WORKSEMAIL,',
'       a.REMARK,',
'       a.PARTYSHORTNAME,',
'       a.PARTYRANK,',
'       a.OFFICEADDRESS1,',
'       a.OFFICEADDRESS2,',
'       a.OFFICEADDRESS3,',
'       a.WORKSADDRESS1,',
'       a.WORKSADDRESS2,',
'       a.WORKSADDRESS3,',
'       a.DATECREATED,',
'       a.DATEMODIFY,',
'       a.SCHEDULENO,',
'       a.ACCOUNTTYPE,',
'       a.TDSMASTERCODE,',
'       a.BANKCODE,',
'       a.PRINTNAME,',
'       a.TRIALBALANCEPOSITION,',
'       a.COSTCENTREREQUIRED,',
'       getpartyname(a.DEPRECIATIONACCOUNTCODE) DEPRECIATIONACCOUNTname ,',
'       a.NATUREOFACCOUNTCODE,',
'       a.AGENTCOMMISIONACCOUNTCODE,',
'       a.OFFICECOUNTRYCODE,',
'       a.WORKSCOUNTRYCODE,',
'       a.OFFICEADDRESS4,',
'       a.WORKSADDRESS4,',
'       a.ISCOMPANY,',
'       a.SCHEDULEREMARK,',
'       a.OPENINGFUNCTION,',
'       a.CLOSINGFUNCTION,',
'       a.CLOSINGFUNCTIONLOC,',
'       a.CREATOR,',
'       a.PARTYREQUESTTNO,',
'       a.EXCISEPARTYTYPECODE,',
'       a.PARTYBANKCODE,',
'       a.PARTYBANKACCOUNTNO,',
'       a.RTGSCODE,',
'       a.EMPLOYEECODE,',
'       a.CLOSINGFUNCTIONPANDL,',
'       a.BASICNATURE,',
'       a.PARENTCODEOTHERWISE,',
'       a.COSTSHEET,',
'       a.COSTAMOUNT,',
'       a.BILLEDTILLDATE,',
'       a.WEEKLYOFFDAY,',
'       a.TAXREGISTRATIONTYPECODE,',
'       a.CREDITAMOUNT,',
'       a.CREDITDAYS,',
'       a.ALLOCATIONTYPECODE,',
'       a.IMPORTTNO,',
'       a.BILLTOBILL,',
'       a.TRIALBALANCEPOSITIONREVISED,',
'       a.AGENTCODE,',
'       a.DISTANCE,',
'       a.RETURNTYPE,',
'       a.MSME,',
'       a.VENDORCODE,',
'       a.CREATIONTIME,',
'       a.FREIGHTTYPECODE,',
'       a.FROMACCOUNTNO,',
'       a.TOACCOUNTNO,',
'       a.CONTACTNO,',
'       a.VENDORSTATUSCODE,',
'       a.BUSINESSNATURECODE,',
'       a.INDUSTRYTYPECODE,',
'       a.VENDORTNO,',
'       a.VENDORACCOUNTNO,',
'       a.DELIVERYCONFIRMATION,',
'       a.OFFICEMOBILENO,',
'       a.WORKSMOBILENO,',
'       a.TDSAPPLICABLE,',
'       a.TDSPAYEECATEGORYCODE,',
'       a.TDSNATURECODE,',
'       a.SECURITYDEPOSITACCOUNTCODE,',
'       a.GSTHOLDACCOUNTCODE,',
'       a.WITHHELDACCOUNTCODE,',
'       a.SANCTIONEDAMOUNT,',
'       a.PFHOLDACCOUNTCODE,',
'       a.ESICHOLDACCOUNTCODE,',
'       a.OTHERHOLDACCOUNTCODE,',
'       a.ASSETCATEGORYCODE,',
'       a.INCOMETAXRETURNTILLDATE,',
'       a.ELIGIBLEFORTDSUNDER194Q,',
'       a.ASSOCIATIONDATE,',
'       a.BILLCYCLEDAYS,',
'       a.TRADETYPECODE,',
'       a.DCNO,',
'       a.DCBUYERCODE,',
'       a.ISDC,',
'       a.CHARTSERIALNO,',
'       GETPARTYATTRIBUTEVALUE(a.PARTYCODE,''GSTNO'') AS GSTINNO,',
'       GETPARTYATTRIBUTEVALUE(a.PARTYCODE,''PANNO'') AS PANNO,',
'       GETPARTYATTRIBUTEVALUE(a.PARTYCODE,''AADHARNO'') AS AADHARNO,',
'       --getpartyname(b.bankcode) as bank ,',
'       c.bankname,',
'       b.BANKACCOUNTNO,',
'       b.IFSCCODE,',
'       a.zonetype,',
'       e.zonename,',
'       f.natureofaccountname,',
'       g.tradetypename ,',
'       h.TAXREGISTRATIONTYPEname ,',
'       i.FreightTypename,',
'       j.TDSNaturename,',
'       k.TDSPayeeCategoryname,',
'       l.Assetcategoryname,',
'       m.industrysectorname',
'  from PARTY a , PARTYBANK b , bank c , partytype d , zone e , natureofaccount f , tradetype g , TAXREGISTRATIONTYPE h ,',
'        FreightType i , TDSNature j , TDSPayeeCategory k , Assetcategory l , industrysector m',
'  where a.tno = b.tno(+)',
'  and b.bankcode = c.bankcode(+)',
'  and a.partytypecode = d.partytypecode(+)',
'  and a.zonetype = e.zonecode(+)',
'  and a.natureofaccountcode = f.natureofaccountcode(+)',
'  and a.tradetypecode = g.tradetypecode(+)',
'  and a.TAXREGISTRATIONTYPEcode = h.TAXREGISTRATIONTYPEcode(+)',
'  and a.FreightTypecode = i.FreightTypecode(+)',
'  and a.TDSNaturecode = j.TDSNaturecode(+)',
'  and a.TDSPayeeCategorycode = k.TDSPayeeCategorycode(+)',
'  and a.Assetcategorycode = l.Assetcategorycode(+)',
'  and a.INDUSTRYTYPECODE = m.industrysectorcode(+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Account Master Report'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(747863633648800190)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49:P49_TNO:#TNO#'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>297997084566407302
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203176562968231452)
,p_db_column_name=>'AADHARNO'
,p_display_order=>1530
,p_column_identifier=>'EY'
,p_column_label=>'AADHARNO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377486385440826)
,p_db_column_name=>'ACCOUNTTYPE'
,p_display_order=>670
,p_column_identifier=>'BQ'
,p_column_label=>'Accounttype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374344397318309)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>1000
,p_column_identifier=>'CX'
,p_column_label=>'Agentcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588378216892440833)
,p_db_column_name=>'AGENTCOMMISIONACCOUNTCODE'
,p_display_order=>740
,p_column_identifier=>'BX'
,p_column_label=>'Agentcommisionaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373890198318305)
,p_db_column_name=>'ALLOCATIONTYPECODE'
,p_display_order=>960
,p_column_identifier=>'CT'
,p_column_label=>'Allocationtypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376671812318333)
,p_db_column_name=>'ASSETCATEGORYCODE'
,p_display_order=>1240
,p_column_identifier=>'DV'
,p_column_label=>'Assetcategorycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203176295492231449)
,p_db_column_name=>'ASSETCATEGORYNAME'
,p_display_order=>1500
,p_column_identifier=>'EV'
,p_column_label=>'ASSET CATEGORY NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589377007590318336)
,p_db_column_name=>'ASSOCIATIONDATE'
,p_display_order=>1270
,p_column_identifier=>'DY'
,p_column_label=>'Associationdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196681278358609907)
,p_db_column_name=>'BANKACCOUNTNO'
,p_display_order=>1360
,p_column_identifier=>'EH'
,p_column_label=>'BANK ACCOUNT'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377732473440828)
,p_db_column_name=>'BANKCODE'
,p_display_order=>690
,p_column_identifier=>'BS'
,p_column_label=>'Bankcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196682416282609918)
,p_db_column_name=>'BANKNAME'
,p_display_order=>1380
,p_column_identifier=>'EJ'
,p_column_label=>'BANK NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#BANKNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741570634459439396)
,p_db_column_name=>'BASICNATURE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'BASIC NATURE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589377117951318337)
,p_db_column_name=>'BILLCYCLEDAYS'
,p_display_order=>1280
,p_column_identifier=>'DZ'
,p_column_label=>'Billcycledays'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373449096318301)
,p_db_column_name=>'BILLEDTILLDATE'
,p_display_order=>920
,p_column_identifier=>'CP'
,p_column_label=>'Billedtilldate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374103519318307)
,p_db_column_name=>'BILLTOBILL'
,p_display_order=>980
,p_column_identifier=>'CV'
,p_column_label=>'Billtobill'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375183512318318)
,p_db_column_name=>'BUSINESSNATURECODE'
,p_display_order=>1090
,p_column_identifier=>'DG'
,p_column_label=>'Businessnaturecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589377564955318292)
,p_db_column_name=>'CHARTSERIALNO'
,p_display_order=>1330
,p_column_identifier=>'EE'
,p_column_label=>'Chartserialno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372441862318290)
,p_db_column_name=>'CLOSINGFUNCTION'
,p_display_order=>810
,p_column_identifier=>'CE'
,p_column_label=>'Closingfunction'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372485235318291)
,p_db_column_name=>'CLOSINGFUNCTIONLOC'
,p_display_order=>820
,p_column_identifier=>'CF'
,p_column_label=>'Closingfunctionloc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373112152318297)
,p_db_column_name=>'CLOSINGFUNCTIONPANDL'
,p_display_order=>880
,p_column_identifier=>'CL'
,p_column_label=>'Closingfunctionpandl'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374985916318316)
,p_db_column_name=>'CONTACTNO'
,p_display_order=>1070
,p_column_identifier=>'DE'
,p_column_label=>'Contactno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375374603440805)
,p_db_column_name=>'CONTACTPERSON'
,p_display_order=>460
,p_column_identifier=>'AV'
,p_column_label=>'CONTACT PERSON'
,p_column_html_expression=>'<div style="display:block; width:100px">#CONTACTPERSON#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373371678318300)
,p_db_column_name=>'COSTAMOUNT'
,p_display_order=>910
,p_column_identifier=>'CO'
,p_column_label=>'Costamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377898032440830)
,p_db_column_name=>'COSTCENTREREQUIRED'
,p_display_order=>710
,p_column_identifier=>'BU'
,p_column_label=>'Costcentrerequired'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373294102318299)
,p_db_column_name=>'COSTSHEET'
,p_display_order=>900
,p_column_identifier=>'CN'
,p_column_label=>'Costsheet'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741577852619439399)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'CREATION TIME'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741577466703439398)
,p_db_column_name=>'CREATOR'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'CREATOR'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373726143318303)
,p_db_column_name=>'CREDITAMOUNT'
,p_display_order=>940
,p_column_identifier=>'CR'
,p_column_label=>'Creditamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373819072318304)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>950
,p_column_identifier=>'CS'
,p_column_label=>'CREDIT DAYS'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377197707440823)
,p_db_column_name=>'DATECREATED'
,p_display_order=>640
,p_column_identifier=>'BN'
,p_column_label=>'Datecreated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377339618440824)
,p_db_column_name=>'DATEMODIFY'
,p_display_order=>650
,p_column_identifier=>'BO'
,p_column_label=>'Datemodify'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589377393705318290)
,p_db_column_name=>'DCBUYERCODE'
,p_display_order=>1310
,p_column_identifier=>'EC'
,p_column_label=>'Dcbuyercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589377273788318289)
,p_db_column_name=>'DCNO'
,p_display_order=>1300
,p_column_identifier=>'EB'
,p_column_label=>'Dcno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375586293318322)
,p_db_column_name=>'DELIVERYCONFIRMATION'
,p_display_order=>1130
,p_column_identifier=>'DK'
,p_column_label=>'Deliveryconfirmation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203176138928231448)
,p_db_column_name=>'DEPRECIATIONACCOUNTNAME'
,p_display_order=>1490
,p_column_identifier=>'EU'
,p_column_label=>'DEPRECIATION ACCOUNT NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375539541440806)
,p_db_column_name=>'DESIGNATIONCODE'
,p_display_order=>470
,p_column_identifier=>'AW'
,p_column_label=>'Designationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741579028304439399)
,p_db_column_name=>'DISTANCE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'DISTANCE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376862964318335)
,p_db_column_name=>'ELIGIBLEFORTDSUNDER194Q'
,p_display_order=>1260
,p_column_identifier=>'DX'
,p_column_label=>'DEDUCTION FROM FIRST BILL 194Q'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372969205318296)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>870
,p_column_identifier=>'CK'
,p_column_label=>'Employeecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376527909318331)
,p_db_column_name=>'ESICHOLDACCOUNTCODE'
,p_display_order=>1220
,p_column_identifier=>'DT'
,p_column_label=>'Esicholdaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372669397318293)
,p_db_column_name=>'EXCISEPARTYTYPECODE'
,p_display_order=>840
,p_column_identifier=>'CH'
,p_column_label=>'Excisepartytypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374698966318313)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>1040
,p_column_identifier=>'DB'
,p_column_label=>'Freighttypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175824315231445)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>1460
,p_column_identifier=>'ER'
,p_column_label=>'FREIGHT TYPE NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374812514318314)
,p_db_column_name=>'FROMACCOUNTNO'
,p_display_order=>1050
,p_column_identifier=>'DC'
,p_column_label=>'Fromaccountno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376125860318327)
,p_db_column_name=>'GSTHOLDACCOUNTCODE'
,p_display_order=>1180
,p_column_identifier=>'DP'
,p_column_label=>'Gstholdaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194526647698166607)
,p_db_column_name=>'GSTINNO'
,p_display_order=>1340
,p_column_identifier=>'EF'
,p_column_label=>'GST NO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196681328066609908)
,p_db_column_name=>'IFSCCODE'
,p_display_order=>1370
,p_column_identifier=>'EI'
,p_column_label=>'IFSC'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373967121318306)
,p_db_column_name=>'IMPORTTNO'
,p_display_order=>970
,p_column_identifier=>'CU'
,p_column_label=>'Importtno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376802686318334)
,p_db_column_name=>'INCOMETAXRETURNTILLDATE'
,p_display_order=>1250
,p_column_identifier=>'DW'
,p_column_label=>'Incometaxreturntilldate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203176374972231450)
,p_db_column_name=>'INDUSTRYSECTORNAME'
,p_display_order=>1510
,p_column_identifier=>'EW'
,p_column_label=>'INDUSTRY SECTOR NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375330348318319)
,p_db_column_name=>'INDUSTRYTYPECODE'
,p_display_order=>1100
,p_column_identifier=>'DH'
,p_column_label=>'Industrytypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741569372503439395)
,p_db_column_name=>'ISCOMPANY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'IS COMPANY'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589377547123318291)
,p_db_column_name=>'ISDC'
,p_display_order=>1320
,p_column_identifier=>'ED'
,p_column_label=>'Isdc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374522845318311)
,p_db_column_name=>'MSME'
,p_display_order=>1020
,p_column_identifier=>'CZ'
,p_column_label=>'Msme'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588378064433440832)
,p_db_column_name=>'NATUREOFACCOUNTCODE'
,p_display_order=>730
,p_column_identifier=>'BW'
,p_column_label=>'Natureofaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175583161231442)
,p_db_column_name=>'NATUREOFACCOUNTNAME'
,p_display_order=>1430
,p_column_identifier=>'EO'
,p_column_label=>'NATURE OF ACCOUNT NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#NATUREOFACCOUNTNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741572596022439396)
,p_db_column_name=>'OFFICEADDRESS'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'OFFICE ADDRESS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376600568440817)
,p_db_column_name=>'OFFICEADDRESS1'
,p_display_order=>580
,p_column_identifier=>'BH'
,p_column_label=>'OFFICE ADDRESS1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376683558440818)
,p_db_column_name=>'OFFICEADDRESS2'
,p_display_order=>590
,p_column_identifier=>'BI'
,p_column_label=>'OFFICE ADDRESS2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376822597440819)
,p_db_column_name=>'OFFICEADDRESS3'
,p_display_order=>600
,p_column_identifier=>'BJ'
,p_column_label=>'Officeaddress3'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588378461683440836)
,p_db_column_name=>'OFFICEADDRESS4'
,p_display_order=>770
,p_column_identifier=>'CA'
,p_column_label=>'Officeaddress4'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375674595440808)
,p_db_column_name=>'OFFICECITYCODE'
,p_display_order=>490
,p_column_identifier=>'AY'
,p_column_label=>'Officecitycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588378329142440834)
,p_db_column_name=>'OFFICECOUNTRYCODE'
,p_display_order=>750
,p_column_identifier=>'BY'
,p_column_label=>'Officecountrycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741574656476439397)
,p_db_column_name=>'OFFICEEMAIL'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'OFFICEE MAIL'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375941377440810)
,p_db_column_name=>'OFFICEFAXNO'
,p_display_order=>510
,p_column_identifier=>'BA'
,p_column_label=>'Officefaxno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(744097837901062539)
,p_db_column_name=>'OFFICEMOBILENO'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'OFFICE MOBILE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741574228696439397)
,p_db_column_name=>'OFFICEPHONENO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'OFFICE PHONE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741573812915439397)
,p_db_column_name=>'OFFICEPINCODE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'OFFICE PIN CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375808294440809)
,p_db_column_name=>'OFFICESTATECODE'
,p_display_order=>500
,p_column_identifier=>'AZ'
,p_column_label=>'OFFICE STATE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372286332318289)
,p_db_column_name=>'OPENINGFUNCTION'
,p_display_order=>800
,p_column_identifier=>'CD'
,p_column_label=>'Openingfunction'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376615288318332)
,p_db_column_name=>'OTHERHOLDACCOUNTCODE'
,p_display_order=>1230
,p_column_identifier=>'DU'
,p_column_label=>'Otherholdaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741569009388439395)
,p_db_column_name=>'OWNERNAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'OWNER NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#OWNERNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203176506105231451)
,p_db_column_name=>'PANNO'
,p_display_order=>1520
,p_column_identifier=>'EX'
,p_column_label=>'PANNO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373244669318298)
,p_db_column_name=>'PARENTCODEOTHERWISE'
,p_display_order=>890
,p_column_identifier=>'CM'
,p_column_label=>'Parentcodeotherwise'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175520872231441)
,p_db_column_name=>'PARENTNAME'
,p_display_order=>1420
,p_column_identifier=>'EN'
,p_column_label=>'PARENT NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARENTNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741570183081439395)
,p_db_column_name=>'PARTYBANKACCOUNTNO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'PARTY BANK ACCOUNT NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372755112318294)
,p_db_column_name=>'PARTYBANKCODE'
,p_display_order=>850
,p_column_identifier=>'CI'
,p_column_label=>'Partybankcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741565948404439393)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ACCOUNT CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375065164440802)
,p_db_column_name=>'PARTYGRADECODE'
,p_display_order=>430
,p_column_identifier=>'AS'
,p_column_label=>'Partygradecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741566277948439394)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'ACCOUNT NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376501441440816)
,p_db_column_name=>'PARTYRANK'
,p_display_order=>570
,p_column_identifier=>'BG'
,p_column_label=>'Partyrank'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372606138318292)
,p_db_column_name=>'PARTYREQUESTTNO'
,p_display_order=>830
,p_column_identifier=>'CG'
,p_column_label=>'Partyrequesttno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741567130301439394)
,p_db_column_name=>'PARTYSHORTNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'SHORT NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTYSHORTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375247716440803)
,p_db_column_name=>'PARTYSTATUS'
,p_display_order=>440
,p_column_identifier=>'AT'
,p_column_label=>'Partystatus'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375013942440801)
,p_db_column_name=>'PARTYTYPECODE'
,p_display_order=>420
,p_column_identifier=>'AR'
,p_column_label=>'ACCOUNT TYPE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175127311231438)
,p_db_column_name=>'PARTYTYPENAME'
,p_display_order=>1390
,p_column_identifier=>'EK'
,p_column_label=>'PARTY TYPE NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTYTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376421195318330)
,p_db_column_name=>'PFHOLDACCOUNTCODE'
,p_display_order=>1210
,p_column_identifier=>'DS'
,p_column_label=>'Pfholdaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741566697983439394)
,p_db_column_name=>'PRINTNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'PRINT NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PRINTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376406614440815)
,p_db_column_name=>'REMARK'
,p_display_order=>560
,p_column_identifier=>'BF'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374402384318310)
,p_db_column_name=>'RETURNTYPE'
,p_display_order=>1010
,p_column_identifier=>'CY'
,p_column_label=>'Returntype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589372898520318295)
,p_db_column_name=>'RTGSCODE'
,p_display_order=>860
,p_column_identifier=>'CJ'
,p_column_label=>'Rtgscode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376250039318329)
,p_db_column_name=>'SANCTIONEDAMOUNT'
,p_display_order=>1200
,p_column_identifier=>'DR'
,p_column_label=>'Sanctionedamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377401015440825)
,p_db_column_name=>'SCHEDULENO'
,p_display_order=>660
,p_column_identifier=>'BP'
,p_column_label=>'Scheduleno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588378705239440838)
,p_db_column_name=>'SCHEDULEREMARK'
,p_display_order=>790
,p_column_identifier=>'CC'
,p_column_label=>'Scheduleremark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375970815318326)
,p_db_column_name=>'SECURITYDEPOSITACCOUNTCODE'
,p_display_order=>1170
,p_column_identifier=>'DO'
,p_column_label=>'Securitydepositaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741568654302439395)
,p_db_column_name=>'TAXREGISTRATIONTYPECODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'TAX REGISTRATION TYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175762184231444)
,p_db_column_name=>'TAXREGISTRATIONTYPENAME'
,p_display_order=>1450
,p_column_identifier=>'EQ'
,p_column_label=>'TAX REGISTRATION TYPE NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375673186318323)
,p_db_column_name=>'TDSAPPLICABLE'
,p_display_order=>1140
,p_column_identifier=>'DL'
,p_column_label=>'TDS APPLICABLE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377602034440827)
,p_db_column_name=>'TDSMASTERCODE'
,p_display_order=>680
,p_column_identifier=>'BR'
,p_column_label=>'Tdsmastercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375914199318325)
,p_db_column_name=>'TDSNATURECODE'
,p_display_order=>1160
,p_column_identifier=>'DN'
,p_column_label=>'Tdsnaturecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175931511231446)
,p_db_column_name=>'TDSNATURENAME'
,p_display_order=>1470
,p_column_identifier=>'ES'
,p_column_label=>'TDS NATURE NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSNATURENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375812083318324)
,p_db_column_name=>'TDSPAYEECATEGORYCODE'
,p_display_order=>1150
,p_column_identifier=>'DM'
,p_column_label=>'Tdspayeecategorycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203176052306231447)
,p_db_column_name=>'TDSPAYEECATEGORYNAME'
,p_display_order=>1480
,p_column_identifier=>'ET'
,p_column_label=>'TDS PAYEE CATEGORY NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588375567444440807)
,p_db_column_name=>'TINNO'
,p_display_order=>480
,p_column_identifier=>'AX'
,p_column_label=>'Tinno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(729321709121304950)
,p_db_column_name=>'TNO'
,p_display_order=>410
,p_column_identifier=>'AQ'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374881013318315)
,p_db_column_name=>'TOACCOUNTNO'
,p_display_order=>1060
,p_column_identifier=>'DD'
,p_column_label=>'Toaccountno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589377172273318338)
,p_db_column_name=>'TRADETYPECODE'
,p_display_order=>1290
,p_column_identifier=>'EA'
,p_column_label=>'Tradetypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175701632231443)
,p_db_column_name=>'TRADETYPENAME'
,p_display_order=>1440
,p_column_identifier=>'EP'
,p_column_label=>'TRADE TYPE NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#TRADETYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377809086440829)
,p_db_column_name=>'TRIALBALANCEPOSITION'
,p_display_order=>700
,p_column_identifier=>'BT'
,p_column_label=>'Trialbalanceposition'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374235368318308)
,p_db_column_name=>'TRIALBALANCEPOSITIONREVISED'
,p_display_order=>990
,p_column_identifier=>'CW'
,p_column_label=>'Trialbalancepositionrevised'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375479006318321)
,p_db_column_name=>'VENDORACCOUNTNO'
,p_display_order=>1120
,p_column_identifier=>'DJ'
,p_column_label=>'Vendoraccountno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589374614536318312)
,p_db_column_name=>'VENDORCODE'
,p_display_order=>1030
,p_column_identifier=>'DA'
,p_column_label=>'Vendorcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375065499318317)
,p_db_column_name=>'VENDORSTATUSCODE'
,p_display_order=>1080
,p_column_identifier=>'DF'
,p_column_label=>'Vendorstatuscode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589375432650318320)
,p_db_column_name=>'VENDORTNO'
,p_display_order=>1110
,p_column_identifier=>'DI'
,p_column_label=>'Vendortno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589373628512318302)
,p_db_column_name=>'WEEKLYOFFDAY'
,p_display_order=>930
,p_column_identifier=>'CQ'
,p_column_label=>'Weeklyoffday'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(589376203568318328)
,p_db_column_name=>'WITHHELDACCOUNTCODE'
,p_display_order=>1190
,p_column_identifier=>'DQ'
,p_column_label=>'Withheldaccountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376035428440811)
,p_db_column_name=>'WORKSADDRESS'
,p_display_order=>520
,p_column_identifier=>'BB'
,p_column_label=>'Worksaddress'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376916810440820)
,p_db_column_name=>'WORKSADDRESS1'
,p_display_order=>610
,p_column_identifier=>'BK'
,p_column_label=>'Worksaddress1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377037891440821)
,p_db_column_name=>'WORKSADDRESS2'
,p_display_order=>620
,p_column_identifier=>'BL'
,p_column_label=>'Worksaddress2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588377128068440822)
,p_db_column_name=>'WORKSADDRESS3'
,p_display_order=>630
,p_column_identifier=>'BM'
,p_column_label=>'Worksaddress3'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588378632784440837)
,p_db_column_name=>'WORKSADDRESS4'
,p_display_order=>780
,p_column_identifier=>'CB'
,p_column_label=>'Worksaddress4'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376141061440812)
,p_db_column_name=>'WORKSCITYCODE'
,p_display_order=>530
,p_column_identifier=>'BC'
,p_column_label=>'Workscitycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588378410484440835)
,p_db_column_name=>'WORKSCOUNTRYCODE'
,p_display_order=>760
,p_column_identifier=>'BZ'
,p_column_label=>'Workscountrycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741577006399439398)
,p_db_column_name=>'WORKSEMAIL'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'WORKS EMAIL'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376265616440814)
,p_db_column_name=>'WORKSFAXNO'
,p_display_order=>550
,p_column_identifier=>'BE'
,p_column_label=>'Worksfaxno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(744097964565062540)
,p_db_column_name=>'WORKSMOBILENO'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'WORKS MOBILE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741576639410439398)
,p_db_column_name=>'WORKSPHONENO'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'WORKS PHONE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(741576249751439398)
,p_db_column_name=>'WORKSPINCODE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'WORKS PIN CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(588376192676440813)
,p_db_column_name=>'WORKSSTATECODE'
,p_display_order=>540
,p_column_identifier=>'BD'
,p_column_label=>'Worksstatecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175410306231440)
,p_db_column_name=>'ZONENAME'
,p_display_order=>1410
,p_column_identifier=>'EM'
,p_column_label=>'ZONE NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#ZONENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(203175311276231439)
,p_db_column_name=>'ZONETYPE'
,p_display_order=>1400
,p_column_identifier=>'EL'
,p_column_label=>'ZONE TYPE'
,p_column_html_expression=>'<div style="display:block; width:100px">#ZONETYPE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(747897504183529890)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21195'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYNAME:PARTYSHORTNAME:PARTYCODE:PARTYTYPECODE:PARENTNAME:NATUREOFACCOUNTNAME:ZONENAME:TRADETYPENAME:TAXREGISTRATIONTYPENAME:OWNERNAME:CONTACTPERSON:CREDITDAYS:TDSAPPLICABLE:TDSNATURENAME:TDSPAYEECATEGORYNAME:ELIGIBLEFORTDSUNDER194Q:GSTINNO:PANNO:A'
||'ADHARNO:OFFICEADDRESS1:OFFICEADDRESS2:OFFICESTATECODE:OFFICEPINCODE:OFFICEPHONENO:OFFICEMOBILENO:OFFICEEMAIL:BANKNAME:BANKACCOUNTNO:IFSCCODE'
,p_sort_column_1=>'CREATIONTIME'
,p_sort_direction_1=>'DESC'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(589108633031784920)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(764382165518119915)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(588374899235440800)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(764382165518119915)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(589109199857784923)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(589109621234784923)
,p_event_id=>wwv_flow_imp.id(589109199857784923)
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
