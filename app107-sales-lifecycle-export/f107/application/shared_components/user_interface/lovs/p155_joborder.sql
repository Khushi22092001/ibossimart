prompt --application/shared_components/user_interface/lovs/p155_joborder
begin
--   Manifest
--     P155_JOBORDER
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
 p_id=>wwv_flow_imp.id(460204350838312946)
,p_lov_name=>'P155_JOBORDER'
,p_static_id=>'p155-joborder'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct   a.tno,a.joborderno , a.joborderdate',
'  From joborder a,',
'       jobOrderDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From loadingadvice       bb,',
'               loadingadvicedetail cc,',
'               joborderdetail dd',
'         Where bb.tno = cc.tno',
'           And bb.jobordertno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c',
' Where getdocumentstatuscode(''JOBORDER'', a.TNO) = ''ACTIVE''',
'   -- and a.locationcode = :P155_LOCATIONCODE',
'    --and a.doctypecode = :P155_DOCTYPECODE',
'    and a.partycode = :P155_NAMEOFVENDOR',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And nvl(b.quantity1, 0) - nvl(c.quantity1, 0) > 0',
'    union all',
'   Select Distinct a.tno, a.joborderno, a.joborderdate',
'  From joborder a',
'  where tno  not in (select distinct jobordertno from loadingadvice)',
'  union all',
'   Select Distinct a.tno, a.joborderno, a.joborderDATE',
'  From joborder a',
'  where tno  = :P155_JOBORDERTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'JOBORDERNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(460205897429326750)
,p_query_column_name=>'JOBORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(460205549093326750)
,p_query_column_name=>'JOBORDERNO'
,p_heading=>'Job Order No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(460205117696326749)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
