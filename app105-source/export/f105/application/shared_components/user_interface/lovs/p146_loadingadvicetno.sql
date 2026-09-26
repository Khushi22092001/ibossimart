prompt --application/shared_components/user_interface/lovs/p146_loadingadvicetno
begin
--   Manifest
--     P146_LOADINGADVICETNO
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
 p_id=>wwv_flow_imp.id(450662162314669405)
,p_lov_name=>'P146_LOADINGADVICETNO'
,p_static_id=>'p146-loadingadvicetno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.tno, a.loadingadviceno, a.loadingadviceDATE',
'  From loadingadvice a,',
'       loadingadviceDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.RECEIVEDQUANTITY1) As RECEIVEDQUANTITY1',
'          From grn       bb,',
'               grndetail cc,',
'               loadingadvicedetail dd',
'         Where bb.tno = cc.tno',
'           And bb.loadingadvicetno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c         ',
' Where getdocumentstatuscode(''LOADINGADVICE'', a.TNO) = ''ACTIVE''',
'    --and a.locationcode = :P155_LOCATIONCODE',
'   -- and a.doctypecode = :P155_DOCTYPECODE',
'   and (',
'      (a.supplierCODE = :P146_PARTYCODE ',
'          Or Exists (Select * ',
'                     From GROUPOFPARTY AA, GROUPOFPARTYDETAIL BB',
'                    Where AA.TNO = BB.TNO',
'                      And BB.PARTYCODE = :P146_PARTYCODE)',
'        )  ',
'    --and a.doctypecode = :P146_DOCTYPECODE',
'    )',
'   and a.companycode = :global_companycode',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And (:P146_FORMSTATUS = ''EDITRECORD'' OR nvl(b.quantity1, 0) - nvl(c.RECEIVEDQUANTITY1, 0) > 0)',
'   --REMARKED OM 09-SEP-2024',
' --  and not exists (select 1 from grn g where g.loadingadvicetno = a.tno )',
'   and nvl(a.ISPARTYLOCATION,''NO'') = ''YES''',
'union all',
'Select Distinct a.tno, a.loadingadviceno, a.loadingadviceDATE',
'  From loadingadvice a,',
'       loadingadviceDetail b,',
'       (Select dd.tno,',
'               dd.itemcode,',
'               dd.itemspecificationcode,',
'               Sum(cc.RECEIVEDQUANTITY1) As RECEIVEDQUANTITY1',
'          From grn       bb,',
'               grndetail cc,',
'               loadingadvicedetail dd',
'         Where bb.tno = cc.tno',
'           And bb.loadingadvicetno = dd.tno(+)',
'           And cc.itemcode = dd.itemcode',
'           And cc.itemspecificationcode = dd.itemspecificationcode',
'         Group By dd.tno, dd.itemcode, dd.itemspecificationcode) c         ',
' Where getdocumentstatuscode(''LOADINGADVICE'', a.TNO) = ''ACTIVE''',
'    --and a.locationcode = :P155_LOCATIONCODE',
'   -- and a.doctypecode = :P155_DOCTYPECODE',
'   and ((a.supplierCODE = :P146_PARTYCODE ',
'          Or Exists (Select * ',
'                     From GROUPOFPARTY AA, GROUPOFPARTYDETAIL BB',
'                    Where AA.TNO = BB.TNO',
'                      And BB.PARTYCODE = :P146_PARTYCODE)',
'        ) ',
'                 -- and a.doctypecode = :P146_DOCTYPECODE',
'                )',
'   and a.companycode = :global_companycode',
'   And a.tno = b.tno(+)',
'   And a.tno = c.tno(+)',
'   And b.itemcode = c.itemcode(+)',
'   And b.itemspecificationcode = c.itemspecificationcode(+)',
'   And (:P146_FORMSTATUS = ''EDITRECORD'' OR nvl(b.quantity1, 0) - nvl(c.RECEIVEDQUANTITY1, 0) > 0)',
'   --REMARKED OM 09-SEP-2024',
'   --and not exists (select 1 from grn g where g.loadingadvicetno = a.tno )',
'   and nvl(a.ISWAREHOUSE,''NO'') = ''YES''',
'  -- REMARKED OM 09-SEP-2024',
'  -- and exists (select 1 from materialin m where m.loadingadvicetno = a.tno)',
'   union all',
'   Select Distinct a.tno, a.loadingadviceno, a.loadingadviceDATE',
'  From loadingadvice a',
'  where :P146_FORMSTATUS = ''EDITRECORD''',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'LOADINGADVICENO'
,p_version_scn=>'4415548249'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(450664780913689145)
,p_query_column_name=>'LOADINGADVICEDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(450664444679689145)
,p_query_column_name=>'LOADINGADVICENO'
,p_heading=>'Loading Advice No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(450663978301689144)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
