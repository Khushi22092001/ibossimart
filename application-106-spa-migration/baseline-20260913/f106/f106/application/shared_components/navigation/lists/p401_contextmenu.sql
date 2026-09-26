prompt --application/shared_components/navigation/lists/p401_contextmenu
begin
--   Manifest
--     LIST: P401_CONTEXTMENU
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(297668346603285602)
,p_name=>'P401_CONTEXTMENU'
,p_static_id=>'p401-contextmenu'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Show Monthly Summary'', ',
'''f?p=''||:APP_ID||'':249:''||:APP_SESSION||'':P249_PARTY:''||:P401_ACCODE||'':249::'' target',
'-- ''f?p='' || :APP_ID || '':'' ||''249'' || '':'' ||:APP_SESSION || ''::NO::'' || ''P'' ||''249_PARTY'' || '':'' ||''YES''||'':NO'' target,',
'',
'FROM DUAL',
'union all',
'SELECT ''Show Daily Summary'' as Display, ''f?p=&APP_ID.:250:&SESSION.:P250_PARTY:&P401_ACCODE:250::'' target',
'FROM DUAL'))
,p_version_scn=>'4388337206'
);
wwv_flow_imp.component_end;
end;
/
