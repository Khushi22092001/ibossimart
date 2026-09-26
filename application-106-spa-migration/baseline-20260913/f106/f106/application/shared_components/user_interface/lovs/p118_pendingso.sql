prompt --application/shared_components/user_interface/lovs/p118_pendingso
begin
--   Manifest
--     P118_PENDINGSO
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
 p_id=>wwv_flow_imp.id(212664351277061805)
,p_lov_name=>'P118_PENDINGSO'
,p_static_id=>'p118-pendingso'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.salesorderno ,  a.tno , a.salesorderdate',
'  From salesorder a,',
'       salesOrderDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From loadingadvice       bb,',
'               loadingadvicedetail cc,',
'               salesorderdetail dd',
'         Where bb.tno = cc.tno',
'           And bb.salesordertno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c,',
'         (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.quantity1) As Quantity1',
'          From despatchadvice       bb,',
'               despatchadvicedetail cc,',
'               salesorderdetail dd',
'         Where bb.tno = cc.tno',
'           And bb.salesordertno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) d',
' Where getdocumentstatuscode(''SALESORDER'', a.TNO) = ''ACTIVE''',
'    --and a.locationcode = :P155_LOCATIONCODE',
'    --and a.doctypecode = :P155_DOCTYPECODE',
'   and ( ( a.executedat = ''BOOKINGBRANCH'' and a.locationcode = :P118_LOCATIONCODE ) ',
'        or ',
'            ( nvl(a.executedat,''ANYBRANCH'') = ''ANYBRANCH'')',
'        )',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And nvl(b.quantity1, 0) - nvl(c.quantity1, 0) > 0',
'   And a.tno = d.tno(+)',
'   And b.itemcode = d.itemcode(+)',
'   And b.itemspecificationcode = d.itemspecificationcode(+)',
'   And nvl(b.quantity1, 0) - nvl(d.quantity1, 0) > 0',
'   and a.partycode = :P118_CUSTOMERCODE',
'  union all',
'   Select Distinct  a.salesorderno , a.tno , a.salesorderdate',
'  From salesorder a',
'  where tno  = :P118_PENDINGSOTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'SALESORDERNO'
,p_version_scn=>'4393434933'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(212666272594072557)
,p_query_column_name=>'SALESORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(212665828662072557)
,p_query_column_name=>'SALESORDERNO'
,p_heading=>'SO No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(212665412887072557)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
