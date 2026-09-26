prompt --application/shared_components/user_interface/lovs/p161_referenceno
begin
--   Manifest
--     P161_REFERENCENO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(609701311747887095)
,p_lov_name=>'P161_REFERENCENO'
,p_static_id=>'p161-referenceno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'  distinct',
'  a.tno,',
'  a.SalesOrderNo AS ReferenceNo,',
'  a.SalesOrderDate as ReferenceDate,',
'  ''Sale Order'' as Reference,',
'	p.Partyname As Party,',
'	p.Partytypecode As PartyType',
'from SalesOrder a, DocumentStatusDetail b, SalesOrderDetail c,Party p,',
'(',
'     Select aa.salesordertno,bb.itemcode,bb.itemspecificationcode,Sum(bb.quantity1) quantity1',
'     From loadingadvice aa, loadingadvicedetail bb',
'     Where aa.tno = bb.tno',
'     Group By aa.salesordertno,bb.itemcode,bb.itemspecificationcode',
') d,',
'(',
'     Select aa.salesordertno,bb.itemcode,bb.itemspecificationcode,Sum(bb.quantity1) quantity1',
'     From despatchadvice aa, despatchadvicedetail bb',
'     Where aa.tno = bb.tno',
'     Group By aa.salesordertno,bb.itemcode,bb.itemspecificationcode',
') e',
'where 1=1',
'/* Reference No Selection before Party */',
'/* And ( a.partycode = :P161_Partycode OR :P161_PartyCode IS NULL ) */',
'  and a.SalesOrderDate <= NVL(:P161_DespatchAdviceDate, TRUNC(SYSDATE))',
'/*and a.VALIDITYUPTODATE>= NVL(:MasterBlock.DespatchAdviceDate, SYSDATE)*/',
'  and a.TNo = b.ModuleTNO',
'  And c.tno = d.salesordertno(+)',
'  And c.itemcode=d.itemcode(+)',
'  And c.itemspecificationcode=d.itemspecificationcode(+)',
'  And a.partycode = p.partycode(+)',
'  And c.tno = e.salesordertno(+)',
'  And c.itemcode=e.itemcode(+)',
'  And c.itemspecificationcode=e.itemspecificationcode(+)',
'  ',
'  ',
' And ( A.TNO = :P161_REFERENCETNO  OR (nvl(c.quantity1,0) > (nvl(d.quantity1,0) + nvl(e.quantity1,0))))',
'--And ( (nvl(c.quantity1,0) > (nvl(d.quantity1,0) + nvl(e.quantity1,0))))',
'',
'  and a.CompanyCode in (',
'     select aa.CompanyCode',
'     from Company aa',
'     start with aa.CompanyCode = :global_CompanyCode',
'     connect by aa.CompanyCode = prior aa.parentcode',
'  )',
'  and b.Modulecode = ''SALESORDER''',
'  and b.DocumentStatusCode = ''ACTIVE''',
'  and a.TNo = c.TNo',
'  and ( A.TNO = :P161_REFERENCETNO  OR  (c.Quantity1 - nvl(c.CCInvoiceQuantity1,0) > 0))',
'--and ( (c.Quantity1 - nvl(c.CCInvoiceQuantity1,0) > 0))',
'',
'  and :P161_DocTypeCode not in (''CONVERSIONJOBOUTOFPREMISES'')',
'  --AND A.LOCATIONCODE = :P161_LOCATIONCODE',
'  and ( ( a.executedat = ''BOOKINGBRANCH'' and a.locationcode = :P161_LOCATIONCODE ) ',
'        or ',
'            ( nvl(a.executedat,''ANYBRANCH'') = ''ANYBRANCH'')',
'        )',
'  ',
'',
'union all',
'Select ',
'  distinct',
'  a.tno,',
'  a.JobOrderNo AS ReferenceNo,',
'  a.JobOrderDate as ReferenceDate,',
'  ''Job Order'' as Reference,',
'  p.Partyname As Party,',
'  p.Partytypecode As PartyType',
'from JobOrder a, DocumentStatusDetail b, JobOrderDetail c, Party p',
'where 1=1',
'/*  And ( a.partycode = :P161_Partycode OR :P161_PartyCode IS NULL ) */',
'  and a.JobOrderDate <= NVL(:P161_DespatchAdviceDate, TRUNC(SYSDATE))',
'  and a.doctypecode = ''CONVERSIONJOBOUTOFPREMISES''',
'  and a.TNo = b.ModuleTNO',
'  and a.partycode = p.partycode(+)',
'  and a.CompanyCode in (',
'     select aa.CompanyCode',
'     from Company aa',
'     start with aa.CompanyCode = :global_CompanyCode',
'     connect by aa.CompanyCode = prior aa.parentcode',
'  )',
'  and b.Modulecode = ''JOBORDER''',
'  and b.DocumentStatusCode = ''ACTIVE''',
'  and a.TNo = c.TNo',
'  and (A.TNO = :P161_TNO  OR c.Quantity1 > 0)',
'  and :P161_DocTypeCode = ''CONVERSIONJOBOUTOFPREMISES''',
'  AND A.LOCATIONCODE = :P161_LOCATIONCODE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'REFERENCENO'
,p_default_sort_column_name=>'TNO'
,p_default_sort_direction=>'DESC'
,p_version_scn=>'7899297887'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440852522412003247)
,p_query_column_name=>'PARTY'
,p_heading=>'Party Name'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440852923335003251)
,p_query_column_name=>'PARTYTYPE'
,p_heading=>'Party Type'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(609702344543891687)
,p_query_column_name=>'REFERENCE'
,p_heading=>'Reference'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(609703056064891687)
,p_query_column_name=>'REFERENCEDATE'
,p_heading=>'Reference Date'
,p_display_sequence=>50
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(609702704476891687)
,p_query_column_name=>'REFERENCENO'
,p_heading=>'Reference No'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(609701870984891685)
,p_query_column_name=>'TNO'
,p_display_sequence=>20
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
