prompt --application/shared_components/user_interface/lovs/p118_salesgrn
begin
--   Manifest
--     P118_SALESGRN
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(466092590934572867)
,p_lov_name=>'P118_SALESGRN'
,p_static_id=>'p118-salesgrn'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Distinct x.tno, x.salesgrnno, x.salesgrnDATE from (',
'Select Distinct a.tno, a.salesgrnno, a.salesgrnDATE',
'  From salesgrn a,',
'       salesgrnDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From loadingadvice       bb,',
'               loadingadvicedetail cc,',
'               salesgrndetail dd',
'         Where bb.tno = cc.tno',
'           And bb.salesgrntno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c',
' Where getdocumentstatuscode(''SALESGRN'', a.TNO) = ''ACTIVE''',
'    and a.locationcode = :P155_LOCATIONCODE',
'    --and a.doctypecode = :P155_DOCTYPECODE',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And nvl(b.rejectedquantity1, 0) - nvl(c.quantity1, 0) > 0',
'   --and a.partycode = :P155_ISSUEDBYPARTYCODE',
'   union all',
'   Select Distinct a.tno, a.salesgrnno, a.salesgrnDATE',
'  From salesgrn a',
'  where tno  not in (select distinct salesgrntno from loadingadvice)',
'  union all',
'   Select Distinct a.tno, a.salesgrnno, a.salesgrnDATE',
'  From salesgrn a',
'  where tno  = :P155_salesgrnTNO',
') x',
'',
'       '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'SALESGRNNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(466094813602580535)
,p_query_column_name=>'SALESGRNDATE'
,p_heading=>'Date'
,p_display_sequence=>20
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(466094461765580535)
,p_query_column_name=>'SALESGRNNO'
,p_heading=>'Sales GRN No'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(466092909857572883)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
