prompt --application/shared_components/user_interface/lovs/p175_loadingadvice
begin
--   Manifest
--     P175_LOADINGADVICE
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
 p_id=>wwv_flow_imp.id(462773793664555882)
,p_lov_name=>'P175_LOADINGADVICE'
,p_static_id=>'p175-loadingadvice'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT A.LOADINGADVICENO, A.TNO , A.LOADINGADVICEDATE',
' FROM LOADINGADVICE A, SALESORDER B',
'',
'WHERE A.SALESORDERTNO = B.TNO',
'And a.locationcode = :P175_LOCATIONCODE',
'  AND B.PARTYCODE= :P175_PARTYCODE',
'  and a.companycode = :global_companycode',
'	And getdocumentstatuscode(''LOADINGADVICE'',A.TNO)=''ACTIVE''',
'/*  -- Replace Below Code for allowing multiple bill against single loadingadvice',
'  and (a.tno = :P175_LOADINGADVICETNO or  not exists (',
'                                                        select distinct loadingadvicetno from ccinvoice aa ',
'                                                        where aa.loadingadvicetno = a.tno',
'                                                        )																								',
'			)',
'*/			',
'	',
'	And (a.tno = :P175_LOADINGADVICETNO or',
'	    Exists (',
'        	    Select AA.TNO, Sum(AA.QUANTITY1) LQTY, nvl(Sum(CC.QUANTITY1),0) CQTY',
'                  From LOADINGADVICEDETAIL AA, CCINVOICE BB, CCINVOICEDETAIL CC',
'                 Where AA.TNO = BB.LOADINGADVICETNO(+)',
'                   And BB.TNO = CC.TNO(+)',
'                   And AA.ITEMCODE = CC.ITEMCODE(+)',
'                   And AA.ITEMSPECIFICATIONCODE = CC.ITEMSPECIFICATIONCODE(+)',
'                   AND AA.TNO = A.TNO',
'                 Group By AA.TNO',
'                Having Sum(AA.QUANTITY1) > nvl(Sum(CC.QUANTITY1),0)',
'	      )',
'			)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'LOADINGADVICENO'
,p_default_sort_column_name=>'LOADINGADVICENO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'7899704345'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462775166651560810)
,p_query_column_name=>'LOADINGADVICEDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462774677424560810)
,p_query_column_name=>'LOADINGADVICENO'
,p_heading=>'Loading Advice No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462774362687560809)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
