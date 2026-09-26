prompt --application/pages/page_00382
begin
--   Manifest
--     PAGE: 00382
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
 p_id=>382
,p_name=>'Proforma Invoice Report'
,p_alias=>'PROFORMA-INVOICE-REPORT'
,p_step_title=>'Proforma Invoice Report'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink{',
'    text-transform: uppercase;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21421736856322697)
,p_plug_name=>'Filters'
,p_static_id=>'filters'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19829060650332680)
,p_plug_name=>'Proforma Invoice Report'
,p_static_id=>'proforma-invoice-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(GetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), xxx.TNo), ''STATUS'') AS Status,',
'    xxx.TNo,',
'    xxx.LocationName,',
'    xxx.DocTypeName,',
'    xxx.PInvoiceNo,',
'    xxx.PInvoiceDate,',
'    xxx.SalesOrderNo,',
'    xxx.SalesOrderDate,',
'    xxx.PartyName,',
'    xxx.Consignee,',
'    xxx.Transporter,',
'    xxx.VehicleNo,',
'    xxx.LorryNo,',
'    xxx.LorryDate,',
'    xxx.FreightRate,',
'    xxx.FreightUnitCode,',
'    xxx.ItemCode,',
'    xxx.ItemName,',
'    xxx.Item,',
'    xxx.UOM,',
'    xxx.UOM2,',
'    xxx.Quantity1,',
'    xxx.Quantity2,',
'    xxx.Rate,',
'    xxx.Amount,',
'    xxx.CGST,',
'    xxx.SGST,',
'    xxx.IGST,',
'    xxx.TCS,',
'    xxx.FooterAmount,',
'    ABS(xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)) AS OtherAmount,',
'    xxx.TotalAmount,',
'    xxx.Creator,',
'    xxx.CreationTime,',
'    xxx.AgentName,',
'    xxx.CityName,',
'    xxx.StateName',
'',
'    -- , xxx.LoadingAdviceNo       -- Related to LOADINGADVICE',
'    -- , xxx.DespatchAdviceNo      -- Related to DESPATCHADVICE',
'    -- , xxx.DespatchAdviceDate    -- Related to DESPATCHADVICE',
'    -- , xxx.FreightTypeName       -- Related to FREIGHTTYPE',
'    -- , xxx.VoucherStatus         -- Related to VOUCHER / INVOICE',
'    -- , ''<a href="'' || APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':'' || 9993 || '':'' || :APP_SESSION || ''::::'' || ''P9993_TNO,P9993_REPNAME'' || '':'' || xxx.TNo || '','' || ''PInvoice11'' || '':NO'') || ''"><span aria-label="Action"><span class="fa fa-print" '
||'aria-hidden="true" title="Action"></span></span></a>'' AS Print',
'FROM (',
'    SELECT',
'        xx.TNo,',
'        xx.LocationName,',
'        xx.DocTypeName,',
'        xx.PInvoiceNo,',
'        xx.PInvoiceDate,',
'        xx.SalesOrderNo,',
'        xx.SalesOrderDate,',
'        xx.PartyName,',
'        xx.Consignee,',
'        xx.Transporter,',
'        xx.VehicleNo,',
'        xx.LorryNo,',
'        xx.LorryDate,',
'        xx.FreightRate,',
'        xx.FreightUnitCode,',
'        xx.ItemCode,',
'        xx.ItemName,',
'        xx.Item,',
'        xx.UOM,',
'        xx.UOM2,',
'        xx.Quantity1,',
'        xx.Quantity2,',
'        xx.Rate,',
'        xx.Amount,',
'        SUM(xx.CGST) AS CGST,',
'        SUM(xx.SGST) AS SGST,',
'        SUM(xx.IGST) AS IGST,',
'        SUM(xx.TCS) AS TCS,',
'        xx.FooterAmount,',
'        xx.TotalAmount,',
'        xx.Creator,',
'        xx.CreationTime,',
'        xx.AgentName,',
'        xx.CityName,',
'        xx.StateName',
'',
'        -- , xx.LoadingAdviceNo    -- Related to LOADINGADVICE',
'        -- , xx.DespatchAdviceNo   -- Related to DESPATCHADVICE',
'        -- , xx.DespatchAdviceDate -- Related to DESPATCHADVICE',
'        -- , xx.FreightTypeName    -- Related to FREIGHTTYPE',
'        -- , xx.VoucherStatus      -- Related to VOUCHER / INVOICE',
'    FROM (',
'        SELECT',
'            a.TNo,',
'            l.LocationName,',
'            dt.DocTypeName,',
'            a.PINVOICENO AS PInvoiceNo, ',
'            a.PINVOICEDATE AS PInvoiceDate,',
'            so.SalesOrderNo,',
'            so.SalesOrderDate,',
'            GetPartyName(so.AgentCode) AS AgentName,',
'            p.PartyName,',
'            GetCityName(p.OfficeCityCode) AS CityName,',
'            GetStateName(p.OfficeStateCode) AS StateName,',
'            GetPartyName(a.ConsigneeCode) AS Consignee,',
'            t.PartyName AS Transporter,',
'            a.VehicleNo,',
'            a.LorryNo,',
'            a.LorryDate,',
'            a.FreightRate,',
'            a.FreightUnitCode,',
'            b.ItemCode,',
'            e.ItemName,',
'            e.ItemName || '' ~ '' || ee.ItemSpecificationName AS Item,',
'            e.MeasuringUnitCode1 AS UOM,',
'            e.MeasuringUnitCode2 AS UOM2,',
'            CASE WHEN e.ItemClassificationCode != ''SERVICE'' THEN b.Quantity1 END AS Quantity1,',
'            CASE WHEN e.ItemClassificationCode != ''SERVICE'' THEN b.Quantity2 END AS Quantity2,',
'            b.Rate,',
'            b.Amount,',
'            NVL(DECODE(c.FooterHeadCode, ''.CGST.'', c.FooterValue), 0) AS CGST,',
'            NVL(DECODE(c.FooterHeadCode, ''.SGST.'', c.FooterValue), 0) AS SGST,',
'            NVL(DECODE(c.FooterHeadCode, ''.IGST.'', c.FooterValue), 0) AS IGST,',
'            NVL(DECODE(c.FooterHeadCode, ''.TCS.'', c.FooterValue), 0) AS TCS,',
'            b.FooterAmount,',
'            b.TotalAmount,',
'            bue.EmployeeName || '' ( '' || a.Creator || '')'' AS Creator,',
'            a.CreationTime',
'',
'            -- , ld.LoadingAdviceNo                                                                        -- Related to LOADINGADVICE',
'            -- , da.DespatchAdviceNo                                                                       -- Related to DESPATCHADVICE',
'            -- , da.DespatchAdviceDate                                                                     -- Related to DESPATCHADVICE',
'            -- , ft.FreightTypeName                                                                        -- Related to FREIGHTTYPE',
'            -- , CASE WHEN vo.ModuleTNo IS NOT NULL THEN ''PREPARED'' ELSE ''PENDING'' END AS VoucherStatus    -- Related to VOUCHER / INVOICE',
'        FROM PINVOICE a',
'        LEFT JOIN PINVOICEDETAIL b ON a.TNo = b.TNo',
'        LEFT JOIN PINVOICEDETAILFOOTER c ON b.TNo = c.TNo AND b.SNo = c.SNo',
'        LEFT JOIN LOCATION l ON a.LocationCode = l.LocationCode',
'        LEFT JOIN DOCTYPE dt ON a.DocTypeCode = dt.DocTypeCode',
'        LEFT JOIN SALESORDER so ON a.SalesOrderTNo = so.TNo',
'        LEFT JOIN PARTY p ON a.PartyCode = p.PartyCode',
'        LEFT JOIN PARTY t ON a.TransporterCode = t.PartyCode',
'        LEFT JOIN ITEM e ON b.ItemCode = e.ItemCode',
'        LEFT JOIN ITEMSPECIFICATION ee ON b.ItemSpecificationCode = ee.ItemSpecificationCode',
'        LEFT JOIN BOSSUSER bu ON a.Creator = bu.LoginName',
'        LEFT JOIN EMPLOYEE bue ON bu.EmployeeCode = bue.EmployeeCode',
'        LEFT JOIN DOCUMENTSTATUSDETAIL dsd ON a.TNo = dsd.ModuleTNo',
'',
'        -- LEFT JOIN LOADINGADVICE ld ON a.LoadingAdviceTNo = ld.TNo',
'        -- LEFT JOIN DESPATCHADVICE da ON a.DespatchAdviceTNo = da.TNo',
'        -- LEFT JOIN FREIGHTTYPE ft ON a.FreightTypeCode = ft.FreightTypeCode',
'        -- LEFT JOIN INVOICE ic ON a.TNo = ic.ModuleTNo',
'        -- LEFT JOIN VOUCHER vo ON ic.TNo = vo.ModuleTNo',
'        WHERE a.PINVOICEDATE BETWEEN :P382_FROMDATE AND :P382_TODATE',
'          AND (:P382_LOCATION IS NULL OR REGEXP_LIKE(:P382_LOCATION, ''((^|:)'' || a.LocationCode || ''(:|$))''))',
'          AND (:P382_COMPANY IS NULL OR REGEXP_LIKE(:P382_COMPANY, ''((^|:)'' || a.CompanyCode || ''(:|$))''))',
'          AND (:P382_PARTY IS NULL OR REGEXP_LIKE(:P382_PARTY, ''((^|:)'' || a.PartyCode || ''(:|$))''))',
'          AND (:P382_CONSIGNEE IS NULL OR REGEXP_LIKE(:P382_CONSIGNEE, ''((^|:)'' || so.ConsigneeCode || ''(:|$))''))',
'          AND (:P382_ITEM IS NULL OR REGEXP_LIKE(:P382_ITEM, ''((^|:)'' || e.ItemCode || ''(:|$))''))',
'          AND (:P382_ITEMSPECIFICATION IS NULL OR REGEXP_LIKE(:P382_ITEMSPECIFICATION, ''((^|:)'' || ee.ItemSpecificationCode || ''(:|$))''))',
'        --   AND GetCompanyPrivilege(a.CompanyCode, GetModuleCodeForPageNo(:APP_PAGE_ID), :GLOBAL_LOGINNAME) = ''YES''',
'        --   AND GetLocationPrivilege(a.LocationCode, GetModuleCodeForPageNo(:APP_PAGE_ID), a.CompanyCode, :GLOBAL_LOGINNAME) = ''YES''',
'    ) xx',
'    GROUP BY ',
'        xx.TNo, xx.LocationName, xx.DocTypeName, xx.PInvoiceNo, xx.PInvoiceDate, xx.SalesOrderNo, xx.SalesOrderDate, ',
'        xx.PartyName, xx.Consignee, xx.Transporter, xx.VehicleNo, xx.LorryNo, xx.LorryDate, xx.FreightRate, ',
'        xx.FreightUnitCode, xx.ItemCode, xx.ItemName, xx.Item, xx.UOM, xx.UOM2, xx.Quantity1, xx.Quantity2, ',
'        xx.Rate, xx.Amount, xx.FooterAmount, xx.TotalAmount, xx.Creator, xx.CreationTime, xx.AgentName, ',
'        xx.CityName, xx.StateName',
'',
'        -- , xx.LoadingAdviceNo',
'        -- , xx.DespatchAdviceNo',
'        -- , xx.DespatchAdviceDate',
'        -- , xx.FreightTypeName',
'        -- , xx.VoucherStatus',
') xxx',
'Order by xxx.PInvoiceNo desc,',
'         xxx.PInvoiceDate desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P382_COMPANY,P382_LOCATION,P382_STATUS,P382_FROMDATE,P382_TODATE,P382_PARTY,P382_CONSIGNEE,P382_ITEM,P382_ITEMSPECIFICATION'
,p_prn_page_header=>'Proforma Invoice Report'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19829148448332680)
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
,p_detail_link=>'f?p=&APP_ID.:383:&SESSION.::&DEBUG.:RP,383:P383_TNO,P383_FORMSTATUS:\#TNO#\,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>3890109273492313
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21421091948322691)
,p_db_column_name=>'AGENTNAME'
,p_display_order=>330
,p_column_identifier=>'DJ'
,p_column_label=>'Agentname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420268514322683)
,p_db_column_name=>'AMOUNT'
,p_display_order=>250
,p_column_identifier=>'DB'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420425518322684)
,p_db_column_name=>'CGST'
,p_display_order=>260
,p_column_identifier=>'DC'
,p_column_label=>'Cgst'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21421149402322692)
,p_db_column_name=>'CITYNAME'
,p_display_order=>340
,p_column_identifier=>'DK'
,p_column_label=>'Cityname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419176654322672)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>150
,p_column_identifier=>'CQ'
,p_column_label=>'Consignee'
,p_column_html_expression=>'<div style="display:block; width:250px">#CONSIGNEE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19862272093332694)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>80
,p_column_identifier=>'CD'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19861881995332694)
,p_db_column_name=>'CREATOR'
,p_display_order=>70
,p_column_identifier=>'CC'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21326382878643314)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>110
,p_column_identifier=>'CI'
,p_column_label=>'Doctypename'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420822039322688)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>300
,p_column_identifier=>'DG'
,p_column_label=>'Footeramount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19847070428332690)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>40
,p_column_identifier=>'AR'
,p_column_label=>'Freightrate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19837457043332686)
,p_db_column_name=>'FREIGHTUNITCODE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Freightunitcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420597029322686)
,p_db_column_name=>'IGST'
,p_display_order=>280
,p_column_identifier=>'DE'
,p_column_label=>'Igst'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419708890322677)
,p_db_column_name=>'ITEM'
,p_display_order=>190
,p_column_identifier=>'CV'
,p_column_label=>'Item'
,p_column_html_expression=>'<div style="display:block; width:250px">#ITEM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419527529322675)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>170
,p_column_identifier=>'CT'
,p_column_label=>'Itemcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419605032322676)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>180
,p_column_identifier=>'CU'
,p_column_label=>'Itemname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21326257592643313)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>100
,p_column_identifier=>'CH'
,p_column_label=>'Locationname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19843903663332688)
,p_db_column_name=>'LORRYDATE'
,p_display_order=>30
,p_column_identifier=>'AJ'
,p_column_label=>'Lorrydate'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19855874138332692)
,p_db_column_name=>'LORRYNO'
,p_display_order=>60
,p_column_identifier=>'BN'
,p_column_label=>'Lorryno'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420899995322689)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>310
,p_column_identifier=>'DH'
,p_column_label=>'Otheramount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419074769322671)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>140
,p_column_identifier=>'CP'
,p_column_label=>'Partyname'
,p_column_html_expression=>'<div style="display:block; width:250px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21422906917322709)
,p_db_column_name=>'PINVOICEDATE'
,p_display_order=>370
,p_column_identifier=>'DQ'
,p_column_label=>'Pinvoicedate'
,p_column_html_expression=>'<div style="display:block; width:80px">#PINVOICEDATE#</div>'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21422772835322708)
,p_db_column_name=>'PINVOICENO'
,p_display_order=>360
,p_column_identifier=>'DP'
,p_column_label=>'Pinvoiceno'
,p_column_html_expression=>'<div style="display:block; width:130px">#PINVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420032163322680)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>220
,p_column_identifier=>'CY'
,p_column_label=>'Quantity1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420078607322681)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>230
,p_column_identifier=>'CZ'
,p_column_label=>'Quantity2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420142744322682)
,p_db_column_name=>'RATE'
,p_display_order=>240
,p_column_identifier=>'DA'
,p_column_label=>'Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21418970374322670)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>130
,p_column_identifier=>'CO'
,p_column_label=>'Salesorderdate'
,p_column_html_expression=>'<div style="display:block; width:100px">#SALESORDERDATE#</div>'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21418906374322669)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>120
,p_column_identifier=>'CN'
,p_column_label=>'Salesorderno'
,p_column_html_expression=>'<div style="display:block; width:130px">#SALESORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420523731322685)
,p_db_column_name=>'SGST'
,p_display_order=>270
,p_column_identifier=>'DD'
,p_column_label=>'Sgst'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21421280711322693)
,p_db_column_name=>'STATENAME'
,p_display_order=>350
,p_column_identifier=>'DL'
,p_column_label=>'Statename'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21326178500643312)
,p_db_column_name=>'STATUS'
,p_display_order=>10
,p_column_identifier=>'CG'
,p_column_label=>'Status'
,p_column_html_expression=>'<span class="iboss-tag iboss-tag-#STATUS#">#STATUS#</span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21420657106322687)
,p_db_column_name=>'TCS'
,p_display_order=>290
,p_column_identifier=>'DF'
,p_column_label=>'Tcs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19829935713332683)
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
 p_id=>wwv_flow_imp.id(21421039122322690)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>320
,p_column_identifier=>'DI'
,p_column_label=>'Totalamount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419324373322673)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>160
,p_column_identifier=>'CR'
,p_column_label=>'Transporter'
,p_column_html_expression=>'<div style="display:block; width:190px">#TRANSPORTER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419815276322678)
,p_db_column_name=>'UOM'
,p_display_order=>200
,p_column_identifier=>'CW'
,p_column_label=>'Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21419913730322679)
,p_db_column_name=>'UOM2'
,p_display_order=>210
,p_column_identifier=>'CX'
,p_column_label=>'Uom2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19854726848332692)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>50
,p_column_identifier=>'BK'
,p_column_label=>'Vehicleno'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19865134200359061)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'39261'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS:LOCATIONNAME:PINVOICEDATE:PINVOICENO:SALESORDERDATE:SALESORDERNO:PARTYNAME:CONSIGNEE:AGENTNAME:ITEM:UOM:QUANTITY1:RATE:AMOUNT:CGST:SGST:IGST:FOOTERAMOUNT:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19863564248332695)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19829060650332680)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:383:&SESSION.::&DEBUG.:383:P383_FORMSTATUS:NEWRECORD'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21422646629322707)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21421794372322698)
,p_name=>'P382_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_prompt=>'Company'
,p_placeholder=>'-- Select Company --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PINVOICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
' and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21422396315322704)
,p_name=>'P382_CONSIGNEE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_prompt=>'Consignee'
,p_placeholder=>'-- Select Consignee Name  --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From pinvoice a, Party p',
'Where a.ConsigneeCode = p.PartyCode',
'Order by 1'))
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21421955224322700)
,p_name=>'P382_FROMDATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_item_default=>'TRUNC(SYSDATE) -7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'-- Select From Date --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(21422521989322705)
,p_name=>'P382_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_prompt=>'Item'
,p_placeholder=>'-- Select Item Name  --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From pinvoiceDetail a, Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21422623440322706)
,p_name=>'P382_ITEMSPECIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_prompt=>'Itemspecification'
,p_placeholder=>'-- Select Item Specification Name  --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'     ee.ItemSpecificationName as d,',
'     ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee, PInvoiceDetail p',
'Where e.ItemCode = :P382_ITEM',
'  and e.TNo = ee.TNo',
'  and ee.ItemSpecificationCode = p.ItemSpecificationCode',
'Order by 1'))
,p_lov_cascade_parent_items=>'P382_ITEM'
,p_ajax_items_to_submit=>'P382_ITEM'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21422141312322702)
,p_name=>'P382_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_prompt=>'Location'
,p_placeholder=>'-- Select Location --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''PINVOICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21422304840322703)
,p_name=>'P382_PARTY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_prompt=>'Party'
,p_placeholder=>'-- Select Customer Name  --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From pinvoice a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21421908484322699)
,p_name=>'P382_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_prompt=>'Status'
,p_placeholder=>'-- Select Status --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>'Select DOCUMENTSTATUSCODE as D, DOCUMENTSTATUSCODE as R From DOCUMENTSTATUSDETAIL Where MODULECODE = ''PINVOICE'';'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21422074197322701)
,p_name=>'P382_TODATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(21421736856322697)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'-- Select To Date --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
wwv_flow_imp.component_end;
end;
/
