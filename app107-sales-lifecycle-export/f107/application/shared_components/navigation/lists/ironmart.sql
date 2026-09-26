prompt --application/shared_components/navigation/lists/ironmart
begin
--   Manifest
--     LIST: IronMart
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(584482620895424898)
,p_name=>'IronMart'
,p_static_id=>'ironmart'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Level,',
'       aa.MYBOXLABEL,',
'       ''f?p=&APP_ID.:'' || TO_CHAR(aA.PAGENO) || '':&SESSION.:::''|| TO_CHAR(aA.PAGENO) ||''::'' target,',
'       aa.MYBOXKEY,',
'        aa.iconname                             AS icon',
'  From (Select *',
'          From myboxtree_apexmenu a',
'         Where A.BossUserCode = :GLOBAL_BOSSUSERCODE',
'           And A.COMPANYCODE  = :GLOBAL_COMPANYCODE',
'           ) AA',
' Start With aA.ParentKey = ''ROOT''',
'Connect By Prior aA.MyBoxKey = aA.ParentKey',
'Order Siblings By aA.SerialNo',
'/*',
' UNION ALL',
' Select 1,',
'       ''On The Table'',--aa.MYBOXLABEL,',
'       ''f?p=&APP_ID.:'' || ''126'' || '':&SESSION.:::''|| ''126'' ||''::'' target,',
'       null,',
'       ''YES'' As is_current,',
'      null image',
'  From DUAL',
'*/',
' -- Order Siblings By aA.MyBoxLabel',
''))
,p_version_scn=>'41837893'
);
wwv_flow_imp.component_end;
end;
/
