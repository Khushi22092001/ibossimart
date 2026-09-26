prompt --application/pages/page_00291
begin
--   Manifest
--     PAGE: 00291
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>291
,p_name=>'Purchase Party Payment Register'
,p_alias=>'PURCHASE-PARTY-AMOUNT-REPORT'
,p_step_title=>'Purchase Party Payment Register'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var reportName = ''IRONMART/REPORT/BalanceFreightSettlement.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P291_FROMDATE'').val());',
'',
'  var reportParams = ',
'  ''&P_COMPANY='' +  $(''#P291_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P291_LOCATION'').val() +',
'    ''&P_FROMDATE=''  +  $(''#P291_FROMDATE'').val() +',
'    ''&P_TODATE='' + $(''#P291_TODATE'').val() +',
'    ''&P_PARTY='' +  $(''#P291_PARTY'').val() ',
'    ;',
' ',
'//alert($v(''P291_PARTY''));',
'  var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P291_BIREPORTURL'').val()',
'  var reportName =  ''PurchasePartyPayment.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_COMPANY":"'' +$(''#P291_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P291_LOCATION'').val() + ''",'' +',
'         ''"_paramsP_FROMDATE":"'' +$(''#P291_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P291_TODATE'').val() + ''",'' + ',
'	     ''"_paramsP_PARTY":"'' + $(''#P291_PARTY'').val() ;',
'         ',
'     ',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(187201275311143545)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(186894187453791355)
,p_plug_name=>'Purchase Party Amount Register'
,p_static_id=>'purchase-party-amount-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  row_number() over(order by CHALLANDATE) SerialNo,',
'    TNO, ',
'    LOADINGADVICENO, ',
'    AGENT, ',
'    CHALLANNO, ',
'    CHALLANDATE, ',
'    SALEPARTYNAME, ',
'    PURCHASEORDERNO, ',
'    PURCHASEPARTYNAME, ',
'    PURCHASEBILLNO, ',
'    PURCHASEORDERDATE, ',
'    PURCHASEBILLDATE, ',
'    PURCHASEAMOUNT, ',
'    POITEM, ',
'    POSPECIFICATION, ',
'    QUANTITY, ',
'    SAUDARATE,',
'     SAUDAAMOUNT, ',
'     PASSEDAMOUNT, ',
'     PARTYPAYMENT, ',
'     BALANCEAMOUNT, ',
'     PAYDATE, ',
'     TDS, ',
'     BASICBEFOREGSTTAX, ',
'     sum(SGST) SGST , ',
'     sum(CGST) CGST, ',
'     sum(IGST) IGST, ',
'     PAYDAYS,',
'     DUEDATE, ',
'     OVERDAYS, ',
'     TRANSPORTERCOMPANY,',
'      VEHICLENO, ',
'      LRNO, ',
'      FREIGHTRATE, ',
'      FREIGHTAMOUNT, ',
'      FREIGHTADVANCE ',
'      PARTYBILLTNO',
' from (',
'select distinct ',
'       ',
'        A.TNO, ',
'        a.LOADINGADVICEno,',
'        getpartyname(so.agentcode)                  agent,',
'        nvl(mi.REFDOCNO , cc.CCINVOICENO)       as challanno,',
'        nvl(mi.REFDOCDATE , cc.CCINVOICEDATE)   as challandate,',
'        GETPARTYNAME(so.partycode)              AS Salepartyname,',
'        po.purchaseorderno                      as purchaseorderno,',
'        getpartyname(po.partycode)              as purchasepartyname, ',
'        pb.PARTYBILLNO                          as purchasebillno,',
'        po.purchaseorderdate                    as purchaseorderdate,',
'        pb.PARTYBILLDATE                        as purchasebilldate,',
'        pbp.totalamount                         as Purchaseamount,',
'        getitemname(po.itemcode)                POITEM,',
'        getitemspecificationname(po.itemcode , po.itemspecificationcode) POSpecification,',
'        pbp.quantity1                           as quantity,',
'        po.RATEAFTERDISCOUNT                    as saudarate,',
'        pbp.quantity1 * po.RATEAFTERDISCOUNT    as saudaamount,',
'        pbp.AMOUNTAFTERTDS                      as passedamount,',
'        nvl(pa.amount,0)                        as partypayment,',
'        pbp.AMOUNTAFTERTDS-nvl(pa.amount,0)     as Balanceamount,',
'        pa.paymentadvicedate                    as paydate,',
'        pbp.footervalue                         as TDS,',
'        pbp.amount                              as basicbeforegsttax,',
'       -- po.footeramount as TAX,',
'       case  when pbp.footerheadcode=''.SGST.'' then',
'        pbp.footervalue1',
'        else',
'        0',
'        end "SGST",  ',
'        case  when pbp.footerheadcode=''.CGST.'' then',
'        pbp.footervalue1',
'        else',
'        0',
'        end "CGST", ',
'        case  when pbp.footerheadcode=''.IGST.'' then',
'        pbp.footervalue1',
'        else',
'        0',
'        end "IGST", ',
'        po.CREDITDAYS                               as Paydays,',
'        pb.purchasebilldate + po.CREDITDAYS                  as duedate,',
'       trunc(sysdate) - (pb.purchasebilldate + po.CREDITDAYS) as overdays,',
'        getpartyname(cc.TRANSPORTERCODE)            as transportercompany,',
'        cc.VEHICLENO,',
'        cc.LORRYNO LRNO,',
'       cc.FREIGHTRATE,',
'       cc.FREIGHTRATE * pbp.quantity1 FREIGHTamount,',
'       cc.FREIGHTADVANCE,',
'       pb.Tno as PartyBillTno',
'         ',
'  from LOADINGADVICE A, LOADINGADVICEDETAIL F, ccinvoice cc ,  grn ,',
'  (',
'        select a.tno , a.purchaseorderno , a.partycode , b.itemcode , b.itemspecificationcode , b.RATEAFTERDISCOUNT ,',
'        a.purchaseorderdate , b.amount , b.quantity1 , b.footeramount , a.CREDITDAYS , c.footerheadcode , c.footervalue',
'        from purchaseorder a , purchaseorderdetail b , purchaseorderdetailfooter c',
'        where a.tno = b.tno',
'        and b.tno = c.tno',
'        and b.sno = c.sno',
'          ',
'    )po ,',
'    (',
'        select a.tno , a.salesorderno, b.itemcode , b.itemspecificationcode , a.agentcode , b.rate ,',
'        b.amount , a.partycode',
'        from SALESORDER a , SALESORDERdetail b',
'        where a.tno = b.tno',
'       ',
'    )so ,',
'    (',
'        select a.tno , a.joborderno, b.itemcode , b.itemspecificationcode',
'        from JOBORDER a , JOBORDERdetail b',
'        where a.tno = b.tno',
'       ',
'    )jo,',
'    (',
'        select a.REFDOCNO , a.REFDOCDATE , a.tno , a.loadingadvicetno , b.itemcode , b.itemspecificationcode ,',
'        a.LRNO',
'        from materialin a , materialindetail b',
'         where a.tno = b.tno',
'        ',
'    )mi,',
'    (',
'        select  a.tno ,  b.itemcode , b.itemspecificationcode , b.quantity1 , a.purchaseordertno , a.purchasebillno , a.purchasebilldate , ',
'                a.PARTYBILLNO , a.PARTYBILLDATE , c.grntno',
'        from purchasebill a , purchasebilldetail b , purchasebillgrndetail c',
'         where a.tno = b.tno',
'         and b.tno = c.tno',
'         and b.sno = c.sno',
'                ',
'    )pb,',
'    (',
'        select  a.tno ,  b.itemcode , b.itemspecificationcode , b.quantity1 , b.amount , a.purchasebilltno , c.FOOTERVALUE ,',
'                b.totalamount , a.AMOUNTAFTERTDS , d.footerheadcode , d.footervalue footervalue1',
'        from pbpass a , pbpassdetail b , PBPASSTDSDETAIL c , pbpassdetailfooter d',
'         where a.tno = b.tno',
'         and a.tno = c.tno',
'         and b.tno = d.tno',
'         and b.sno = d.sno',
'                ',
'    )pbp,',
'    (',
'        select a.paymentadvicedate , b.REFERENCEMODULETNO , sum(b.amount) amount , sum(b.TDSAMOUNT) tds   ',
'        from paymentadvice a , paymentadvicereference b',
'            where a.tno = b.tno',
'            group by a.paymentadvicedate ,b.REFERENCEMODULETNO',
'    )pa',
'  WHERE A.PURCHASEORDERTNO              = po.TNO(+)',
'  AND A.TNO                             = F.TNO',
'    and f.itemcode                      = po.itemcode ',
'    and f.itemspecificationcode         = po.itemspecificationcode',
'    AND A.SALESORDERTNO                 = so.TNO(+)',
'     and f.itemcode                     = so.itemcode(+)',
'    and f.itemspecificationcode         = so.itemspecificationcode(+)',
'    AND A.JOBORDERTNO                   = jo.TNO(+)',
'     and f.itemcode                     = jo.itemcode(+)',
'    and f.itemspecificationcode         = jo.itemspecificationcode(+)',
'     AND A.tno                          = mi.loadingadvicetno(+)',
'     and f.itemcode                     = mi.itemcode(+)',
'    and f.itemspecificationcode         = mi.itemspecificationcode(+)',
'    AND A.purchaseordertno              = pb.purchaseordertno(+)',
'     and f.itemcode                     = pb.itemcode(+)',
'    and f.itemspecificationcode         = pb.itemspecificationcode(+)',
'    ',
'     AND pb.tno                         = pbp.purchasebilltno(+)',
'     and f.itemcode                     = pbp.itemcode(+)',
'    and f.itemspecificationcode         = pbp.itemspecificationcode(+)',
'    ',
'    ',
'    AND pbp.purchasebilltno             = pa.REFERENCEMODULETNO(+)',
'    and a.tno                           = cc.loadingadvicetno(+)',
'    and a.tno = grn.loadingadvicetno(+)',
'    and grn.tno = pb.grntno(+)',
'    --and f.quantity1  = pb.quantity1',
'   --and a.tno = 54995810',
'  and a.loadingadviceDATE between :P291_FROMDATE and :P291_TODATE',
'  and ( :P291_PARTY IS NULL OR instr('':''||:P291_PARTY||'':'','':''||a.SUPPLIERCODE||'':'') > 0 ) ',
'  and ( :P291_LOCATION IS NULL OR instr('':''||:P291_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'  and ( :P291_COMPANY IS NULL OR instr('':''||:P291_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'     and ( :P291_PURCHASEBILL IS NULL OR instr('':''||:P291_PURCHASEBILL||'':'','':''||pb.Tno||'':'') > 0 )  ',
'    ',
'   -- order by A.LOADINGADVICEDATE desc,A.LOADINGADVICENO',
') x',
'group by  TNO, LOADINGADVICENO, AGENT, CHALLANNO, CHALLANDATE, SALEPARTYNAME, PURCHASEORDERNO, PURCHASEPARTYNAME, ',
'PURCHASEBILLNO, PURCHASEORDERDATE, PURCHASEBILLDATE, PURCHASEAMOUNT, POITEM, POSPECIFICATION, QUANTITY, SAUDARATE,',
' SAUDAAMOUNT, PASSEDAMOUNT, PARTYPAYMENT, BALANCEAMOUNT, PAYDATE, TDS, BASICBEFOREGSTTAX,  PAYDAYS,',
' DUEDATE,OVERDAYS,',
'  TRANSPORTERCOMPANY, VEHICLENO, LRNO, FREIGHTRATE, FREIGHTAMOUNT, FREIGHTADVANCE, PARTYBILLTNO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Purchase Party Amount Report'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(186894265155791355)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>18975246689663913
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186895319795791360)
,p_db_column_name=>'AGENT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Agent'
,p_column_html_expression=>'<div style="display:block; width:150px">#AGENT#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186901735511791365)
,p_db_column_name=>'BALANCEAMOUNT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Balance Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#BALANCEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186902977382791366)
,p_db_column_name=>'BASICBEFOREGSTTAX'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Basic Before GST Tax'
,p_column_html_expression=>'<div style="display:block; width:80px">#BASICBEFOREGSTTAX#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189893392316436159)
,p_db_column_name=>'CGST'
,p_display_order=>81
,p_column_identifier=>'AJ'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186896129925791361)
,p_db_column_name=>'CHALLANDATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Challan Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#CHALLANDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186895797323791361)
,p_db_column_name=>'CHALLANNO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Challan No'
,p_column_html_expression=>'<div style="display:block; width:180px">#CHALLANNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186904188896791367)
,p_db_column_name=>'DUEDATE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DUEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186906597189791368)
,p_db_column_name=>'FREIGHTAMOUNT'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Freight Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186906144847791368)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Freight Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTRATE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189893506854436160)
,p_db_column_name=>'IGST'
,p_display_order=>91
,p_column_identifier=>'AK'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185182693404627289)
,p_db_column_name=>'LOADINGADVICENO'
,p_display_order=>41
,p_column_identifier=>'AF'
,p_column_label=>'Loading Advice No'
,p_column_html_expression=>'<div style="display:block; width:160px">#LOADINGADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186905736755791368)
,p_db_column_name=>'LRNO'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'LR No'
,p_column_html_expression=>'<div style="display:block; width:150px">#LRNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202065349640770050)
,p_db_column_name=>'OVERDAYS'
,p_display_order=>121
,p_column_identifier=>'AO'
,p_column_label=>'Overdays'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202066138979770058)
,p_db_column_name=>'PARTYBILLTNO'
,p_display_order=>131
,p_column_identifier=>'AP'
,p_column_label=>'Partybilltno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186901381405791365)
,p_db_column_name=>'PARTYPAYMENT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Party Payment'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYPAYMENT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186901013295791364)
,p_db_column_name=>'PASSEDAMOUNT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Passed Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#PASSEDAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186902137797791365)
,p_db_column_name=>'PAYDATE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Pay Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PAYDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186903722184791366)
,p_db_column_name=>'PAYDAYS'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Paydays'
,p_column_html_expression=>'<div style="display:block; width:80px">#PAYDAYS#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186898961574791363)
,p_db_column_name=>'POITEM'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'PO Item'
,p_column_html_expression=>'<div style="display:block; width:100px">#POITEM#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186899407832791363)
,p_db_column_name=>'POSPECIFICATION'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'PO Specification'
,p_column_html_expression=>'<div style="display:block; width:150px">#POSPECIFICATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186898615093791363)
,p_db_column_name=>'PURCHASEAMOUNT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Purchase Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#PURCHASEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(198962975181630162)
,p_db_column_name=>'PURCHASEBILLDATE'
,p_display_order=>111
,p_column_identifier=>'AN'
,p_column_label=>'Purchasebilldate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186897800709791362)
,p_db_column_name=>'PURCHASEBILLNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Purchase Bill No'
,p_column_html_expression=>'<div style="display:block; width:180px">#PURCHASEBILLNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186898162537791362)
,p_db_column_name=>'PURCHASEORDERDATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'PO Order Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PURCHASEORDERDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186896961670791361)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Purchase Order No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186897348116791362)
,p_db_column_name=>'PURCHASEPARTYNAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Purchase Party Name'
,p_column_html_expression=>'<div style="display:block; width:180px">#PURCHASEPARTYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186899783872791363)
,p_db_column_name=>'QUANTITY'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Quantity'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186896534295791361)
,p_db_column_name=>'SALEPARTYNAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Sale Party Name'
,p_column_html_expression=>'<div style="display:block; width:200px">#SALEPARTYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186900564871791364)
,p_db_column_name=>'SAUDAAMOUNT'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Sauda Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#SAUDAAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186900204524791364)
,p_db_column_name=>'SAUDARATE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Sauda rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#SAUDARATE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189893530689436161)
,p_db_column_name=>'SERIALNO'
,p_display_order=>101
,p_column_identifier=>'AL'
,p_column_label=>'Serialno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189893301007436158)
,p_db_column_name=>'SGST'
,p_display_order=>71
,p_column_identifier=>'AI'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186902560502791365)
,p_db_column_name=>'TDS'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'TDS'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDS#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186894949880791359)
,p_db_column_name=>'TNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186904981460791367)
,p_db_column_name=>'TRANSPORTERCOMPANY'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Transporter Company'
,p_column_html_expression=>'<div style="display:block; width:180px">#TRANSPORTERCOMPANY#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186905399640791368)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Vehicle No'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(186907352436791988)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'189884'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:AGENT:CHALLANNO:CHALLANDATE:SALEPARTYNAME:PURCHASEORDERNO:PURCHASEPARTYNAME:PURCHASEBILLNO:PURCHASEBILLDATE:PURCHASEAMOUNT:POITEM:POSPECIFICATION:QUANTITY:SAUDARATE:SAUDAAMOUNT:PASSEDAMOUNT:PARTYPAYMENT:BALANCEAMOUNT:PAYDATE:TDS:BASICBEFOREG'
||'STTAX:CGST:SGST:IGST:PAYDAYS:DUEDATE:OVERDAYS:TRANSPORTERCOMPANY:VEHICLENO:LRNO:FREIGHTRATE:FREIGHTAMOUNT'
,p_sort_column_1=>'SERIALNO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(189932155206676781)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(186894187453791355)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(187202018975143553)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204604226533101107)
,p_name=>'P291_BIREPORTURL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(187201381870143546)
,p_name=>'P291_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_item_default=>'1'
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = getModuleCodeForPageNo(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and upper(bu.BossUserName) =  upper(''&APP_USER.'')',
'  and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES'''))
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(187201784969143550)
,p_name=>'P291_FROMDATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_item_default=>'sysdate - 7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fromdate'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(187201457952143547)
,p_name=>'P291_LOCATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = getModuleCodeForPageNo(:APP_PAGE_ID)',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
' /* and a.CompanyCode = :P107_COMPANY */',
' and instr('':''||:P291_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P291_COMPANY'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(187201987294143552)
,p_name=>'P291_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname d , partycode r from party  ',
'where partycode in (select distinct SUPPLIERCODE from loadingadvice)'))
,p_cSize=>30
,p_colspan=>6
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202066115767770057)
,p_name=>'P291_PURCHASEBILL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_prompt=>'Purchase Bill No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      a.PartyBillNo d,',
'      a.TNO  r',
'From  PurchaseBill a'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(187201899333143551)
,p_name=>'P291_TODATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(187201275311143545)
,p_item_default=>'sysdate '
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Todate'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189932257419676782)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(189932155206676781)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189932410418676783)
,p_event_id=>wwv_flow_imp.id(189932257419676782)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(185182727942627290)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(185182824222627291)
,p_event_id=>wwv_flow_imp.id(185182727942627290)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
