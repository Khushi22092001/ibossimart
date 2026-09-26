prompt --application/shared_components/user_interface/lovs/p69_loadingadvicetno
begin
--   Manifest
--     P69_LOADINGADVICETNO
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
 p_id=>wwv_flow_imp.id(607061522123439508)
,p_lov_name=>'P69_LOADINGADVICETNO'
,p_static_id=>'p69-loadingadvicetno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  tno , loadingadviceno , loadingadvicedate from loadingadvice     ',
'where locationcode = :P69_LOCATIONCODE',
'and (SUPPLIERCODE = :P69_PARTYCODE ',
'	        Or Exists (Select * ',
'	                   From GROUPOFPARTY AA, GROUPOFPARTYDETAIL BB',
'                    Where AA.TNO = BB.TNO',
'                      And BB.PARTYCODE = :P69_PARTYCODE)',
'				)',
'and  tno not in (select distinct nvl(loadingadvicetno,0) from materialin)',
'and (purchaseordertno is not null or doctypecode = ''SALERETURN'')',
'and JOBORDERTNO is null',
'and SALESORDERTNO is null',
'union all',
'select  tno , loadingadviceno , loadingadvicedate from loadingadvice     ',
'where locationcode = :P69_LOCATIONCODE',
'and (SUPPLIERCODE = :P69_PARTYCODE ',
'	        Or Exists (Select * ',
'	                   From GROUPOFPARTY AA, GROUPOFPARTYDETAIL BB',
'                    Where AA.TNO = BB.TNO',
'                      And BB.PARTYCODE = :P69_PARTYCODE)',
'				)',
'and  tno = :P69_LOADINGADVICETNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'LOADINGADVICENO'
,p_version_scn=>'4392980048'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607062732996442877)
,p_query_column_name=>'LOADINGADVICEDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607062288543442877)
,p_query_column_name=>'LOADINGADVICENO'
,p_heading=>'Loading Advice No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607061870958442877)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
