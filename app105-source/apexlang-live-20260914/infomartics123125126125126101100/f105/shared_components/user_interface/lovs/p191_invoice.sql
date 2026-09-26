prompt --application/shared_components/user_interface/lovs/p191_invoice
begin
--   Manifest
--     P191_INVOICE
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
 p_id=>wwv_flow_imp.id(607061935805414365)
,p_lov_name=>'P191_INVOICE'
,p_static_id=>'p191-invoice'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH base_data AS (',
'    -- 1. Service Bill (Join order optimized)',
'    SELECT /*+ LEADING(a e b) */',
'        NULL AS LRdate, NULL AS LRNo, a.ServiceBillNo AS InvoiceNo, a.ServiceBillDate AS InvoiceDate,',
'        NULL AS FactoryTransferTNo, NULL AS DFreightBillTNo, ''SERVICEBILL'' AS ModuleCode, ',
'        a.TNo AS ServiceBillTNo, e.TNo AS ServiceVoucherTNo, b.SNo AS ServiceVoucherSNo, ',
'        a.TNo AS ModuleTNo, NULL AS VehicleNo, a.ServiceBillAmount AS BillAmount,',
'        (NVL(a.ServiceBillAmount,0) - NVL(a.PaidAmount,0) - NVL(a.DeductedAmount,0)) AS PendingAmount',
'    FROM ServiceBill a',
'    JOIN Voucher e ON a.TNo = e.ModuleTNo AND e.ModuleCode = ''SERVICEBILL''',
'    JOIN VoucherDetail b ON e.TNo = b.TNo AND a.PartyCode = b.AccountCode',
'    WHERE a.PartyCode = :P191_DepoCode ',
'      AND a.CompanyCode = :P191_CompanyCode ',
'      AND a.Locationcode = :P191_LocationCode',
'      AND a.ServiceBillDate BETWEEN :P191_FromDate AND :P191_ToDate',
'      AND e.VoucherDate <= :P191_DFreightBillReceiptDate',
'      AND b.VoucherDate <= :P191_DFreightBillReceiptDate',
'',
'    UNION ALL',
'',
'    -- 2. Invoice (Removed NVL from join/filter to allow Index usage)',
'    SELECT NULL, NULL, a.InvoiceNo, a.InvoiceDate, NULL, NULL, ''INVOICE'',',
'           NULL, e.TNo, b.SNo, a.TNo, NULL, a.InvoiceAmount,',
'           (NVL(a.InvoiceAmount,0) - NVL(a.PaidAmount,0) - NVL(a.DeductedAmount,0))',
'    FROM Invoice a',
'    JOIN Voucher e ON a.TNo = e.ModuleTNo',
'    LEFT JOIN VoucherDetail b ON e.TNo = b.TNo AND a.PartyCode = b.AccountCode',
'    WHERE a.PartyCode = :P191_DepoCode ',
'      AND a.CompanyCode = :P191_CompanyCode',
'      AND a.Locationcode = :P191_LocationCode',
'      AND a.InvoiceDate BETWEEN :P191_FromDate AND :P191_ToDate',
'      -- Use direct comparison where possible',
'      AND (e.VoucherDate <= :P191_DFreightBillReceiptDate OR e.VoucherDate IS NULL)',
'      AND (b.VoucherDate <= :P191_DFreightBillReceiptDate OR b.VoucherDate IS NULL)',
'',
'    UNION ALL',
'',
'    -- 3. Account Opening (Added missing filter consistency)',
'    SELECT NULL, NULL, a.BillNo, a.BillDate, NULL, NULL, ''ACCOUNTOPENING'',',
'           NULL, e.TNo, e.SNo, a.TNo, NULL, a.BillAmount,',
'           (NVL(-1 * a.OpeningAmount,0) - NVL(a.PaidAmount,0) - NVL(a.DeductedAmount,0))',
'    FROM AccountOpening a',
'    JOIN VoucherDetail e ON a.TNo = e.ModuleTNo AND a.Accountcode = e.Accountcode ',
'         AND a.LocationCode = e.LocationCode AND e.ModuleCode = ''ACCOUNTOPENING''',
'    WHERE a.AccountCode = :P191_DepoCode ',
'      AND a.CompanyCode = :P191_CompanyCode ',
'      AND e.CompanyCode = :P191_CompanyCode',
'      AND a.Locationcode = :P191_LocationCode',
'      AND a.BillDate BETWEEN :P191_FromDate AND :P191_ToDate',
'      AND a.BillDate <= :P191_DFreightBillReceiptDate',
'      AND a.BillNo IS NOT NULL AND a.BillAmount > 0',
'',
'    UNION ALL',
'',
'    -- 4. Debit Note',
'    SELECT NULL, NULL, a.DebitNoteNo, a.DebitNoteDate, NULL, NULL, ''DEBITNOTE'',',
'           NULL, e.TNo, b.SNo, a.TNo, NULL, a.DebitNoteAmount,',
'           (NVL(a.DebitNoteAmount,0) - NVL(a.PaidAmount,0) - NVL(a.DeductedAmount,0))',
'    FROM DebitNote a',
'    JOIN Voucher e ON a.TNo = e.ModuleTNo AND e.ModuleCode = ''DEBITNOTE''',
'    JOIN VoucherDetail b ON e.TNo = b.TNo AND a.PartyCode = b.AccountCode',
'    WHERE a.PartyCode = :P191_DepoCode ',
'      AND a.CompanyCode = :P191_CompanyCode',
'      AND a.Locationcode = :P191_LocationCode',
'      AND a.DebitNoteDate BETWEEN :P191_FromDate AND :P191_ToDate',
'      AND e.VoucherDate <= :P191_DFreightBillReceiptDate',
'      AND b.VoucherDate <= :P191_DFreightBillReceiptDate',
')',
'-- Efficient single pass filter',
'SELECT * ',
'FROM base_data ',
'WHERE PendingAmount > 0 ',
'   OR (ModuleTNo = :MODULETNO AND :MODULETNO IS NOT NULL)',
'ORDER BY InvoiceDate, InvoiceNo;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MODULETNO'
,p_display_column_name=>'INVOICENO'
,p_version_scn=>'42857878'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43716324023878627)
,p_query_column_name=>'BILLAMOUNT'
,p_heading=>'Billamount'
,p_display_sequence=>50
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43709054772866050)
,p_query_column_name=>'DFREIGHTBILLTNO'
,p_heading=>'Dfreightbilltno'
,p_display_sequence=>100
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43671196754588351)
,p_query_column_name=>'INVOICEDATE'
,p_heading=>'Invoicedate'
,p_display_sequence=>40
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43669941032588351)
,p_query_column_name=>'INVOICENO'
,p_heading=>'Invoiceno'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43672351397588352)
,p_query_column_name=>'MODULECODE'
,p_heading=>'Modulecode'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43669650399588351)
,p_query_column_name=>'MODULETNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43674809675588352)
,p_query_column_name=>'PENDINGAMOUNT'
,p_heading=>'Pendingamount'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43708038465866050)
,p_query_column_name=>'SERVICEBILLTNO'
,p_heading=>'Servicebilltno'
,p_display_sequence=>70
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43683551790672460)
,p_query_column_name=>'SERVICEVOUCHERSNO'
,p_heading=>'Servicevouchersno'
,p_display_sequence=>90
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(43683163403672460)
,p_query_column_name=>'SERVICEVOUCHERTNO'
,p_heading=>'Servicevouchertno'
,p_display_sequence=>80
,p_data_type=>'NUMBER'
);
wwv_flow_imp.component_end;
end;
/
