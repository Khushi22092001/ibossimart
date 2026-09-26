prompt --application/shared_components/user_interface/lovs/p175_despatchadvice
begin
--   Manifest
--     P175_DESPATCHADVICE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(603193055023740603)
,p_lov_name=>'P175_DESPATCHADVICE'
,p_static_id=>'p175-despatchadvice'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  DISTINCT',
'  a.TNO,',
'  a.DESPATCHADVICENO,',
'  a.DESPATCHADVICEdate,',
'  a.vehicleno,',
'  e.tno AS SaleOrdertno,',
'  e.doctypecode as sodoctypecode,',
'  e.salesorderno,',
'  e.PartyPONo,',
'  e.tno AS SOrtno,',
'  e.salesorderno as son,   ',
'  null as IUTTNo,',
'  null as IUTNO,',
'  f.PartyName',
'  ',
'FROM DESPATCHADVICE a, ',
'  DESPATCHADVICEDETAIL b,',
'  ITEM c,',
'  ITEMSPECIFICATION d,',
'  SALESORDER e, ',
'  Party f,',
'  DocumentStatusDetail dsd ',
'WHERE a.tno = b.tno(+)',
'  AND a.CompanyCode = :GLOBAL_CompanyCode',
'  AND a.referencetno = e.tno(+)',
'  AND b.itemcode = c.itemcode',
'  AND b.itemspecificationcode = d.itemspecificationcode(+)',
'  and a.PartyCode = f.PartyCode(+)',
'  and a.TNo = dsd.ModuleTNo',
'  and dsd.DocumentStatusCode = ''ACTIVE''',
'  and a.LocationCode = :P175_LocationCode',
'  And a.partycode = :P175_PARTYCODE',
'  AND (',
'    a.SalesOrderTNo IS NULL',
'    OR',
'    e.LocationCode = :P175_LocationCode',
'    --A.SalesOrderTno=e.tno',
'    )',
'  AND (',
'      (',
'      GetNaturedocTypeCode(''DESPATCHADVICE'', a.DocTypeCode) IN (''SALE'')  ',
'      AND ',
'      GetNaturedocTypeCode(getmodulecodeforpageno(:APP_PAGE_ID), :P175_DocTypeCode) IN (''CHALAN'' , ''CHALANCUMINVOICE'', ''CAPTIVECONSUMPTION'',''CONVERSION'')',
'      )',
'    OR',
'      (',
'      GetNaturedocTypeCode(''DESPATCHADVICE'', a.DocTypeCode) = GetNaturedocTypeCode(getmodulecodeforpageno(:APP_PAGE_ID), :P175_DocTypeCode)',
'      )',
'    )',
'  AND (',
'    nvl(d.ISWEIGHMENTREQUIRED,''NO'') = ''NO''',
'    OR',
'    EXISTS(',
'      SELECT ',
'        AA.TNO',
'      FROM WEIGHMENT AA',
'      WHERE ',
'      AA.Referencetno = A.TNO',
'        AND aa.ITEMCODE = B.ITEMCODE',
'        AND aa.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'      )',
'    )',
'  AND NOT EXISTS( ',
'    SELECT',
'      aa.TNo',
'    FROM CCINVOICE aa, CCINVOICEDETAIL bb',
'    WHERE aa.tno = bb.tno',
'      AND aa.DespatchAdviceTNo = a.TNO',
'      AND aa.TNO != :P175_TNO',
'      AND bb.ItemCode = b.ItemCode',
'      AND bb.ItemSpecificationCode = b.ItemSpecificationCode',
'    )',
'  AND NOT EXISTS( ',
'    SELECT',
'      aa.TNo',
'    FROM GATEPASS aa',
'    WHERE aa.ReferenceTNo = a.TNO',
'    )',
'  AND (       ',
'    a.referencetno = :P175_salesordertno',
'    OR :P175_salesordertno IS NULL',
'    ) ',
'',
'order by 3 desc, 2  desc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'DESPATCHADVICENO'
,p_version_scn=>'7002266'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603194338106758866)
,p_query_column_name=>'DESPATCHADVICEDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603193883750758866)
,p_query_column_name=>'DESPATCHADVICENO'
,p_heading=>'Despatch Advice No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603197866169758867)
,p_query_column_name=>'IUTNO'
,p_heading=>'IUT NO'
,p_display_sequence=>120
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603197488224758867)
,p_query_column_name=>'IUTTNO'
,p_heading=>'IUT TNO'
,p_display_sequence=>110
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603198335154758867)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party'
,p_display_sequence=>130
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603196334776758867)
,p_query_column_name=>'PARTYPONO'
,p_heading=>'Party PO No'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603195145377758866)
,p_query_column_name=>'SALEORDERTNO'
,p_heading=>'Sale Order No'
,p_display_sequence=>50
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603195930482758867)
,p_query_column_name=>'SALESORDERNO'
,p_heading=>'Sales Order No'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603195539976758866)
,p_query_column_name=>'SODOCTYPECODE'
,p_heading=>'SO Doctype'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603197142114758867)
,p_query_column_name=>'SON'
,p_heading=>'SON'
,p_display_sequence=>100
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603196741735758867)
,p_query_column_name=>'SORTNO'
,p_heading=>'Sort No'
,p_display_sequence=>90
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603193484494758864)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603194734624758866)
,p_query_column_name=>'VEHICLENO'
,p_heading=>'Vehicle No'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
