prompt --application/pages/page_00378
begin
--   Manifest
--     PAGE: 00378
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
 p_id=>378
,p_name=>'GRN Pending for Purchase Bill Report'
,p_alias=>'GRN-PENDING-PURCHASE-BILL-REPORT'
,p_step_title=>'GRN Pending for Purchase Bill Report'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-header a {',
'  text-transform: uppercase;',
'  padding: 6px;',
'  letter-spacing: 0.5px;',
'}',
'',
'.a-IRR-table td {',
'  border-bottom: 1px solid var(--ut-palette-neutral-30, #dcdcdc) !important;',
'  vertical-align: top !important; ',
'  padding: 12px 8px !important;',
'}',
'',
'',
'/* 2. Shared Containers (Party & Info Cards) */',
'.u-party-card, .u-info-card {',
'  width: 300px;',
'  max-width: 300px;',
'  display: flex;',
'  flex-direction: column;',
'  gap: 8px;',
'  /* padding: 8px 0; */',
'  white-space: normal;',
'}',
'/* .u-item-card { margin-top: 12px; } */',
'',
'/* 3. Titles & Layout Structure */',
'.u-party-title, .u-info-title {',
'  font-weight: 600;',
'  color: var(--ut-body-text-color, #111);',
'  font-size: 14px;',
'  border-bottom: 1px solid var(--ut-palette-neutral-20, #e0e0e0);',
'  padding-bottom: 4px;',
'}',
'.u-info-title { text-transform: uppercase; font-size: 12px; letter-spacing: 0.5px; }',
'',
'.u-party-details, .u-info-details { display: flex; flex-direction: column; gap: 5px; }',
'.u-party-row, .u-info-row { display: flex; justify-content: space-between; align-items: center; font-size: 12px; }',
'',
'/* 4. Labels & Values formatting */',
'.u-party-label, .u-info-label {',
'  font-size: 11px;',
'  text-transform: lowercase;',
'  color: var(--ut-palette-neutral-70, #777);',
'  font-weight: 500;',
'}',
'.u-party-value, .u-info-value { color: var(--ut-component-text-color, #333); font-weight: 500; }',
'.u-info-sep { color: var(--ut-palette-neutral-40, #ccc); margin: 0 4px; }',
'',
'/* 5. Badges */',
'.u-party-badge, .u-info-badge {',
'  background-color: var(--ut-palette-neutral-20, #f0f0f0);',
'  color: var(--ut-palette-neutral-90, #333);',
'  padding: 2px 6px;',
'  border-radius: 4px;',
'  font-weight: 700;',
'  font-size: 11px;',
'  text-transform: uppercase;',
'}',
'',
'/* 6. Utility Colors (Amounts, Rates & Quantities) */',
'.u-party-amount, .u-qty-success { color: var(--ut-palette-success-dark, #2e7d32); font-weight: 600; }',
'.u-qty-danger { color: var(--ut-palette-danger-dark, #c62828); font-weight: 600; }',
'.u-info-rate { color: var(--ut-palette-assignment-dark, #0066cc); font-weight: 600; }',
'.u-info-unit { font-size: 10px; color: #666; font-weight: normal; }',
'',
'/* Custom status badge treatment */',
'.u-status-badge {',
'  background-color: var(--ut-palette-neutral-20, #f0f0f0);',
'  color: var(--ut-palette-neutral-90, #333);',
'  padding: 2px 8px;',
'  border-radius: 12px; /* Makes it a clean oval pill shape */',
'  font-weight: 600;',
'  font-size: 11px;',
'}',
'',
'/* Allows multi-line text block layouts for long item descriptions */',
'.u-row-stack {',
'  flex-direction: column !important;',
'  align-items: flex-start !important;',
'  gap: 2px;',
'}',
'',
'/* Forces word-wrapping for long technical strings or codes */',
'.u-text-wrap {',
'  white-space: normal;',
'  word-break: break-word;',
'  color: var(--ut-body-text-color, #222);',
'}',
'',
'/* Professional interactive layout links */',
'.u-info-link {',
'  text-decoration: none;',
'  transition: opacity 0.15s ease-in-out;',
'}',
'',
'/* Subtle underline change and hover effect */',
'.u-info-link:hover {',
'  text-decoration: underline;',
'  opacity: 0.8;',
'}',
'',
'/* Re-enforce consistent layout flow for link wrappers */',
'.u-info-link .u-info-value {',
'  color: var(--ut-palette-assignment-dark, #0066cc); /* Standard APEX actionable blue */',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51644274789790478)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51733962159104441)
,p_plug_name=>'Pending Purchase Bill Report'
,p_static_id=>'pending-purchase-bill-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       G.TNO',
'     , G.COMPANYCODE',
'     , G.FINANCIALYEARCODE',
'     , G.LOCATIONCODE',
'     , G.GRNNO',
'     , G.GRNDATE',
'     , G.PARTYCODE',
'     , G.MATERIALINTNO',
'     , G.PURCHASEORDERTNO',
'     , G.TRANSPORTERCODE',
'     , G.VEHICLETYPECODE',
'     , G.VEHICLENO',
'     , CASE G.REFDOCTYPECODE WHEN ''CHLN'' THEN ''CHALLAN'' WHEN ''BILL'' THEN ''BILL'' END AS REFDOCTYPECODE',
'     , G.REFDOCNO',
'     , G.REFDOCDATE',
'     , TO_CHAR(G.REFDOCAMOUNT,''999G999G999G999G990D00'') AS REFDOCAMOUNT',
'     , G.FREIGHTTYPECODE',
'     , G.LRNO',
'     , G.LRDATE',
'     , TO_CHAR(G.FREIGHTRATE,''999G999G999G999G990D00'') AS FREIGHTRATE',
'     , G.FREIGHTUNITCODE',
'     , G.LOADINGADVICETNO',
'     , GD.ITEMCODE',
'     , GD.ITEMSPECIFICATIONCODE',
'     , GD.CHALANQUANTITY1',
'     , GD.RECEIVEDQUANTITY1',
'     , GD.CHALANQUANTITY2',
'     , GD.RECEIVEDQUANTITY2',
'     , GD.INSPECTEDQUANTITY1',
'     , GD.INSPECTEDQUANTITY2',
'     , GD.ACCEPTEDQUANTITY1',
'     , GD.ACCEPTEDQUANTITY2',
'     , GD.REJECTEDQUANTITY1',
'     , GD.REJECTEDQUANTITY2',
'     , PO.PURCHASEORDERNO',
'     , PO.PURCHASEORDERDATE',
'     , MI.MATERIALINNO',
'     , MI.MATERIALINDATE',
'     , LA.LOADINGADVICENO',
'     , LA.LOADINGADVICEDATE',
'     , P.PARTYNAME AS PARTYNAME',
'     , T.PARTYNAME AS TRANSPORTERNAME',
'     , L.LOCATIONNAME',
'     , DT.DOCTYPENAME',
'     , C.COMPANYNAME',
'     , VI.ITEMNAME',
'     , VI.ITEMSPECIFICATIONNAME',
'     , VI.ITEMCATEGORYNAME',
'     , VI.UOM1',
'     , VT.VEHICLETYPENAME',
'     , FT.FREIGHTTYPENAME',
'     , GETDOCUMENTSTATUSCODE(''GRN'',G.TNO) AS DOCSTATUS',
'     , '''' AS PARTY_DETAILS',
'     , '''' AS TRANSPORTER_DETAILS',
'     , '''' AS ITEM_QTY_DETAILS',
'     , '''' AS REFERENCE_DOCUMENTS',
'     , '''' AS GRN_DETAILS',
'     , '''' AS ITEM_DETAILS',
'',
'     , CASE ',
'           WHEN check_module_view_access(''PURCHASEORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'               apex_page.get_url(',
'                   p_page   => 118,   ',
'                   p_items  => ''P118_TNO'',',
'                   p_values => g.PURCHASEORDERTNO ',
'               )',
'           ELSE',
'               apex_util.prepare_url(''f?p='' || :APP_ID || '':378:'' || :APP_SESSION)',
'       END AS po_link',
'',
'       , CASE ',
'           WHEN check_module_view_access(''MATERIALIN'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'               apex_page.get_url(',
'                   p_page   => 69,   ',
'                   p_items  => ''P69_TNO'',',
'                   p_values => g.MATERIALINTNO ',
'               )',
'           ELSE',
'               apex_util.prepare_url(''f?p='' || :APP_ID || '':378:'' || :APP_SESSION)',
'       END AS MATERIALIN_link',
'       ',
'       , CASE ',
'           WHEN check_module_view_access(''LOADINGADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'               apex_page.get_url(',
'                   p_page   => 155,   ',
'                   p_items  => ''P155_TNO'',',
'                   p_values => g.LOADINGADVICETNO ',
'               )',
'           ELSE',
'               apex_util.prepare_url(''f?p='' || :APP_ID || '':378:'' || :APP_SESSION)',
'       END AS LOADING_ADVICE_link',
'       ',
'       , CASE ',
'           WHEN check_module_view_access(''GRN'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'               apex_page.get_url(',
'                   p_page   => 146,   ',
'                   p_items  => ''P146_TNO'',',
'                   p_values => g.TNO ',
'               )',
'           ELSE',
'               apex_util.prepare_url(''f?p='' || :APP_ID || '':378:'' || :APP_SESSION)',
'       END AS GRN_link',
'FROM GRN G',
'INNER JOIN GRNDETAIL GD     ON G.TNO = GD.TNO',
'LEFT JOIN V_ITEM_DETAILS VI ON VI.ITEMCODE = GD.ITEMCODE AND VI.ITEMSPECIFICATIONCODE = GD.ITEMSPECIFICATIONCODE',
'LEFT JOIN PARTY P           ON P.PARTYCODE = G.PARTYCODE',
'LEFT JOIN PARTY T           ON T.PARTYCODE = G.TRANSPORTERCODE',
'LEFT JOIN LOCATION L        ON L.LOCATIONCODE = G.LOCATIONCODE',
'LEFT JOIN DOCTYPE DT        ON DT.DOCTYPECODE = G.DOCTYPECODE',
'LEFT JOIN COMPANY C         ON C.COMPANYCODE = G.COMPANYCODE',
'LEFT JOIN PURCHASEORDER PO  ON PO.TNO = G.PURCHASEORDERTNO',
'LEFT JOIN MATERIALIN MI     ON MI.TNO = G.MATERIALINTNO',
'LEFT JOIN LOADINGADVICE LA  ON LA.TNO = G.LOADINGADVICETNO',
'LEFT JOIN VEHICLETYPE VT    ON VT.VEHICLETYPECODE = G.VEHICLETYPECODE',
'LEFT JOIN FREIGHTTYPE FT    ON FT.FREIGHTTYPECODE = G.FREIGHTTYPECODE',
'WHERE G.GRNDATE BETWEEN TO_DATE(TRIM(SUBSTR(:P378_DATE_RANGE, 1, INSTR(:P378_DATE_RANGE, '' - '') - 1)), ''DD-MM-YYYY'') ',
'                    AND TO_DATE(TRIM(SUBSTR(:P378_DATE_RANGE, INSTR(:P378_DATE_RANGE, '' - '') + 3)), ''DD-MM-YYYY'')',
'  AND NOT EXISTS (',
'      SELECT 1 ',
'      FROM PURCHASEBILLGRNDETAIL X ',
'      WHERE X.GRNTNO = GD.TNO ',
'        AND X.GRNSNO = GD.SNO',
'  )',
'  -- Optimized Sargable Predicates using NVL instead of OR conditions',
'  AND G.LOCATIONCODE           = NVL(:P378_LOCATION, G.LOCATIONCODE)',
'  AND G.DOCTYPECODE            = NVL(:P378_DOCTYPE, G.DOCTYPECODE)',
'  AND G.PARTYCODE              = NVL(:P378_PARTY, G.PARTYCODE)',
'  AND GD.ITEMCODE              = NVL(:P378_ITEM, GD.ITEMCODE)',
'  AND GD.ITEMSPECIFICATIONCODE = NVL(:P378_ITEM_SPECIFICATION, GD.ITEMSPECIFICATIONCODE)',
'order by g.tno desc',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P378_DATE_RANGE,P378_LOCATION,P378_DOCTYPE,P378_PARTY,P378_ITEM,P378_ITEM_SPECIFICATION'
,p_prn_page_header=>'Pending Purchase Bill Report'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(51734070212104441)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>.u-det-wrapper{width:100%!important;box-sizing:border-box!important;padding:0!important;margin:0!important}.u-det-hdr-grid,.u-det-data-grid{display:grid!important;grid-template-columns:repeat(6,minmax(150px,1fr))!important;gap:0!important;widt'
||'h:100%!important}.u-det-hdr-grid{background-color:var(--ut-palette-neutral-20,#f0f0f0)!important;border:1px solid var(--ut-palette-neutral-40,#ccc)!important;position:sticky!important;top:0!important;z-index:10!important;margin-bottom:0!important;bor'
||'der-radius:4px 4px 0 0!important}.u-det-hdr-cell{font-size:11px!important;font-weight:700!important;color:var(--ut-palette-assignment-dark,#0066cc)!important;text-transform:uppercase!important;padding:8px 4px!important;text-align:center!important;bor'
||'der-right:1px solid var(--ut-palette-neutral-30,#e0e0e0)!important}.u-det-hdr-cell:last-child{border-right:none!important}.u-det-data-grid{background-color:#fff!important;border:1px solid var(--ut-palette-neutral-40,#ccc)!important;border-top:none!im'
||'portant;margin-bottom:8px!important;box-shadow:0 1px 4px rgba(0,0,0,.04)!important;border-radius:0 0 4px 4px!important;transition:background-color .15s ease-in-out,box-shadow .15s ease-in-out!important}.u-det-data-grid .u-info-card,.u-det-data-grid .'
||'u-party-card{width:100%!important;max-width:100%!important;margin:0!important;background:transparent!important;border:none!important;border-right:1px solid var(--ut-palette-neutral-30,#e0e0e0)!important;padding:10px 8px!important;display:flex!importa'
||'nt;flex-direction:column!important;justify-content:flex-start!important}.u-det-data-grid .u-info-card:last-child{border-right:none!important}.u-det-data-grid:hover{background-color:#FFFACD!important;box-shadow:0 4px 12px rgba(0,0,0,.08)!important;bor'
||'der-color:var(--ut-palette-neutral-50,#b0b0b0)!important}.u-det-data-grid:hover .u-info-card,.u-det-data-grid:hover .u-party-card{background-color:#FFFACD!important}</style><div class="u-det-wrapper"><div class="u-det-hdr-grid"><div class="u-det-hdr-'
||'cell">GRN Details</div><div class="u-det-hdr-cell">Party Details</div><div class="u-det-hdr-cell">Reference Documents</div><div class="u-det-hdr-cell">Transporter Details</div><div class="u-det-hdr-cell">Item Details</div><div class="u-det-hdr-cell">'
||'Item Qty Details</div></div>',
''))
,p_detail_view_for_each_row=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="u-det-data-grid"><div class="u-info-card"><div class="u-info-title">#DOCTYPENAME#</div><div class="u-info-details"><div class="u-info-row"><span class="u-info-label">grn no</span><a href="#GRN_LINK#" class="u-info-link" title="View GRN"><'
||'span class="u-info-value">#GRNNO#</span></a></div><div class="u-info-row"><span class="u-info-label">date</span><span class="u-info-value">#GRNDATE#</span></div><div class="u-info-row"><span class="u-info-label">location</span><span class="u-info-val'
||'ue">#LOCATIONNAME#</span></div><div class="u-info-row"><span class="u-info-label">status</span><span class="u-info-value u-status-badge">#DOCSTATUS#</span></div></div></div><div class="u-party-card"><div class="u-party-title">#PARTYNAME#</div><div cl'
||'ass="u-party-details"><div class="u-party-row"><span class="u-party-badge">#REFDOCTYPECODE#</span></div><div class="u-party-row"><span class="u-party-label">Document</span><span class="u-party-value">#REFDOCNO#</span></div><div class="u-party-row"><s'
||unistr('pan class="u-party-label">Date</span><span class="u-party-value">#REFDOCDATE#</span></div><div class="u-party-row"><span class="u-party-label">Amount</span><span class="u-party-value u-party-amount">\20B9 #REFDOCAMOUNT#</span></div></div></div><div class')
||'="u-info-card"><div class="u-info-title">Document References</div><div class="u-info-details"><div class="u-info-row"><span class="u-info-label">po no</span><a href="#PO_LINK#" class="u-info-link" title="View PO"><span class="u-info-value">#PURCHASEO'
||'RDERNO#</span></a></div><div class="u-info-row"><span class="u-info-label">material in no</span><a href="#MATERIALIN_LINK#" class="u-info-link" title="View Material In"><span class="u-info-value">#MATERIALINNO#</span></a></div><div class="u-info-row"'
||'><span class="u-info-label">loading advice</span><a href="#LOADING_ADVICE_LINK#" class="u-info-link" title="View Loading Advice"><span class="u-info-value">#LOADINGADVICENO#</span></a></div></div></div><div class="u-info-card"><div class="u-info-titl'
||'e">#TRANSPORTERNAME#</div><div class="u-info-details"><div class="u-info-row"><span class="u-info-badge">#VEHICLETYPENAME#</span><span class="u-info-value" style="font-weight:600;">#VEHICLENO#</span></div><div class="u-info-row"><span class="u-info-l'
||unistr('abel">lr no / date</span><span class="u-info-value">#LRNO# <span class="u-info-sep">\2022</span> #LRDATE#</span></div><div class="u-info-row"><span class="u-info-label">freight type</span><span class="u-info-value">#FREIGHTTYPENAME#</span></div><div clas')
||unistr('s="u-info-row"><span class="u-info-label">rate</span><span class="u-info-value u-info-rate">\20B9 #FREIGHTRATE# <span class="u-info-unit">/ #FREIGHTUNITCODE#</span></span></div></div></div><div class="u-info-card"><div class="u-info-title">#ITEMNAME#</di')
||'v><div class="u-info-details"><div class="u-info-row u-row-stack"><span class="u-info-value u-text-wrap">#ITEMSPECIFICATIONNAME#</span></div><div class="u-info-row"><span class="u-info-label">category</span><span class="u-info-value">#ITEMCATEGORYNAM'
||'E#</span></div><div class="u-info-row"><span class="u-info-label">unit of measure (uom)</span><span class="u-info-badge">#UOM1#</span></div></div></div><div class="u-info-card"><div class="u-info-title">Quantity Breakdown</div><div class="u-info-deta'
||'ils"><div class="u-info-row"><span class="u-info-label">challan qty</span><span class="u-info-value">#CHALANQUANTITY1#</span></div><div class="u-info-row"><span class="u-info-label">received qty</span><span class="u-info-value">#RECEIVEDQUANTITY1#</s'
||'pan></div><div class="u-info-row"><span class="u-info-label">inspected qty</span><span class="u-info-value">#INSPECTEDQUANTITY1#</span></div><div class="u-info-row"><span class="u-info-label">accepted qty</span><span class="u-info-value u-qty-success'
||'">#ACCEPTEDQUANTITY1#</span></div><div class="u-info-row"><span class="u-info-label">rejected qty</span><span class="u-info-value u-qty-danger">#REJECTEDQUANTITY1#</span></div></div></div></div>',
''))
,p_detail_view_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
''))
,p_internal_uid=>41808547895577875
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51746782391104453)
,p_db_column_name=>'ACCEPTEDQUANTITY1'
,p_display_order=>390
,p_column_identifier=>'AE'
,p_column_label=>'Accepted quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51747148564104453)
,p_db_column_name=>'ACCEPTEDQUANTITY2'
,p_display_order=>400
,p_column_identifier=>'AF'
,p_column_label=>'Acceptedquantity2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51744421871104452)
,p_db_column_name=>'CHALANQUANTITY1'
,p_display_order=>330
,p_column_identifier=>'Y'
,p_column_label=>'Chalan quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51745178661104452)
,p_db_column_name=>'CHALANQUANTITY2'
,p_display_order=>350
,p_column_identifier=>'AA'
,p_column_label=>'Chalanquantity2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51735207757104446)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>120
,p_column_identifier=>'B'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51752390246104457)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>530
,p_column_identifier=>'AS'
,p_column_label=>'Company name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646228281790498)
,p_db_column_name=>'DOCSTATUS'
,p_display_order=>600
,p_column_identifier=>'AZ'
,p_column_label=>'Doc status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51751971641104456)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>520
,p_column_identifier=>'AR'
,p_column_label=>'Doctype name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51735535800104446)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>130
,p_column_identifier=>'C'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51647710474790512)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>630
,p_column_identifier=>'BN'
,p_column_label=>'Freightrate'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51741192097104449)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>260
,p_column_identifier=>'Q'
,p_column_label=>'Freighttypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646127283790497)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>590
,p_column_identifier=>'AY'
,p_column_label=>'Freighttypename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51742815747104451)
,p_db_column_name=>'FREIGHTUNITCODE'
,p_display_order=>290
,p_column_identifier=>'U'
,p_column_label=>'Freight unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51736819724104447)
,p_db_column_name=>'GRNDATE'
,p_display_order=>160
,p_column_identifier=>'F'
,p_column_label=>'Grn date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51736343882104446)
,p_db_column_name=>'GRNNO'
,p_display_order=>150
,p_column_identifier=>'E'
,p_column_label=>'Grn no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646977324790505)
,p_db_column_name=>'GRN_DETAILS'
,p_display_order=>10
,p_column_identifier=>'BG'
,p_column_label=>'Grn Details'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51647518156790510)
,p_db_column_name=>'GRN_LINK'
,p_display_order=>100
,p_column_identifier=>'BL'
,p_column_label=>'Grn Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51745951081104453)
,p_db_column_name=>'INSPECTEDQUANTITY1'
,p_display_order=>370
,p_column_identifier=>'AC'
,p_column_label=>'Inspected quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51746420977104453)
,p_db_column_name=>'INSPECTEDQUANTITY2'
,p_display_order=>380
,p_column_identifier=>'AD'
,p_column_label=>'Inspected quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51753558420104457)
,p_db_column_name=>'ITEMCATEGORYNAME'
,p_display_order=>560
,p_column_identifier=>'AV'
,p_column_label=>'Item category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51743562967104451)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>310
,p_column_identifier=>'W'
,p_column_label=>'Item code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51752737620104457)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>540
,p_column_identifier=>'AT'
,p_column_label=>'Item name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51743942274104451)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>320
,p_column_identifier=>'X'
,p_column_label=>'Item specification code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51753142433104457)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>550
,p_column_identifier=>'AU'
,p_column_label=>'Item specification name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51647100724790506)
,p_db_column_name=>'ITEM_DETAILS'
,p_display_order=>50
,p_column_identifier=>'BH'
,p_column_label=>'Item Details'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646613549790501)
,p_db_column_name=>'ITEM_QTY_DETAILS'
,p_display_order=>60
,p_column_identifier=>'BC'
,p_column_label=>'Item Qty Details'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51750372002104455)
,p_db_column_name=>'LOADINGADVICEDATE'
,p_display_order=>480
,p_column_identifier=>'AN'
,p_column_label=>'Loading advice date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51749966451104455)
,p_db_column_name=>'LOADINGADVICENO'
,p_display_order=>470
,p_column_identifier=>'AM'
,p_column_label=>'Loading advice no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51743168529104451)
,p_db_column_name=>'LOADINGADVICETNO'
,p_display_order=>300
,p_column_identifier=>'V'
,p_column_label=>'Loadingadvicetno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51647338133790509)
,p_db_column_name=>'LOADING_ADVICE_LINK'
,p_display_order=>90
,p_column_identifier=>'BK'
,p_column_label=>'Loading Advice Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51736000975104446)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>140
,p_column_identifier=>'D'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51751588735104456)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>510
,p_column_identifier=>'AQ'
,p_column_label=>'Location name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51742008625104450)
,p_db_column_name=>'LRDATE'
,p_display_order=>280
,p_column_identifier=>'S'
,p_column_label=>'Lr date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51741549030104450)
,p_db_column_name=>'LRNO'
,p_display_order=>270
,p_column_identifier=>'R'
,p_column_label=>'Lr no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51749572217104455)
,p_db_column_name=>'MATERIALINDATE'
,p_display_order=>460
,p_column_identifier=>'AL'
,p_column_label=>'Material in date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51749148104104455)
,p_db_column_name=>'MATERIALINNO'
,p_display_order=>450
,p_column_identifier=>'AK'
,p_column_label=>'Material in no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51737570911104447)
,p_db_column_name=>'MATERIALINTNO'
,p_display_order=>180
,p_column_identifier=>'H'
,p_column_label=>'Materialintno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51647316240790508)
,p_db_column_name=>'MATERIALIN_LINK'
,p_display_order=>80
,p_column_identifier=>'BJ'
,p_column_label=>'Materialin Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51737154757104447)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>170
,p_column_identifier=>'G'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51750782863104456)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>490
,p_column_identifier=>'AO'
,p_column_label=>'Party name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646344875790499)
,p_db_column_name=>'PARTY_DETAILS'
,p_display_order=>20
,p_column_identifier=>'BA'
,p_column_label=>'Party Details'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51647128764790507)
,p_db_column_name=>'PO_LINK'
,p_display_order=>70
,p_column_identifier=>'BI'
,p_column_label=>'Po Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51748815709104454)
,p_db_column_name=>'PURCHASEORDERDATE'
,p_display_order=>440
,p_column_identifier=>'AJ'
,p_column_label=>'Purchase order date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51748415108104454)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>430
,p_column_identifier=>'AI'
,p_column_label=>'Purchase order no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51737935046104447)
,p_db_column_name=>'PURCHASEORDERTNO'
,p_display_order=>190
,p_column_identifier=>'I'
,p_column_label=>'Purchaseordertno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51744800036104452)
,p_db_column_name=>'RECEIVEDQUANTITY1'
,p_display_order=>340
,p_column_identifier=>'Z'
,p_column_label=>'Received quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51745525950104452)
,p_db_column_name=>'RECEIVEDQUANTITY2'
,p_display_order=>360
,p_column_identifier=>'AB'
,p_column_label=>'Receivedquantity2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51647593513790511)
,p_db_column_name=>'REFDOCAMOUNT'
,p_display_order=>620
,p_column_identifier=>'BM'
,p_column_label=>'Refdocamount'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51740418932104449)
,p_db_column_name=>'REFDOCDATE'
,p_display_order=>250
,p_column_identifier=>'O'
,p_column_label=>'Ref doc date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51739947619104449)
,p_db_column_name=>'REFDOCNO'
,p_display_order=>240
,p_column_identifier=>'N'
,p_column_label=>'Ref doc no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51739560955104448)
,p_db_column_name=>'REFDOCTYPECODE'
,p_display_order=>230
,p_column_identifier=>'M'
,p_column_label=>'Ref doc type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646829798790504)
,p_db_column_name=>'REFERENCE_DOCUMENTS'
,p_display_order=>30
,p_column_identifier=>'BF'
,p_column_label=>'Reference Documents'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51747611246104454)
,p_db_column_name=>'REJECTEDQUANTITY1'
,p_display_order=>410
,p_column_identifier=>'AG'
,p_column_label=>'Rejected quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51747990775104454)
,p_db_column_name=>'REJECTEDQUANTITY2'
,p_display_order=>420
,p_column_identifier=>'AH'
,p_column_label=>'Rejectedquantity2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51734820261104445)
,p_db_column_name=>'TNO'
,p_display_order=>110
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51738342566104448)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>200
,p_column_identifier=>'J'
,p_column_label=>'Transportercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51751170257104456)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>500
,p_column_identifier=>'AP'
,p_column_label=>'Transporter name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646484458790500)
,p_db_column_name=>'TRANSPORTER_DETAILS'
,p_display_order=>40
,p_column_identifier=>'BB'
,p_column_label=>'Transporter Details'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51753968848104458)
,p_db_column_name=>'UOM1'
,p_display_order=>570
,p_column_identifier=>'AW'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51739185958104448)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>220
,p_column_identifier=>'L'
,p_column_label=>'Vehicle no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51738732256104448)
,p_db_column_name=>'VEHICLETYPECODE'
,p_display_order=>210
,p_column_identifier=>'K'
,p_column_label=>'Vehicletypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51646076058790496)
,p_db_column_name=>'VEHICLETYPENAME'
,p_display_order=>580
,p_column_identifier=>'AX'
,p_column_label=>'Vehicletypename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(51754509311108067)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'418290'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DOCSTATUS:DOCTYPENAME:GRNNO:GRNDATE:PARTYNAME:REFDOCTYPECODE:REFDOCDATE:REFDOCNO:REFDOCAMOUNT:PURCHASEORDERNO:PURCHASEORDERDATE:LOADINGADVICENO:LOADINGADVICEDATE:MATERIALINNO:MATERIALINDATE:TRANSPORTERNAME:VEHICLETYPENAME:VEHICLENO:LRNO:LRDATE:FREIGH'
||'TTYPENAME:FREIGHTUNITCODE:FREIGHTRATE:ITEMCATEGORYNAME:ITEMNAME:ITEMSPECIFICATIONNAME:UOM1:CHALANQUANTITY1:INSPECTEDQUANTITY1:RECEIVEDQUANTITY1:ACCEPTEDQUANTITY1:REJECTEDQUANTITY1'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51646018685790495)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_button_name=>'P378_REFRESH_BTN'
,p_static_id=>'p378-refresh-btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_button_cattributes=>'style="padding-top: 2px;     padding-bottom: 2px;    "'
,p_grid_column_attributes=>'style= "margin-top: 8px;"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51644954398790485)
,p_name=>'P378_DATE_RANGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_prompt=>'Date Range'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_UC_DATE_RANGE_PICKER'
,p_cSize=>30
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'NDP',
  'attribute_06', 'ranges',
  'attribute_07', 'DR',
  'attribute_09', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    ' ''Custom'': true,',
    ' ''Today'': [moment(), moment()],',
    ' ''Yesterday'': [moment().subtract(1, ''days''), moment().subtract(1, ''days'')],',
    ' ''Last 7 Days'': [moment().subtract(6, ''days''), moment()],',
    ' ''Last 30 Days'': [moment().subtract(29, ''days''), moment()],',
    ' ''This Month'': [moment().startOf(''month''), moment().endOf(''month'')],',
    ' ''Last Month'': [moment().subtract(1, ''month'').startOf(''month''), moment().subtract(1, ''month'').endOf(''month'')],',
    ' ''This Quarter'': [moment().startOf(''quarter''), moment().endOf(''quarter'')],',
    ' ''This FY Year'': [moment().month(3).startOf(''month'').isAfter(moment()) ? moment().subtract(1, ''year'').month(3).startOf(''month'') : moment().month(3).startOf(''month''), moment().month(3).startOf(''month'').isAfter(moment()) ? moment().month(2).endOf(''mont'
||'h'') : moment().add(1, ''year'').month(2).endOf(''month'')]',
    '}',
    '')),
  'attribute_10', 'alwaysShowCalendars:linkedCalendars:showDropdowns:showWeekNumbers',
  'attribute_15', 'onIconClick')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51645603760790491)
,p_name=>'P378_DOCTYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_item_default=>'PURCHASE'
,p_prompt=>'Doc Type'
,p_placeholder=>'Select DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      dt.DocTypeName d,',
'      dt.DocTypeCode r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = ''GRN''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(51645129214790487)
,p_name=>'P378_FY_BEGIN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51645230670790488)
,p_name=>'P378_FY_END'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51645753665790493)
,p_name=>'P378_ITEM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_prompt=>'Item'
,p_placeholder=>'Select Item Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From GRNDetail a, Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 2'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(51645839961790494)
,p_name=>'P378_ITEM_SPECIFICATION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_prompt=>'Item Specification'
,p_placeholder=>'Select Item Specification Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'     ee.ItemSpecificationName as d,',
'     ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P378_ITEM',
'  and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P378_ITEM'
,p_ajax_items_to_submit=>'P378_ITEM_SPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(51645512283790490)
,p_name=>'P378_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_prompt=>'Location'
,p_placeholder=>'Select Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''GRN''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(51645647686790492)
,p_name=>'P378_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(51644274789790478)
,p_prompt=>'Party'
,p_placeholder=>'Select Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From GRN a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
,p_cSize=>30
,p_colspan=>3
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51644044608790476)
,p_name=>'Hide navigation menu'
,p_static_id=>'hide-navigation-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51644133753790477)
,p_event_id=>wwv_flow_imp.id(51644044608790476)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51645025603790486)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Default Values'
,p_static_id=>'get-default-values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P378_FY_BEGIN      := :GLOBAL_FINANCIALYEARBEGIN;',
'    :P378_FY_END        := :GLOBAL_FINANCIALYEAREND;',
'    IF  :P378_DATE_RANGE IS NULL THEN',
'        -- :P378_DATE_RANGE    :=  :P378_FY_BEGIN||'' - ''||:P378_FY_END;',
'        :P378_DATE_RANGE    :=  TO_CHAR(SYSDATE, ''DD-MM-YYYY'') || '' - '' || TO_CHAR(SYSDATE, ''DD-MM-YYYY'');',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>41719503287263920
);
wwv_flow_imp.component_end;
end;
/
