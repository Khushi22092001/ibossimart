prompt --application/shared_components/user_interface/lovs/p138_stocktno
begin
--   Manifest
--     P138_STOCKTNO
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
 p_id=>wwv_flow_imp.id(615795131160875128)
,p_lov_name=>'P138_STOCKTNO'
,p_static_id=>'p138-stocktno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.tno,',
'--  substr(getTableColumnValue(',
'--      m.MasterTableName,',
'--      m.LabelColumnName,',
'--      m.MasterTableName || ''.TNo = '' || to_char(a.StockModuleTNo)',
'--  ), 1, 1000) as StockModuleNo,',
'  a.StockDate,',
'  a.StockModuleTNo,',
'  a.StockModuleCode,',
'  GetLocationName(a.LocationCode) AS Location--,',
'  --sl.StorageLocationCode,',
'--  l.StorageLocationName,',
'--  m.ModuleName, ',
'--  m.MasterTableName,',
'--  m.LABELCOLUMNNAME,',
'--  --g.GRNNo,',
'--  b.IndentNo,',
'--  c.PurchaseOrderNo,',
'--  --d.WorkOrderNo,',
'--  e.JobOrderNo,',
'--  --sl.StockQuantity1 - nvl(sl.UsedStockQuantity1,0) - nvl(sl.ReserveStockQuantity1,0) as Quantity1,',
'--  --sl.StockQuantity2 - nvl(sl.UsedStockQuantity2,0) - nvl(sl.ReserveStockQuantity2,0) as Quantity2,                       ',
'--  j.LocationCode as FromLocationCode,',
'--  j.LocationName as FromLocationname,',
'--  a.rate,',
'--  substr(decode (',
'--    nvl( ',
'--      b.DocTypeCode ,',
'--      getTableColumnValue(m.MasterTableName, ''DOCTYPECODE'', '' TNO = '' || TO_CHAR(a.StockModuleTNo) )',
'--    ) ,',
'--    ''CAPITAL'',',
'--    ''CAPITAL'',',
'--    ''REVENUE''',
'--  ),1, 100) as StockType',
'  from Stock a--, Module m, Indent b, PurchaseOrder c, JobOrder e, GRN g, StorageLocation l, Item f, Location j, StockStoragedetail sl --, WorkOrder d',
'  where a.ItemCode = :P138_ItemCode',
'  and a.ItemspecificationCode = :P138_ItemSpecificationCode',
'  and a.CompanyCode = :GLOBAL_COMPANYCODE',
'--   and a.StockDate <= :P138_IssueDate',
'--  and a.StockModuleCode = m.ModuleCode',
'--  --and a.IndentTNo = b.TNo(+)',
'--  --and a.PurchaseOrderTNo = c.TNo(+)',
'--  --and a.WorkOrderTNo = d.TNo(+)',
'--  --and a.JobOrderTNo = e.TNO(+)                    ',
'--  --and a.GRNTNO = g.TNo(+)',
'--  --And a.tno = sl.tno(+)',
'--  --and sl.StorageLocationCode = l.StorageLocationCode(+)',
'--  and a.ItemCode = f.ItemCode',
'--  and a.LocationCode = j.LocationCode',
'--  --and nvl(a.WorkOrderTNo,0)  = nvl(:WorkOrderTNo,0)                       ',
'--  --and sl.StockQuantity1 - nvl(sl.UsedStockQuantity1,0) - nvl(sl.ReserveStockQuantity1,0) > 0',
'--  and nvl(a.LockForModuleCode, :P138_Modulecode ) = :P138_Modulecode',
'--  --and ( ',
'--  --    f.MeasuringUnitCode2 is null ',
'--  --    or ',
'--  --    sl.StockQuantity2 - nvl(sl.UsedStockQuantity2,0) - nvl(sl.ReserveStockQuantity2,0) > 0',
'--  --)',
'--  --and getLocationPrivilege( j.LocationCode, :ModuleCode, :GLOBAL_COMPANYCODE, user) = ''YES''                       ',
'--  --and getStorageLocationPrivilege(sl.StorageLocationCode, :ModuleCode, :GLOBAL_COMPANYCODE, user)=''YES''',
'--and a.companycode = :GLOBAL_COMPANYCODE',
'--order by a.StockDate, a.TNo'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'LOCATION'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(616468244809601801)
,p_query_column_name=>'LOCATION'
,p_heading=>'Location'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(616468591070601801)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Stockdate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(616469377197601801)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'Stockmodulecode'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(616468993521601801)
,p_query_column_name=>'STOCKMODULETNO'
,p_heading=>'Stockmoduletno'
,p_display_sequence=>40
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(616467870029601800)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
