prompt --application/shared_components/user_interface/lovs/p69_purchaseordertno_1
begin
--   Manifest
--     P69_PURCHASEORDERTNO_1
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
 p_id=>wwv_flow_imp.id(464196136664781193)
,p_lov_name=>'P69_PURCHASEORDERTNO_1'
,p_static_id=>'p69-purchaseordertno-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.tno, a.purchaseorderno, a.purchaseorderDATE',
'  From purchaseorder a,',
'       PurchaseOrderDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From materialin       bb,',
'               materialindetail cc,',
'               purchaseorderdetail dd',
'         Where bb.tno = cc.tno',
'           And bb.purchaseordertno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c,',
'         (Select dd.tno,',
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
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) d',
' Where getdocumentstatuscode(''PURCHASEORDER'', a.TNO) = ''ACTIVE''',
'    --and a.locationcode = :P155_LOCATIONCODE',
'   -- and a.doctypecode = :P155_DOCTYPECODE',
'   --and a.partycode = :P69_PARTYCODE',
'   and (a.partycode = :P69_PARTYCODE ',
'	        Or Exists (Select * ',
'	                   From GROUPOFPARTY AA, GROUPOFPARTYDETAIL BB',
'                    Where AA.TNO = BB.TNO',
'                      And BB.PARTYCODE = :P69_PARTYCODE)',
'				)',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And a.tno = d.tno(+)',
'   And b.itemcode = d.itemcode(+)',
'   And b.itemspecificationcode = d.itemspecificationcode(+)',
'  -- And (:P69_FORMSTATUS = ''EDITRECORD'' OR nvl(b.quantity1, 0) - nvl(c.quantity1, 0) > 0)',
'  -- And (:P69_FORMSTATUS = ''EDITRECORD'' OR nvl(b.quantity1, 0) - nvl(d.quantity1, 0) > 0)',
'  ',
'  UNION ALL',
'  ',
'  SELECT a.tno, a.purchaseorderno, a.purchaseorderDATE',
'  FROM PurchaseOrder a',
'  Where a.TNO = :P69_PURCHASEORDERTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'PURCHASEORDERNO'
,p_version_scn=>'41459016'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(464197182903781220)
,p_query_column_name=>'PURCHASEORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(464196835286781219)
,p_query_column_name=>'PURCHASEORDERNO'
,p_heading=>'PO No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(464196404207781217)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
