prompt --application/shared_components/user_interface/lovs/p101_referencemodno
begin
--   Manifest
--     P101_REFERENCEMODNO
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
 p_id=>wwv_flow_imp.id(608104767632164442)
,p_lov_name=>'P101_REFERENCEMODNO'
,p_static_id=>'p101-referencemodno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  a.tno ,',
'  a.pbpassno ,',
'  a.pbpassdate,',
'  aa.partybillno ,',
'  aa.partybilldate,',
'  aa.natureofsupplycode,',
'  cc.natureofsupplyname',
'from Pbpass a , purchasebill aa , natureofsupply cc',
'where a.purchasebilltno = aa.tno ',
'  And aa.natureofsupplycode = cc.natureofsupplycode(+)',
'  and aa.partycode = :P159_PARTYCODE',
'  and :P159_REFERENCEMODULECODE = ''PBPASS'' ',
'UNION ALL ',
'select',
'  a.tno ,',
'  a.JBPASSNO  ,',
'  a.JBPASSDATE,',
'  aa.partybillno ,',
'  aa.partybilldate ,',
'  aa.natureofsupplycode,',
'  cc.natureofsupplyname',
'from JBPASS a , JOBBILL aa , natureofsupply cc',
'where a.JOBBILLTNO  = aa.tno ',
' And aa.natureofsupplycode = cc.natureofsupplycode(+)',
'  and aa.partycode = :P159_PARTYCODE',
'  and :P159_REFERENCEMODULECODE = ''JBPASS'' ',
'UNION ALL',
'select',
'  a.tno ,',
'  a.fREIGHTBILLNO  ,',
'  a.FREIGHTBILLDATE,',
'  a.partybillno ,',
'  a.partybilldate,',
'  Null As natureofsupplycode,',
'  Null As natureofsupplyname ',
'from FREIGHTBILL a',
'WHERE A.TRANSPORTERCODE = :P159_PARTYCODE',
'AND :P159_REFERENCEMODULECODE =''FREIGHTBILL''',
'UNION ALL',
'select',
'  a.tno ,',
'  a.fREIGHTADVICENO  ,',
'  a.FREIGHTADVICEDATE,',
'  a.partybillno ,',
'  a.partybilldate,',
'  Null As natureofsupplycode,',
'  Null As natureofsupplyname ',
'from FREIGHTADVICE a',
'WHERE A.TRANSPORTERCODE = :P159_PARTYCODE',
'AND :P159_REFERENCEMODULECODE =''FREIGHTADVICE''',
'UNION ALL',
'select',
'  a.tno ,',
'  a.INVOICENO  ,',
'  a.INVOICEDATE,',
'  a.INVOICENO  ,',
'  a.INVOICEDATE,',
'  b.natureofsupplycode,',
'  c.natureofsupplyname',
'from INVOICE  a , ccinvoice b ,natureofsupply c',
'WHERE b.tno = a.Moduletno(+)',
'  And b.natureofsupplycode = c.natureofsupplycode(+)',
'  And A.PARTYCODE = :P159_PARTYCODE',
'  AND :P159_REFERENCEMODULECODE =''INVOICE''',
'UNION ALL',
'select',
'  a.tno ,',
'  a.SERVICEBILLNO  ,',
'  a.SERVICEBILLDATE,',
'  NULL,',
'  NULL,',
'  a.natureofsupplycode,',
'  b.natureofsupplyname',
'from SERVICEBILL a, natureofsupply b   ',
'WHERE a.natureofsupplycode = b.natureofsupplycode(+)',
'And A.PARTYCODE = :P159_PARTYCODE',
'AND :P159_REFERENCEMODULECODE =''SERVICEBILL''',
'UNION ALL',
'Select',
'  a.Tno,',
'  a.AccountOpeningNo,',
'  a.AccountOpeningDate,',
'  nvl(a.BillNo, a.AccountOpeningNo) as PartyBillNo,',
'  nvl(a.BillDate, a.AccountOpeningDate) as PartyBillDate,',
'  Null,',
'  Null',
'From AccountOpening a',
'Where nvl(a.OpeningAmount, 0) > 0',
'-- and a.JobTypeCode is not null',
'and a.AccountCode = :P159_PARTYCODE',
'AND :P159_REFERENCEMODULECODE = ''ACCOUNTOPENING''',
'and a.CompanyCode = :global_CompanyCode',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'PBPASSNO'
,p_version_scn=>'47450378'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39039482764964472)
,p_query_column_name=>'NATUREOFSUPPLYCODE'
,p_heading=>'Natureofsupplycode'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39039834142964472)
,p_query_column_name=>'NATUREOFSUPPLYNAME'
,p_heading=>'Natureofsupplyname'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39039065117964471)
,p_query_column_name=>'PARTYBILLDATE'
,p_heading=>'Bill Date'
,p_display_sequence=>50
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39038670236964471)
,p_query_column_name=>'PARTYBILLNO'
,p_heading=>'Bill No'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39038296170964471)
,p_query_column_name=>'PBPASSDATE'
,p_heading=>'Reference Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39037870855964471)
,p_query_column_name=>'PBPASSNO'
,p_heading=>'Reference No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(39037500708964471)
,p_query_column_name=>'TNO'
,p_heading=>'Tno'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
