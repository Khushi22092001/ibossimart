prompt --application/shared_components/user_interface/lovs/p155_salesorder
begin
--   Manifest
--     P155_SALESORDER
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
 p_id=>wwv_flow_imp.id(443180416857120265)
,p_lov_name=>'P155_SALESORDER'
,p_static_id=>'p155-salesorder'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.tno, a.salesorderno, a.salesorderDATE',
'  From salesorder a,',
'       salesOrderDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From loadingadvice       bb,',
'               loadingadvicedetail cc,',
'               salesorderdetail dd',
'         Where bb.tno = cc.tno',
'           And bb.salesordertno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c',
' Where getdocumentstatuscode(''SALESORDER'', a.TNO) = ''ACTIVE''',
'    and a.locationcode = :P155_LOCATIONCODE',
'    --and a.doctypecode = :P155_DOCTYPECODE',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And nvl(b.quantity1, 0) - nvl(c.quantity1, 0) > 0',
'    union all',
'   Select Distinct a.tno, a.salesorderno, a.salesorderDATE',
'  From salesorder a',
'  where tno  not in (select distinct salesordertno from loadingadvice)',
'  union all',
'   Select Distinct a.tno, a.salesorderno, a.salesorderDATE',
'  From salesorder a',
'  where tno  = :P155_salesORDERTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'SALESORDERNO'
,p_default_sort_column_name=>'SALESORDERNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443182128777133439)
,p_query_column_name=>'SALESORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443181752804133438)
,p_query_column_name=>'SALESORDERNO'
,p_heading=>'SO NO'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443181319156133438)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
