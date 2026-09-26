prompt --application/shared_components/user_interface/lovs/p168_pendingda
begin
--   Manifest
--     P168_PENDINGDA
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
 p_id=>wwv_flow_imp.id(602356421568104097)
,p_lov_name=>'P168_PENDINGDA'
,p_static_id=>'p168-pendingda'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'a.TNo,',
'a.DespatchadviceNo,',
'a.DespatchAdviceDate,',
'a.VehicleNO,',
't.partyname AS Transporter,',
'b.PartyName,',
'a.vehicletypecode,',
'v.vehicletypename,',
'a.transportercode,',
'a.locationcode ,',
'l.locationname,',
'a.doctypecode,',
'h.doctypename ,',
'a.partycode,',
'''DESPATCHADVICE'' AS MODULECODE',
'FROM DESPATCHADVICE a, PARTY b, DOCUMENTSTATUSDETAIL c, PARTY t, VEHICLETYPE v, LOCATION l , DOCTYPE h ',
'WHERE a.PartyCode = b.PartyCode(+)',
'AND a.vehicletypecode = v.vehicletypecode(+)',
'AND a.transportercode  = t.partycode(+)',
'AND a.TNo = c.ModuleTNo',
'AND a.CompanyCode = :GLOBAL_CompanyCode',
'AND c.ModuleCode = ''DESPATCHADVICE''',
'AND c.DocumentStatusCode = ''ACTIVE''',
'AND a.locationcode = l.locationcode',
'AND a.doctypecode = h.doctypecode ',
'AND NOT EXISTS(',
'    SELECT',
'         aa.TNO',
'    FROM MATERIALOUT aa',
'    WHERE aa.ReferenceTNO = a.TNO',
'    and :P168_Formstatus in (''NEWRECORD'')',
')',
'and GetLocationPrivilege(a.LocationCode, ''DESPATCHADVICE'', a.companycode) =''YES''',
'ORDER BY 3, 2'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'DESPATCHADVICENO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
