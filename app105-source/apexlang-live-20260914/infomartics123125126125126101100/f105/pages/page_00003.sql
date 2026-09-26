prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Company'
,p_alias=>'COMPANY'
,p_step_title=>'Company'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.10rem !important;',
'  ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(831668937894789278)
,p_plug_name=>'Company'
,p_static_id=>'company'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.COMPANYCODE,',
'       a.COMPANYNAME,',
'       a.COMPANYTYPECODE,',
'       a.PARENTCODE,',
'       a.OWNERNAME,',
'       a.CGSTNO,',
'       a.CSTNO,',
'       a.NEWREGISTRATIONNO,',
'       a.TINNO,',
'       a.ECCNO,',
'       a.COMMISSIONER,',
'       a.DIVISION,',
'       a.RANGE,',
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
'       a.COMPANYSHORTNAME,',
'       a.TNO,',
'       a.SELFCODE,',
'       a.OFFICEADDRESS1,',
'       a.OFFICEADDRESS2,',
'       a.OFFICEADDRESS3,',
'       a.OFFICEADDRESS4,',
'       a.WORKSADDRESS4,',
'       a.WORKSADDRESS3,',
'       a.WORKSADDRESS2,',
'       a.WORKSADDRESS1,',
'       a.CREATOR,',
'      -- a.TMP,',
'       a.CREATIONTIME,',
'       a.EMPLOYEECODERESPONSIBLEFORTDS,',
'       a.NAMERESPONSIBLEFORTDS,',
'       a.DESIGNATIONRESPONSIBLEFORTDS,',
'       a.ADDRESS1RESPONSIBLEFORTDS,',
'       a.ADDRESS2RESPONSIBLEFORTDS,',
'       a.ADDRESS3RESPONSIBLEFORTDS,',
'       a.ADDRESS4RESPONSIBLEFORTDS,',
'       a.CITYRESPONSIBLEFORTDS,',
'       a.STATERESPONSIBLEFORTDS,',
'       a.PINCODERESPONSIBLEFORTDS,',
'       a.PHONENORESPONSIBLEFORTDS,',
'       a.EMAILRESPONSIBLEFORTDS,',
'       a.TAXREGISTRATIONTYPECODE,',
'       --a.PRINTNAME,',
'       a.OFFICEADDRESS1||'' ''||a.OFFICEADDRESS2||'' ''||a.OFFICEADDRESS3||'' ''||b.cityname||'' ''||c.statename as "Office Address"',
'  from COMPANY a , city b, state c',
'  where a.OFFICECITYCODE = b.citycode(+)',
'  and a.OFFICESTATECODE =  c.statecode(+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Company'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(831669050094789278)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_COMPANYCODE:#COMPANYCODE#'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>398824194652565504
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831687930005789286)
,p_db_column_name=>'ADDRESS1RESPONSIBLEFORTDS'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Address1responsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831688301801789286)
,p_db_column_name=>'ADDRESS2RESPONSIBLEFORTDS'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Address2responsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831688714903789286)
,p_db_column_name=>'ADDRESS3RESPONSIBLEFORTDS'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Address3responsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831689042506789286)
,p_db_column_name=>'ADDRESS4RESPONSIBLEFORTDS'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Address4responsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831671843695789281)
,p_db_column_name=>'CGSTNO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'CGST No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831689532285789286)
,p_db_column_name=>'CITYRESPONSIBLEFORTDS'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Cityresponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831673896585789281)
,p_db_column_name=>'COMMISSIONER'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Commissioner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831669868471789280)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831670298659789280)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Company Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831681083913789284)
,p_db_column_name=>'COMPANYSHORTNAME'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Company Short Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831670642780789281)
,p_db_column_name=>'COMPANYTYPECODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Company Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831686273804789285)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831685492521789285)
,p_db_column_name=>'CREATOR'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831672326076789281)
,p_db_column_name=>'CSTNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'CST No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831687509402789286)
,p_db_column_name=>'DESIGNATIONRESPONSIBLEFORTDS'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Designationresponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831674326816789282)
,p_db_column_name=>'DIVISION'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Division'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831673500282789281)
,p_db_column_name=>'ECCNO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'ECC No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831691075529789287)
,p_db_column_name=>'EMAILRESPONSIBLEFORTDS'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Emailresponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831686650590789285)
,p_db_column_name=>'EMPLOYEECODERESPONSIBLEFORTDS'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Employeecoderesponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831687048642789286)
,p_db_column_name=>'NAMERESPONSIBLEFORTDS'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Nameresponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831672680332789281)
,p_db_column_name=>'NEWREGISTRATIONNO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'New Registration No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831675129764789282)
,p_db_column_name=>'OFFICEADDRESS'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Office Address'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:300px">#OFFICEADDRESS#</div>',
''))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831682295658789284)
,p_db_column_name=>'OFFICEADDRESS1'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Office Address1'
,p_column_html_expression=>'<div style="display:block; width:150px">#OFFICEADDRESS1#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831682729879789284)
,p_db_column_name=>'OFFICEADDRESS2'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Officeaddress2'
,p_column_html_expression=>'<div style="display:block; width:150px">#OFFICEADDRESS2#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831683087180789284)
,p_db_column_name=>'OFFICEADDRESS3'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Officeaddress3'
,p_column_html_expression=>'<div style="display:block; width:150px">#OFFICEADDRESS3#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831683494763789284)
,p_db_column_name=>'OFFICEADDRESS4'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Officeaddress4'
,p_column_html_expression=>'<div style="display:block; width:150px">#OFFICEADDRESS4#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831675496589789282)
,p_db_column_name=>'OFFICECITYCODE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Office City Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831677467139789283)
,p_db_column_name=>'OFFICEEMAIL'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Office Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831677099418789282)
,p_db_column_name=>'OFFICEFAXNO'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Office Fax No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831676707363789282)
,p_db_column_name=>'OFFICEPHONENO'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Office Phone No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831676303714789282)
,p_db_column_name=>'OFFICEPINCODE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Office Pin Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831675847948789282)
,p_db_column_name=>'OFFICESTATECODE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Office State Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831671435540789281)
,p_db_column_name=>'OWNERNAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Owner Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(843543805987180272)
,p_db_column_name=>'Office Address'
,p_display_order=>76
,p_column_identifier=>'BF'
,p_column_label=>'Office Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831671055187789281)
,p_db_column_name=>'PARENTCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Parent Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831690714814789287)
,p_db_column_name=>'PHONENORESPONSIBLEFORTDS'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Phonenoresponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831690324978789287)
,p_db_column_name=>'PINCODERESPONSIBLEFORTDS'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Pincoderesponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831674692051789282)
,p_db_column_name=>'RANGE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Range'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831680661357789284)
,p_db_column_name=>'REMARK'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831681853881789284)
,p_db_column_name=>'SELFCODE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Self Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831689895394789286)
,p_db_column_name=>'STATERESPONSIBLEFORTDS'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Stateresponsiblefortds'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831691489724789287)
,p_db_column_name=>'TAXREGISTRATIONTYPECODE'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Taxregistrationtypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831673097379789281)
,p_db_column_name=>'TINNO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'TIN No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831681454796789284)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_column_identifier=>'AE'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831677910956789283)
,p_db_column_name=>'WORKSADDRESS'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Works Address'
,p_column_html_expression=>'<div style="display:block; width:300px">#WORKSADDRESS#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831685111057789285)
,p_db_column_name=>'WORKSADDRESS1'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Worksaddress1'
,p_column_html_expression=>'<div style="display:block; width:150px">#WORKSADDRESS1#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831684704205789285)
,p_db_column_name=>'WORKSADDRESS2'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Worksaddress2'
,p_column_html_expression=>'<div style="display:block; width:150px">#WORKSADDRESS2#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831684290923789285)
,p_db_column_name=>'WORKSADDRESS3'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Worksaddress3'
,p_column_html_expression=>'<div style="display:block; width:150px">#WORKSADDRESS3#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831683915793789285)
,p_db_column_name=>'WORKSADDRESS4'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Worksaddress4'
,p_column_html_expression=>'<div style="display:block; width:150px">#WORKSADDRESS4#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831678242713789283)
,p_db_column_name=>'WORKSCITYCODE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Works City Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831680274321789283)
,p_db_column_name=>'WORKSEMAIL'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Works Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831679843774789283)
,p_db_column_name=>'WORKSFAXNO'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Works Fax No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831679467787789283)
,p_db_column_name=>'WORKSPHONENO'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Works Phone No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831679061266789283)
,p_db_column_name=>'WORKSPINCODE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Works Pin Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(831678704641789283)
,p_db_column_name=>'WORKSSTATECODE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Works State Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(831694415503790512)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65619'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COMPANYCODE:COMPANYNAME:COMPANYTYPECODE:COMPANYSHORTNAME:OWNERNAME:Office Address:OFFICEPINCODE:OFFICEPHONENO:OFFICEFAXNO:OFFICEEMAIL:WORKSADDRESS:WORKSPHONENO:WORKSFAXNO:WORKSEMAIL:CREATOR:CREATIONTIME:REMARK'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(568017838430867688)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(831668937894789278)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(568115756468018354)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(831668937894789278)
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
 p_id=>wwv_flow_imp.id(568018385335867690)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(831668937894789278)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(568018891668867692)
,p_event_id=>wwv_flow_imp.id(568018385335867690)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(831668937894789278)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(438098300647531300)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(438098735932531300)
,p_event_id=>wwv_flow_imp.id(438098300647531300)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp.component_end;
end;
/
