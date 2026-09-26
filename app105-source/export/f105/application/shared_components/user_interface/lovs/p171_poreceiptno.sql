prompt --application/shared_components/user_interface/lovs/p171_poreceiptno
begin
--   Manifest
--     P171_PORECEIPTNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(211368422436237640)
,p_lov_name=>'P171_PORECEIPTNO'
,p_static_id=>'p171-poreceiptno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct  a.poreceiptno, a.tno , a.poreceiptdate , a.PARTYPORECEIPTNO',
'  From poreceipt a,',
'       poreceiptdetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From salesorder       bb,',
'               salesorderdetail cc,',
'               poreceiptdetail dd',
'         Where bb.tno = cc.tno',
'           And bb.poreceipttno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c',
' Where getdocumentstatuscode(''PORECEIPT'', a.TNO) = ''ACTIVE''',
'   and a.partycode = :P171_PARTYCODE',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   and (b.quantity1 - nvl(c.quantity1,0) > 0 Or a.tno = :P171_PORECEIPTTNO)',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'PORECEIPTNO'
,p_version_scn=>'4392949126'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(211370427052247652)
,p_query_column_name=>'PARTYPORECEIPTNO'
,p_heading=>'PO Receipt No'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(211370040767247651)
,p_query_column_name=>'PORECEIPTDATE'
,p_heading=>'DATE'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(211369625362247651)
,p_query_column_name=>'PORECEIPTNO'
,p_heading=>'No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(211369298065247651)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
