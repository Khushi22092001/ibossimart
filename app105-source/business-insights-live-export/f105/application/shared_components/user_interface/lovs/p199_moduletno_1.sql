prompt --application/shared_components/user_interface/lovs/p199_moduletno
begin
--   Manifest
--     P199_MODULETNO
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
 p_id=>wwv_flow_imp.id(445636573382225668)
,p_lov_name=>'P199_MODULETNO'
,p_static_id=>'p199-moduletno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.TNo,',
'       b.RefNo,',
'       getpartyname(b.partycode) As partyname,',
'       b.refdate,',
'       b.ModuleCode,',
'       b.VEHICLENO as COMPANYVEHICLENO,',
'       a.ChalanQuantity1,',
'       a.ReceivedQuantity1,',
'       a.PassedQuantity1,',
'       (b.RefDate) As ReachedDate,',
'       e.AdvanceAmount As ADVANCEAMOUNT,',
'       e.tdsdeductableamount As TDSDeductableAmount',
'',
'  From FreightGRNCCInvoiceQty a,',
'       FreightGRNCCInvoice b,',
'       GRNforFreight c,',
'       --companyvehicle d,',
'       (Select CC.REFERENCEMODULETNO As MODULETNO,',
'               Sum(CC.TDSDEDUCTABLEAMOUNT) As TDSDEDUCTABLEAMOUNT,',
'               Sum(CC.AMOUNT) As ADVANCEAMOUNT',
'        ',
'          From paymentadvice          aa,',
'               paymentadvicedetail    bb,',
'               paymentadvicereference cc',
'         Where aa.tno = bb.tno(+)',
'           And aa.tno = cc.tno(+)',
'           And bb.footerheadcode = ''.TDS.''',
'        -- And CC.REFERENCEMODULETNO = 26390',
'         Group By CC.REFERENCEMODULETNO) e',
' Where 1 = 1',
'   And a.TNO = b.TNO',
'   and b.companycode = :global_companycode',
'   And a.tno = c.TNo(+)',
'   And a.tno = e.moduletno(+)',
'   and b.TRANSPORTERCODE = :P199_TRANSPORTERCODE',
'   --And A.TNO = 30356',
'     -- And b.VehicleNO = to_char(d.tno)',
'			',
'   And c.MODULECODE = decode(:P199_DOCTYPECODE,',
'                             ''PURCHASE'',',
'                             ''PURCHASEBILL'',',
'                             ''SALE'',',
'                             ''CCINVOICE'',',
'                             :P199_DOCTYPECODE)',
'',
'   And b.FREIGHTTYPECODE = :P199_FREIGHTTYPECODE',
'  -- and :P140_FORMSTATUS=''NEWRECORD''',
' And (Not Exists',
' (Select 1 From freightadvicedetail aa Where aa.moduletno = a.tno and  :P199_FORMSTATUS=''NEWRECORD'' and aa.tno = :P199_TNO )',
' or exists (Select 1 From freightadvicedetail aa Where aa.moduletno = a.tno and  :P199_FORMSTATUS=''EDITRECORD'') )'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'REFNO'
,p_version_scn=>'7904594536'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445930159917692227)
,p_query_column_name=>'ADVANCEAMOUNT'
,p_heading=>'Advance Amount'
,p_display_sequence=>110
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445928885228692227)
,p_query_column_name=>'CHALANQUANTITY1'
,p_heading=>'Chalan Quantity'
,p_display_sequence=>70
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455675897890518847)
,p_query_column_name=>'COMPANYVEHICLENO'
,p_heading=>'Vehicle No'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445928134322692227)
,p_query_column_name=>'MODULECODE'
,p_heading=>'Module'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445927301312692226)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(451914765460794796)
,p_query_column_name=>'PASSEDQUANTITY1'
,p_heading=>'Passed Quantity'
,p_display_sequence=>90
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445929729228692227)
,p_query_column_name=>'REACHEDDATE'
,p_heading=>'Reached Date'
,p_display_sequence=>100
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445929282040692227)
,p_query_column_name=>'RECEIVEDQUANTITY1'
,p_heading=>'Received Quantity'
,p_display_sequence=>80
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445927755670692227)
,p_query_column_name=>'REFDATE'
,p_heading=>'Ref Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445926964517692226)
,p_query_column_name=>'REFNO'
,p_heading=>'Ref No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(456313894973690942)
,p_query_column_name=>'TDSDEDUCTABLEAMOUNT'
,p_heading=>'Tdsdeductableamount'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(445926499845692225)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
