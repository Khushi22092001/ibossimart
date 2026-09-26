prompt --application/shared_components/user_interface/lovs/p143_purchaseordertno
begin
--   Manifest
--     P143_PURCHASEORDERTNO
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
 p_id=>wwv_flow_imp.id(447313188200295284)
,p_lov_name=>'P143_PURCHASEORDERTNO'
,p_static_id=>'p143-purchaseordertno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	distinct',
'	a.TNO,',
'	a.PurchaseOrderNO,',
'	a.PurchaseOrderDate',
'from PurchaseOrder a, GRNDetail b, TransactionType c, NatureOfSupply d',
'where a.TNO = b.PurchaseOrderTNo',
'and a.TransactionTypeCode = c.TransactionTypeCode(+)',
'and a.NatureOfSupplyCode = d.NatureOfSupplyCode(+)',
'and :P143_FORMSTATUS = ''NEWRECORD''',
'	and ( ',
'	   a.PartyCode = :P143_PartyCode',
'	   or',
'	   exists(',
'		  select',
'			  bb.tno',
'		  from GroupOfPartyDetail bb, GroupOfPartyDetail cc',
'		  where bb.TNo = cc.TNo',
'			 and bb.PartyCode = :P143_PartyCode',
'			 and cc.PartyCode = a.PartyCode',
'	   )',
'	)',
'	and a.CompanyCode = :global_CompanyCode',
'	and a.PurchaseOrderDate <= :P143_PurchaseBillDate',
'	and (',
'		:P143_doctypecode = ''SUPPLIMENTARYBILL'' ',
'		or ',
'		not exists (',
'				 select ',
'					aa.TNo',
'				 from PurchaseBillGRNDetail aa, PurchaseBillDetail bb, GRNDetail cc',
'				 where aa.TNo = bb.TNo',
'					and aa.SNo = bb.SNo',
'					and bb.PurchaseOrderTNo = a.TNo',
'					and aa.GRNTNo = cc.TNo',
'					and (',
'						( BB.ITEMCODE = CC.ITEMCODE AND BB.ITEMSPECIFICATIONCODE = CC.ITEMSPECIFICATIONCODE )',
'						OR',
'						AA.GRNSNO = CC.SNO',
'					)',
'					and bb.PurchaseOrderTNo = cc.PurchaseOrderTNo',
'					and cc.TNo = b.TNo',
'					and cc.SNo = b.SNo',
'		)',
'	)',
'	AND (',
'		A.LOCATIONCODE = :P143_LOCATIONCODE ',
'		or exists(',
'			select ',
'				aa.TNo',
'			from MaterialIn aa, GRN bb ',
'			where aa.TNo = bb.MaterialInTNo ',
'				and aa.PurchaseOrderTNo = a.TNo',
'				and aa.LocationCode = :P143_LocationCode',
'				and not exists(',
'					select ',
'						aaa.TNo',
'					from PurchaseBillGRNDetail aaa ',
'					where aaa.GRNTNo = bb.TNo',
'                    and aaa.TNo != :P143_TNo',
'				)',
'		)',
'	)',
'    union all',
'    select',
'    	distinct',
'    	a.TNO,',
'    	a.PurchaseOrderNO,',
'    	a.PurchaseOrderDate',
'    from PurchaseOrder a',
'    where a.tno = :P143_PURCHASEORDERTNO',
'    --and :P143_FORMSTATUS = ''EDITRECORD''',
'',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'PURCHASEORDERNO'
,p_default_sort_column_name=>'PURCHASEORDERNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4393087574'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(447314475247304750)
,p_query_column_name=>'PURCHASEORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(447314158729304750)
,p_query_column_name=>'PURCHASEORDERNO'
,p_heading=>'Purchase Order No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(447313747045304748)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
