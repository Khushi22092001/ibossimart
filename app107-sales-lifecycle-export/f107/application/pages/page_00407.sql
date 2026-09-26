prompt --application/pages/page_00407
begin
--   Manifest
--     PAGE: 00407
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
 p_id=>407
,p_name=>'Stock Statement'
,p_alias=>'STOCK-STATEMENT'
,p_step_title=>'Stock Statement'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(564112940104544404)
,p_plug_name=>'Stock Statement'
,p_static_id=>'stock-statement'
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:is-collapsed:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(564113039028544405)
,p_plug_name=>'Stock Statement'
,p_static_id=>'stock-statement-2'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ',
'                -- row_number() over(order by a.Tno) SerialNo,',
'                :P407_FROMDATE,',
'                :P407_TODATE,',
'                 A.PARENTCODE AS ITEMGROUP,',
'                GETITEMNAME(A.PARENTCODE) AS ITEMGROUPNAME,',
'                C.LOCATIONCODE,',
'                GETLOCATIONNAME(C.LOCATIONCODE) LOCATIONNAME,',
'                D.STORAGELOCATIONCODE,',
'                GETSTORAGELOCATIONNAME(D.STORAGELOCATIONCODE) STORAGELOCATIONNAME,',
'                A.ITEMCODE,',
'                A.ITEMNAME,',
'                B.ITEMSPECIFICATIONCODE,',
'                B.ITEMSPECIFICATIONNAME,',
'                A.STOCKACCOUNTCODE,',
'                A.CONSUMPTIONACCOUNTCODE,',
'                GETPARTYNAME(A.STOCKACCOUNTCODE) STOCKACCOUNTNAME,',
'                GETPARTYNAME(A.CONSUMPTIONACCOUNTCODE) CONSUMPTIONACCOUNTNAME,',
'                A.MEASURINGUNITCODE1 AS UOM1,',
'                A.MEASURINGUNITCODE2 AS UOM2,',
'                GETMEASURINGUNITNAME(A.MEASURINGUNITCODE1) AS PUOMNAME,',
'                GETMEASURINGUNITNAME(A.MEASURINGUNITCODE2) AS SUOMNAME,',
'                (NVL((SELECT NVL(SUM(Y.STOCKQUANTITY1), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE <= :P407_FROMDATE',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND X.STOCKMODULECODE = ''ITEMOPENING''',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ),',
'                     0) +',
'                ',
'                NVL((SELECT NVL(SUM(Y.STOCKQUANTITY1), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE < :P407_FROMDATE',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND X.STOCKMODULECODE != ''ITEMOPENING''',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE),',
'                     0) -',
'                NVL((SELECT NVL(SUM(P.USEDSTOCKQUANTITY1), 0)',
'                       FROM STOCK Z, USEDSTOCKSTORAGEDETAIL P',
'                      WHERE P.STOCKTNO = Z.TNO',
'                        AND Z.ITEMCODE = A.ITEMCODE',
'                        AND Z.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND P.USEDSTOCKDATE < :P407_FROMDATE',
'                        AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                        AND P.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                      GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE),',
'                     0)) AS OPENINGQTY1,',
'                --',
'                (NVL((SELECT NVL(SUM(Y.STOCKQUANTITY2), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE <= :P407_FROMDATE',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND X.STOCKMODULECODE = ''ITEMOPENING''',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                    ),',
'                     0) +',
'                ',
'                NVL((SELECT NVL(SUM(Y.STOCKQUANTITY2), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE < :P407_FROMDATE',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND X.STOCKMODULECODE != ''ITEMOPENING''',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE),',
'                     0) -',
'                NVL((SELECT NVL(SUM(P.USEDSTOCKQUANTITY2), 0)',
'                       FROM STOCK Z, USEDSTOCKSTORAGEDETAIL P',
'                      WHERE P.STOCKTNO = Z.TNO',
'                        AND Z.ITEMCODE = A.ITEMCODE',
'                        AND Z.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND P.USEDSTOCKDATE < :P407_FROMDATE',
'                        AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                        AND P.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                      GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE),',
'                     0)) AS OPENINGQTY2,',
'                ',
'                --',
'                (NVL((SELECT NVL(ROUND(SUM(Y.STOCKQUANTITY1 * X.RATE), 2), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE <= :P407_FROMDATE',
'                        AND X.STOCKMODULECODE = ''ITEMOPENING''',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                     ),',
'                     0)',
'                ',
'                +',
'                ',
'                NVL((SELECT NVL(ROUND(SUM(Y.STOCKQUANTITY1 * X.RATE), 2), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE < :P407_FROMDATE',
'                        AND X.STOCKMODULECODE != ''ITEMOPENING''',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                     ),',
'                     0) -',
'                NVL((SELECT NVL(ROUND(SUM(Q.USEDSTOCKQUANTITY1 * Z.RATE), 2),',
'                                0)',
'                       FROM STOCK Z, USEDSTOCKSTORAGEDETAIL Q',
'                      WHERE Q.STOCKTNO = Z.TNO',
'                        AND Z.ITEMCODE = A.ITEMCODE',
'                        AND Z.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND Q.USEDSTOCKDATE < :P407_FROMDATE',
'                        AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                        AND Q.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                      GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE),',
'                     0)) AS OPENINGAMT,',
'                ',
'                (SELECT NVL(SUM(Y.STOCKQUANTITY1), 0)',
'                   FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                  WHERE X.ITEMCODE = A.ITEMCODE',
'                    AND X.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                    AND X.STOCKDATE BETWEEN :P407_FROMDATE AND :P407_TODATE',
'                    AND X.TNO = Y.TNO',
'                    AND X.LOCATIONCODE = C.LOCATIONCODE',
'                    AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                 -- ADDED ON 30-MAY-2022',
'                    AND X.STOCKMODULECODE != ''ITEMOPENING''',
'                    ----',
'                 ) AS RECEIPTQTY1,',
'                (SELECT NVL(SUM(Y.STOCKQUANTITY2), 0)',
'                   FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                  WHERE X.ITEMCODE = A.ITEMCODE',
'                    AND X.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                    AND X.STOCKDATE BETWEEN :P407_FROMDATE AND :P407_TODATE',
'                    AND X.TNO = Y.TNO',
'                    AND X.LOCATIONCODE = C.LOCATIONCODE',
'                    AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                 -- ADDED ON 30-MAY-2022',
'                    AND X.STOCKMODULECODE != ''ITEMOPENING''',
'                    ----',
'                 ) AS RECEIPTQTY2,',
'                ',
'                (SELECT NVL(ROUND(SUM(Y.STOCKQUANTITY1 * X.RATE), 2), 0)',
'                   FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                  WHERE X.ITEMCODE = A.ITEMCODE',
'                    AND X.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                    AND X.STOCKDATE BETWEEN :P407_FROMDATE AND :P407_TODATE',
'                    AND X.TNO = Y.TNO',
'                    AND X.LOCATIONCODE = C.LOCATIONCODE',
'                    AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                 -- ADDED ON 30-MAY-2022',
'                    AND X.STOCKMODULECODE != ''ITEMOPENING''',
'                    ----',
'                 ) AS RECEIPTAMT,',
'                ',
'                (SELECT NVL(SUM(R.USEDSTOCKQUANTITY1), 0)',
'                   FROM STOCK Z, USEDSTOCKSTORAGEDETAIL R',
'                  WHERE R.STOCKTNO = Z.TNO',
'                    AND Z.ITEMCODE = A.ITEMCODE',
'                    AND Z.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                    AND R.USEDSTOCKDATE BETWEEN :P407_FROMDATE AND',
'                        :P407_TODATE',
'                    AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                    AND R.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                 ',
'                  GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE) AS ISSUEQTY1,',
'                (SELECT NVL(SUM(R.USEDSTOCKQUANTITY2), 0)',
'                   FROM STOCK Z, USEDSTOCKSTORAGEDETAIL R',
'                  WHERE R.STOCKTNO = Z.TNO',
'                    AND Z.ITEMCODE = A.ITEMCODE',
'                    AND Z.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                    AND R.USEDSTOCKDATE BETWEEN :P407_FROMDATE AND',
'                        :P407_TODATE',
'                    AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                    AND R.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                 ',
'                  GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE) AS ISSUEQTY2,',
'                ',
'                (SELECT NVL(ROUND(SUM(S.USEDSTOCKQUANTITY1 * Z.RATE), 2), 0)',
'                   FROM STOCK Z, USEDSTOCKSTORAGEDETAIL S',
'                  WHERE S.STOCKTNO = Z.TNO',
'                    AND Z.ITEMCODE = A.ITEMCODE',
'                    AND Z.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                    AND S.USEDSTOCKDATE BETWEEN :P407_FROMDATE AND',
'                        :P407_TODATE',
'                    AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                    AND S.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                 ',
'                  GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE) AS ISSUEAMT,',
'                ',
'                ----',
'                ',
'                (NVL((SELECT NVL(SUM(Y.STOCKQUANTITY1), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE <= :P407_TODATE',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                     ),',
'                     0) -',
'                NVL((SELECT SUM(T.USEDSTOCKQUANTITY1)',
'                       FROM STOCK Z, USEDSTOCKSTORAGEDETAIL T',
'                      WHERE T.STOCKTNO = Z.TNO',
'                        AND Z.ITEMCODE = A.ITEMCODE',
'                        AND Z.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND T.USEDSTOCKDATE <= :P407_TODATE',
'                        AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                        AND T.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                      GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE),',
'                     0)) AS CLOSINGQTY1,',
'                --',
'                (NVL((SELECT NVL(SUM(Y.STOCKQUANTITY2), 0)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE <= :P407_TODATE',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                     ),',
'                     0) -',
'                NVL((SELECT SUM(T.USEDSTOCKQUANTITY2)',
'                       FROM STOCK Z, USEDSTOCKSTORAGEDETAIL T',
'                      WHERE T.STOCKTNO = Z.TNO',
'                        AND Z.ITEMCODE = A.ITEMCODE',
'                        AND Z.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND T.USEDSTOCKDATE <= :P407_TODATE',
'                        AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                        AND T.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                      GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE),',
'                     0)) AS CLOSINGQTY2,',
'                ',
'                --',
'                (NVL((SELECT ROUND(SUM(Y.STOCKQUANTITY1 * X.RATE), 2)',
'                       FROM STOCK X, STOCKSTORAGEDETAIL Y',
'                      WHERE X.ITEMCODE = A.ITEMCODE',
'                        AND X.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND X.TNO = Y.TNO',
'                        AND X.STOCKDATE <= :P407_TODATE',
'                        AND X.LOCATIONCODE = C.LOCATIONCODE',
'                        AND Y.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                     ),',
'                     0) -',
'                NVL((SELECT ROUND(SUM(U.USEDSTOCKQUANTITY1 * Z.RATE), 2)',
'                       FROM STOCK Z, USEDSTOCKSTORAGEDETAIL U',
'                      WHERE U.STOCKTNO = Z.TNO',
'                        AND Z.ITEMCODE = A.ITEMCODE',
'                        AND Z.ITEMSPECIFICATIONCODE =',
'                            B.ITEMSPECIFICATIONCODE',
'                        AND U.USEDSTOCKDATE <= :P407_TODATE',
'                        AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                        AND U.STORAGELOCATIONCODE = D.STORAGELOCATIONCODE',
'                     ',
'                      GROUP BY Z.ITEMCODE, Z.ITEMSPECIFICATIONCODE),',
'                     0)) AS CLOSINGAMT,',
'                     B.SKU',
'',
'  FROM ITEM A, ITEMSPECIFICATION B, STOCK C, STOCKSTORAGEDETAIL D',
' WHERE A.TNO = B.TNO',
'   AND A.ITEMCODE = C.ITEMCODE',
'   AND B.ITEMSPECIFICATIONCODE = C.ITEMSPECIFICATIONCODE',
'   AND C.TNO = D.TNO',
'',
'  AND LENGTH(:P407_FROMDATE) > 0 ',
'  AND INSTR('':''||:P407_COMPANY||'':'','':''||C.COMPANYCODE||'':'') > 0',
'   AND INSTR('':''||:P407_LOCATION||'':'','':''||C.LOCATIONCODE||'':'') > 0',
'      AND ( :P407_SKU IS NULL OR INSTR('':''||:P407_SKU||'':'','':''||B.SKU||'':'') > 0 )',
'  AND ( :P407_ITEM IS NULL OR INSTR('':''||:P407_ITEM||'':'','':''||A.ITEMCODE||'':'') > 0 )',
'  AND ( :P407_ITEMSPECIFICATION IS NULL OR INSTR('':''||:P407_ITEMSPECIFICATION||'':'','':''||B.ITEMSPECIFICATIONCODE||'':'') > 0 )',
'  AND ( :P407_STORAGELOCATION IS NULL OR INSTR('':''||:P407_STORAGELOCATION||'':'','':''||D.STORAGELOCATIONCODE||'':'') > 0 ) ',
'  AND ( :P407_ITEMGROUP IS NULL',
'      OR',
'      EXISTS (SELECT 1 FROM (SELECT ITEMCODE,',
'               PARENTCODE,',
'               RPAD(''.'', (LEVEL - 1) * 2, ''.'') || ITEMCODE AS TREE,',
'               LEVEL,',
'               CONNECT_BY_ROOT ITEMCODE AS ROOT_ID,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(ITEMCODE, ''-''), ''-'') || ''-'' AS PATH,',
'               CONNECT_BY_ISLEAF AS LEAF',
'          FROM ITEM A',
'         START WITH PARENTCODE IN ( SELECT ITEMCODE FROM ITEM XX WHERE',
'                                    INSTR('':''||:P407_ITEMGROUP||'':'','':''||XX.ITEMCODE||'':'') > 0)',
'                                    ',
'        CONNECT BY PARENTCODE = PRIOR ITEMCODE',
'         ORDER SIBLINGS BY ITEMCODE) X WHERE X.ITEMCODE = A.ITEMCODE',
'        )',
'  )',
' ',
'',
' ',
' /* ',
'  AND (',
'              (    NVL((',
'                    (SELECT ',
'                    NVL(SUM(X.STOCKQUANTITY1),0)',
'                    FROM STOCK X',
'                    WHERE X.ITEMCODE = A.ITEMCODE',
'                      AND X.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                      AND X.STOCKDATE < :P407_FROMDATE',
'                      AND X.LOCATIONCODE = C.LOCATIONCODE',
'                      AND X.STORAGELOCATIONCODE = C.STORAGELOCATIONCODE',
'                     )',
'                      -',
'                      (',
'                      SELECT NVL(SUM(Y.USEDSTOCKQUANTITY1),0) FROM USEDSTOCK Y, STOCK Z WHERE Y.STOCKTNO =Z.TNO',
'                      AND Z.ITEMCODE = A.ITEMCODE AND Z.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                      AND Y.USEDSTOCKDATE < :P407_FROMDATE',
'                      AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                      AND Z.STORAGELOCATIONCODE = C.STORAGELOCATIONCODE',
'                      GROUP BY Z.ITEMCODE,Z.ITEMSPECIFICATIONCODE',
'                      )  ',
'                ),0) > 0 ',
'              ',
'              )',
'',
'   ',
'                OR',
'                (',
'                        NVL( (SELECT ',
'                        NVL(SUM(X.STOCKQUANTITY1),0)',
'                        FROM STOCK X',
'                        WHERE X.ITEMCODE = A.ITEMCODE',
'                          AND X.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                          AND X.STOCKDATE BETWEEN :P407_FROMDATE AND :P407_TODATE',
'                              AND X.LOCATIONCODE = C.LOCATIONCODE',
'                              AND X.STORAGELOCATIONCODE = C.STORAGELOCATIONCODE',
'                        ), 0 ) > 0 ',
'                ',
'                 )',
'',
'                OR',
'                (',
'                        NVL((',
'                          SELECT NVL(SUM(Y.USEDSTOCKQUANTITY1),0) FROM USEDSTOCK Y, STOCK Z WHERE Y.STOCKTNO =Z.TNO',
'                          AND Z.ITEMCODE = A.ITEMCODE AND Z.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                          AND Y.USEDSTOCKDATE BETWEEN :P407_FROMDATE AND :P407_TODATE',
'                              AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                              AND Z.STORAGELOCATIONCODE = C.STORAGELOCATIONCODE',
'                          GROUP BY Z.ITEMCODE,Z.ITEMSPECIFICATIONCODE',
'                          ),0) > 0',
'                )',
'                 OR',
'                (',
'                         NVL((',
'                           NVL( (SELECT ',
'                            NVL(SUM(X.STOCKQUANTITY1),0)',
'                            FROM STOCK X',
'                            WHERE X.ITEMCODE = A.ITEMCODE',
'                              AND X.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                              AND X.STOCKDATE <= :P407_TODATE',
'                              AND X.LOCATIONCODE = C.LOCATIONCODE',
'                              AND X.STORAGELOCATIONCODE = C.STORAGELOCATIONCODE',
'                            ) ,0 )',
'                              -',
'                             NVL( (',
'                              SELECT SUM(Y.USEDSTOCKQUANTITY1) FROM USEDSTOCK Y, STOCK Z WHERE Y.STOCKTNO =Z.TNO',
'                              AND Z.ITEMCODE = A.ITEMCODE AND Z.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'                              AND Y.USEDSTOCKDATE <= :P407_TODATE',
'                              AND Z.LOCATIONCODE = C.LOCATIONCODE',
'                              AND Z.STORAGELOCATIONCODE = C.STORAGELOCATIONCODE',
'                              GROUP BY Z.ITEMCODE,Z.ITEMSPECIFICATIONCODE',
'                              )  , 0)',
'                        ),0) > 0',
'                )',
'       ',
'       )',
'  */',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Stock Statement'
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
 p_id=>wwv_flow_imp.id(564113228761544407)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_internal_uid=>115648155730380059
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463909914980445261)
,p_db_column_name=>':P407_FROMDATE'
,p_display_order=>490
,p_column_identifier=>'AX'
,p_column_label=>':p407 Fromdate'
,p_column_html_expression=>'<div style="display:block; width:80px">#:P407_FROMDATE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463909980406445262)
,p_db_column_name=>':P407_TODATE'
,p_display_order=>500
,p_column_identifier=>'AY'
,p_column_label=>':p407 Todate'
,p_column_html_expression=>'<div style="display:block; width:80px">#:P407_TODATE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472692460560623149)
,p_db_column_name=>'CLOSINGAMT'
,p_display_order=>320
,p_column_identifier=>'AC'
,p_column_label=>'CLOSING AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#CLOSINGAMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686446788383664)
,p_db_column_name=>'CLOSINGQTY1'
,p_display_order=>410
,p_column_identifier=>'AP'
,p_column_label=>'CLOSING P QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#CLOSINGQTY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686566184383665)
,p_db_column_name=>'CLOSINGQTY2'
,p_display_order=>420
,p_column_identifier=>'AQ'
,p_column_label=>'CLOSING S QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#CLOSINGQTY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472694450554623150)
,p_db_column_name=>'CONSUMPTIONACCOUNTCODE'
,p_display_order=>340
,p_column_identifier=>'AE'
,p_column_label=>'Consumptionaccountcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472695237624623150)
,p_db_column_name=>'CONSUMPTIONACCOUNTNAME'
,p_display_order=>220
,p_column_identifier=>'AG'
,p_column_label=>'CONSUMPTION ACCOUNT NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#CONSUMPTIONACCOUNTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472691574311623148)
,p_db_column_name=>'ISSUEAMT'
,p_display_order=>310
,p_column_identifier=>'AA'
,p_column_label=>'ISSUE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#ISSUEAMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686181285383662)
,p_db_column_name=>'ISSUEQTY1'
,p_display_order=>390
,p_column_identifier=>'AN'
,p_column_label=>'ISSUE P QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#ISSUEQTY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686366329383663)
,p_db_column_name=>'ISSUEQTY2'
,p_display_order=>400
,p_column_identifier=>'AO'
,p_column_label=>'ISSUE S QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#ISSUEQTY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472692845012623149)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>180
,p_column_identifier=>'H'
,p_column_label=>'ITEM CODE'
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472686004345623145)
,p_db_column_name=>'ITEMGROUP'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Itemgroup'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472686469898623145)
,p_db_column_name=>'ITEMGROUPNAME'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'ITEM GROUP'
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMGROUPNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472687971303623146)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'ITEM NAME'
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472693223139623149)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472688424354623147)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'SPECIFICATION '
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMSPECIFICATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472693635291623149)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472686845150623146)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:90px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472690049774623147)
,p_db_column_name=>'OPENINGAMT'
,p_display_order=>290
,p_column_identifier=>'W'
,p_column_label=>'OPENING AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#OPENINGAMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487685795665383658)
,p_db_column_name=>'OPENINGQTY1'
,p_display_order=>350
,p_column_identifier=>'AJ'
,p_column_label=>'OPENING P QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#OPENINGQTY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487685942889383659)
,p_db_column_name=>'OPENINGQTY2'
,p_display_order=>360
,p_column_identifier=>'AK'
,p_column_label=>'OPENING S QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#OPENINGQTY2#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686988139383670)
,p_db_column_name=>'PUOMNAME'
,p_display_order=>470
,p_column_identifier=>'AV'
,p_column_label=>'P UOM NAME'
,p_column_html_expression=>'<div style="display:block; width:90px">#PUOMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472690806134623148)
,p_db_column_name=>'RECEIPTAMT'
,p_display_order=>300
,p_column_identifier=>'Y'
,p_column_label=>'RECEIPT AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#RECEIPTAMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686041239383660)
,p_db_column_name=>'RECEIPTQTY1'
,p_display_order=>370
,p_column_identifier=>'AL'
,p_column_label=>'RECEIPT  P QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#RECEIPTQTY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686167931383661)
,p_db_column_name=>'RECEIPTQTY2'
,p_display_order=>380
,p_column_identifier=>'AM'
,p_column_label=>'RECEIPT  S QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#RECEIPTQTY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51964261160966122)
,p_db_column_name=>'SKU'
,p_display_order=>510
,p_column_identifier=>'AZ'
,p_column_label=>'SKU'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472693982804623149)
,p_db_column_name=>'STOCKACCOUNTCODE'
,p_display_order=>330
,p_column_identifier=>'AD'
,p_column_label=>'Stockaccountcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472694777239623150)
,p_db_column_name=>'STOCKACCOUNTNAME'
,p_display_order=>210
,p_column_identifier=>'AF'
,p_column_label=>'STOCK ACCOUNT NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#STOCKACCOUNTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472687240339623146)
,p_db_column_name=>'STORAGELOCATIONCODE'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Storagelocationcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472687641712623146)
,p_db_column_name=>'STORAGELOCATIONNAME'
,p_display_order=>140
,p_column_identifier=>'Q'
,p_column_label=>'STORAGE LOCATION'
,p_column_html_expression=>'<div style="display:block; width:160px">#STORAGELOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487687113038383671)
,p_db_column_name=>'SUOMNAME'
,p_display_order=>480
,p_column_identifier=>'AW'
,p_column_label=>'S UOM NAME'
,p_column_html_expression=>'<div style="display:block; width:90px">#SUOMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686846958383668)
,p_db_column_name=>'UOM1'
,p_display_order=>450
,p_column_identifier=>'AT'
,p_column_label=>'UOM1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(487686951920383669)
,p_db_column_name=>'UOM2'
,p_display_order=>460
,p_column_identifier=>'AU'
,p_column_label=>'Uom2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(540305532570399381)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'32266'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATIONNAME:ITEMNAME:ITEMSPECIFICATIONNAME:SKU:STORAGELOCATIONNAME:PUOMNAME:OPENINGQTY1:OPENINGAMT:RECEIPTQTY1:RECEIPTAMT:ISSUEQTY1:ISSUEAMT:CLOSINGQTY1:CLOSINGAMT'
,p_sum_columns_on_break=>'RECEIPTQTY:ISSUEAMT:CLOSINGQTY:CLOSINGAMT:OPENINGAMT:RECEIPTAMT:OPENINGQTY1:RECEIPTQTY1:ISSUEQTY1:CLOSINGQTY1'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(462621129464605892)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(564113039028544405)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/StockStatus.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P407_FROMDATE=&P407_FROMDATE.&P407_TODATE=&P407_TODATE.&P407_LOCATION=&P407_LOCATION.&P407_ITEM=&P407_ITEM.&'
,p_button_condition=>'P407_ITEM'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(462621553839605894)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(564113039028544405)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/StockStatus.xdo?id=weblogic&passwd=webboss123&_xpt=1&_xmode=1&P407_FROMDATE=&P407_FROMDATE.&P407_TODATE=&P407_TODATE.&P407_LOCATION=&P407_LOCATION.&P407_ITEM=&P407_ITEM.&_xf=pdf'
,p_button_condition=>'P407_ITEM'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(462608216940605755)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472608742192468233)
,p_name=>'P407_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''STOCKSTATEMENT''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472683568317623146)
,p_name=>'P407_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472684688263623147)
,p_name=>'P407_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_prompt=>'Material'
,p_placeholder=>'Material List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select DISTINCT',
'      e.ItemName d,',
'      e.ItemCode r',
'From  Item e, ItemSpecification ee',
'Where e.itemclassificationcode = ''MATERIAL''',
'Order by 1'))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%DR%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472685508832623147)
,p_name=>'P407_ITEMGROUP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472609054308468236)
,p_name=>'P407_ITEMSPECIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_prompt=>'Specification'
,p_placeholder=>'Select Item Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From  Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
'  and e.ItemCode = :P407_ITEM',
'Order by 1'))
,p_lov_cascade_parent_items=>'P407_ITEM'
,p_ajax_items_to_submit=>'P407_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%DR%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472684356512623146)
,p_name=>'P407_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT l.LocationName d,l.LocationCode r FROM LOCATION L  WHERE L.LOCATIONCODE IN (SELECT LOCATIONCODE FROM STOCK)',
'/*Select',
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
';',
'*/'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51964204755966121)
,p_name=>'P407_SKU'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_prompt=>'SKU'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SKU AS D,',
'SKU AS R',
'FROM ITEMSPECIFICATION',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472685140382623147)
,p_name=>'P407_STORAGELOCATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_prompt=>'Storage Loc'
,p_placeholder=>'Select Storage Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT STORAGELOCATIONNAME AS D,',
'STORAGELOCATIONCODE AS R',
'FROM STORAGELOCATION ',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(472683892404623146)
,p_name=>'P407_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(564112940104544404)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(199164887448928551)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(199165303095928551)
,p_event_id=>wwv_flow_imp.id(199164887448928551)
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
