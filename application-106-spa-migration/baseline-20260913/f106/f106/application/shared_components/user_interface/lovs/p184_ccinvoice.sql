prompt --application/shared_components/user_interface/lovs/p184_ccinvoice
begin
--   Manifest
--     P184_CCINVOICE
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
 p_id=>wwv_flow_imp.id(613215314326003518)
,p_lov_name=>'P184_CCINVOICE'
,p_static_id=>'p184-ccinvoice'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.ccinvoiceno,',
'       a.ccinvoicedate,',
'       getpartyname(a.partycode) As PartyName,',
'       c.CityName,',
'       A.TNO',
'  From ccinvoice a, Party b, City C',
' Where Not Exists',
' (Select aa.tno From salesgrn aa Where aa.ccinvoicetno = a.tno)',
'      And a.companycode = :Global_CompanyCode',
'  and a.partycode = b.PartyCode  ',
'    And getdocumentstatuscode(''CCINVOICE'',a.tno)=''ACTIVE''',
'	--and a.partycode = :P184_PARTYCODE',
' and nvl(b.WorksCityCode,b.OfficeCityCode) = c.CityCode ',
' Order By a.CCInvoiceDate Desc, a.CCInvoiceNo',
'',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'CCINVOICENO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
