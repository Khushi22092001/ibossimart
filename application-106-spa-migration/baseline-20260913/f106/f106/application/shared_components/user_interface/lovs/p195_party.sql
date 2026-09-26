prompt --application/shared_components/user_interface/lovs/p195_party
begin
--   Manifest
--     P195_PARTY
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
 p_id=>wwv_flow_imp.id(461635963455359538)
,p_lov_name=>'P195_PARTY'
,p_static_id=>'p195-party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--New Added by Vibhor on 18-04-2026',
'select partyname, partycode , getcityname(officecitycode) as city from party a',
'where a.partytypecode in (''CONTRACTOR'', ''SUPPLIER'')',
'and getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'and :P195_DOCTYPECODE = ''CONVERSIONJOBOUTOFPREMISES''',
'union all  ',
'select partyname, partycode , getcityname(officecitycode) as city from party a',
'where a.partytypecode in (''SUPPLIER'')',
'and getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'and :P195_DOCTYPECODE = ''PURCHASERETURN''',
'',
'--commented by vibhor',
'',
'-- select',
'-- 	a1.PartyName as PN,',
'-- 	a1.PartyCode , getcityname(officecitycode) as city',
'-- from Party a1, City b1',
'-- where a1.OfficeCityCode = b1.CityCode(+)',
'-- 	and a1.PartyTypeCode != ''ACCOUNTGROUP''',
'-- 	and a1.PartyTypeCode not in (''ACCOUNTGROUP'',''ACCOUNT'')	',
'-- 	and getNatureDocTypeCode(''GATEPASS'', :P195_DocTypeCode) != ''REPAIRINGJOBOUTOFPREMISES''',
'',
'/*',
'union all',
'select',
'	distinct',
'	a1.PartyName as PN,',
'	a1.PartyCode',
'from StoreInRepairingItem a, StoreInRepairingItemDetail b, RepairingRequisition c, Party a1, City b1',
'where a.Tno = b.TNo',
'	and a.RepairingRequisitionTNo = c.TNo',
'	and a.CompanyCode = :global.CompanyCode',
'	and a.IsDespatchAdviceRequired = ''NO''	',
'	and a.StoreInRepairingItemDate <= nvl(:P195_GatePassDate, trunc(sysdate))',
'	and c.PartyCode = a1.PartyCode',
'	and a1.OfficeCityCode = b1.CityCode(+)',
'	and not exists(',
'		select',
'			 aa.tno',
'                FROM GATEPASS aa, GRN bb , INSPECTION c, INSPECTIONDETAIL cc ',
'		WHERE aa.STOREINREPAIRINGITEMTNO = a.tno',
'                      AND bb.gatepasstno = aa.tno ',
'                      AND c.grntno = bb.tno ',
'                      AND c.tno = cc.tno ',
'                      AND NVL(cc.rejectedquantity1,0)  != 0 ',
'	)',
'	and getNatureDocTypeCode(''GATEPASS'', :P195_DocTypeCode) = ''REPAIRINGJOBOUTOFPREMISES''',
'    */',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_version_scn=>'30359260'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461637519104364365)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(461636764680364365)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(45097701489131686)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Partyname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
