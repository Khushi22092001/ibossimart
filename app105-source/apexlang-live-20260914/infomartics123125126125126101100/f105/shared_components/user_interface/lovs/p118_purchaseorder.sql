prompt --application/shared_components/user_interface/lovs/p118_purchaseorder
begin
--   Manifest
--     P118_PURCHASEORDER
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
 p_id=>wwv_flow_imp.id(599505512978516017)
,p_lov_name=>'P118_PURCHASEORDER'
,p_static_id=>'p118-purchaseorder'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Distinct x.tno, x.purchaseorderno, x.purchaseorderDATE from (',
'Select Distinct a.tno, a.purchaseorderno, a.purchaseorderDATE',
'  From purchaseorder a,',
'       PurchaseOrderDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From loadingadvice       bb,',
'               loadingadvicedetail cc,',
'               purchaseorderdetail dd',
'         Where bb.tno = cc.tno',
'           And bb.purchaseordertno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c',
' Where getdocumentstatuscode(''PURCHASEORDER'', a.TNO) = ''ACTIVE''',
'    and a.locationcode = :P155_LOCATIONCODE',
'    and a.doctypecode = :P155_DOCTYPECODE',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And nvl(b.quantity1, 0) -( nvl(c.quantity1, 0)) > 0',
'   and (a.partycode = :P155_SUPPLIERCODE ',
'          Or Exists (Select * ',
'                     From GROUPOFPARTY AA, GROUPOFPARTYDETAIL BB',
'                    Where AA.TNO = BB.TNO',
'                      And BB.PARTYCODE = :P155_SUPPLIERCODE)',
'        )',
'/* commented by Sanjay on 23-jul-2024 because All P.O. is showing',
'   union all',
'   Select Distinct a.tno, a.purchaseorderno, a.purchaseorderDATE',
'  From purchaseorder a',
'  where tno  not in (select distinct purchaseordertno from loadingadvice)',
'*/',
'  union all',
'   Select Distinct a.tno, a.purchaseorderno, a.purchaseorderDATE',
'  From purchaseorder a',
'  where tno  = :P155_PURCHASEORDERTNO',
') x',
'order by 3,2'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'PURCHASEORDERNO'
,p_version_scn=>'4395997008'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(599506680746525046)
,p_query_column_name=>'PURCHASEORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(599506343359525046)
,p_query_column_name=>'PURCHASEORDERNO'
,p_heading=>'PO No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(599505916160525046)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
