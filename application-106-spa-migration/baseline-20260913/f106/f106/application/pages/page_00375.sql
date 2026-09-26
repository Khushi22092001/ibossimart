prompt --application/pages/page_00375
begin
--   Manifest
--     PAGE: 00375
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
 p_id=>375
,p_name=>'Pending Dispatch Quantity Register'
,p_alias=>'PENDING-DISPATCH-QUANTITY-REGISTER'
,p_step_title=>'Pending Dispatch Quantity Register'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57203661423730711)
,p_plug_name=>'Pending Dispatch Quantity Register'
,p_static_id=>'pending-dispatch-quantity-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH SO_DISP_REDUCE AS (',
'    SELECT ',
'        DAD.ITEMCODE,',
'        DAD.ITEMSPECIFICATIONCODE,',
'        DA.REFERENCETNO,',
'        SUM(DAD.QUANTITY1) AS TOTAL_DISP_QTY',
'    FROM DESPATCHADVICEDETAIL DAD',
'    JOIN DESPATCHADVICE DA ON DAD.TNO = DA.TNO',
'    GROUP BY DAD.ITEMCODE, DAD.ITEMSPECIFICATIONCODE, DA.REFERENCETNO',
')',
',SO_ORD_REDUCE AS (',
'    SELECT',
'        SOD.ITEMCODE,',
'        SOD.ITEMSPECIFICATIONCODE,',
'        SOD.TNO AS SALESORDERTNO,',
'        SUM(SOD.QUANTITY1) AS TOTAL_ORD_QTY',
'    FROM SALESORDERDETAIL SOD',
'    GROUP BY SOD.ITEMCODE, SOD.ITEMSPECIFICATIONCODE, SOD.TNO',
')',
',PRIV_CHECK AS (',
'    SELECT a.TNo',
'    FROM DespatchAdvice a',
'    WHERE getcompanyprivilege( a.COMPANYCODE,  GETMODULECODEFORPAGENO(:APP_PAGE_ID), :GLOBAL_LOGINNAME) = ''YES''',
'      AND getlocationprivilege(a.locationcode, GETMODULECODEFORPAGENO(:APP_PAGE_ID), a.companycode, :global_loginname) = ''YES''',
'      AND getdoctypeprivilege( a.doctypecode,  GETMODULECODEFORPAGENO(:APP_PAGE_ID), a.companycode, :global_loginname) = ''YES''',
')',
'SELECT',
'    a.TNo,',
'    l.LocationName,',
'    dt.DocTypeName,',
'    a.DespatchAdviceNo,',
'    a.DespatchAdviceDate,',
'    iut.SalesOrderNo                                                AS ReferenceNo,',
'    iut.SalesOrderDate                                              AS ReferenceDate,',
'    ''Sales Order''                                                   AS Reference,',
'    p.PartyName,',
'    t.PartyName                                                     AS Transporter,',
'    emp.EmployeeName||'' ( ''||emp.EmployeeID||'' )''                  AS Employee,',
'    a.Drivername,',
'    a.VehicleNo,',
'    b.ItemCode,',
'    ei.Itemname||'' ~ ''||ee.itemSpecificationName                    AS Item,',
'    ei.MeasuringUnitCode1,',
'    b.Quantity1,',
'    nvl(pt.PackingTypeName, ei.MeasuringUnitCode2)                  AS MeasuringUnitCode2,',
'    b.Quantity2,',
'    nvl(Decode(mo.ReferenceTNo, a.TNo, ''PREPARED''), ''PENDING'')     AS MSTATUS,',
'    mo.MaterialOutNo,',
'    mo.MaterialOutDate,',
'    nvl(Decode(w.ReferenceTNo,  a.TNo, ''PREPARED''), ''PENDING'')     AS WSTATUS,',
'    w.WeighmentNo,',
'    w.WeighmentDate,',
'    bue.EmployeeName||'' ( ''||a.Creator||'' )''                       AS Creator,',
'    a.CreationTime,',
'    SOR.TOTAL_ORD_QTY                                               AS SO_ORDERED_QTY,',
'    DR.TOTAL_DISP_QTY                                               AS TOTAL_DISPATCHED_QTY,',
'    GREATEST(',
'        COALESCE(SOR.TOTAL_ORD_QTY,  0)',
'      - COALESCE(DR.TOTAL_DISP_QTY, 0),',
'    0)                                                              AS PENDING_DISPATCH_QTY,',
'    ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''',
'        ||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''DespatchAdvice''||'':NO'')',
'        ||''"><span aria-label="Action"><span class="fa fa-print" aria-hidden="true" title="Action"></span></span></a>'' AS Print',
'',
'FROM DespatchAdvice a',
'',
'JOIN PRIV_CHECK              pc  ON  a.TNo               = pc.TNo   -- privilege filter',
'',
'LEFT JOIN DespatchAdviceDetail  b   ON  a.TNo               = b.TNo',
'LEFT JOIN Location              l   ON  a.Locationcode       = l.LocationCode',
'LEFT JOIN DocType               dt  ON  a.DocTypeCode        = dt.DocTypeCode',
'LEFT JOIN Party                 p   ON  a.PartyCode          = p.PartyCode',
'LEFT JOIN Party                 t   ON  a.TransporterCode    = t.PartyCode',
'LEFT JOIN Employee              emp ON  a.EmployeeCode       = emp.EmployeeCode',
'LEFT JOIN BossUser              bu  ON  a.Creator            = bu.LoginName',
'LEFT JOIN Employee              bue ON  bu.EmployeeCode      = bue.EmployeeCode',
'LEFT JOIN Item                  ei  ON  b.ItemCode           = ei.ItemCode',
'LEFT JOIN ItemSpecification     ee  ON  b.ItemSpecificationCode = ee.ItemSpecificationCode',
'LEFT JOIN SalesOrder            iut ON  a.ReferenceTNo       = iut.TNo',
'LEFT JOIN MaterialOut           mo  ON  a.TNo                = mo.ReferenceTNo',
'LEFT JOIN Weighment             w   ON  a.TNo                = w.ReferenceTNo',
'LEFT JOIN PackingType           pt  ON  b.PackingTypeCode    = pt.PackingTypeCode',
'',
'LEFT JOIN SO_DISP_REDUCE DR',
'    ON  DR.REFERENCETNO           = iut.TNo',
'    AND DR.ITEMCODE               = b.ItemCode',
'    AND DR.ITEMSPECIFICATIONCODE  = b.ItemSpecificationCode',
'',
'LEFT JOIN SO_ORD_REDUCE SOR',
'    ON  SOR.SALESORDERTNO         = iut.TNo',
'    AND SOR.ITEMCODE              = b.ItemCode',
'    AND SOR.ITEMSPECIFICATIONCODE = b.ItemSpecificationCode',
'',
'-- WHERE trunc(a.DespatchAdviceDate) BETWEEN :P160_FROMDATE AND :P160_TODATE',
'--   AND ( :P160_COMPANY           IS NULL OR instr('':''||:P160_COMPANY||'':'',           '':''||a.CompanyCode||'':'')           > 0 )',
'--   AND ( :P160_LOCATION          IS NULL OR instr('':''||:P160_LOCATION||'':'',          '':''||a.LocationCode||'':'')          > 0 )',
'--   AND ( :P160_DOCTYPE           IS NULL OR instr('':''||:P160_DOCTYPE||'':'',           '':''||a.DocTypeCode||'':'')           > 0 )',
'--   AND ( :P160_PARTY             IS NULL OR instr('':''||:P160_PARTY||'':'',             '':''||a.PartyCode||'':'')             > 0 )',
'--   AND ( :P160_TRANSPORTER       IS NULL OR instr('':''||:P160_TRANSPORTER||'':'',       '':''||a.TransporterCode||'':'')       > 0 )',
'--   AND ( :P160_ITEM              IS NULL OR instr('':''||:P160_ITEM||'':'',              '':''||b.ItemCode||'':'')              > 0 )',
'--   AND ( :P160_ITEMSPECIFICATION IS NULL OR instr('':''||:P160_ITEMSPECIFICATION||'':'', '':''||b.ItemSpecificationCode||'':'') > 0 )',
'--   AND ( :P160_VEHICLENO         IS NULL OR a.VehicleNo = :P160_VEHICLENO )',
'--   AND nvl(Decode(w.ReferenceTNo,  a.TNo, ''PREPARED''), ''PENDING'') LIKE nvl(:P160_WSTATUS, ''%'')',
'--   AND nvl(Decode(mo.ReferenceTNo, a.TNo, ''PREPARED''), ''PENDING'') LIKE nvl(:P160_MSTATUS, ''%'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Pending Dispatch Quantity Register'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(57203801882730711)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>39736789757501395
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57214836774730724)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57214501872730724)
,p_db_column_name=>'CREATOR'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57206069765730716)
,p_db_column_name=>'DESPATCHADVICEDATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Despatchadvicedate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57205669254730716)
,p_db_column_name=>'DESPATCHADVICENO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Despatchadviceno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57205306926730715)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Doctypename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57208884524730719)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Drivername'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57208449552730719)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57210028372730720)
,p_db_column_name=>'ITEM'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57209668680730720)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Itemcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57204835674730715)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Locationname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57212834454730722)
,p_db_column_name=>'MATERIALOUTDATE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Materialoutdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57212466278730722)
,p_db_column_name=>'MATERIALOUTNO'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Materialoutno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57210414257730720)
,p_db_column_name=>'MEASURINGUNITCODE1'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Measuringunitcode1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57211220860730721)
,p_db_column_name=>'MEASURINGUNITCODE2'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Measuringunitcode2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57212093705730721)
,p_db_column_name=>'MSTATUS'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Mstatus'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57207650871730718)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Partyname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57216045122730725)
,p_db_column_name=>'PENDING_DISPATCH_QTY'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Pending Dispatch Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57216449204730725)
,p_db_column_name=>'PRINT'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57210881156730720)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Quantity1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57211633081730721)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Quantity2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57207240923730717)
,p_db_column_name=>'REFERENCE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57206865266730717)
,p_db_column_name=>'REFERENCEDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Referencedate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57206507198730716)
,p_db_column_name=>'REFERENCENO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Referenceno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57215272900730724)
,p_db_column_name=>'SO_ORDERED_QTY'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'So Ordered Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57204465184730715)
,p_db_column_name=>'TNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57215680530730724)
,p_db_column_name=>'TOTAL_DISPATCHED_QTY'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Total Dispatched Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57208041367730718)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57209281707730719)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Vehicleno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57214049590730723)
,p_db_column_name=>'WEIGHMENTDATE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Weighmentdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57213619444730723)
,p_db_column_name=>'WEIGHMENTNO'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Weighmentno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57213232284730722)
,p_db_column_name=>'WSTATUS'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Wstatus'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(57216840940731025)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'397499'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:LOCATIONNAME:DOCTYPENAME:DESPATCHADVICENO:DESPATCHADVICEDATE:REFERENCENO:REFERENCEDATE:REFERENCE:PARTYNAME:TRANSPORTER:EMPLOYEE:DRIVERNAME:VEHICLENO:ITEMCODE:ITEM:MEASURINGUNITCODE1:QUANTITY1:MEASURINGUNITCODE2:QUANTITY2:MSTATUS:MATERIALOUTNO:MAT'
||'ERIALOUTDATE:WSTATUS:WEIGHMENTNO:WEIGHMENTDATE:CREATOR:CREATIONTIME:SO_ORDERED_QTY:TOTAL_DISPATCHED_QTY:PENDING_DISPATCH_QTY:PRINT'
);
wwv_flow_imp.component_end;
end;
/
