prompt --application/pages/page_00194
begin
--   Manifest
--     PAGE: 00194
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
 p_id=>194
,p_name=>'Gate Pass Register'
,p_alias=>'GATE-PASS-REGISTER'
,p_step_title=>'Gate Pass Register'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
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
'  var bireporturl = $(''#P194_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/GatePassRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P194_FROMDATE'').val());',
'  var toDate = new Date($(''#P194_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P194_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P194_COMPANY'').val() ==="" || $(''#P194_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P194_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P194_COMPANY'').val();',
'       global_companycode= $(''#P194_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +  ',
'      ''&P_STATUS='' +$(''#P194_STATUS'').val() +   ',
'      ''&P_FROMDATE='' +$(''#P194_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P194_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P194_LOCATION'').val() +',
'      ''&P_PARTY='' +$(''#P194_PARTY'').val() +',
'      ''&P_DOCTYPE='' +$(''#P194_DOCTYPE'').val() +',
'      ''&P_TRANSPORTER='' +$(''#P194_TRANSPORTER'').val() +',
'      ''&P_GATEPASSNO='' +$(''#P194_GATEPASSNO'').val() +',
'      ''&P_ITEM='' +$(''#P194_ITEM'').val() +',
'      ''&P_DEPARTMENT='' +$(''#P194_DEPARTMENT'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P194_ITEMSPECIFICATION'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
'       ',
'      ;',
'  ',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function sd() {',
'        // Get the modal element by ID',
'        if (apex.item(''P146_DOCTYPECODE'').getValue()==''CONVERSIONJOBOUTOFPREMISES'') {',
'                openModal(''StockStorageDetail'');',
'        }',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P194_BIREPORTURL'').val()',
'  var reportName =  ''GatePassRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P194_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P194_COMPANY'').val() ==="" || $(''#P194_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P194_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P194_COMPANY'').val();',
'       global_companycode= $(''#P194_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P194_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' +',
'	  ''"_paramsP_STATUS":"'' +$(''#P194_STATUS'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P194_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P194_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P194_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P194_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P194_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_TRANSPORTER":"'' +$(''#P194_TRANSPORTER'').val() + ''",'' + ',
'	  ''"_paramsP_GATEPASSNO":"'' +$(''#P194_GATEPASSNO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' +$(''#P194_ITEM'').val() + ''",'' +',
'	  ''"_paramsP_DEPARTMENT":"'' + $(''#P194_DEPARTMENT'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P194_ITEMSPECIFICATION'').val() + ''",'' + ',
'      ''"_paramsGLOBAL_COMPANYCODE":"'' +global_companycode;',
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
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(603569163525795584)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(594028798366656767)
,p_plug_name=>'Gate Pass Register Report'
,p_static_id=>'gate-pass-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    A.TNO,',
'    L.LOCATIONNAME,',
'    DT.DOCTYPENAME,',
'    A.GATEPASSNO,',
'    A.GATEPASSDATE,',
'    P.PARTYNAME,',
'    JO.JOBORDERNO,',
'    JO.JOBORDERDATE,',
'    T.PARTYNAME                                          AS TRANSPORTER,',
'    FT.FREIGHTTYPENAME,',
'    VT.VEHICLETYPENAME,',
'    A.VEHICLENO,',
'    A.LORRYNO,',
'    A.LORRYDATE,',
'    A.DRIVERNAME,',
'    B.ITEMCODE,',
'    E.ITEMNAME || '' ~ '' || EE.ITEMSPECIFICATIONNAME     AS ITEMDETAIL,',
'    E.MEASURINGUNITCODE1                                 AS UOM,',
'    B.QUANTITY1,',
'    B.RATE,',
'    B.AMOUNT,',
'    B.FOOTERAMOUNT,',
'    B.TOTALAMOUNT,',
'    A.REMARK,',
'    BUE.EMPLOYEENAME || '' ( '' || A.CREATOR || '' )''      AS CREATOR,',
'    A.CREATIONTIME,',
'    I.ISSUENO,',
'    D.DEPARTMENTNAME,',
'    GETMRNNO(A.MRNTNO)                                   AS MRNNO,',
'    GETSTOCKTRANSFERNO(ST.TNO)                           AS STOCKTRANSFERNO,',
'    ''<A HREF="''',
'        || APEX_UTIL.PREPARE_URL(',
'               ''F?P='' || :APP_ID || '':'' || 9993 || '':'' || :APP_SESSION',
'               || ''::::P9993_TNO,P9993_REPNAME:'' || A.TNO || '',GATEPASS:NO''',
'           )',
'        || ''"><SPAN ARIA-LABEL="ACTION"><SPAN CLASS="FA FA-PRINT" ''',
'        || ''ARIA-HIDDEN="TRUE" TITLE="ACTION"></SPAN></SPAN></A>''  AS PRINT',
'',
'FROM GATEPASS A',
'LEFT JOIN GATEPASSDETAIL        B   ON  B.TNO                  = A.TNO',
'LEFT JOIN LOCATION              L   ON  L.LOCATIONCODE         = A.LOCATIONCODE',
'LEFT JOIN DOCTYPE               DT  ON  DT.DOCTYPECODE         = A.DOCTYPECODE',
'LEFT JOIN PARTY                 P   ON  P.PARTYCODE            = A.PARTYCODE',
'LEFT JOIN JOBORDER              JO  ON  JO.TNO                 = A.JOBORDERTNO',
'LEFT JOIN DEPARTMENT            D   ON  D.DEPARTMENTCODE       = A.DEPARTMENTCODE',
'LEFT JOIN PARTY                 T   ON  T.PARTYCODE            = A.TRANSPORTERCODE',
'LEFT JOIN FREIGHTTYPE           FT  ON  FT.FREIGHTTYPECODE     = A.FREIGHTTYPECODE',
'LEFT JOIN VEHICLETYPE           VT  ON  VT.VEHICLETYPECODE     = A.VEHICLETYPECODE',
'LEFT JOIN ITEM                  E   ON  E.ITEMCODE             = B.ITEMCODE',
'LEFT JOIN ITEMSPECIFICATION     EE  ON  EE.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'LEFT JOIN BOSSUSER              BU  ON  BU.LOGINNAME           = A.CREATOR',
'LEFT JOIN EMPLOYEE              BUE ON  BUE.EMPLOYEECODE       = BU.EMPLOYEECODE',
'LEFT JOIN ISSUE                 I   ON  I.TNO                  = A.REFERENCETNO',
'LEFT JOIN STOCKTRANSFER         ST  ON  ST.MODULETNO           = B.TNO',
'                                    AND ST.ITEMCODE            = B.ITEMCODE',
'                                    AND ST.ITEMSPECIFICATIONCODE = B.ITEMSPECIFICATIONCODE',
'WHERE',
'    --Mandatory filter',
'    A.GATEPASSDATE BETWEEN :P194_FROMDATE AND :P194_TODATE',
'    AND INSTR('':'' || :P194_LOCATION || '':'', '':'' || A.LOCATIONCODE  || '':'') > 0',
'    AND INSTR('':'' || :P194_DOCTYPE  || '':'', '':'' || A.DOCTYPECODE   || '':'') > 0',
'',
'    --Optional filters ',
'    AND (:P194_GATEPASSNO        IS NULL OR INSTR('':'' || :P194_GATEPASSNO        || '':'', '':'' || A.GATEPASSNO            || '':'') > 0)',
'    AND (:P194_COMPANY           IS NULL OR INSTR('':'' || :P194_COMPANY           || '':'', '':'' || A.COMPANYCODE           || '':'') > 0)',
'    AND (:P194_TRANSPORTER       IS NULL OR INSTR('':'' || :P194_TRANSPORTER       || '':'', '':'' || A.TRANSPORTERCODE       || '':'') > 0)',
'    AND (:P194_DEPARTMENT        IS NULL OR INSTR('':'' || :P194_DEPARTMENT        || '':'', '':'' || A.DEPARTMENTCODE        || '':'') > 0)',
'    AND (:P194_PARTY             IS NULL OR INSTR('':'' || :P194_PARTY             || '':'', '':'' || A.PARTYCODE             || '':'') > 0)',
'    AND (:P194_ITEM              IS NULL OR INSTR('':'' || :P194_ITEM              || '':'', '':'' || B.ITEMCODE              || '':'') > 0)',
'    AND (:P194_ITEMSPECIFICATION IS NULL OR INSTR('':'' || :P194_ITEMSPECIFICATION || '':'', '':'' || B.ITEMSPECIFICATIONCODE || '':'') > 0)',
'    AND (:P194_STATUS            IS NULL OR INSTR('':'' || :P194_STATUS            || '':'', '':'' || GETDOCUMENTSTATUSCODE(''GATEPASS'', A.TNO) || '':'') > 0)',
'ORDER BY A.GATEPASSDATE DESC, A.GATEPASSNO',
'',
'',
'',
'-- SELECT XXX.TNO , XXX.LOCATIONNAME,',
'--        XXX.DOCTYPENAME,',
'--        XXX.GATEPASSNO,',
'--        XXX.GATEPASSDATE,',
'--        XXX.PARTYNAME,',
'--      --  XXX.STOREINREPAIRINGITEMNO,',
'--       -- XXX.STOREINREPAIRINGITEMDATE,',
'--        XXX.JOBORDERNO,',
'--        XXX.JOBORDERDATE,',
'--        XXX.TRANSPORTER,',
'--        XXX.FREIGHTTYPENAME,',
'--        XXX.VEHICLETYPENAME,',
'--        XXX.VEHICLENO,',
'--        XXX.LORRYNO,',
'--        XXX.LORRYDATE,',
'--        XXX.DRIVERNAME,',
'--        XXX.ITEMCODE,',
'--        XXX.ITEMDETAIL,',
'--        XXX.UOM,',
'--        XXX.QUANTITY1,',
'--        XXX.RATE,',
'--        XXX.AMOUNT,',
'--      --  XXX.CGST,',
'--       -- XXX.SGST,',
'--       -- XXX.IGST,',
'--       -- XXX.TCS,',
'--        XXX.FOOTERAMOUNT,',
'--        --(XXX.FOOTERAMOUNT - (XXX.CGST + XXX.SGST + XXX.IGST + XXX.TCS)) AS OTHERAMOUNT,',
'--        XXX.TOTALAMOUNT,',
'--        XXX.REMARK,',
'--        XXX.CREATOR,',
'--        XXX.CREATIONTIME,',
'--        XXX.ISSUENO,',
'--   --     XXX.EQUIPMENT,',
'--        XXX.DEPARTMENTNAME,',
'--        XXX.MRNNO,',
'--        XXX.STOCKTRANSFERNO,',
'--                  ''<A HREF="''||APEX_UTIL.PREPARE_URL(''F?P=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||XXX.TNO||'',''||''GATEPASS''||'':NO'')||''"><SPAN ARIA-LABEL="ACTION"><SPAN CLASS="FA FA-PRINT"  ARIA-HIDDEN="TRUE"'
||' TITLE="ACTION"></SPAN</SPAN></A>'' AS PRINT',
'',
'--   FROM (SELECT XX.TNO ,XX.LOCATIONNAME,',
'--                XX.DOCTYPENAME,',
'--                XX.GATEPASSNO,',
'--                XX.GATEPASSDATE,',
'--                XX.PARTYNAME,',
'--              --  XX.STOREINREPAIRINGITEMNO,',
'--              --  XX.STOREINREPAIRINGITEMDATE,',
'--                XX.JOBORDERNO,',
'--                XX.JOBORDERDATE,',
'--                XX.TRANSPORTER,',
'--                XX.FREIGHTTYPENAME,',
'--                XX.VEHICLETYPENAME,',
'--                XX.VEHICLENO,',
'--                XX.LORRYNO,',
'--                XX.LORRYDATE,',
'--                XX.DRIVERNAME,',
'--                XX.ITEMCODE,',
'--                XX.ITEMDETAIL,',
'--                XX.UOM,',
'--                XX.QUANTITY1,',
'--                XX.RATE,',
'--                XX.AMOUNT,',
'--               -- SUM(XX.CGST) CGST,',
'--               -- SUM(XX.SGST) SGST,',
'--                --SUM(XX.IGST) IGST,',
'--                --SUM(XX.TCS) TCS,',
'--                XX.FOOTERAMOUNT,',
'--                XX.TOTALAMOUNT,',
'--                XX.REMARK,',
'--                XX.CREATOR,',
'--                XX.CREATIONTIME,',
'--                XX.ISSUENO,',
'--              --  XX.EQUIPMENT,',
'--                XX.DEPARTMENTNAME,',
'--                XX.MRNNO,',
'--                XX.STOCKTRANSFERNO',
'--           FROM (SELECT A.TNO,',
'--                        L.LOCATIONNAME,',
'--                        DT.DOCTYPENAME,',
'--                        A.GATEPASSNO,',
'--                        A.GATEPASSDATE,',
'--                        P.PARTYNAME,',
'--                       -- SR.STOREINREPAIRINGITEMNO,',
'--                        --SR.STOREINREPAIRINGITEMDATE,',
'--                        JO.JOBORDERNO,',
'--                        JO.JOBORDERDATE,',
'--                        T.PARTYNAME AS TRANSPORTER,',
'--                        FT.FREIGHTTYPENAME,',
'--                        VT.VEHICLETYPENAME,',
'--                        A.VEHICLENO,',
'--                        A.LORRYNO,',
'--                        A.LORRYDATE,',
'--                        A.DRIVERNAME,',
'--                        B.ITEMCODE,',
'--                        E.ITEMNAME || '' ~ '' || EE.ITEMSPECIFICATIONNAME AS ITEMDETAIL,',
'--                        E.MEASURINGUNITCODE1 AS UOM,',
'--                        B.QUANTITY1,',
'--                        B.RATE,',
'--                        B.AMOUNT,',
'--                        /*NVL(DECODE(C.FOOTERHEADCODE, ''.CGST.'', C.FOOTERVALUE),',
'--                            0) CGST,',
'--                        NVL(DECODE(C.FOOTERHEADCODE, ''.SGST.'', C.FOOTERVALUE),',
'--                            0) SGST,',
'--                        NVL(DECODE(C.FOOTERHEADCODE, ''.IGST.'', C.FOOTERVALUE),',
'--                            0) IGST,',
'--                        NVL(DECODE(C.FOOTERHEADCODE, ''.TCS.'', C.FOOTERVALUE),',
'--                            0) TCS,*/',
'--                        B.FOOTERAMOUNT,',
'--                        B.TOTALAMOUNT,',
'--                        A.REMARK,',
'--                        BUE.EMPLOYEENAME || '' ( '' || A.CREATOR || '' )'' AS CREATOR,',
'--                        A.CREATIONTIME,',
'--                        I.ISSUENO,',
'--                       -- EQ.EQUIPMENTNAME || '' ( '' || EQ.EQUIPMENTID || '' )'' AS EQUIPMENT,',
'--                        D.DEPARTMENTNAME,',
'--                        GETMRNNO(A.MRNTNO) AS MRNNO,',
'--                        GETSTOCKTRANSFERNO(ST.TNO) AS STOCKTRANSFERNO',
'--                   FROM GATEPASS                A,',
'--                        GATEPASSDETAIL          B,',
'--                       -- GATEPASSDETAILFOOTER    C,',
'--                       -- GATEPASSEQUIPMENTDETAIL GD,',
'--                        LOCATION                L,',
'--                        DOCTYPE                 DT,',
'--                        PARTY                   P,',
'--                        JOBORDER                JO,',
'--                        PARTY                   T,',
'--                        VEHICLETYPE             VT,',
'--                        FREIGHTTYPE             FT,',
'--                        --STOREINREPAIRINGITEM    SR,',
'--                        DEPARTMENT              D,',
'--                        ITEM                    E,',
'--                        ITEMSPECIFICATION       EE,',
'--                        BOSSUSER                BU,',
'--                        EMPLOYEE                BUE,',
'--                        ISSUE                   I,',
'--                        STOCKTRANSFER           ST',
'--                        --EQUIPMENT               EQ',
'--                  WHERE A.TNO = B.TNO(+)',
'--                   -- AND B.TNO = C.TNO(+)',
'--                   -- AND B.SNO = C.SNO(+)',
'--                   -- AND B.TNO = GD.TNO(+)',
'--                   -- AND B.SNO = GD.SNO(+)',
'--                   -- AND GD.EQUIPMENTTNO = EQ.TNO(+)',
'--                    AND A.LOCATIONCODE = L.LOCATIONCODE(+)',
'--                    AND A.DOCTYPECODE = DT.DOCTYPECODE(+)',
'--                    AND A.PARTYCODE = P.PARTYCODE(+)',
'--                    AND A.JOBORDERTNO = JO.TNO(+)',
'--                    AND A.DEPARTMENTCODE = D.DEPARTMENTCODE(+)',
'--                    AND A.TRANSPORTERCODE = T.PARTYCODE(+)',
'--                    AND A.FREIGHTTYPECODE = FT.FREIGHTTYPECODE(+)',
'--                    AND A.VEHICLETYPECODE = VT.VEHICLETYPECODE(+)',
'--                    --AND A.STOREINREPAIRINGITEMTNO = SR.TNO(+)',
'--                    AND B.ITEMCODE = E.ITEMCODE(+)',
'--                    AND B.ITEMSPECIFICATIONCODE = EE.ITEMSPECIFICATIONCODE(+)',
'--                    AND A.CREATOR = BU.LOGINNAME(+)',
'--                    AND BU.EMPLOYEECODE = BUE.EMPLOYEECODE(+)',
'--                    AND A.REFERENCETNO = I.TNO(+)',
'--                    AND B.TNO = ST.MODULETNO(+)',
'--                    AND B.ITEMCODE =ST.ITEMCODE(+)',
'--                     AND B.ITEMSPECIFICATIONCODE =ST.ITEMSPECIFICATIONCODE(+)',
'--                     AND A.GATEPASSDATE BETWEEN :P194_FROMDATE AND :P194_TODATE',
'-- --                    --AND A.COMPANYCODE = :P194_COMPANY',
'-- --                    AND A.GATEPASSNO LIKE NVL(:P194_GATEPASSNO,''%'')',
'--                     AND ( :P194_GATEPASSNO IS NULL OR INSTR('':''||:P194_GATEPASSNO||'':'','':''||A.GATEPASSNO||'':'') > 0 ) ',
'--                     AND ( :P194_COMPANY IS NULL OR INSTR('':''||:P194_COMPANY||'':'','':''||A.COMPANYCODE||'':'') > 0 ) ',
'--                     AND INSTR('':''||:P194_LOCATION||'':'','':''||A.LOCATIONCODE||'':'') > 0',
'--                     AND INSTR('':''||:P194_DOCTYPE||'':'','':''||A.DOCTYPECODE||'':'') > 0',
'--                     AND ( :P194_ITEM IS NULL OR INSTR('':''||:P194_ITEM||'':'','':''||E.ITEMCODE||'':'') > 0 ) ',
'--                     AND ( :P194_ITEMSPECIFICATION IS NULL OR INSTR('':''||:P194_ITEMSPECIFICATION||'':'','':''||EE.ITEMSPECIFICATIONCODE||'':'') > 0 ) ',
'--                     AND ( :P194_TRANSPORTER IS NULL OR INSTR('':''||:P194_TRANSPORTER||'':'','':''||A.TRANSPORTERCODE||'':'') > 0 ) ',
'--                     AND ( :P194_DEPARTMENT IS NULL OR INSTR('':''||:P194_DEPARTMENT||'':'','':''||A.DEPARTMENTCODE||'':'') > 0 ) ',
'--                     AND ( :P194_PARTY IS NULL OR INSTR('':''||:P194_PARTY||'':'','':''||A.PARTYCODE||'':'') > 0 ) ',
'--                     AND ( :P194_STATUS IS NULL OR INSTR('':''||:P194_STATUS||'':'','':''||GETDOCUMENTSTATUSCODE(''GATEPASS'',A.TNO)||'':'') > 0 )',
'--                 ) XX',
'--          GROUP BY XX.TNO , XX.LOCATIONNAME,',
'--                   XX.DOCTYPENAME,',
'--                   XX.GATEPASSNO,',
'--                   XX.GATEPASSDATE,',
'--                   XX.PARTYNAME,',
'--                   --XX.STOREINREPAIRINGITEMNO,',
'--                  -- XX.STOREINREPAIRINGITEMDATE,',
'--                   XX.JOBORDERNO,',
'--                   XX.JOBORDERDATE,',
'--                   XX.TRANSPORTER,',
'--                   XX.FREIGHTTYPENAME,',
'--                   XX.VEHICLETYPENAME,',
'--                   XX.VEHICLENO,',
'--                   XX.LORRYNO,',
'--                   XX.LORRYDATE,',
'--                   XX.DRIVERNAME,',
'--                   XX.ITEMCODE,',
'--                   XX.ITEMDETAIL,',
'--                   XX.UOM,',
'--                   XX.QUANTITY1,',
'--                   XX.RATE,',
'--                   XX.AMOUNT,',
'--                   XX.FOOTERAMOUNT,',
'--                   XX.TOTALAMOUNT,',
'--                   XX.REMARK,',
'--                   XX.CREATOR,',
'--                   XX.CREATIONTIME,',
'--                   XX.ISSUENO,',
'--                   --XX.EQUIPMENT,',
'--                   XX.DEPARTMENTNAME,',
'--                   XX.MRNNO,',
'--                   XX.STOCKTRANSFERNO) XXX',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Dispatch Advice Register'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(616331396054119794)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.::P195_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>177346526854421810
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463880852234150182)
,p_db_column_name=>'AMOUNT'
,p_display_order=>400
,p_column_identifier=>'AV'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463882447140150183)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>550
,p_column_identifier=>'BK'
,p_column_label=>'TIMESTAMP'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463882033946150183)
,p_db_column_name=>'CREATOR'
,p_display_order=>540
,p_column_identifier=>'BJ'
,p_column_label=>'USER (RAISED BY)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463891131063152112)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>960
,p_column_identifier=>'DL'
,p_column_label=>'DEPARTMENT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463878813758150182)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715982182716452)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>860
,p_column_identifier=>'DB'
,p_column_label=>'DRIVER NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463881229421150183)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>450
,p_column_identifier=>'BA'
,p_column_label=>'FOOTERAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715477469716447)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>810
,p_column_identifier=>'CW'
,p_column_label=>'FREIGHT TYPE NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463714807089716440)
,p_db_column_name=>'GATEPASSDATE'
,p_display_order=>740
,p_column_identifier=>'CP'
,p_column_label=>'GATEPASS DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463714736544716439)
,p_db_column_name=>'GATEPASSNO'
,p_display_order=>730
,p_column_identifier=>'CO'
,p_column_label=>'GATEPASS NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463890957908152110)
,p_db_column_name=>'ISSUENO'
,p_display_order=>940
,p_column_identifier=>'DJ'
,p_column_label=>'ISSUE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463879675661150182)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463890234154152103)
,p_db_column_name=>'ITEMDETAIL'
,p_display_order=>870
,p_column_identifier=>'DC'
,p_column_label=>'ITEM DETAIL'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715321338716445)
,p_db_column_name=>'JOBORDERDATE'
,p_display_order=>790
,p_column_identifier=>'CU'
,p_column_label=>'JOBORDER DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715276179716444)
,p_db_column_name=>'JOBORDERNO'
,p_display_order=>780
,p_column_identifier=>'CT'
,p_column_label=>'JOBORDER NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463878380877150181)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715877417716451)
,p_db_column_name=>'LORRYDATE'
,p_display_order=>850
,p_column_identifier=>'DA'
,p_column_label=>'LR DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715841047716450)
,p_db_column_name=>'LORRYNO'
,p_display_order=>840
,p_column_identifier=>'CZ'
,p_column_label=>'LR NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462518340195715706)
,p_db_column_name=>'MRNNO'
,p_display_order=>980
,p_column_identifier=>'DN'
,p_column_label=>'MRN No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463714905582716441)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>750
,p_column_identifier=>'CQ'
,p_column_label=>'PARTY NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291366806498173271)
,p_db_column_name=>'PRINT'
,p_display_order=>1000
,p_column_identifier=>'DP'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463880024586150182)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463880425309150182)
,p_db_column_name=>'RATE'
,p_display_order=>390
,p_column_identifier=>'AU'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463874476933150180)
,p_db_column_name=>'REMARK'
,p_display_order=>720
,p_column_identifier=>'CF'
,p_column_label=>'REMARK'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462518370885715707)
,p_db_column_name=>'STOCKTRANSFERNO'
,p_display_order=>990
,p_column_identifier=>'DO'
,p_column_label=>'Stock Transfer No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445916982789617217)
,p_db_column_name=>'TNO'
,p_display_order=>970
,p_column_identifier=>'DM'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463881594220150183)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>470
,p_column_identifier=>'BC'
,p_column_label=>'TOTALAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715408417716446)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>800
,p_column_identifier=>'CV'
,p_column_label=>'TRANSPORTER'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463890344004152104)
,p_db_column_name=>'UOM'
,p_display_order=>880
,p_column_identifier=>'DD'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715742873716449)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>830
,p_column_identifier=>'CY'
,p_column_label=>'VEHICLE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463715637717716448)
,p_db_column_name=>'VEHICLETYPENAME'
,p_display_order=>820
,p_column_identifier=>'CX'
,p_column_label=>'VEHICLE TYPE NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(616394588506125328)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'102240'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:LOCATIONNAME:DOCTYPENAME:PARTYNAME:GATEPASSNO:GATEPASSDATE:DEPARTMENTNAME:JOBORDERNO:MRNNO:STOCKTRANSFERNO:ITEMDETAIL:QUANTITY1:UOM:RATE:AMOUNT:TOTALAMOUNT:TRANSPORTER:FREIGHTTYPENAME:VEHICLETYPENAME:VEHICLENO:LORRYNO:LORRYDATE:DRIVERNAME:REMAR'
||'K:CREATOR:CREATIONTIME'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445916941492617216)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(594028798366656767)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(446808862061253269)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(594028798366656767)
,p_button_name=>'CUSTOM2'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/ccinvoiceregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P194_FROMDATE=&P194_FROMDATE.&P194_TODATE=&P194_TODATE.&P194_LOCATION=&P194_LOCATION.&P194_DOCTYPE=&P194_DOCTYPE.&P194_PARTY=&P194_PARTY.&P194_TRANSPORTER=&P194_TRANSPORTER.&P194_ITEM=&P194_ITEM.&P194_ITEMSPECIFICATION=&P194_ITEMSPECIFICATION.&P194_CCINO=&P194_CCINO.&P194_VEHICLENO=&P194_VEHICLENO.&P194_VSTATUS=&P194_VSTATUS.&P194_MISTATUS=&P194_MISTATUS.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445916855787617215)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(594028798366656767)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(446809242395253270)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(594028798366656767)
,p_button_name=>'PDF2'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(446810061866253271)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447304890521079973)
,p_name=>'P194_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463897743598150228)
,p_name=>'P194_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''CCINVOICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(463901663678150229)
,p_name=>'P194_DEPARTMENT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Department'
,p_placeholder=>'Enter Department No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct p.DepartmentName d, p.DepartmentCode r',
'  From GatePass a, Department p',
' Where a.DepartmentCode = p.DepartmentCode',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>28
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(463900110923150228)
,p_name=>'P194_DOCTYPE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'DocType'
,p_placeholder=>'Enter DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      dt.DocTypeName d,',
'      dt.DocTypeCode r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = ''GATEPASS''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463898510792150228)
,p_name=>'P194_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_item_default=>'select sysdate - 7 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463900911824150229)
,p_name=>'P194_GATEPASSNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Gate Pass No'
,p_placeholder=>'Enter GatePass  No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.GatePassNo d, a.GatePassNo r',
'  From GatePass a',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>28
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(463901278669150229)
,p_name=>'P194_ITEM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ItemName||'' ( ''||ItemCode||'' )'' as d,',
'      ItemCode r',
'From  Item e',
''))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463902077721150229)
,p_name=>'P194_ITEMSPECIFICATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'     ee.ItemSpecificationName as d,',
'     ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P194_ITEM',
'  and e.TNo = ee.TNo',
'Order by 1'))
,p_lov_cascade_parent_items=>'P194_ITEM'
,p_ajax_items_to_submit=>'P194_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463899327576150228)
,p_name=>'P194_LOCATION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Location'
,p_placeholder=>'Enter  Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''CCINVOICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463899702492150228)
,p_name=>'P194_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ',
'       PartyName d,',
'       PartyCode r',
'From  Party ',
''))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463898071638150228)
,p_name=>'P194_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NONACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447963259489502310)
,p_name=>'P194_TNO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463898864601150228)
,p_name=>'P194_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463900510247150229)
,p_name=>'P194_TRANSPORTER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(603569163525795584)
,p_prompt=>'Transporter'
,p_placeholder=>'Transporter Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From gatepass a, Party p',
'Where a.TransporterCode = p.PartyCode',
'Order by 1'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(446814631909253276)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(446809242395253270)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(446815122760253277)
,p_event_id=>wwv_flow_imp.id(446814631909253276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/Gate Pass Register Report.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_'
||'xpt":"1","_paramsP_COMPANY":"&P194_COMPANY.","_paramsP_STATUS":"&P194_STATUS.","_paramsP_FROMDATE":"&P194_FROMDATE.","_paramsP_TODATE":"&P194_TODATE.","_paramsP_LOCATION":"&P194_LOCATION.","_paramsP_PARTY":"&P194_PARTY.","_paramsP_DOCTYPE":"&P194_DOC'
||'TYPE.","_paramsP_TRANSPORTER":"&P194_TRANSPORTER.","_paramsP_GATEPASSNO":"&P194_GATEPASSNO.","_paramsP_ITEM":"&P194_ITEM.","_paramsP_DEPARTMENT":"&P194_DEPARTMENT.","_paramsP_ITEMSPECIFICATION":"&P194_ITEMSPECIFICATION."}'');',
    '  */',
    '  generatePDF_new();                                                                                 ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451809429866682828)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451809475097682829)
,p_event_id=>wwv_flow_imp.id(451809429866682828)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(446814213009253275)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P194_CCINO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P194_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P194_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7829343809555291
);
wwv_flow_imp.component_end;
end;
/
