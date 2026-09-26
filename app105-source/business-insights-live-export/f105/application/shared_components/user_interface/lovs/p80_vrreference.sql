prompt --application/shared_components/user_interface/lovs/p80_vrreference
begin
--   Manifest
--     P80_VRREFERENCE
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
 p_id=>wwv_flow_imp.id(607741898820288671)
,p_lov_name=>'P80_VRREFERENCE'
,p_static_id=>'p80-vrreference'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  a.TNo as ReferenceTNo,',
'  a.VoucherNo  as ReferenceNO,',
'  a.VoucherDate as ReferenceDate,',
'  b.Amount,',
'  ''VOUCHER'' AS MODULECODE,',
'  c.partyName as AccountName,',
'  b.AccountCode,',
'  b.SNO',
'From Voucher a, VoucherDetail b, Party c',
'Where a.tno = b.tno',
'  And b.accountcode = c.partycode',
'  --And b.accountcode = :P156_DETACCOUNTCODE',
'  And b.amount > 0',
'	And :P156_CRDR=''C''',
'    AND NVL(:P156_FORMSTATUS,''NEWRECORD'') = ''NEWRECORD''',
'	and (',
'          abs(b.Amount) > nvl((',
'           select',
'              sum(abs(aa.amount)) ',
'           from DRCRAllocation aa',
'           where b.TNo in (aa.DRVoucherTNO, aa.CRVoucherTNo)                ',
'               and b.SNO in (aa.DRVoucherSNO, aa.CRVoucherSNo)                ',
'               and not ( ',
'                aa.ModuleTNO = :P156_TNo',
'                and',
'                aa.ModuleCode = ''VOUCHER''',
'               )',
'               and aa.AccountCode = b.AccountCode',
'            ',
'          ),0)',
'       )    ',
'    UNION',
'    Select',
'  a.TNo as ReferenceTNo,',
'  a.VoucherNo  as ReferenceNO,',
'  a.VoucherDate as ReferenceDate,',
'  b.Amount,',
'  ''VOUCHER'' AS MODULECODE,',
'  c.partyName as AccountName,',
'  b.AccountCode,',
'  b.SNO',
'From Voucher a, VoucherDetail b, Party c',
'Where a.tno = b.tno',
'  AND B.ACCOUNTCODE = C.PARTYCODE',
'  AND :P156_FORMSTATUS=''EDITRECORD'' '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'REFERENCETNO'
,p_display_column_name=>'REFERENCENO'
,p_default_sort_column_name=>'REFERENCENO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607744758426288678)
,p_query_column_name=>'ACCOUNTCODE'
,p_heading=>'Accountcode'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607744327308288675)
,p_query_column_name=>'ACCOUNTNAME'
,p_heading=>'Accountname'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607743448587288675)
,p_query_column_name=>'AMOUNT'
,p_heading=>'Amount'
,p_display_sequence=>40
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607743868604288675)
,p_query_column_name=>'MODULECODE'
,p_heading=>'Modulecode'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607743121124288675)
,p_query_column_name=>'REFERENCEDATE'
,p_heading=>'Referencedate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607742685598288675)
,p_query_column_name=>'REFERENCENO'
,p_heading=>'Referenceno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607742281547288673)
,p_query_column_name=>'REFERENCETNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(607745236685288678)
,p_query_column_name=>'SNO'
,p_heading=>'Sno'
,p_display_sequence=>80
,p_data_type=>'NUMBER'
);
wwv_flow_imp.component_end;
end;
/
