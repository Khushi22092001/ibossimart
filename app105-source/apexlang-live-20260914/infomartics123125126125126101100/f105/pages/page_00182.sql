prompt --application/pages/page_00182
begin
--   Manifest
--     PAGE: 00182
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
 p_id=>182
,p_name=>'E-Invoice'
,p_alias=>'E-INVOICE'
,p_step_title=>'E-Invoice'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(974759478159270857)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>40
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1342139644015338982)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(679808771529091808)
,p_plug_name=>'E-Invoice'
,p_static_id=>'e-invoice'
,p_region_name=>'S_Einvoice'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
' A.TNO, A.COMPANYCODE, A.LOCATIONCODE, A.PARTYCODE, A.MODULETNO, A.MODULECODE, A.INVOICENO, A.INVOICEDATE, A.INVOICEAMOUNT, A.TRANDTLS_CATG, A.TRANDTLS_SUPTYP, A.TRANDTLS_REGREV, A.TRANDTLS_TYP, A.TRANDTLS_ECMTRN, A.TRANDTLS_ECMGSTIN, A.TRANDTLS_IGST'
||'ONINTRA, A.DOCDTLS_TYP, A.DOCDTLS_NO, A.DOCDTLS_DT, A.DOCDTLS_ORGINVNO, A.SELLERDTLS_GSTIN, A.SELLERDTLS_TRDNM, A.SELLERDTLS_LGLNM, A.SELLERDTLS_ADDR1, A.SELLERDTLS_ADDR2, A.SELLERDTLS_LOC, A.SELLERDTLS_PIN, A.SELLERDTLS_STATE, A.SELLERDTLS_STCD, A.S'
||'ELLERDTLS_PH, A.SELLERDTLS_EM, A.BUYERDTLS_GSTIN, A.BUYERDTLS_LGLNM, A.BUYERDTLS_TRDNM, A.BUYERDTLS_POS, A.BUYERDTLS_ADDR1, A.BUYERDTLS_ADDR2, A.BUYERDTLS_LOC, A.BUYERDTLS_PIN, A.BUYERDTLS_STATE, A.BUYERDTLS_STCD, A.BUYERDTLS_PH, A.BUYERDTLS_EM, A.SH'
||'IPDTLS_GSTIN, A.SHIPDTLS_LGLNM, A.SHIPDTLS_TRDNM, A.SHIPDTLS_ADDR1, A.SHIPDTLS_ADDR2, A.SHIPDTLS_LOC, A.SHIPDTLS_PIN, A.SHIPDTLS_STCD, A.VALDTLS_ASSVAL, A.VALDTLS_SGSTVAL, A.VALDTLS_CGSTVAL, A.VALDTLS_IGSTVAL, A.VALDTLS_CESVAL, A.VALDTLS_STCESVAL, A.'
||'VALDTLS_DISCOUNT, A.VALDTLS_OTHCHRG, A.VALDTLS_RNDOFFAMT, A.VALDTLS_TOTINVVAL, A.EWBDTLS_TRANSID, A.EWBDTLS_TRANSNAME, A.EWBDTLS_TRANSMODE, A.EWBDTLS_DISTANCE, A.EWBDTLS_TRANSDOCNO, A.EWBDTLS_TRANSDOCDT, A.EWBDTLS_VEHICLENO, A.EWBDTLS_VEHICLETYPE, A.'
||'ACKNO, A.ACKDATE, A.IRN, A.EWBNO, A.EWBDATE, A.VALIDTILLDATE, TO_CHAR(A.SIGNEDQRCODE) AS SIGNEDQRCODE, A.CCINVOICETNO, TO_CHAR(A.ERROR) AS ERROR, TO_CHAR(A.CANCELERROR) AS CANCELERROR, A.CANCELDATE, A.CANCELREASONCODE, A.CANCELREMARK,',
' B.PARTYNAME,',
' ''Check'' As check1,',
' ''Req IRN'' As ReqIRN,',
' ''Get IRN'' As GetIRN,',
' ''Cancel'' As Cancel,',
' --value pass to page 23',
' :P182_WITHEWAYBILL as WithEwayBill,',
' -- css alteration',
' CASE WHEN :P182_MANUALUPDATE = ''YES'' THEN ''none''',
'      ELSE ''auto''',
'  END AS IS_MANUAL_UPDATE,',
' CASE ',
'    WHEN :P182_MANUALUPDATE = ''YES'' THEN ''0.5'' ',
'    ELSE ''1'' ',
' END AS BTN_OPACITY,',
' --Extra null Columns',
'   NULL AS REMARK,',
'   NULL AS CREATOR,',
'   NULL AS CREATIONTIME,',
'   NULL AS BUYERGSTIN,',
'   NULL AS CANCELPORTALRESPONSE,',
'   NULL AS EWAYBILLPORTALRESPONSE,',
'   NULL AS EWAYBILLERROR,',
'   NULL AS PORTALRESPONSE,',
'   NULL AS ISDELETED,',
'   NULL AS DELETIONTIME,',
'   NULL AS DELETEDBY,',
'   NULL AS SELLERGSTIN',
'  From INVOICEFOREI0101REVISED A, PARTY B',
' Where A.PARTYCODE = B.PARTYCODE',
'  -- AND A.tno = :P182_TNO',
'  AND  ( ',
'       ( NVL(:P182_PENDINGFOREINVOICE ,''NO'') = ''YES'' and a.irn is null )',
'       OR',
'       ( NVL(:P182_PENDINGFOREINVOICE ,''NO'') = ''NO'' and a.irn is not null )',
'  )',
'  and ( :P182_LOCATIONCODE IS NULL OR instr('':''||:P182_LOCATIONCODE||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'  AND a.modulecode = :P182_MODULECODE',
'  AND A.INVOICEDATE BETWEEN :P182_FROMDATE AND :P182_TODATE',
'  AND ( :P182_INVOICENO IS NULL OR instr('':''||:P182_INVOICENO||'':'','':''||A.MODULETNO||'':'') > 0 )',
'',
'',
'',
'/*select  TO_NUMBER(:P182_TNO) AS TNO,',
'       A.TNO AS MODULETNO,',
'       ''CCINVOICE'' AS MODULECODE,',
'       null as REMARK,',
'       :GLOBAL_LOGINNAME AS CREATOR,',
'       SYSDATE AS CREATIONTIME,',
'       NULL AS ACKNO,',
'       NULL AS ACKDATE,',
'       NULL AS IRN,',
'       NULL AS BUYERGSTIN,',
'       A.CCINVOICENO AS INVOICENO,',
'       A.CCINVOICEDATE AS INVOICEDATE,',
'       NULL AS EWBNO,',
'       NULL AS SIGNEDQRCODE,',
'       NULL AS EWBDATE,',
'       NULL AS VALIDTILLDATE,',
'       A.TNO AS CCINVOICETNO,',
'       NULL AS ERROR,',
'       NULL AS CANCELPORTALRESPONSE,',
'       NULL AS CANCELDATE,',
'       NULL AS CANCELERROR,',
'       NULL AS CANCELREASONCODE,',
'       NULL AS CANCELREMARK,',
'       NULL AS EWAYBILLPORTALRESPONSE,',
'       NULL AS EWAYBILLERROR,',
'       NULL AS PORTALRESPONSE,',
'       NULL AS ISDELETED,',
'       NULL AS DELETIONTIME,',
'       NULL AS DELETEDBY,',
'       NULL AS SELLERGSTIN,',
'       A.LOCATIONCODE,',
'       B.PARTYNAME,',
'       a.ccinvoiceamount as amount,',
'       ''Check'' as check1,',
'       ''Req IRN'' as ReqIRN,',
'       ''Get IRN'' as GetIRN,',
'       ''Cancel'' as Cancel',
'    FROM CCINVOICE A, PARTY B',
'    WHERE A.PARTYCODE = B.PARTYCODE',
'      AND NOT EXISTS ( SELECT 1 FROM EINVOICE AA WHERE AA.MODULETNO = A.TNO)',
'      AND NVL(:P182_PENDINGFOREINVOICE ,''NO'') = ''YES''',
'      AND :P182_MODULECODE=''CCINVOICE''',
'      and A.CCINVOICEDATE between :P182_FROMDATE and :P182_TODATE',
'      and ( :P182_LOCATIONCODE IS NULL OR instr('':''||:P182_LOCATIONCODE||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
' UNION ALL',
' select  TO_NUMBER(:P182_TNO) AS TNO,',
'       A.TNO AS MODULETNO,',
'       ''CREDITNOTE'' AS MODULECODE,',
'       null as REMARK,',
'       :GLOBAL_LOGINNAME AS CREATOR,',
'       SYSDATE AS CREATIONTIME,',
'       NULL AS ACKNO,',
'       NULL AS ACKDATE,',
'       NULL AS IRN,',
'       NULL AS BUYERGSTIN,',
'       A.creditnoteNO AS INVOICENO,',
'       A.creditnoteDATE AS INVOICEDATE,',
'       NULL AS EWBNO,',
'       NULL AS SIGNEDQRCODE,',
'       NULL AS EWBDATE,',
'       NULL AS VALIDTILLDATE,',
'       A.TNO AS CCINVOICETNO,',
'       NULL AS ERROR,',
'       NULL AS CANCELPORTALRESPONSE,',
'       NULL AS CANCELDATE,',
'       NULL AS CANCELERROR,',
'       NULL AS CANCELREASONCODE,',
'       NULL AS CANCELREMARK,',
'       NULL AS EWAYBILLPORTALRESPONSE,',
'       NULL AS EWAYBILLERROR,',
'       NULL AS PORTALRESPONSE,',
'       NULL AS ISDELETED,',
'       NULL AS DELETIONTIME,',
'       NULL AS DELETEDBY,',
'       NULL AS SELLERGSTIN,',
'       A.LOCATIONCODE,',
'       B.PARTYNAME,',
'       a.creditnoteamount as amount,',
'       ''Check'' as check1,',
'       ''Req IRN'' as ReqIRN,',
'       ''Get IRN'' as GetIRN,',
'       ''Cancel'' as Cancel',
'    FROM creditnote A, PARTY B',
'    WHERE A.PARTYCODE = B.PARTYCODE',
'      AND NOT EXISTS ( SELECT 1 FROM EINVOICE AA WHERE AA.MODULETNO = A.TNO)',
'      AND NVL(:P182_PENDINGFOREINVOICE ,''NO'') = ''YES''',
'      AND :P182_MODULECODE=''CREDITNOTE''',
'      and A.creditnoteDATE between :P182_FROMDATE and :P182_TODATE',
'      and ( :P182_LOCATIONCODE IS NULL OR instr('':''||:P182_LOCATIONCODE||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
' UNION ALL',
' select  TO_NUMBER(:P182_TNO) AS TNO,',
'       A.TNO AS MODULETNO,',
'       ''DEBITNOTE'' AS MODULECODE,',
'       null as REMARK,',
'       :GLOBAL_LOGINNAME AS CREATOR,',
'       SYSDATE AS CREATIONTIME,',
'       NULL AS ACKNO,',
'       NULL AS ACKDATE,',
'       NULL AS IRN,',
'       NULL AS BUYERGSTIN,',
'       A.debitnoteNO AS INVOICENO,',
'       A.debitnoteDATE AS INVOICEDATE,',
'       NULL AS EWBNO,',
'       NULL AS SIGNEDQRCODE,',
'       NULL AS EWBDATE,',
'       NULL AS VALIDTILLDATE,',
'       A.TNO AS CCINVOICETNO,',
'       NULL AS ERROR,',
'       NULL AS CANCELPORTALRESPONSE,',
'       NULL AS CANCELDATE,',
'       NULL AS CANCELERROR,',
'       NULL AS CANCELREASONCODE,',
'       NULL AS CANCELREMARK,',
'       NULL AS EWAYBILLPORTALRESPONSE,',
'       NULL AS EWAYBILLERROR,',
'       NULL AS PORTALRESPONSE,',
'       NULL AS ISDELETED,',
'       NULL AS DELETIONTIME,',
'       NULL AS DELETEDBY,',
'       NULL AS SELLERGSTIN,',
'       A.LOCATIONCODE,',
'       B.PARTYNAME,',
'       a.debitnoteamount as amount,',
'       ''Check'' as check1,',
'       ''Req IRN'' as ReqIRN,',
'       ''Get IRN'' as GetIRN,',
'       ''Cancel'' as Cancel',
'    FROM debitnote A, PARTY B',
'    WHERE A.PARTYCODE = B.PARTYCODE',
'      AND NOT EXISTS ( SELECT 1 FROM EINVOICE AA WHERE AA.MODULETNO = A.TNO)',
'      AND :P182_MODULECODE=''DEBITNOTE''',
'      AND NVL(:P182_PENDINGFOREINVOICE ,''NO'') = ''YES''',
'      and A.debitnoteDATE between :P182_FROMDATE and :P182_TODATE',
'      and ( :P182_LOCATIONCODE IS NULL OR instr('':''||:P182_LOCATIONCODE||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
' UNION ALL',
'select A.TNO,',
'       A.MODULETNO,',
'       A.MODULECODE,',
'       A.REMARK,',
'       A.CREATOR,',
'       A.CREATIONTIME,',
'       A.ACKNO,',
'       A.ACKDATE,',
'       A.IRN,',
'       A.BUYERGSTIN,',
'       A.INVOICENO,',
'       A.INVOICEDATE,',
'       A.EWBNO,',
'       A.SIGNEDQRCODE,',
'       A.EWBDATE,',
'       A.VALIDTILLDATE,',
'       A.CCINVOICETNO,',
'       A.ERROR,',
'       A.CANCELPORTALRESPONSE,',
'       A.CANCELDATE,',
'       A.CANCELERROR,',
'       A.CANCELREASONCODE,',
'       A.CANCELREMARK,',
'       A.EWAYBILLPORTALRESPONSE,',
'       A.EWAYBILLERROR,',
'       A.PORTALRESPONSE,',
'       A.ISDELETED,',
'       A.DELETIONTIME,',
'       A.DELETEDBY,',
'       A.SELLERGSTIN,',
'       A.LOCATIONCODE,',
'       GETPARTYNAME(B.PARTYCODE) AS PARTYNAME,',
'       null as amount,',
'       ''Check'' as check1,',
'       ''Req IRN'' as ReqIRN,',
'       ''Get IRN'' as GetIRN,',
'       ''Cancel'' as Cancel',
'  from EINVOICE A, CCINVOICE B , creditnote c , debitnote d',
'  where A.MODULETNO = B.TNO(+)',
'  and  A.MODULETNO = c.TNO(+)',
'  and  A.MODULETNO = d.TNO(+)',
'   -- AND A.tno = :P182_TNO',
'  AND NVL(:P182_PENDINGFOREINVOICE ,''NO'') = ''NO''',
'   and ( :P182_LOCATIONCODE IS NULL OR instr('':''||:P182_LOCATIONCODE||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'  AND a.modulecode = :P182_MODULECODE',
'  AND A.INVOICEDATE BETWEEN :P182_FROMDATE AND :P182_TODATE',
'  */',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P182_TNO,P182_MODULECODE,P182_LOCATIONCODE,P182_FROMDATE,P182_TODATE,P182_PENDINGFOREINVOICE,P182_WITHEWAYBILL,P182_MANUALUPDATE,P182_INVOICENO'
,p_prn_page_header=>'E-Invoice'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679817084484091825)
,p_name=>'ACKDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACKDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ack Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679816025094091825)
,p_name=>'ACKNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACKNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ack No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>64
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679282484263116306)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679282583047116307)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691182796708299)
,p_name=>'BTN_OPACITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_OPACITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1050
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660891831736002)
,p_name=>'BUYERDTLS_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls Addr1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>690
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661024935736003)
,p_name=>'BUYERDTLS_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls Addr2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>700
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661630617736009)
,p_name=>'BUYERDTLS_EM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_EM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Buyerdtls Em'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>760
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660490979735998)
,p_name=>'BUYERDTLS_GSTIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_GSTIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls Gstin'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>650
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660609714735999)
,p_name=>'BUYERDTLS_LGLNM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_LGLNM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Buyerdtls Lglnm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>660
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661151486736004)
,p_name=>'BUYERDTLS_LOC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_LOC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls Loc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>710
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661569104736008)
,p_name=>'BUYERDTLS_PH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_PH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Buyerdtls Ph'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>750
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661228760736005)
,p_name=>'BUYERDTLS_PIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_PIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls Pin'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>720
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660803102736001)
,p_name=>'BUYERDTLS_POS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_POS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls Pos'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>680
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661324910736006)
,p_name=>'BUYERDTLS_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls State'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>730
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661462448736007)
,p_name=>'BUYERDTLS_STCD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_STCD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Buyerdtls Stcd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>740
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660768758736000)
,p_name=>'BUYERDTLS_TRDNM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERDTLS_TRDNM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Buyerdtls Trdnm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>670
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691761420708305)
,p_name=>'BUYERGSTIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUYERGSTIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1090
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679859407367154879)
,p_name=>'CANCEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Cancel'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_ACTION,P23_INVOICEDATE,P23_INVOICENO,P23_LOCATIONCODE,P23_MODULECODE,P23_MODULETNO,P23_TNO,P23_WITHEWAYBILL:CANCEL,&INVOICEDATE.,&INVOICENO.,&LOCATIONCODE.,&MODULECODE.,&MODULETNO.,&P182_TNO.,&WITHEWAYBILL.'
,p_link_text=>'&CANCEL.'
,p_link_attributes=>' class="t-Button t-Button--simple t-Button--hot t-Button--stretch" style="pointer-events:&IS_MANUAL_UPDATE.; opacity:&BTN_OPACITY.;"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">Cancel</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679829100440091831)
,p_name=>'CANCELDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Cancel Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679830093257091832)
,p_name=>'CANCELERROR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELERROR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cancel Error'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691862075708306)
,p_name=>'CANCELPORTALRESPONSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELPORTALRESPONSE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679831082359091832)
,p_name=>'CANCELREASONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELREASONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cancel Reason'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679832090024091832)
,p_name=>'CANCELREMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELREMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cancel Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679826060218091830)
,p_name=>'CCINVOICETNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CCINVOICETNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ccinvoicetno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679859030679154876)
,p_name=>'CHECK1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHECK1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Check'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_ACTION,P23_INVOICEDATE,P23_INVOICENO,P23_LOCATIONCODE,P23_MODULECODE,P23_MODULETNO,P23_TNO:CHECK,&INVOICEDATE.,&INVOICENO.,&LOCATIONCODE.,&MODULECODE.,&MODULETNO.,&P182_TNO.'
,p_link_text=>'&CHECK1.'
,p_link_attributes=>' class="t-Button t-Button--simple t-Button--hot t-Button--stretch" style="pointer-events:&IS_MANUAL_UPDATE.; opacity:&BTN_OPACITY.;"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">Check</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(280997090265948323)
,p_name=>'COMPANYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPANYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Companycode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691637239708304)
,p_name=>'CREATIONTIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATIONTIME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1080
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691612326708303)
,p_name=>'CREATOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1070
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43692483168708312)
,p_name=>'DELETEDBY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETEDBY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43692411041708311)
,p_name=>'DELETIONTIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETIONTIME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659242218735985)
,p_name=>'DOCDTLS_DT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCDTLS_DT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Docdtls Dt'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>520
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659122291735984)
,p_name=>'DOCDTLS_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCDTLS_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Docdtls No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>510
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659359431735986)
,p_name=>'DOCDTLS_ORGINVNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCDTLS_ORGINVNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Docdtls Orginvno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>530
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659064211735983)
,p_name=>'DOCDTLS_TYP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCDTLS_TYP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Docdtls Typ'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>500
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679827054034091830)
,p_name=>'ERROR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ERROR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Error'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43692072940708308)
,p_name=>'EWAYBILLERROR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWAYBILLERROR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691964171708307)
,p_name=>'EWAYBILLPORTALRESPONSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWAYBILLPORTALRESPONSE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679824019703091829)
,p_name=>'EWBDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'EWB Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663855439735981)
,p_name=>'EWBDTLS_DISTANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_DISTANCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ewbdtls Distance'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>980
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290664009683735983)
,p_name=>'EWBDTLS_TRANSDOCDT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_TRANSDOCDT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ewbdtls Transdocdt'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>1000
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663926657735982)
,p_name=>'EWBDTLS_TRANSDOCNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_TRANSDOCNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ewbdtls Transdocno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>990
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663507616736028)
,p_name=>'EWBDTLS_TRANSID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_TRANSID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ewbdtls Transid'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>950
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663726970735980)
,p_name=>'EWBDTLS_TRANSMODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_TRANSMODE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ewbdtls Transmode'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>970
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663635107736029)
,p_name=>'EWBDTLS_TRANSNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_TRANSNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ewbdtls Transname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>960
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290664174803735984)
,p_name=>'EWBDTLS_VEHICLENO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_VEHICLENO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ewbdtls Vehicleno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>1010
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290664191009735985)
,p_name=>'EWBDTLS_VEHICLETYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBDTLS_VEHICLETYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ewbdtls Vehicletype'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>1020
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679822056710091827)
,p_name=>'EWBNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EWBNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'EWB No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679859308385154878)
,p_name=>'GETIRN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GETIRN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Getirn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_ACTION,P23_INVOICEDATE,P23_INVOICENO,P23_LOCATIONCODE,P23_MODULECODE,P23_MODULETNO,P23_TNO:GETIRN,&INVOICEDATE.,&INVOICENO.,&LOCATIONCODE.,&MODULECODE.,&MODULETNO.,&P182_TNO.'
,p_link_text=>'&GETIRN.'
,p_link_attributes=>' class="t-Button t-Button--simple t-Button--hot t-Button--stretch" style="pointer-events:&IS_MANUAL_UPDATE.; opacity:&BTN_OPACITY.;"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">Get IRN</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(280997315388948325)
,p_name=>'INVOICEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Invoiceamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>420
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679821041527091827)
,p_name=>'INVOICEDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICEDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679820034084091826)
,p_name=>'INVOICENO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICENO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Invoice/DBN/CRN No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679818060763091826)
,p_name=>'IRN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IRN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'IRN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>64
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43692299148708310)
,p_name=>'ISDELETED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISDELETED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691071370708298)
,p_name=>'IS_MANUAL_UPDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_MANUAL_UPDATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1040
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679840019505091835)
,p_name=>'LOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Locationcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>330
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679812058852091822)
,p_name=>'MODULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Modulecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679811093534091822)
,p_name=>'MODULETNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULETNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Moduletno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(280997259108948324)
,p_name=>'PARTYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Partycode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(678306910877702795)
,p_name=>'PARTYNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>340
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43692130728708309)
,p_name=>'PORTALRESPONSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PORTALRESPONSE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43691478000708302)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1060
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679859198536154877)
,p_name=>'REQIRN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQIRN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Req.IRN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_TNO,P23_ACTION,P23_INVOICEDATE,P23_INVOICENO,P23_LOCATIONCODE,P23_MODULECODE,P23_MODULETNO,P23_WITHEWAYBILL:&P182_TNO.,REQUESTIRN,&INVOICEDATE.,&INVOICENO.,&LOCATIONCODE.,&MODULECODE.,&MODULETNO.,&WITHEWAYBIL'
||'L.'
,p_link_text=>'&REQIRN.'
,p_link_attributes=>' class="t-Button t-Button--simple t-Button--hot t-Button--stretch" style="pointer-events:&IS_MANUAL_UPDATE.; opacity:&BTN_OPACITY.;"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'<span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">Req.IRN</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659691846735990)
,p_name=>'SELLERDTLS_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Addr1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>570
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659868107735991)
,p_name=>'SELLERDTLS_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Addr2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>580
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660481867735997)
,p_name=>'SELLERDTLS_EM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_EM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Em'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>640
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659463940735987)
,p_name=>'SELLERDTLS_GSTIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_GSTIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Gstin'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>540
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659632252735989)
,p_name=>'SELLERDTLS_LGLNM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_LGLNM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sellerdtls Lglnm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>560
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659958876735992)
,p_name=>'SELLERDTLS_LOC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_LOC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Loc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>590
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660364826735996)
,p_name=>'SELLERDTLS_PH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_PH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Ph'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>630
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660061564735993)
,p_name=>'SELLERDTLS_PIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_PIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Pin'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>600
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660128725735994)
,p_name=>'SELLERDTLS_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls State'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>610
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290660254720735995)
,p_name=>'SELLERDTLS_STCD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_STCD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sellerdtls Stcd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>620
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290659569246735988)
,p_name=>'SELLERDTLS_TRDNM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERDTLS_TRDNM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sellerdtls Trdnm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>550
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(43692592303708313)
,p_name=>'SELLERGSTIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELLERGSTIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>1170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662049107736013)
,p_name=>'SHIPDTLS_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Shipdtls Addr1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>800
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662152600736014)
,p_name=>'SHIPDTLS_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Shipdtls Addr2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>810
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661735284736010)
,p_name=>'SHIPDTLS_GSTIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_GSTIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Shipdtls Gstin'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>770
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661866874736011)
,p_name=>'SHIPDTLS_LGLNM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_LGLNM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Shipdtls Lglnm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>780
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662266889736015)
,p_name=>'SHIPDTLS_LOC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_LOC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Shipdtls Loc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>820
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662374451736016)
,p_name=>'SHIPDTLS_PIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_PIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Shipdtls Pin'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>830
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662435430736017)
,p_name=>'SHIPDTLS_STCD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_STCD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Shipdtls Stcd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>840
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290661931269736012)
,p_name=>'SHIPDTLS_TRDNM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHIPDTLS_TRDNM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Shipdtls Trdnm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>790
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679823020192091827)
,p_name=>'SIGNEDQRCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SIGNEDQRCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Signed QR Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679810038467091813)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(280997402006948326)
,p_name=>'TRANDTLS_CATG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANDTLS_CATG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Trandtls Catg'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290658821328735981)
,p_name=>'TRANDTLS_ECMGSTIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANDTLS_ECMGSTIN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Trandtls Ecmgstin'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>480
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290658763269735980)
,p_name=>'TRANDTLS_ECMTRN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANDTLS_ECMTRN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Trandtls Ecmtrn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>470
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290658888165735982)
,p_name=>'TRANDTLS_IGSTONINTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANDTLS_IGSTONINTRA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Trandtls Igstonintra'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>490
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(280997613754948328)
,p_name=>'TRANDTLS_REGREV'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANDTLS_REGREV'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Trandtls Regrev'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>2
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(280997502537948327)
,p_name=>'TRANDTLS_SUPTYP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANDTLS_SUPTYP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Trandtls Suptyp'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(280997701493948329)
,p_name=>'TRANDTLS_TYP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANDTLS_TYP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Trandtls Typ'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662516511736018)
,p_name=>'VALDTLS_ASSVAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_ASSVAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Assval'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>850
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662923350736022)
,p_name=>'VALDTLS_CESVAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_CESVAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Cesval'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>890
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662781762736020)
,p_name=>'VALDTLS_CGSTVAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_CGSTVAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Cgstval'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>870
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663130142736024)
,p_name=>'VALDTLS_DISCOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_DISCOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Discount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>910
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662869471736021)
,p_name=>'VALDTLS_IGSTVAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_IGSTVAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Igstval'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>880
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663228545736025)
,p_name=>'VALDTLS_OTHCHRG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_OTHCHRG'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Othchrg'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>920
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663355617736026)
,p_name=>'VALDTLS_RNDOFFAMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_RNDOFFAMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Rndoffamt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>930
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290662671945736019)
,p_name=>'VALDTLS_SGSTVAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_SGSTVAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Sgstval'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>860
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663038108736023)
,p_name=>'VALDTLS_STCESVAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_STCESVAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Stcesval'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>900
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290663442466736027)
,p_name=>'VALDTLS_TOTINVVAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALDTLS_TOTINVVAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valdtls Totinvval'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>940
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(679825027953091829)
,p_name=>'VALIDTILLDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALIDTILLDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Valid Till Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(40485830111152202)
,p_name=>'WITHEWAYBILL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WITHEWAYBILL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Withewaybill'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>1030
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>2000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(679809244768091808)
,p_internal_uid=>669883722451565242
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(679809692670091808)
,p_interactive_grid_id=>wwv_flow_imp.id(679809244768091808)
,p_static_id=>'1723246'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(679809891040091812)
,p_report_id=>wwv_flow_imp.id(679809692670091808)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(42948921958670228)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>89
,p_column_id=>wwv_flow_imp.id(40485830111152202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44222468937861031)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>90
,p_column_id=>wwv_flow_imp.id(43691071370708298)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44230426054954775)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>91
,p_column_id=>wwv_flow_imp.id(43691182796708299)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44247813683130432)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>92
,p_column_id=>wwv_flow_imp.id(43691478000708302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44248773278130433)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>93
,p_column_id=>wwv_flow_imp.id(43691612326708303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44249777063130435)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>94
,p_column_id=>wwv_flow_imp.id(43691637239708304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44250807154130436)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>95
,p_column_id=>wwv_flow_imp.id(43691761420708305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44251807493130437)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>96
,p_column_id=>wwv_flow_imp.id(43691862075708306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44252781288130439)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>97
,p_column_id=>wwv_flow_imp.id(43691964171708307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44253737642130440)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>98
,p_column_id=>wwv_flow_imp.id(43692072940708308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44254792787130442)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>99
,p_column_id=>wwv_flow_imp.id(43692130728708309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44255810707130443)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>100
,p_column_id=>wwv_flow_imp.id(43692299148708310)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44256794347130444)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>101
,p_column_id=>wwv_flow_imp.id(43692411041708311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44257817006130446)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>102
,p_column_id=>wwv_flow_imp.id(43692483168708312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44258783136130447)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>103
,p_column_id=>wwv_flow_imp.id(43692592303708313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290669632177736549)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(280997090265948323)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290670561739736562)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(280997259108948324)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290671464824736570)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(280997315388948325)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290672350599736577)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(280997402006948326)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290673218642736583)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(280997502537948327)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290674131430736590)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(280997613754948328)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290674992451736597)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(280997701493948329)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290675978814736603)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(290658763269735980)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290676826939736610)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(290658821328735981)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290677701861736617)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(290658888165735982)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290678671370736623)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(290659064211735983)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290679524778736630)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(290659122291735984)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290680400237736637)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(290659242218735985)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290681275349736643)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(290659359431735986)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290682149864736650)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(290659463940735987)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290683081112736657)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(290659569246735988)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290683953206736664)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(290659632252735989)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290684861636736671)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(290659691846735990)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290685696840736677)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(290659868107735991)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290686639442736684)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(290659958876735992)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290687551723736691)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(290660061564735993)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290688399874736698)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(290660128725735994)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290689378484736705)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(290660254720735995)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290690196602736711)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(290660364826735996)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290691137646736718)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(290660481867735997)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290692062559736725)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(290660490979735998)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290692929255736732)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(290660609714735999)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290693750865736738)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(290660768758736000)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290694657888736745)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(290660803102736001)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290695523015736752)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(290660891831736002)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290696411716736759)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(290661024935736003)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290697317897736765)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(290661151486736004)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290698258175736772)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>58
,p_column_id=>wwv_flow_imp.id(290661228760736005)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290699087037736779)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(290661324910736006)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290699985910736786)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>60
,p_column_id=>wwv_flow_imp.id(290661462448736007)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290700893153736792)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>61
,p_column_id=>wwv_flow_imp.id(290661569104736008)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290701787609736799)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>62
,p_column_id=>wwv_flow_imp.id(290661630617736009)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290702724704736806)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>63
,p_column_id=>wwv_flow_imp.id(290661735284736010)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290703612487736812)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>64
,p_column_id=>wwv_flow_imp.id(290661866874736011)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290704488994736819)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>65
,p_column_id=>wwv_flow_imp.id(290661931269736012)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290705455963736826)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>66
,p_column_id=>wwv_flow_imp.id(290662049107736013)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290706355349736833)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>67
,p_column_id=>wwv_flow_imp.id(290662152600736014)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290707104752736839)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>68
,p_column_id=>wwv_flow_imp.id(290662266889736015)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290707995466736846)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>69
,p_column_id=>wwv_flow_imp.id(290662374451736016)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290708982865736853)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>70
,p_column_id=>wwv_flow_imp.id(290662435430736017)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290709879496736860)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>71
,p_column_id=>wwv_flow_imp.id(290662516511736018)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290710729331736866)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>72
,p_column_id=>wwv_flow_imp.id(290662671945736019)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290711592900736873)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>73
,p_column_id=>wwv_flow_imp.id(290662781762736020)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290712579777736880)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>74
,p_column_id=>wwv_flow_imp.id(290662869471736021)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290713441252736886)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>75
,p_column_id=>wwv_flow_imp.id(290662923350736022)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290714301949736893)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>76
,p_column_id=>wwv_flow_imp.id(290663038108736023)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290715254589736900)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>77
,p_column_id=>wwv_flow_imp.id(290663130142736024)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290716096157736907)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>78
,p_column_id=>wwv_flow_imp.id(290663228545736025)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290717060585736913)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>79
,p_column_id=>wwv_flow_imp.id(290663355617736026)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290717975667736920)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>80
,p_column_id=>wwv_flow_imp.id(290663442466736027)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290718787187736927)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>81
,p_column_id=>wwv_flow_imp.id(290663507616736028)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290719747827736933)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>82
,p_column_id=>wwv_flow_imp.id(290663635107736029)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290720489159736940)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>83
,p_column_id=>wwv_flow_imp.id(290663726970735980)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290721421212736947)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>84
,p_column_id=>wwv_flow_imp.id(290663855439735981)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290722341787736953)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>85
,p_column_id=>wwv_flow_imp.id(290663926657735982)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290723229626736960)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>86
,p_column_id=>wwv_flow_imp.id(290664009683735983)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290724155717736967)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>87
,p_column_id=>wwv_flow_imp.id(290664174803735984)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290725070015736973)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>88
,p_column_id=>wwv_flow_imp.id(290664191009735985)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679810423331091821)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(679810038467091813)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679811507773091822)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(679811093534091822)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679812441017091822)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(679812058852091822)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679816418584091825)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(679816025094091825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679817431751091825)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(679817084484091825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679818419321091826)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(679818060763091826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679820426147091826)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(679820034084091826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>185
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679821481412091827)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(679821041527091827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679822416308091827)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(679822056710091827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679823420345091829)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(679823020192091827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679824426800091829)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(679824019703091829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679825444635091830)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(679825027953091829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679826496693091830)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(679826060218091830)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679827486798091830)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(679827054034091830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679829481200091831)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(679829100440091831)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679830458629091832)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(679830093257091832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679831467672091832)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(679831082359091832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679832469972091832)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(679832090024091832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679840443257091835)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(679840019505091835)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(679843137181140121)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(679282484263116306)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(680162782025431845)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(678306910877702795)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>413
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(680285782736749129)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(679859030679154876)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(680286634828749137)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(679859198536154877)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(680287517031749142)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(679859308385154878)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(680288423847749147)
,p_view_id=>wwv_flow_imp.id(679809891040091812)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(679859407367154879)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(679282732385116309)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31172262589468086)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31174698115468088)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31175912460468088)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31175108976468088)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31173107331468087)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31173429689468087)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31213668327468124)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_button_name=>'getrecord'
,p_static_id=>'getrecord'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>4
,p_grid_column=>5
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31172670929468087)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31174289402468087)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31175468852468088)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31173837912468087)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(974759478159270857)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P202_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(31240065866468134)
,p_branch_action=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:134::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1428578261433581028)
,p_name=>'P182_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1369959916217312636)
,p_name=>'P182_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_item_default=>'134'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1369959829738312635)
,p_name=>'P182_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679904163246154922)
,p_name=>'P182_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_item_default=>'select sysdate-7 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(43691326857708301)
,p_name=>'P182_INVOICENO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_prompt=>'Invoice No'
,p_placeholder=>'-- Enter the Invoice No --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select DISTINCT',
'     INVOICENO,',
'     MODULETNO',
'FROM INVOICEFOREI0101REVISED a',
'WHERE MODULECODE = :P182_MODULECODE'))
,p_lov_cascade_parent_items=>'P182_MODULECODE'
,p_ajax_items_to_submit=>'P182_INVOICENO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679904388796154924)
,p_name=>'P182_INVOICETNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679329441823116371)
,p_name=>'P182_LOCATIONCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LOCATIONCODE ',
'FROM (SELECT DISTINCT LOCATIONCODE FROM INVOICEFOREI0101REVISED)',
'WHERE ROWNUM = 1;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOCATION'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679904546486154926)
,p_name=>'P182_MANUALUPDATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_prompt=>'Manual Update'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679329378543116370)
,p_name=>'P182_MODULECODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_item_default=>'INVOICE'
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select modulename , modulecode from module',
'where modulecode in (''CREDITNOTE'',''DEBITNOTE'',''INVOICE'',''SERVICEBILL'')'))
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1369956112421312598)
,p_name=>'P182_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1369364333317041332)
,p_name=>'P182_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1344012851181687796)
,p_name=>'P182_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679904473113154925)
,p_name=>'P182_PENDINGFOREINVOICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_prompt=>'Pending For E-Invoice'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(833942621583760567)
,p_name=>'P182_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P182_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1344012687536687795)
,p_name=>'P182_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679904153699154936)
,p_name=>'P182_TNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1342139644015338982)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(679904291154154923)
,p_name=>'P182_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(679904705768154927)
,p_name=>'P182_WITHEWAYBILL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(679282732385116309)
,p_item_default=>'YES'
,p_prompt=>'With E-Way Bill'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31226421303468130)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(31174698115468088)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31226888541468130)
,p_event_id=>wwv_flow_imp.id(31226421303468130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PURCHASEORDERDETAIL a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31230073546468131)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31231117312468131)
,p_event_id=>wwv_flow_imp.id(31230073546468131)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31231539194468131)
,p_event_id=>wwv_flow_imp.id(31230073546468131)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P182_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31232092972468132)
,p_event_id=>wwv_flow_imp.id(31230073546468131)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P182_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31230561943468131)
,p_event_id=>wwv_flow_imp.id(31230073546468131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31236230337468133)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31237302645468133)
,p_event_id=>wwv_flow_imp.id(31236230337468133)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31236754551468133)
,p_event_id=>wwv_flow_imp.id(31236230337468133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31232488979468132)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31233009647468132)
,p_event_id=>wwv_flow_imp.id(31232488979468132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''NO''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31233960986468132)
,p_event_id=>wwv_flow_imp.id(31232488979468132)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P182_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31234468588468132)
,p_event_id=>wwv_flow_imp.id(31232488979468132)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P182_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31233487604468132)
,p_event_id=>wwv_flow_imp.id(31232488979468132)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''YES''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31234900190468132)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31235839171468133)
,p_event_id=>wwv_flow_imp.id(31234900190468132)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31235360414468132)
,p_event_id=>wwv_flow_imp.id(31234900190468132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31222519576468129)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(31173837912468087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31226009977468130)
,p_event_id=>wwv_flow_imp.id(31222519576468129)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P182_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31225519438468130)
,p_event_id=>wwv_flow_imp.id(31222519576468129)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P182_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31223507959468129)
,p_event_id=>wwv_flow_imp.id(31222519576468129)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P182_TNO,P182_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P182_TNO,:P182_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31224001824468129)
,p_event_id=>wwv_flow_imp.id(31222519576468129)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P182_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31224512665468129)
,p_event_id=>wwv_flow_imp.id(31222519576468129)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31224977466468130)
,p_event_id=>wwv_flow_imp.id(31222519576468129)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31223005632468129)
,p_event_id=>wwv_flow_imp.id(31222519576468129)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P182_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31228207502468130)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31228680502468131)
,p_event_id=>wwv_flow_imp.id(31228207502468130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P182_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31229162787468131)
,p_event_id=>wwv_flow_imp.id(31228207502468130)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P182_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31229685380468131)
,p_event_id=>wwv_flow_imp.id(31228207502468130)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P182_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31220539552468128)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(31173107331468087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31221550183468129)
,p_event_id=>wwv_flow_imp.id(31220539552468128)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P182_TNO,P182_COMPANYCODE,P182_PURCHASEORDERNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '		cursor cPassFail is',
    '				select',
    '						a.TNo,',
    '						a.TokenNo										',
    '				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '				where a.ModuleFlowTNo = b.TNo',
    '						and b.TNo = c.TNo',
    '						and a.BossUserCode = c.BossUserCode',
    '						and c.BossUserCode = d.BossUserCode',
    '						and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '						and d.LoginName = User',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100) := :P60_TNO;',
    'begin',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = '':P''||to_char(:APP_PAGE_ID)||''_PASSFAILREMARK''',
    '				where a.TNo = vPassFail.TNo;',
    '				',
    '				SendBackPassFail(tTokenNo , TMP );',
    '		    		',
    '				',
    '				commit;',
    '		else',
    '				close cPassFail;',
    '		end if;',
    '',
    '	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31222035410468129)
,p_event_id=>wwv_flow_imp.id(31220539552468128)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31221084455468129)
,p_event_id=>wwv_flow_imp.id(31220539552468128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P182_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31227292562468130)
,p_name=>'Go Back To Called Form'
,p_static_id=>'go-back-to-called-form'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(31174698115468088)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31227743684468130)
,p_event_id=>wwv_flow_imp.id(31227292562468130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P182_CALLEDFROMPAGE'').getValue();',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31237622651468133)
,p_name=>'Insert into einvoice'
,p_static_id=>'insert-into-einvoice'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(31213668327468124)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31238204585468133)
,p_event_id=>wwv_flow_imp.id(31237622651468133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P182_MODULECODE,P182_TNO,P182_FROMDATE,P182_TODATE,P182_LOCATIONCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P182_MODULECODE = ''DEBITNOTE'' then',
    '        insert into einvoice(',
    '            tno , ',
    '            moduletno,',
    '            modulecode,',
    '            invoiceno,',
    '            invoicedate',
    '        )',
    '        (',
    '            select',
    '                :P182_TNO,',
    '                tno,',
    '                ''DEBITNOTE'',',
    '                debitnoteno,',
    '                debitnotedate',
    '            from debitnote',
    '            where debitnotedate between :P182_FROMDATE and :P182_TODATE',
    '            and locationcode = :P182_LOCATIONCODE',
    '        );',
    '',
    '    end if;',
    '',
    '',
    '    if :P182_MODULECODE = ''CREDITNOTE'' then',
    '        insert into einvoice(',
    '            tno , ',
    '            moduletno,',
    '            modulecode,',
    '            invoiceno,',
    '            invoicedate',
    '        )',
    '        (',
    '            select',
    '                :P182_TNO,',
    '                tno,',
    '                ''CREDITNOTE'',',
    '                CREDITNOTEno,',
    '                CREDITNOTEdate',
    '            from CREDITNOTE',
    '            where CREDITNOTEdate between :P182_FROMDATE and :P182_TODATE',
    '            and locationcode = :P182_LOCATIONCODE',
    '        );',
    '',
    '    end if;',
    '',
    '    if :P182_MODULECODE = ''CCINVOICE'' then',
    '        insert into einvoice(',
    '            tno , ',
    '            moduletno,',
    '            modulecode,',
    '            invoiceno,',
    '            invoicedate',
    '        )',
    '        (',
    '            select',
    '                :P182_TNO,',
    '                tno,',
    '                ''CCINVOICE'',',
    '                CCINVOICEno,',
    '                CCINVOICEdate',
    '            from CCINVOICE',
    '            where CCINVOICEdate between :P182_FROMDATE and :P182_TODATE',
    '            and locationcode = :P182_LOCATIONCODE',
    '        );',
    '',
    '    end if;',
    '',
    '    /*if :P182_MODULECODE = ''SERVICEBILL'' then',
    '        insert into einvoice(',
    '            tno , ',
    '            moduletno,',
    '            modulecode,',
    '            invoiceno,',
    '            invoicedate',
    '        )',
    '        (',
    '            select',
    '                :P182_TNO,',
    '                tno,',
    '                ''SERVICEBILL'',',
    '                SERVICEBILLno,',
    '                SERVICEBILLdate',
    '            from SERVICEBILL',
    '            where SERVICEBILLdate between :P182_FROMDATE and :P182_TODATE',
    '            and locationcode = :P182_LOCATIONCODE',
    '        );',
    '',
    '    end if;',
    '    */',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31238624220468134)
,p_event_id=>wwv_flow_imp.id(31237622651468133)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(679808771529091808)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31218668863468128)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(31172670929468087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31219698068468128)
,p_event_id=>wwv_flow_imp.id(31218668863468128)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P182_TNO,P182_COMPANYCODE,P182_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) ;--:= :P80_PICKUPREQUESTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = '':P''||:APP_PAGE_ID||''_TNo''',
    '				and d.LoginName = User',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = '':P''||:APP_PAGE_ID||''_PASSFAILREMARK''',
    '			where a.TNo = vPassFail.TNo;',
    '			',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, '':P''||:APP_PAGE_ID||''_TNo'' , TMP, :global_CompanyCode );',
    '',
    '             if :P182_STATUS = ''ACTIVE'' then',
    '        ',
    '                CREATEPAYMENTADVICEFORPO(:P182_TNO);',
    '',
    '              end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31220191766468128)
,p_event_id=>wwv_flow_imp.id(31218668863468128)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31219161010468128)
,p_event_id=>wwv_flow_imp.id(31218668863468128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P182_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(31239102647468134)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(31213668327468124)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(31239605090468134)
,p_event_id=>wwv_flow_imp.id(31239102647468134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(679808771529091808)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(31213033500468122)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(679808771529091808)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'E-Invoice - Save Interactive Grid Data'
,p_static_id=>'e-invoice-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into einvoice (                 ',
'                    TNO,',
'                    MODULETNO,',
'                    MODULECODE,',
'                    REMARK,',
'                    CREATOR,',
'                    CREATIONTIME,',
'                    ACKNO,',
'                    ACKDATE,',
'                    IRN,',
'                    BUYERGSTIN,',
'                    INVOICENO,',
'                    INVOICEDATE,',
'                    EWBNO,',
'                    SIGNEDQRCODE,',
'                    EWBDATE,',
'                    VALIDTILLDATE,',
'                    CCINVOICETNO,',
'                    ERROR,',
'                    CANCELPORTALRESPONSE,',
'                    CANCELDATE,',
'                    CANCELERROR,',
'                    CANCELREASONCODE,',
'                    CANCELREMARK,',
'                    EWAYBILLPORTALRESPONSE,',
'                    EWAYBILLERROR,',
'                    PORTALRESPONSE,',
'                    ISDELETED,',
'                    DELETIONTIME,',
'                    DELETEDBY,',
'                    SELLERGSTIN,',
'                    LOCATIONCODE',
'',
'            )',
'            Values (',
'                :TNO,',
'                :MODULETNO,',
'                :MODULECODE,',
'                :REMARK,',
'                :CREATOR,',
'                :CREATIONTIME,',
'                :ACKNO,',
'                :ACKDATE,',
'                :IRN,',
'                :BUYERGSTIN,',
'                :INVOICENO,',
'                :INVOICEDATE,',
'                :EWBNO,',
'                :SIGNEDQRCODE,',
'                :EWBDATE,',
'                :VALIDTILLDATE,',
'                :CCINVOICETNO,',
'                :ERROR,',
'                :CANCELPORTALRESPONSE,',
'                :CANCELDATE,',
'                :CANCELERROR,',
'                :CANCELREASONCODE,',
'                :CANCELREMARK,',
'                :EWAYBILLPORTALRESPONSE,',
'                :EWAYBILLERROR,',
'                :PORTALRESPONSE,',
'                :ISDELETED,',
'                :DELETIONTIME,',
'                :DELETEDBY,',
'                :SELLERGSTIN,',
'                :LOCATIONCODE',
'',
'            );',
'        ',
'        when ''U'' then',
'            update einvoice Set',
'                    MODULETNO       =:MODULETNO,',
'                    MODULECODE      =:MODULECODE,',
'                    REMARK          =:REMARK,',
'                    CREATOR         =:CREATOR,',
'                    CREATIONTIME    =:CREATIONTIME,',
'                    ACKNO           =:ACKNO,',
'                    ACKDATE         =:ACKDATE,',
'                    IRN             =:IRN,',
'                    BUYERGSTIN      =:BUYERGSTIN,',
'                    INVOICENO       =:INVOICENO,',
'                    INVOICEDATE     =:INVOICEDATE,',
'                    EWBNO           =:EWBNO,',
'                    SIGNEDQRCODE    =:SIGNEDQRCODE,',
'                    EWBDATE         =:EWBDATE,',
'                    VALIDTILLDATE   =:VALIDTILLDATE,',
'                    CCINVOICETNO    =:CCINVOICETNO,',
'                    ERROR           =:ERROR,',
'                    CANCELPORTALRESPONSE=:CANCELPORTALRESPONSE,',
'                    CANCELDATE      =:CANCELDATE,',
'                    CANCELERROR     =:CANCELERROR,',
'                    CANCELREASONCODE=:CANCELREASONCODE,',
'                    CANCELREMARK    =:CANCELREMARK,',
'                    EWAYBILLPORTALRESPONSE=:EWAYBILLPORTALRESPONSE,',
'                    EWAYBILLERROR   =:EWAYBILLERROR,',
'                    PORTALRESPONSE  =:PORTALRESPONSE,',
'                    ISDELETED       =:ISDELETED,',
'                    DELETIONTIME    =:DELETIONTIME,',
'                    DELETEDBY       =:DELETEDBY,',
'                    SELLERGSTIN     =:SELLERGSTIN,',
'                    LOCATIONCODE    =:LOCATIONCODE',
'',
'            WHERE TNO = :TNO',
'              AND MODULETNO = :MODULETNO;',
'',
'        when ''D'' then',
'            Delete From einvoice',
'            Where TNo = :TNO;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(566229566348256666)
,p_internal_uid=>21287511183941556
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(31217457759468127)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P182_Tno is null then',
'        Select GlobalTno.NextVal into :P182_Tno From Dual;',
'     end if;',
'    ----',
'    if :P182_PURCHASEORDERNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P182_LocationCode,',
'					:P182_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P182_PURCHASEORDERDATE, ''DD-MM-RRRR'')',
'				);',
'        :P182_PURCHASEORDERNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P182_LocationCode,',
'                    :P182_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P182_PURCHASEORDERDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>21291935442941561
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(31216672162468127)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P182_TNO is null then',
'    :P182_TNO := GlobalTNo.nextval;',
'    :P182_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P182_FORMSTATUS := ''EDITRECORD'';',
'End if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>21291149845941561
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(31217093779468127)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetOnTheTable'
,p_static_id=>'getonthetable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P182_MODULEFLOW := ''YES'';',
'   else',
'       :P182_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P182_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P182_ONTHETABLE := ''YES'' ;',
'   else',
'       :P182_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>21291571462941561
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(43692711413708314)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(679808771529091808)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New-- E-Invoice - Save Interactive Grid Data'
,p_static_id=>'new-e-invoice-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case ',
'        when :APEX$ROW_STATUS in (''C'', ''U'') then',
'            MERGE INTO einvoice e',
'            USING (SELECT :MODULETNO as M_TNO FROM DUAL) src',
'            ON (e.MODULETNO = src.M_TNO)',
'            WHEN MATCHED THEN',
'                UPDATE SET ',
'                    -- MODULETNO       = :MODULETNO,',
'                    MODULECODE      = :MODULECODE,',
'                    REMARK          = :REMARK,',
'                    CREATOR         = :CREATOR,',
'                    CREATIONTIME    = :CREATIONTIME,',
'                    ACKNO           = :ACKNO,',
'                    ACKDATE         = :ACKDATE,',
'                    IRN             = :IRN,',
'                    BUYERGSTIN      = :BUYERGSTIN,',
'                    INVOICENO       = :INVOICENO,',
'                    INVOICEDATE     = :INVOICEDATE,',
'                    EWBNO           = :EWBNO,',
'                    SIGNEDQRCODE    = :SIGNEDQRCODE,',
'                    EWBDATE         = :EWBDATE,',
'                    VALIDTILLDATE   = :VALIDTILLDATE,',
'                    CCINVOICETNO    = :CCINVOICETNO,',
'                    ERROR           = :ERROR,',
'                    CANCELPORTALRESPONSE = :CANCELPORTALRESPONSE,',
'                    CANCELDATE      = :CANCELDATE,',
'                    CANCELERROR     = :CANCELERROR,',
'                    CANCELREASONCODE = :CANCELREASONCODE,',
'                    CANCELREMARK    = :CANCELREMARK,',
'                    EWAYBILLPORTALRESPONSE = :EWAYBILLPORTALRESPONSE,',
'                    EWAYBILLERROR   = :EWAYBILLERROR,',
'                    PORTALRESPONSE  = :PORTALRESPONSE,',
'                    ISDELETED       = :ISDELETED,',
'                    DELETIONTIME    = :DELETIONTIME,',
'                    DELETEDBY       = :DELETEDBY,',
'                    SELLERGSTIN     = :SELLERGSTIN,',
'                    LOCATIONCODE    = :LOCATIONCODE',
'            WHEN NOT MATCHED THEN',
'                INSERT (',
'                    TNO, MODULETNO, MODULECODE, REMARK, CREATOR, CREATIONTIME, ',
'                    ACKNO, ACKDATE, IRN, BUYERGSTIN, INVOICENO, INVOICEDATE, ',
'                    EWBNO, SIGNEDQRCODE, EWBDATE, VALIDTILLDATE, CCINVOICETNO, ',
'                    ERROR, CANCELPORTALRESPONSE, CANCELDATE, CANCELERROR, ',
'                    CANCELREASONCODE, CANCELREMARK, EWAYBILLPORTALRESPONSE, ',
'                    EWAYBILLERROR, PORTALRESPONSE, ISDELETED, DELETIONTIME, ',
'                    DELETEDBY, SELLERGSTIN, LOCATIONCODE',
'                ) VALUES (',
'                    GlobalTNO.Nextval, ',
'                    :MODULETNO, :MODULECODE, :REMARK, :CREATOR, :CREATIONTIME, ',
'                    :ACKNO, :ACKDATE, :IRN, :BUYERGSTIN, :INVOICENO, :INVOICEDATE, ',
'                    :EWBNO, :SIGNEDQRCODE, :EWBDATE, :VALIDTILLDATE, :CCINVOICETNO, ',
'                    :ERROR, :CANCELPORTALRESPONSE, :CANCELDATE, :CANCELERROR, ',
'                    :CANCELREASONCODE, :CANCELREMARK, :EWAYBILLPORTALRESPONSE, ',
'                    :EWAYBILLERROR, :PORTALRESPONSE, :ISDELETED, :DELETIONTIME, ',
'                    :DELETEDBY, :SELLERGSTIN, :LOCATIONCODE',
'                );',
'        ',
'        when :APEX$ROW_STATUS = ''D'' then',
'            DELETE FROM einvoice WHERE TNO = :TNO;',
'    end case;',
'exception ',
'    when others then ',
'        raise_application_error(-20010, sqlerrm);',
'End;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>33767189097181748
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(31218247745468128)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_static_id=>'prepare-url'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(2000);',
'begin',
'   result:=apex_util.prepare_url(apex_application.g_x01);',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>21292725428941562
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(31217859904468127)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P182_TNO, :P182_PURCHASEORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(31175912460468088)
,p_internal_uid=>21292337587941561
);
wwv_flow_imp.component_end;
end;
/
