prompt --application/pages/page_00294
begin
--   Manifest
--     PAGE: 00294
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
 p_id=>294
,p_name=>'Depreciation Register'
,p_alias=>'DEPRECIATION-REGISTER'
,p_step_title=>'Depreciation Register'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(225162597216874095)
,p_plug_name=>'Depreciation'
,p_static_id=>'depreciation'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'row_number() over(order by a.Tno) SerialNo,',
'a.TNo,',
'f.CompanyName,',
'd.LocationName,',
'e.DocTypeName,',
'c.PartyName as AccountName,',
'a.AssetNo,',
'a.AssetDate,',
'g.VoucherNo,',
'g.VoucherDate,',
'h.ItemName,',
'i.ItemSpecificationName,',
'b.AssetCode,',
'k.DepreciationNo,',
'k.TillDate as DepreciationTillDate,',
'L.VoucherNo as DepreciationVoucherNo,',
'L.VoucherDate as DepreciationVoucherDate,',
'--nvl(j.AssetWDV + j.DepreciationAmount, b.AssetValue) as AssetValueBeforeDepreciation,',
'--j.DepreciationAmount,',
'--j.AssetWDV as AssetValueAfterDepreciation,',
'--b.AssetValue as AssetPurchaseValue,',
'--j.DepreciationAmount + nvl(b.DepreciatedAmount, 0) + ( select NVL(sum(aa.DepreciationAmount), 0) from DepreciationDetail aa where aa.TNo < j.TNo and aa.AssetTNo = j.AssetTNo and aa.AssetCode = j.AssetCode )  as TotalDepreciationIncludingThis,',
'j.DepreciationRate,',
'j.DepreciationDays,',
'case when a.DocTypeCode = ''OPENING'' OR a.AssetDate < :P294_FROMDATE  then  b.AssetValue ELSE 0  end as GrossOpening,',
'case when a.DocTypeCode != ''OPENING'' and a.AssetDate BETWEEN :P294_FROMDATE AND :P294_TODATE then nvl(j.AssetWDV + j.DepreciationAmount, b.AssetValue) ELSE 0  end as AdditionForThePeriod,',
'case when m.DeductionDate is not null then b.AssetValue ELSE 0  end as DeductionForThePeriod,',
'( case when a.DocTypeCode = ''OPENING'' OR a.AssetDate < :P294_FROMDATE  then  b.AssetValue ELSE 0  end )',
' + ( case when a.DocTypeCode != ''OPENING'' and a.AssetDate BETWEEN :P294_FROMDATE AND :P294_TODATE then nvl(j.AssetWDV + j.DepreciationAmount, b.AssetValue) ELSE 0  end ) ',
' - (case when m.DeductionDate is not null then b.AssetValue ELSE 0  end) as TotalGross,',
'',
'nvl(b.DepreciatedAmount, 0) + ( select NVL(sum(aa.DepreciationAmount), 0) from DepreciationDetail aa where aa.TNo < j.TNo and aa.AssetTNo = j.AssetTNo and aa.AssetCode = j.AssetCode )  as DepreciationOpening,',
'',
'',
'case when a.DocTypeCode = ''OPENING'' or a.AssetDate < :P294_FROMDATE then nvl(j.AssetWDV + j.DepreciationAmount, b.AssetValue - NVL(B.DEPRECIATEDAMOUNT, 0)) else 0 end as NetOpening,',
'',
'case when l.VoucherDate  between :P294_FROMDATE and :P294_TODATE  AND l.VoucherDate IS NOT NULL then j.DepreciationAmount else 0  end as DepreciationForThePeriod,',
'',
'nvl(b.DepreciatedAmount, 0) + ( select NVL(sum(aa.DepreciationAmount), 0) from DepreciationDetail aa where aa.TNo < j.TNo and aa.AssetTNo = j.AssetTNo and aa.AssetCode = j.AssetCode )',
'  + ( case when l.VoucherDate  between :P294_FROMDATE and :P294_TODATE  AND l.VoucherDate IS NOT NULL then j.DepreciationAmount else 0  end  )',
'  as TotalDepreciation,',
'',
'( case when a.DocTypeCode = ''OPENING'' or a.AssetDate < :P294_FROMDATE then nvl(j.AssetWDV + j.DepreciationAmount, b.AssetValue - NVL(B.DEPRECIATEDAMOUNT, 0)) else 0 end ) ',
'   + (case when a.DocTypeCode != ''OPENING'' and a.AssetDate BETWEEN :P294_FROMDATE AND :P294_TODATE then nvl(j.AssetWDV + j.DepreciationAmount, b.AssetValue) ELSE 0  end )',
'   - (case when l.VoucherDate  between :P294_FROMDATE and :P294_TODATE  AND l.VoucherDate IS NOT NULL then j.DepreciationAmount else 0  end)',
'as NetClosing,',
'',
'0 as dummy',
'from Asset a, AssetCodeDetail b, Party c, Location d, DocType e, Company f, Voucher g, Item h, ItemSpecification i, ',
'DepreciationDetail j, Depreciation k, Voucher L, (',
'    select ',
'        aa.AssetDiscardDate as DeductionDate,',
'        bb.AssetTNo,',
'        bb.AssetCode,',
'        bb.NetValue',
'    from AssetDiscard aa, AssetDiscardDetail bb',
'    where aa.tno = bb.tno  ',
'        and aa.AssetDiscardDate between :P294_FROMDATE AND :P294_TODATE',
'    union all',
'    select ',
'        aa.AssetTransferDate as DeductionDate,',
'        bb.AssetTNo,',
'        bb.AssetCode,',
'        bb.NetValue',
'    from AssetTransfer aa, AssetTransferFromAsset bb',
'    where aa.tno = bb.tno  ',
'        and aa.AssetTransferDate between :P294_FROMDATE AND :P294_TODATE',
'',
') M',
'where a.tno = b.tno ',
'and a.AccountCode = c.PartyCode',
'and a.LocationCode = d.LocationCode',
'and a.DocTypeCode = e.DocTypeCode',
'and a.CompanyCode = f.CompanyCode',
'and a.TNO = g.ModuleTNo(+)',
'and a.ItemCode = h.ItemCode',
'and a.ItemSpecificationCode = i.ItemSpecificationCode',
'and b.TNO = j.AssetTNo(+)',
'and b.AssetCode = j.AssetCode(+)',
'and j.TNO = k.TNo(+)',
'and k.TNo = L.ModuleTNo(+)',
'--',
'and b.TNo = m.AssetTNo(+)',
'and b.AssetCode = m.AssetCode(+)',
'--',
'--and ( l.VoucherDate Between :P294_FROMDATE and :P294_TODATE or L.VoucherDate is null )',
'and ( :P294_COMPANY IS NULL OR INSTR('':''||:P294_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'AND a.AssetDate <=  :P294_TODATE'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Depreciation'
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
 p_id=>wwv_flow_imp.id(225162696865874096)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>57243678399746654
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163203893874101)
,p_db_column_name=>'ACCOUNTNAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Account Name'
,p_column_html_expression=>'<div style="display:block; width:190px">#ACCOUNTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165417732874123)
,p_db_column_name=>'ADDITIONFORTHEPERIOD'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'ADDITION FOR THE YEAR'
,p_column_html_expression=>'<div style="display:block; width:100px">#ADDITIONFORTHEPERIOD#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163861753874108)
,p_db_column_name=>'ASSETCODE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Asset Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#ASSETCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163354203874103)
,p_db_column_name=>'ASSETDATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Asset Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#ASSETDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163276879874102)
,p_db_column_name=>'ASSETNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Asset No'
,p_column_html_expression=>'<div style="display:block; width:200px">#ASSETNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225162875742874098)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Company Name'
,p_column_html_expression=>'<div style="display:block; width:200px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165536164874124)
,p_db_column_name=>'DEDUCTIONFORTHEPERIOD'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'DEDUCTION FOR THE YEAR'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEDUCTIONFORTHEPERIOD#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165012093874119)
,p_db_column_name=>'DEPRECIATIONDAYS'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Depreciation Days'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPRECIATIONDAYS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165295830874122)
,p_db_column_name=>'DEPRECIATIONFORTHEPERIOD'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'DEPRECIATION FOR THE YEAR'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPRECIATIONFORTHEPERIOD#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225164463034874114)
,p_db_column_name=>'DEPRECIATIONNO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Depreciation No'
,p_column_html_expression=>'<div style="display:block; width:200px">#DEPRECIATIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165883263874128)
,p_db_column_name=>'DEPRECIATIONOPENING'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'DEPRECIATION ( OPENING )'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPRECIATIONOPENING#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225164920096874118)
,p_db_column_name=>'DEPRECIATIONRATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Depreciation Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPRECIATIONRATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225164589881874115)
,p_db_column_name=>'DEPRECIATIONTILLDATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Depreciation Till Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPRECIATIONTILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225164771871874117)
,p_db_column_name=>'DEPRECIATIONVOUCHERDATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Depreciation Voucher Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPRECIATIONVOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225164711845874116)
,p_db_column_name=>'DEPRECIATIONVOUCHERNO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Depreciation Voucher No'
,p_column_html_expression=>'<div style="display:block; width:200px">#DEPRECIATIONVOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163138060874100)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doctype Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165813771874127)
,p_db_column_name=>'DUMMY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Dummy'
,p_column_html_expression=>'<div style="display:block; width:100px">#DUMMY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165640591874125)
,p_db_column_name=>'GROSSOPENING'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'GROSS OPENING'
,p_column_html_expression=>'<div style="display:block; width:80px">#GROSSOPENING#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163704040874106)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163806095874107)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Itemspecification Name'
,p_column_html_expression=>'<div style="display:block; width:120px">#ITEMSPECIFICATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225162953854874099)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Location Name'
,p_column_html_expression=>'<div style="display:block; width:120px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225329564168176481)
,p_db_column_name=>'NETCLOSING'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'CLOSING NET BLOCK'
,p_column_html_expression=>'<div style="display:block; width:80px">#NETCLOSING#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225329475412176480)
,p_db_column_name=>'NETOPENING'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'OPENING NET BLOCK'
,p_column_html_expression=>'<div style="display:block; width:80px">#NETOPENING#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189651429478099760)
,p_db_column_name=>'SERIALNO'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225162825036874097)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225329416931176479)
,p_db_column_name=>'TOTALDEPRECIATION'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'TOTAL DEPRECIATION YEAR END'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALDEPRECIATION#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225165666087874126)
,p_db_column_name=>'TOTALGROSS'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'GROSS TOTAL (YEAR END)'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALGROSS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163613316874105)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Voucher Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225163542933874104)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Voucher No'
,p_column_html_expression=>'<div style="display:block; width:200px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(225183774199073385)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'232250'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SERIALNO:COMPANYNAME:LOCATIONNAME:DOCTYPENAME:ACCOUNTNAME:ASSETNO:ASSETDATE:VOUCHERNO:VOUCHERDATE:ITEMNAME:ITEMSPECIFICATIONNAME:ASSETCODE:DEPRECIATIONNO:DEPRECIATIONTILLDATE:DEPRECIATIONVOUCHERNO:DEPRECIATIONVOUCHERDATE:DEPRECIATIONRATE:DEPRECIATION'
||'DAYS:GROSSOPENING:ADDITIONFORTHEPERIOD:DEDUCTIONFORTHEPERIOD:TOTALGROSS:DEPRECIATIONOPENING:DEPRECIATIONFORTHEPERIOD:TOTALDEPRECIATION:NETOPENING:NETCLOSING'
,p_sum_columns_on_break=>'DEPRECIATIONAMOUNT:ASSETVALUEBEFOREDEPRECIATION:ASSETPURCHASEVALUE:OPENINGASSETVALUE:ADDITIONASSETVALUE:DEPRECIATIONFORTHEPERIOD:ADDITIONFORTHEPERIOD:DEDUCTIONFORTHEPERIOD:GROSSOPENING:TOTALGROSS:DEPRECIATIONOPENING:TOTALDEPRECIATION:NETOPENING:NETCL'
||'OSING'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(225125262680010590)
,p_plug_name=>'Depreciation Register'
,p_static_id=>'depreciation-register'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent4:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(184988825411257128)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(225125262680010590)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(225189079043124711)
,p_name=>'P294_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(225125262680010590)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct ',
'  b.CompanyName d,',
'  b.CompanyCode r',
'  From Asset a, Company b',
'  Where a.CompanyCode = b.CompanyCode;'))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(225189390198126296)
,p_name=>'P294_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(225125262680010590)
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(225126399868010592)
,p_name=>'P294_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(225125262680010590)
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(184999771359257138)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(185000308023257139)
,p_event_id=>wwv_flow_imp.id(184999771359257138)
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
