prompt --application/shared_components/user_interface/lovs/p161_itemspecification
begin
--   Manifest
--     P161_ITEMSPECIFICATION
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
 p_id=>wwv_flow_imp.id(609764293725150023)
,p_lov_name=>'P161_ITEMSPECIFICATION'
,p_static_id=>'p161-itemspecification'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  a.ItemSpecificationCode,',
'  a.ItemSpecificationName,',
'  a.MultiplyingFactor',
'from ItemSpecification a, Item b',
'where a.TNo = b.TNO',
'  and b.ItemCode = :ItemCode',
'  and ( (',
'      ( ',
'         :P161_DocTypeCode in (''4'',''SALE'',''PURCHASERETURN'')',
'        OR',
'        EXISTS (',
'          SELECT',
'            AA.TNO',
'          FROM ModuleDocType aa, ModuleDocTypeDetail bb',
'          Where aa.TNo = bb.TNo',
'            and aa.Modulecode = getmoduleentrypageno(:APP_PAGE_ID)',
'            and bb.DocTypeCode = :P161_DocTypeCode',
'            and bb.NatureDocTypeCode in (''4'',''SALE'',''PURCHASERETURN'')',
'        )',
'      )',
'      and (',
'       exists(',
'         Select aa.TNo from SalesOrderDetail aa',
'         where aa.tno = :P161_ReferenceTNo',
'          and aa.itemcode = B.Itemcode',
'          and aa.ItemSpecificationCode = a.ItemspecificationCode ',
'       )',
'      )',
'      )',
'			)',
'union all',
'select',
'  a.ItemSpecificationCode,',
'  a.ItemSpecificationName,',
'  a.MultiplyingFactor',
'from ItemSpecification a, Item b',
'where a.TNo = b.TNO',
'  and b.ItemCode = :ItemCode',
'  and ( (',
'      ( ',
'         :P161_DocTypeCode in (''CONVERSIONJOBOUTOFPREMISES'')',
'        OR',
'        EXISTS (',
'          SELECT',
'            AA.TNO',
'          FROM ModuleDocType aa, ModuleDocTypeDetail bb',
'          Where aa.TNo = bb.TNo',
'            and aa.Modulecode = getmoduleentrypageno(:APP_PAGE_ID)',
'            and bb.DocTypeCode = :P161_DocTypeCode',
'            and bb.NatureDocTypeCode in (''CONVERSIONJOBOUTOFPREMISES'')',
'        )',
'      )',
'      and (',
'       exists(',
'         Select aa.TNo from JobOrderDetail aa',
'         where aa.tno = :P161_ReferenceTNo',
'          and aa.itemcode = B.Itemcode',
'          and aa.ItemSpecificationCode = a.ItemspecificationCode ',
'       )',
'      )',
'      )',
'			)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_column_name=>'ITEMSPECIFICATIONNAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(609767520419157138)
,p_query_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(609767849396157138)
,p_query_column_name=>'ITEMSPECIFICATIONNAME'
,p_heading=>'Itemspecificationname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(609768262769157138)
,p_query_column_name=>'MULTIPLYINGFACTOR'
,p_heading=>'Multiplyingfactor'
,p_display_sequence=>30
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
