WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>''2026.03.30''
,p_release=>''26.1.2''
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>''IMART''
);
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 1 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('begin
  -- replace components
  wwv_flow_imp.g_mode := ''REPLACE'';
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 2 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>50);
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 3 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('begin
wwv_flow_imp_page.create_page(
 p_id=>50
,p_name=>''Measuring Unit List''
,p_alias=>''MEASURING-UNIT-LIST''
,p_step_title=>''Measuring Unit List''
,p_autocomplete_on_off=>''OFF''
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'''',
''<script id="hspl-sidebar-head-state">'',
''(function(d){'',
''  var state=''''closed'''';'',
''  try {'',
''    var saved=window.localStorage.getItem(''''imart.sidebar.state.v1'''');'',
''    if(saved===''''open''''||saved===''''closed'''') state=saved;'',
''  } catch(ignore) {}'',
''  d.classList.remove(state===''''open''''?''''hspl-nav-target-closed'''':''''hspl-nav-target-open'''');'',
''  d.classList.add(state===''''open''''?''''hspl-nav-target-open'''':''''hspl-nav-target-closed'''');'',
''})(document.documentElement);'',
''</script>'',
''<!-- IMART_REGISTER_INITIAL_PAINT_20261006: only register page 50 -->'',
''<style id="imart-register-initial-paint-50">'',
'''',
''html.page-50 #R579865637102746482 .a-IRR-table th.a-IRR-header{font-size:10.5px!important;font-weight:700!important;letter-spacing:.08em!important;line-height:1.35!important;padding:7px 12px!important;border:1px solid #e7e9f0!important;background-col''
||''or:#e6e8f7!important}'',
''html.page-50 #R579865637102746482 .a-IRR-table th.a-IRR-header .a-IRR-headerLink{font-size:10.5px!important;font-weight:700!important;letter-spacing:.08em!important;color:#5b5bd6!important}'',
''html.page-50 #R579865637102746482 .a-IRR-table tbody td{font-size:12px!important;padding:7px 12px!important;border:1px solid #e7e9f0!important;line-height:1.32!important}'',
''html.page-50 #R579865637102746482 .a-IRR-table td:not(:has(input,select,textarea,button)) :is(div,span,a):not(.fa):not(.a-Icon){font-size:inherit!important}'',
''html.page-50 #R579865637102746482 .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]){background-color:#f3f6fc!important}'',
''html.page-50 #R579865637102746482 .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]){background-color:#fff!important}'',
'''',
''/* IMART106_HEADER_LABEL_CENTER: keep existing link height/padding/colors. */'',
''html.page-50 #R579865637102746482 .a-IRR-table th.a-IRR-header > .a-IRR-headerLink{display:block!important;align-content:center!important;}'',
''html.page-50 #R579865637102746482 .a-IRR-table th.a-IRR-header.u-tR > .a-IRR-headerLink{justify-content:flex-end;}'',
''html.page-50 #R579865637102746482 .a-IRR-table th.a-IRR-header.u-tC > .a-IRR-headerLink{justify-content:center;}'',
''</style>'',
'''',
''<!-- IMART_REGISTER_STATIC_TRACKS_20261006 -->'',
''<link rel="stylesheet" href="/ords/#APP_FILES#imart-register-static-tracks-20261006.css" data-imart-register-tracks="50">'',
'''',
''<!-- IMART105_NATIVE_FILL_1010_BEGIN -->'',
''<style>'',
''/* Length-only column math; table-cell percentage math may resolve as auto. */'',
''@supports (width:1cqw) and (container-type:inline-size){'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-tableContainer{container-type:inline-size;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))){--imart-fill-base-0:0px;--imart-fill-w-0:0;--imart-fill-base-1:0px;--imart-fill-w-1:0;--imart-fill-base-2:0px;--imart-fill-w-2:0;--imart-fill-base-3''
||'':0px;--imart-fill-w-3:0;--imart-fill-base-4:0px;--imart-fill-w-4:0;--imart-fill-base-5:0px;--imart-fill-w-5:0;--imart-fill-base-6:0px;--imart-fill-w-6:0;--imart-fill-base-7:0px;--imart-fill-w-7:0;--imart-fill-base-8:0px;--imart-fill-w-8:0;--imart-fil''
||''l-total:calc(var(--imart-fill-base-0) + var(--imart-fill-base-1) + var(--imart-fill-base-2) + var(--imart-fill-base-3) + var(--imart-fill-base-4) + var(--imart-fill-base-5) + var(--imart-fill-base-6) + var(--imart-fill-base-7) + var(--imart-fill-base''
||''-8));--imart-fill-weight:calc(var(--imart-fill-w-0) + var(--imart-fill-w-1) + var(--imart-fill-w-2) + var(--imart-fill-w-3) + var(--imart-fill-w-4) + var(--imart-fill-w-5) + var(--imart-fill-w-6) + var(--imart-fill-w-7) + var(--imart-fill-w-8));}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="R579865637102746482_LINK"]){--imart-fill-base-0:48px;--imart-fill-w-0:0;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C579866509341746484"]){--imart-fill-base-1:160px;--imart-fill-w-1:0;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5798665093''
||''41746484"]){--imart-fill-w-1:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C579866919907746485"]){--ima') ||
to_clob('rt-fill-base-2:160px;--imart-fill-w-2:0;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5798669199''
||''07746485"]){--imart-fill-w-2:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C579867288090746485"]){--imart-fill-base-3:140px;--imart-fill-w-3:0;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5798672880''
||''90746485"]){--imart-fill-w-3:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C579868460147746485"]){--imart-fill-base-4:196px;--imart-fill-w-4:2;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5798684601''
||''47746485"]){--imart-fill-w-4:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C579869650823746486"]){--imart-fill-base-5:134px;--imart-fill-w-5:0;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5798696508''
||''23746486"]){--imart-fill-w-5:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C579870477115746486"]){--imart-fill-base-6:250px;--imart-fill-w-6:3;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5798704771''
||''15746486"]){--imart-fill-w-6:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C579871337012746486"]){--imart-fill-base-7:220px;--imart-fill-w-7:2;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5798713370''
||''12746486"]){--imart-fill-w-7:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th[id="C577830291263300469"]){--imart-fill-base-8:170px;--imart-fill-w-8:1;}'',
''html.page-50 #R579865637102746482') ||
to_clob('.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):not(:has(th:is([id="C579868460147746485"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"]))):has(th[id="C5778302912''
||''63300469"]){--imart-fill-w-8:1;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))):has(th:is([id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C579869650823746486"],[id''
||''="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])){width:max(100cqw,var(--imart-fill-total))!important;min-width:var(--imart-fill-total)!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="R579865637102746482_LINK"],td[headers~="R579865637102746482_LINK"]){width:max(48px,calc(48px + max(0px,100cqw - var(--imart-fill-total))*''
||''var(--imart-fill-w-0)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C579866509341746484"],td[headers~="C579866509341746484"]){width:max(160px,calc(160px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-1)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C579866919907746485"],td[headers~="C579866919907746485"]){width:max(160px,calc(160px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-2)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C579867288090746485"],td[headers~="C579867288090746485"]){width:max(140px,calc(140px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-3)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C579868460147746485"],td[headers~="C579868460147746485"]){width:max(196px,calc(196px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-4)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C579869650823746486"],td[headers~="C579869650823746486"]){width:max(134px,calc(134px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-5)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C579870477115746486"],td[headers~="C579870477115746486"]){width:max(250px,calc(250px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-6)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C579871337012746486"],td[headers~="C579871337012746486"]){width:max(220px,calc(220px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-7)/max(1,var(--imart-fill-weight))))!important;}'',
''html.page-50 #R579865637102746482.imart-sizing-off .a-IRR-table:has(th[id]):not(:has(th[id]:not(:is([id="R579865637102746482_LINK"],[id="C579866509341746484"],[id="C579866919907746485"],[id="C579867288090') ||
to_clob('746485"],[id="C579868460147746485"],[id="C5798''
||''69650823746486"],[id="C579870477115746486"],[id="C579871337012746486"],[id="C577830291263300469"])))) :is(th[id="C577830291263300469"],td[headers~="C577830291263300469"]){width:max(170px,calc(170px + max(0px,100cqw - var(--imart-fill-total))*var(--im''
||''art-fill-w-8)/max(1,var(--imart-fill-weight))))!important;}'',
''}'',
''</style>'',
''<!-- IMART105_NATIVE_FILL_1010_END -->''))
,p_javascript_file_urls=>''#APP_FILES#imart-register-finder-all.js?initial105=1&v=20261005a''
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'''',
''/* IMART_REGISTER_FINDER_ALL_V1 */'',
''IMARTRegisterFinder.init({"pageId":50,"regionSelector":"#R579865637102746482","process":"IMART_REGISTER_RECORD_FINDER_ALL","title":"Search Measuring Unit Records","placeholder":"Search measuring unit records...","description":"Type to find and open a''
||''ny measuring unit available to your user","columns":[{"key":"record","label":"Measuring Unit","width":"39.0%"},{"key":"code","label":"Code","width":"18.6%"},{"key":"description","label":"Description","width":"42.4%"}]});'',
''/* IMART_COMPLETED_50_0_INITIAL_COLLAPSE: native presentation only. */'',
''(function(){'',
'' var panel=document.getElementById(''''R579865637102746482_control_panel'''');'',
'' if(!panel)return;'',
'' apex.theme.closeRegion(''''R579865637102746482_control_panel'''');'',
'' document.getElementById(''''R579865637102746482'''').setAttribute(''''data-imart-initial-collapse'''',''''ready'''');'',
''})();'',
''''))
,p_css_file_urls=>''#APP_FILES#imart-register-finder-all.css?v=20261005a''
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'':root{'',
''    --a-menu-font-size: 1.25rem !important;'',
''}'',
''/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */'',
''details#hspl-keyboard-help{display:none!important}'',
'''',
''/* IMART_MASTER_CARD_COMPACT_20261005: ONLY master list 50; existing KPIs, maximum four desktop tracks. */'',
''html #t_Body_content #mr-register-kpis-50{margin:0 0 3px!important;padding:6px 8px!important;border-radius:10px!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-grid{display:grid!important;grid-template-columns:repeat(auto-fit,minmax(min(100%,270px),270px))!important;grid-auto-columns:auto!important;max-width:1104px!important;justify-content:start!important;g''
||''ap:8px!important;min-height:0!important;align-items:start!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-inline-kpi{box-sizing:border-box!important;width:100%!important;min-width:0!important;max-width:none!important;height:82px!important;min-height:82px!important;max-height:82px!important;padding:8px 10px!im''
||''portant;border-radius:9px!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-card-body{min-height:0!important;gap:6px!important;padding:0!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-card-icon{width:26px!important;height:26px!important;border-radius:8px!important;font-size:14px!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-status{margin:0!important;font-size:10px!important;line-height:1.2!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-inline-kpi strong{margin:0!important;font-size:22px!important;line-height:1!important;letter-spacing:-.3px!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-share{margin:1px 0!important;font-size:9.5px!important;line-height:1.2!important;white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-card-bottom{padding-top:3px!important;gap:5px!important;font-size:9.5px!important;line-height:1.2!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-wave{width:40px!important;height:15px!important;bottom:4px!important;opacity:.24!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-method{margin-top:3px!important;font-size:10px!important;line-height:1.15!important}'',
''@media(max-width:580px){html #t_Body_content #mr-register-kpis-50 .mr-kpi-grid{grid-template-columns:minmax(0,270px)!important}}'',
'''',
''/* IMART_COMPLETED_50_0_REGISTER_PREVIEW_V1: ONLY KPI group mr-register-kpis-50. Initial native disclosure, no delayed collapse. */'',
''#imart-register-50-breadcrumb{margin:0 0 3px;padding:0 2px;color:#64748b;font-size:11px;line-height:18px}'',
''#imart-register-50-breadcrumb ol{display:flex;align-items:center;flex-wrap:wrap;gap:7px;list-style:none;padding:0;margin:0}'',
''#imart-register-50-breadcrumb li+li::before{content:"/";margin-right:7px;color:#94a3b8}'',
''#imart-register-50-breadcrumb [aria-current="page"]{color:#334155;font-weight:600}'',
''#imart-register-50-kpi-disclosure{margin:0 0 3px;border:1px solid #e0e5f2;border-radius:10px;background:linear-gradient(120deg,#fff 65%,#faf9ff)}'',
''#imart-register-50-kpi-disclosure>summary{display:flex;align-items:center;gap:8px;min-height:34px;padding:7px 11px;box-sizing:border-box;cursor:pointer;list-style:none;font-size:12px;font-weight:600;color:#596781}'',
''#imart-register-50-kpi-disclosure>summary::-webkit-details-marker{display:none}'',
''#imart-register-50-kpi-disclosure>summary>.fa{color:#6658d7;font-size:14px}'',
''#imart-register-50-kpi-disclosure>summary:focus-visible{outline:2px solid #6658d7;outline-offset:2px;border-radius:9px}'',
''#imart-register-50-kpi-disclosure .imart-register-50-kpi-caption{font-size:11px;font-weight:400;color:#8790a3;margin-left:6px}'',
''#imart-register-50-kpi-disclosure .imart-register-50-kpi-show,#imart-register-50-kpi-disclosure .imart-register-50-kpi-hide{margin-left:auto;font-size:11px;color:#6658d7}'',
''#imart-register-50-kpi-disclosure .imart-register-50-kpi-hide{display:none}'',
''#imart-register-50-kpi-disclosure[open] .imart-register-50-kpi-show{display:none}'',
''#imart-register-50-kpi-disclosure[open] .imart-register-50-kpi-hide{display:inline}'',
''#imart-register-50-kpi-disclosure .imart-register-50-kpi-chevron{width:6px;height:6px;border-right:1.5px solid currentColor;border-bottom:1.5px solid currentColor;transform:rotate(45deg);margin:0 3px 3px 6px}'',
''#imart') ||
to_clob('-register-50-kpi-disclosure[open] .imart-register-50-kpi-chevron{transform:rotate(225deg);margin-bottom:0}'',
''html #t_Body_content #mr-register-kpis-50{margin:0!important;border:0!important;box-shadow:none!important;padding:4px 8px 6px!important;background:transparent!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-grid{display:grid!important;grid-template-columns:repeat(auto-fit,minmax(min(100%,270px),270px))!important;grid-auto-columns:auto!important;max-width:1104px!important;justify-content:start!important;g''
||''ap:8px!important;min-height:0!important;align-items:start!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-inline-kpi{box-sizing:border-box!important;width:100%!important;min-width:0!important;max-width:none!important;height:82px!important;min-height:82px!important;max-height:82px!important;padding:8px 10px!im''
||''portant;border-radius:9px!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-card-body{min-height:0!important;gap:6px!important;padding:0!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-card-icon{width:26px!important;height:26px!important;border-radius:8px!important;font-size:14px!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-status{margin:0!important;font-size:10px!important;line-height:1.2!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-inline-kpi strong{margin:0!important;font-size:22px!important;line-height:1!important;letter-spacing:-.3px!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-share{margin:1px 0!important;font-size:9.5px!important;line-height:1.2!important;white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-card-bottom{padding-top:3px!important;gap:5px!important;font-size:9.5px!important;line-height:1.2!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-wave{width:40px!important;height:15px!important;bottom:4px!important;opacity:.24!important}'',
''html #t_Body_content #mr-register-kpis-50 .mr-kpi-method{margin-top:3px!important;font-size:10px!important;line-height:1.15!important}'',
''/* Report highlight settings stay native and available. Collapse initial content before native initialization; expansion restores it. */'',
''#R579865637102746482:not([data-imart-initial-collapse="ready"]) #R579865637102746482_control_panel>.a-MediaBlock-content{display:none!important}'',
''#R579865637102746482:not([data-imart-initial-collapse="ready"]) #R579865637102746482_control_panel>.a-IRR-reportSummaryContainer{display:block!important}'',
'''',
''/* IMART_COMPLETED_50_0_NATIVE_COLLAPSED_SUMMARY_V1: retain the native highlight summary when initialized closed. */'',
''#R579865637102746482_control_panel.is-collapsed>.a-IRR-reportSummaryContainer{display:block!important}'',
'''',
''@media(max-width:580px){html #t_Body_content #mr-register-kpis-50 .mr-kpi-grid{grid-template-columns:minmax(0,270px)!important}}'',
'''',
''/* IMART_KPI_POINTER_FOCUS_20261005: only existing KPI summary controls. */'',
''html #t_Body_content #imart-register-50-kpi-disclosure>summary,'',
''html #t_Body_content #imart-register-50-kpi-disclosure>summary *{user-select:none;-webkit-user-select:none}'',
''html #t_Body_content #imart-register-50-kpi-disclosure>summary:focus:not(:focus-visible){outline:none!important;box-shadow:none!important}'',
''''))
,p_step_template=>wwv_flow_imp.id(95002006000005)
,p_page_template_options=>''#DEFAULT#''
,p_protection_level=>''C''
,p_page_component_map=>''18''
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579865637102746482)
,p_plug_name=>''Measuring Unit List''
,p_static_id=>''measuring-unit-list''
,p_region_css_classes=>''imart-register-data imart-sizing-off''
,p_region_template_options=>''#DEFAULT#''
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>''ABOVE''
,p_query_type=>''SQL''
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
''select mr_source.* from (select TNO,'',
''       MEASURINGUNITCODE,'',
''       MEASURINGUNITNAME,'',
''       DECIMALPLACE,'',
''       DATECRATED,'',
''       DATEMODIFY,'',
''       ISWEIGHMENTREQUIRED,'',
''       DIVISORFACTOR,'',
''       MULTIPLYINGFACTOR,'',
''       GSTUQCCODE,'',
''       FORMANPOWER,'',
''       REMARK,'',
''       to_char(CREATIONTIME,''''DD-MM-YYYY HH24:MI:SS'''') CREATIONTIME,'',
''       CREATOR'',
''  from MEASURINGUNIT'',
''  Order By CREATIONTIME DESC'',
'') mr_source where ((select imart_register_kpis.selected_mode(50) from dual)=''''ALL'''' or ((select imart_register_kpis.selected_mode(50) from dual)=''''STATUS'''' and nvl(trim(cast((select ds.documentstatuscode from documentstatusdetail ds where ds.modulecode=''''''
||''MEASURINGUNIT'''' and ds.moduletno=mr_source.TNO fetch first 1 row only) as varchar2(4000))),chr(1))=nvl((select imart_register_kpis.selected_status(50) from dual),chr(1))) or ((select imart_register_kpis.selected_mode(50) from dual)=''''RECENT'''' and exists''
||''(select 1 from MEASURINGUNIT mr_created where mr_created.TNO=mr_source.TNO and mr_created.CREATIONTIME >= sysdate-7 and mr_created.CREATIONTIME <= sysdate)) or ((select imart_register_kpis.selected_mode(50) from dual)=''''MINE'''' and exists(select 1 from ''
||''MEASURINGUNIT mr_created where mr_created.TNO=mr_source.TNO and (upper(trim(mr_created.CREATOR))=upper(trim(:APP_USER)) or exists(select 1 from bossuser mr_creator_identity where upper(trim(mr_creator_identity.bossusername))=upper(trim(:APP_USER)) and upper(trim(mr_creator_identity.loginname))=upper(trim(mr_created.CREATOR)))))))''))
,p_plug_source_type=>''NATIVE_IR''
,p_prn_page_header=>''Measuring Unit List''
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(579865669777746482)
,p_max_row_count_message=>''The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.''
,p_no_data_found_message=>''No data found.''
,p_allow_save_rpt_public=>''Y''
,p_pagination_type=>''ROWS_X_TO_Y''
,p_pagination_') ||
to_clob('display_pos=>''BOTTOM_RIGHT''
,p_show_display_row_count=>''Y''
,p_report_list_mode=>''TABS''
,p_lazy_loading=>false
,p_show_detail_link=>''C''
,p_show_rows_per_page=>''N''
,p_show_notify=>''Y''
,p_download_formats=>''CSV:HTML:XLSX:PDF''
,p_enable_mail_download=>''Y''
,p_detail_link=>''f?p=&APP_ID.:51:&APP_SESSION.::&DEBUG.:RP:P51_TNO:\#TNO#\''
,p_detail_link_text=>''<span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>''
,p_internal_uid=>139479324526819958
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(577830291263300469)
,p_db_column_name=>''CREATIONTIME''
,p_display_order=>32
,p_column_identifier=>''O''
,p_column_label=>''Creation Time''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579871337012746486)
,p_db_column_name=>''CREATOR''
,p_display_order=>22
,p_column_identifier=>''N''
,p_column_label=>''Creator''
,p_column_html_expression=>''<span class="imart-text-value" title="#CREATOR!ATTR#">#CREATOR!HTML#</span>''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579867733424746485)
,p_db_column_name=>''DATECRATED''
,p_display_order=>5
,p_column_identifier=>''E''
,p_column_label=>''Date Created''
,p_column_type=>''DATE''
,p_heading_alignment=>''LEFT''
,p_tz_dependent=>''N''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579868104699746485)
,p_db_column_name=>''DATEMODIFY''
,p_display_order=>6
,p_column_identifier=>''F''
,p_column_label=>''Date Modify''
,p_column_type=>''DATE''
,p_heading_alignment=>''LEFT''
,p_tz_dependent=>''N''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579867288090746485)
,p_db_column_name=>''DECIMALPLACE''
,p_display_order=>4
,p_column_identifier=>''D''
,p_column_label=>''Decimal Place''
,p_column_type=>''NUMBER''
,p_heading_alignment=>''RIGHT''
,p_column_alignment=>''RIGHT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579868918359746485)
,p_db_column_name=>''DIVISORFACTOR''
,p_display_order=>8
,p_column_identifier=>''H''
,p_column_label=>''Divisor Factor''
,p_column_type=>''NUMBER''
,p_heading_alignment=>''RIGHT''
,p_column_alignment=>''RIGHT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579870121157746486)
,p_db_column_name=>''FORMANPOWER''
,p_display_order=>11
,p_column_identifier=>''K''
,p_column_label=>''Forman Power''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579869650823746486)
,p_db_column_name=>''GSTUQCCODE''
,p_display_order=>10
,p_column_identifier=>''J''
,p_column_label=>''GST UQC Code''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579868460147746485)
,p_db_column_name=>''ISWEIGHMENTREQUIRED''
,p_display_order=>7
,p_column_identifier=>''G''
,p_column_label=>''Is Weighment Required''
,p_column_html_expression=>''<span class="imart-text-value" title="#ISWEIGHMENTREQUIRED!ATTR#">#ISWEIGHMENTREQUIRED!HTML#</span>''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579866509341746484)
,p_db_column_name=>''MEASURINGUNITCODE''
,p_display_order=>2
,p_column_identifier=>''B''
,p_column_label=>''Measuring Unit Code''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579866919907746485)
,p_db_column_name=>''MEASURINGUNITNAME''
,p_display_order=>3
,p_column_identifier=>''C''
,p_column_label=>''Measuring Unit Name''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579869251754746486)
,p_db_column_name=>''MULTIPLYINGFACTOR''
,p_display_order=>9
,p_column_identifier=>''I''
,p_column_label=>''Multiplying Factor''
,p_column_type=>''NUMBER''
,p_heading_alignment=>''RIGHT''
,p_column_alignment=>''RIGHT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579870477115746486)
,p_db_column_name=>''REMARK''
,p_display_order=>12
,p_column_identifier=>''L''
,p_column_label=>''Remark''
,p_column_html_expression=>''<span class="imart-long-value" title="#REMARK!ATTR#">#REMARK!HTML#</span>''
,p_column_type=>''STRING''
,p_heading_alignment=>''LEFT''
,p_use_as_row_header=>''N''
,p_available_clientside=>''N''
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(579866055545746482)
,p_db_column_name=>''TNO''
,p_display_order=>0
,p_is_primary_key=>''Y''
,p_column_identifier=>''A''
,p_column_label=>''Tno''
,p_column_type=>''NUMBER''
,p_display_text_as=>''HIDDEN_ESCAPE_SC''
,p_use_as_row_header=>''N''
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(579879964770783825)
,p_application_user=>''APXWS_DEFAULT''
,p_report_seq=>10
,p_report_alias=>''1394937''
,p_status=>''PUBLIC''
,p_is_default=>''Y''
,p_report_columns=>''MEASURINGUNITCODE:MEASURINGUNITNAME:DECIMALPLACE:ISWEIGHMENTREQUIRED:GSTUQCCODE:REMARK:CREATOR:CREATIONTIME''
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026100200005000)
,p_plug_name=>''Master KPI Cards''
,p_static_id=>''mr-kpi-shell-50''
,p_region_template_options=>''#DEFAULT#:t-Region--noUI''
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>9
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
''begin htp.p(q''''^<style>') ||
to_clob('.mr-register-kpis[hidden]{display:none!important}'',
''button[aria-controls^="mr-register-kpis-"]{display:inline-flex;align-items:center;justify-content:center;gap:7px;margin-right:4px;padding:8px 11px!important;min-height:0;border:1px solid #c5bfee!important;border-radius:9px!important;background:linear''
||''-gradient(135deg,#fff,#f5f3ff)!important;color:#6255d7!important;font-weight:600!important;font-size:13px!important;box-shadow:0 2px 5px #5846c80c!important}'',
''button[aria-controls^="mr-register-kpis-"]::before{content:"";display:block;flex:none;width:15px;height:15px;background:linear-gradient(currentColor,currentColor) left bottom/3px 7px no-repeat,linear-gradient(currentColor,currentColor) center bottom/''
||''3px 13px no-repeat,linear-gradient(currentColor,currentColor) right bottom/3px 10px no-repeat}'',
''button[aria-controls^="mr-register-kpis-"]:hover{border-color:#9687e7!important;background:#eeebff!important}'',
''button[aria-controls^="mr-register-kpis-"][aria-expanded="true"]{border-color:#a89de6!important;background:#f2efff!important;color:#5846c8!important}'',
''button[aria-controls^="mr-register-kpis-"]:focus-visible{outline:2px solid #6658d7;outline-offset:3px}'',
''.mr-register-kpis{margin:0 0 18px;padding:22px;border:1px solid #e0e5f2;border-radius:18px;background:linear-gradient(120deg,#fff 65%,#faf9ff);box-shadow:0 4px 18px #24336205}'',
''.mr-register-kpis header{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;margin-bottom:20px}'',
''.mr-register-kpis .mr-kpi-heading{display:flex;align-items:center;gap:13px;min-width:0}'',
''.mr-register-kpis .mr-kpi-heading-icon{display:grid;place-items:center;width:44px;height:44px;flex:none;border-radius:13px;background:#eeecff;color:#6255d7;font-size:20px}'',
''.mr-register-kpis .mr-kpi-eyebrow{font-size:10px;font-weight:700;letter-spacing:1.4px;color:#847baf;display:block;margin-bottom:5px}'',
''.mr-register-kpis h2{font-size:19px;font-weight:700;line-height:1.3;color:#202a43;margin:0}'',
''.mr-register-kpis .mr-kpi-subtitle{font-size:12px;color:#79849b;margin:5px 0 0}'',
''.mr-register-kpis .mr-kpi-close{display:flex;align-items:center;gap:7px;flex:none;border:1px solid #e2e5f0;border-radius:9px;padding:8px 12px;background:#fff;color:#657089;font:inherit;font-size:12px;cursor:pointer}'',
''.mr-register-kpis .mr-kpi-close:hover{color:#5d50d2;border-color:#bcb5ee;background:#faf9ff}'',
''.mr-register-kpis .mr-kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,190px),1fr));gap:14px}'',
''.mr-register-kpis .mr-inline-kpi{--kpi-accent:#6658d7;--kpi-tint:#efedff;--kpi-line:#e3defb;position:relative;overflow:hidden;display:flex;flex-direction:column;gap:0;min-width:0;width:100%;padding:17px 18px 14px;border:1px solid var(--kpi-line);bord''
||''er-radius:13px;background:linear-gradient(125deg,#fff,var(--kpi-tint));font-family:inherit;text-align:left;cursor:pointer;color:#202a43;box-shadow:0 2px 5px #24336203}'',
''.mr-register-kpis .mr-inline-kpi[data-tone="success"]{--kpi-accent:#198a68;--kpi-tint:#edf9f3;--kpi-line:#d8eee4}'',
''.mr-register-kpis .mr-inline-kpi[data-tone="warning"]{--kpi-accent:#b87b19;--kpi-tint:#fff8e9;--kpi-line:#f0e4c7}'',
''.mr-register-kpis .mr-inline-kpi[data-tone="danger"]{--kpi-accent:#c55364;--kpi-tint:#fff0f2;--kpi-line:#f2dce2}'',
''.mr-register-kpis .mr-inline-kpi[data-tone="neutral"]{--kpi-accent:#738099;--kpi-tint:#f2f5fa;--kpi-line:#e0e5ee}'',
''.mr-register-kpis .mr-inline-kpi[data-tone="info"]{--kpi-accent:#397db7;--kpi-tint:#edf6ff;--kpi-line:#dceafa}'',
''.mr-register-kpis .mr-inline-kpi:hover{border-color:var(--kpi-accent);box-shadow:0 4px 14px #2433620a}'',
''.mr-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:var(--kpi-accent);box-shadow:inset 0 0 0 1px var(--kpi-accent),0 4px 14px #24336208}'',
''.mr-register-kpis .mr-inline-kpi:focus-visible,.mr-register-kpis .mr-kpi-close:focus-visible{outline:2px solid #6658d7;outline-offset:3px}'',
''.mr-register-kpis .mr-inline-kpi:disabled{cursor:progress;opacity:.75}'',
''.mr-register-kpis .mr-kpi-card-top{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:10px}'',
''.mr-register-kpis .mr-kpi-status{display:flex;align-items:center;gap:7px;font-size:12px;font-weight:600;color:#606d85}'',
''.mr-register-kpis .mr-kpi-status::before{content:"";width:6px;height:6px;border-radius:50%;background:var(--kpi-accent);flex:none}'',
''.mr-register-kpis .mr-kpi-card-icon{display:grid;place-items:center;flex:none;width:31px;height:31px;border:1px solid var(--kpi-line);border-radius:9px;background:#ffffffb3;color:var(--kpi-accent);font-size:16px}'',
''.mr-register-kpis .mr-inline-kpi strong{font-size:32px;line-height:1.15;font-weight:700;letter-spacing:-.8px;color:#202a43;margin-bottom:5px}'',
''.mr-register-kpis .mr-kpi-share{font-size:11px;color:#8790a3;margin-bottom:13px}'',
''.mr-register-kpis .mr-kpi-card-bottom{display:flex;justify-content:space-between;align-items:center;border-top:1px solid var(--kpi-line);padding-top:10px;gap:10px;color:var(--kpi-accent);font-size:11px;font-weight:600}'',
''.mr-register-kpis .mr-kpi-selected{display:none}'',
''.mr-register-kpis [aria-pressed="true"] .mr-kpi-selected{display:inline}'',
''.mr-register-kpis [aria-pressed="true"] .mr-kpi-unselected{display:none}'',
''.mr-register-kpis .mr-kpi-method{margin-top:13px;color:#8790a3;font-size:11px}'',
''.mr-register-kpis .mr-kpi-method summary{cursor:pointer;list-style:none;display:inline-flex;align-items:center;gap:6px}'',
''.mr-register-kpis .mr-kpi-method summary::-webkit-details-marker{display:none}'',
''.mr-register-kpis .mr-kpi-method p{font-size:11px;line-height:1.6;color:#738099;margin:8px 0 0;max-width:1000px}'',
''.mr-register-kpis .mr-kpi-card-body{display:flex;align-items:flex-start;gap:17px;position:relative;padding:3px 0 0;min-height:100px}'',
''.mr-register-kpis .mr-kpi-card-details{display:flex;flex-direction:column;min-width:0;position:relative;z-index:1}'',
''.mr-register-kpis .mr-kpi-card-icon{width:45px;height:45px;border:0;border-ra') ||
to_clob('dius:16px;background:var(--kpi-tint);font-size:24px}'',
''.mr-register-kpis .mr-kpi-status{font-size:13px;margin:5px 0 8px}'',
''.mr-register-kpis .mr-kpi-status::before{display:none}'',
''.mr-register-kpis .mr-kpi-share{margin-bottom:13px}'',
''.mr-register-kpis .mr-kpi-wave{position:absolute;right:0;bottom:18px;width:105px;height:39px;color:var(--kpi-accent);opacity:.65;pointer-events:none}'',
''.mr-register-kpis .mr-kpi-wave svg{display:block;width:100%;height:100%}'',
''@media(max-width:1000px){.mr-register-kpis .mr-kpi-wave{width:75px;opacity:.35}}'',
''@media(max-width:650px){.mr-register-kpis{padding:16px}.mr-register-kpis h2{font-size:16px}.mr-register-kpis .mr-kpi-heading-icon{display:none}.mr-register-kpis .mr-kpi-grid{gap:10px}.mr-register-kpis .mr-inline-kpi{padding:13px}.mr-register-kpis .mr''
||''-inline-kpi strong{font-size:27px}.mr-register-kpis .mr-kpi-card-top{flex-wrap:wrap;gap:6px}}'',
''@media(max-width:380px){.mr-register-kpis .mr-kpi-grid{grid-template-columns:1fr}}'',
''.mr-register-kpis{padding:12px;margin-bottom:12px}'',
''.mr-register-kpis header{gap:10px;margin-bottom:10px}'',
''.mr-register-kpis .mr-kpi-heading{gap:9px}'',
''.mr-register-kpis .mr-kpi-heading-icon{width:32px;height:32px;border-radius:10px;font-size:17px}'',
''.mr-register-kpis .mr-kpi-eyebrow{margin-bottom:2px;letter-spacing:1px}'',
''.mr-register-kpis h2{font-size:16px}'',
''.mr-register-kpis .mr-kpi-subtitle{margin-top:3px;font-size:11px}'',
''.mr-register-kpis .mr-kpi-grid{gap:9px}'',
''.mr-register-kpis .mr-inline-kpi{padding:7px 10px 6px;border-radius:10px}'',
''.mr-register-kpis .mr-kpi-card-body{min-height:0;gap:8px;padding:0}'',
''.mr-register-kpis .mr-kpi-card-icon{width:27px;height:27px;border-radius:9px;font-size:17px}'',
''.mr-register-kpis .mr-kpi-status{font-size:11px;line-height:1.3;margin:0 0 1px}'',
''.mr-register-kpis .mr-inline-kpi strong{font-size:22px;line-height:1.05;margin:0;letter-spacing:-.4px}'',
''.mr-register-kpis .mr-kpi-share{font-size:10px;line-height:1.3;margin:1px 0 2px}'',
''.mr-register-kpis .mr-kpi-card-bottom{padding-top:4px;gap:6px;font-size:10px;line-height:1.3}'',
''.mr-register-kpis .mr-kpi-card-bottom>.fa{font-size:11px;line-height:13px}'',
''.mr-register-kpis .mr-kpi-wave{width:48px;height:18px;bottom:5px;opacity:.3}'',
''.mr-register-kpis .mr-kpi-method{margin-top:8px}'',
''.mr-register-kpis .mr-kpi-grid{min-height:87px}'',
''</style><nav id="imart-register-50-breadcrumb" aria-label="Breadcrumb"><ol><li>Home</li><li>Inventory Control</li><li aria-current="page">Measuring Unit List</li></ol></nav><details id="imart-register-50-kpi-disclosure"><summary><span class="fa fa-ba''
||''r-chart" aria-hidden="true"></span><span>KPIs <span class="imart-register-50-kpi-caption">Record summary</span></span><span class="imart-register-50-kpi-show">Show KPIs</span><span class="imart-register-50-kpi-hide">Hide KPIs</span><span class="imart''
||''-register-50-kpi-chevron" aria-hidden="true"></span></summary><section id="mr-register-kpis-50" class="mr-register-kpis" data-report-region="measuring-unit-list" data-report-label="Measuring&#x20;Unit&#x20;List" aria-label="Master KPIs"><div class="m''
||''r-kpi-grid" data-kpi-content role="status"></div><details class="mr-kpi-method"><summary><span class="fa fa-info-circle" aria-hidden="true"></span> How counts work</summary><p data-kpi-scope></p></details></section></details><script>(function () {'',
''  ''''use strict'''';'',
''  if (window.IMARTMasterKpis) return;'',
''  var currentRequest = null;'',
''  function section(page) { return document.getElementById(''''mr-register-kpis-'''' + page); }'',
''  function reportId(root) {'',
''    var id = root.dataset.reportRegion;'',
''    if (id && document.getElementById(id) && apex.region(id)) return id;'',
''    var reports = Array.from(document.querySelectorAll(''''main .js-apex-region'''')).filter(function (el) {'',
''      return el.querySelector(''''.a-IRR,.a-IG'''') && apex.region(el.id);'',
''    });'',
''    var named = reports.filter(function (el) { return el.getAttribute(''''aria-label'''') === root.dataset.reportLabel; });'',
''    return named.length === 1 ? named[0].id : reports.length === 1 ? reports[0].id : null;'',
''  }'',
''  function load(page) {'',
''    var root = section(page);'',
''    if (!root) return;'',
''    if (currentRequest) currentRequest.abort();'',
''    var content = root.querySelector(''''[data-kpi-content]'''');'',
unistr(''    if (!content.querySelector(''''button'''')) content.textContent = ''''Loading KPIs\2026'''';''),
''    root.setAttribute(''''aria-busy'''', ''''true'''');'',
''    currentRequest = apex.server.process(''''IMART_REGISTER_KPIS'''', {x01: String(page)}, {'',
''      dataType: ''''json'''', timeout: 15000,'',
''      success: function (data) {'',
''        root.dataset.reportRegion = reportId(root) || data.region;'',
''        root.querySelector(''''[data-kpi-scope]'''').textContent = data.scope;'',
''        content.replaceChildren();'',
''        var total = Number(String(data.cards[0].value).replace(/[^0-9.-]/g, ''''''''));'',
''        data.cards.forEach(function (card) {'',
''          if (card.mode === ''''STATUS'''' && (card.status == null || /^NO[ _-]?STATUS$/i.test(String(card.label).trim()))) return;'',
''          var el = document.createElement(''''button''''), label = document.createElement(''''span''''),'',
''            value = document.createElement(''''strong''''), share = document.createElement(''''span''''),'',
''            top = document.createElement(''''span''''), icon = document.createElement(''''span''''),'',
''            bottom = document.createElement(''''span''''), action = document.createElement(''''span''''), arrow = document.createElement(''''span''''),'',
''            body = document.createElement(''''span''''), details = document.createElement(''''span''''), wave = document.createElement(''''span'''');'',
''          var status = String(card.label).toUpperCase(), tone = ''''info'''', iconName = ''''fa-circle-o'''';'',
''          if (card.mode === ''''ALL'''') { tone = ''''total''''; iconName = ''''fa-th-large''''; }'',
''          else if (card.mode === ''''RECENT'''') { tone = ''''info''''; iconName = ''''fa-calendar''''; }'',
''          else if (card.mode =') ||
to_clob('== ''''MINE'''') { tone = ''''total''''; iconName = ''''fa-user''''; }'',
''          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT/.test(status)) { tone = ''''danger''''; iconName = ''''fa-ban''''; }'',
''          else if (/^ACTIVE$|CLOSED|COMPLETE|APPROV|AUTHORI/.test(status)) { tone = ''''success''''; iconName = ''''fa-check-circle-o''''; }'',
''          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = ''''warning''''; iconName = ''''fa-clock-o''''; }'',
''          else if (/NO STATUS/.test(status)) { tone = ''''neutral''''; iconName = ''''fa-minus-circle''''; }'',
''          el.className = ''''mr-inline-kpi''''; el.dataset.tone = tone;'',
''          label.className = ''''mr-kpi-status''''; label.textContent = card.mode === ''''ALL'''' ? ''''Total records'''' : card.label.replace(/[_-]/g, '''' '''').toLowerCase().replace(/\b\w/g, function (s) { return s.toUpperCase(); });'',
''          top.className = ''''mr-kpi-card-top''''; icon.className = ''''mr-kpi-card-icon fa '''' + (card.mode === ''''ALL'''' ? ''''fa-file-text-o'''' : iconName); icon.setAttribute(''''aria-hidden'''', ''''true'''');'',
''          el.type = ''''button''''; el.setAttribute(''''aria-pressed'''', String(card.selected));'',
''          el.setAttribute(''''aria-label'''', card.label + '''': '''' + card.value);'',
''          value.textContent = card.value; share.className = ''''mr-kpi-share'''';'',
''          var count = Number(String(card.value).replace(/[^0-9.-]/g, ''''''''));'',
''          share.textContent = card.note || (card.mode === ''''ALL'''' ? ''''All records in this scope'''' : (total ? (count / total * 100).toFixed(1) : ''''0'''') + ''''% of total records'''');'',
''          bottom.className = ''''mr-kpi-card-bottom''''; action.innerHTML = ''''<span class="mr-kpi-unselected">View records</span><span class="mr-kpi-selected">Showing records</span>'''';'',
''          arrow.className = ''''fa fa-arrow-right''''; arrow.setAttribute(''''aria-hidden'''', ''''true''''); bottom.append(action, arrow);'',
''          el.addEventListener(''''click'''', function () {'',
''            var buttons = content.querySelectorAll(''''button'''');'',
''            buttons.forEach(function (b) { b.disabled = true; });'',
''            apex.server.process(''''IMART_KPI_STATUS_FILTER'''', {x01: String(page), x02: card.mode, x03: card.status}, {'',
''              dataType: ''''json'''', timeout: 15000,'',
''              success: function () {'',
''                buttons.forEach(function (b) { b.setAttribute(''''aria-pressed'''', String(b === el)); });'',
''                var id = reportId(root), report = id && apex.region(id);'',
''                if (id) root.dataset.reportRegion = id;'',
''                if (report) report.refresh();'',
''                else apex.message.alert(''''The register could not be refreshed. Please reload this page.'''');'',
''              },'',
''              error: function () { apex.message.alert(''''KPI filter could not be applied. Please retry.''''); },'',
''              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }'',
''            });'',
''          });'',
''          details.className = ''''mr-kpi-card-details''''; details.append(label, value, share);'',
''          body.className = ''''mr-kpi-card-body''''; body.append(icon, details);'',
''          wave.className = ''''mr-kpi-wave''''; wave.setAttribute(''''aria-hidden'''', ''''true'''');'',
''          wave.innerHTML = ''''<svg viewBox="0 0 120 44" fill="none" focusable="false"><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72 9 84 19 S98 26 119 13" stroke="currentColor" stroke-width="1.2"/><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72''
||'' 9 84 19 S98 26 119 13 V44 H1 Z" fill="currentColor" opacity=".06"/></svg>'''';'',
''          body.append(wave); el.append(body, bottom); content.append(el);'',
''        });'',
''      },'',
''      error: function (request, status) {'',
''        if (status !== ''''abort'''' && !content.querySelector(''''.mr-inline-kpi'''')) {'',
''          content.textContent = ''''KPIs could not be loaded. '''';'',
''          var retry = document.createElement(''''button'''');'',
''          retry.type = ''''button''''; retry.textContent = ''''Retry'''';'',
''          retry.addEventListener(''''click'''', function () { load(page); });'',
''          content.append(retry);'',
''        }'',
''      },'',
''      complete: function () { currentRequest = null; root.removeAttribute(''''aria-busy''''); }'',
''    });'',
''  }'',
''  function listen() {'',
''    var initial = document.querySelector(''''.mr-register-kpis'''');'',
''    if (initial) load(Number(initial.id.replace(''''mr-register-kpis-'''', '''''''')));'',
''    apex.jQuery(document).on(''''apexafterrefresh.imartMasterKpis'''', ''''.js-apex-region'''', function () {'',
''    var root = document.querySelector(''''.mr-register-kpis'''');'',
''    if (!root) return;'',
''    var page = Number(root.id.replace(''''mr-register-kpis-'''', ''''''''));'',
''    if (root.dataset.reportRegion === this.id) load(page);'',
''  }); }'',
''  window.IMARTMasterKpis = {reload: load};'',
''  if (document.readyState === ''''loading'''') document.addEventListener(''''DOMContentLoaded'''', listen, {once: true});'',
''  else listen();'',
''})();'',
''</script>^'''');end;''))
,p_plug_source_type=>''NATIVE_PLSQL''
,p_plug_display_condition_type=>''FUNCTION_BODY''
,p_plug_display_when_condition=>''begin for r in (select module_code from imart_mr_catalog where register_page=:APP_PAGE_ID) loop if imart_master_reports.allowed(r.module_code)=1 then return true; end if; end loop; return false; end;''
,p_plug_display_when_cond2=>''PLSQL''
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(95002006010050)
,p_plug_name=>''Register initial approved title''
,p_static_id=>''register-initial-approved-title''
,p_region_name=>''imart-initial-title-50''
,p_region_attributes=>''style="display:contents"''
,p_plug_template=>wwv_flow_imp.id(95001071000503)
,p_plug_display_sequence=>1
,p_plug_display_point=>''REGION_POSITION_01''
,p_plug_source=>''<div class="hspl-hero-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"></path><p''
||''ath d="M14 3v5h5M9 13h6M9 17h6M9 9h1"></') ||
to_clob('path></svg></div><div class="hspl-title-block"><h1 class="hspl-page-title">Measuring Unit List</h1></div>''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''expand_shortcuts'', ''N'',
  ''output_as'', ''HTML'')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579871796541746486)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(579865637102746482)
,p_button_name=>''CREATE''
,p_static_id=>''create''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--primary:t-Button--iconLeft''
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Add New''
,p_button_position=>''RIGHT_OF_IR_SEARCH_BAR''
,p_button_redirect_url=>''f?p=&APP_ID.:51:&APP_SESSION.::&DEBUG.:51::''
,p_icon_css_classes=>''fa-plus-square-o''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579878594113775414)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(579865637102746482)
,p_button_name=>''Home''
,p_static_id=>''home''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Home''
,p_button_position=>''RIGHT_OF_IR_SEARCH_BAR''
,p_button_redirect_url=>''f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::''
,p_icon_css_classes=>''fa-window-close-o''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577830444934300470)
,p_name=>''Close Dialog''
,p_static_id=>''close-dialog''
,p_event_sequence=>20
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579871796541746486)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577830524257300471)
,p_event_id=>wwv_flow_imp.id(577830444934300470)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_affected_elements_type=>''REGION''
,p_affected_region_id=>wwv_flow_imp.id(579865637102746482)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579872118360746487)
,p_name=>''Edit Report - Dialog Closed''
,p_static_id=>''edit-report-dialog-closed''
,p_event_sequence=>10
,p_triggering_element_type=>''REGION''
,p_triggering_region_id=>wwv_flow_imp.id(579865637102746482)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579872575957746487)
,p_event_id=>wwv_flow_imp.id(579872118360746487)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_affected_elements_type=>''REGION''
,p_affected_region_id=>wwv_flow_imp.id(579865637102746482)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2026100502000050)
,p_process_sequence=>100
,p_process_point=>''ON_DEMAND''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''IMART_REGISTER_RECORD_FINDER_ALL''
,p_static_id=>''imart-register-record-finder-all''
,p_process_sql_clob=>''begin IMART_REGISTER_FINDER.search;end;''
,p_process_clob_language=>''PLSQL''
,p_internal_uid=>2026100502000050
);
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 4 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>51);
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 5 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('begin
wwv_flow_imp_page.create_page(
 p_id=>51
,p_name=>''Measuring Unit Master''
,p_alias=>''MEASURING-UNIT-MASTER''
,p_page_mode=>''MODAL''
,p_step_title=>''Measuring Unit Master''
,p_autocomplete_on_off=>''OFF''
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'''',
''<script id="hspl-sidebar-head-state">'',
''(function(d){'',
''  var state=''''closed'''';'',
''  try {'',
''    var saved=window.localStorage.getItem(''''imart.sidebar.state.v1'''');'',
''    if(saved===''''open''''||saved===''''closed'''') state=saved;'',
''  } catch(ignore) {}'',
''  d.classList.remove(state===''''open''''?''''hspl-nav-target-closed'''':''''hspl-nav-target-open'''');'',
''  d.classList.add(state===''''open''''?''''hspl-nav-target-open'''':''''hspl-nav-target-closed'''');'',
''})(document.documentElement);'',
''</script>''))
,p_javascript_file_urls=>''#APP_FILES#myfunctions#MIN#.js''
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'':root{'',
''    --a-menu-font-size: 1.25rem !important;'',
''}'',
''/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */'',
''details#hspl-keyboard-help{display:none!important}'',
''''))
,p_step_template=>2100407606326202693
,p_page_template_options=>''#DEFAULT#''
,p_dialog_chained=>''N''
,p_protection_level=>''C''
,p_page_component_map=>''02''
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579861159404746480)
,p_plug_name=>''Buttons''
,p_static_id=>''buttons''
,p_region_template_options=>''#DEFAULT#''
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>''REGION_POSITION_03''
,p_plug_item_display_point=>''ABOVE''
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''output_as'', ''TEXT'',
  ''show_line_breaks'', ''Y'')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1129272710209743263)
,p_plug_name=>''Fields''
,p_static_id=>''fields''
,p_plug_display_sequence=>30
,p_plug_item_display_point=>''ABOVE''
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''expand_shortcuts'', ''N'',
  ''output_as'', ''HTML'')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579850955118746468)
,p_plug_name=>''Measuring Unit Master''
,p_static_id=>''measuring-unit-master''
,p_region_template_options=>''#DEFAULT#''
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_item_display_point=>''ABOVE''
,p_query_type=>''SQL''
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
''select TNO,'',
''       MEASURINGUNITCODE,'',
''       MEASURINGUNITNAME,'',
''       DECIMALPLACE,'',
''       DATECRATED,'',
''       DATEMODIFY,'',
''       ISWEIGHMENTREQUIRED,'',
''       DIVISORFACTOR,'',
''       MULTIPLYINGFACTOR,'',
''       GSTUQCCODE,'',
''       FORMANPOWER,'',
''       REMARK,'',
''       CREATIONTIME,'',
''       CREATOR'',
''  from MEASURINGUNIT''))
,p_is_editable=>true
,p_edit_operations=>''i:u:d''
,p_lost_update_check_type=>''VALUES''
,p_plug_source_type=>''NATIVE_FORM''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579861629890746481)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''CANCEL''
,p_static_id=>''cancel''
,p_button_action=>''DEFINED_BY_DA''
,p_button_template_options=>''#DEFAULT#:t-Button--warning:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Cancel''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>''fa-arrow-circle-o-left''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579863769816746481)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''CREATE''
,p_static_id=>''create''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--success:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Create''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''NEWRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-save''
,p_database_action=>''INSERT''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579863010836746481)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''DELETE''
,p_static_id=>''delete''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--danger:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Delete''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_execute_validations=>''N''
,p_confirm_message=>''&APP_TEXT$DELETE_MSG!RAW.''
,p_confirm_style=>''danger''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-trash-o''
,p_database_action=>''DELETE''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026102051000002)
,p_button_sequence=>95
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''EXIT''
,p_static_id=>''exit''
,p_button_static_id=>''p51_exit''
,p_button_action=>''DEFINED_BY_DA''
,p_button_template_options=>''#DEFAULT#:t-Button--simple:t-Button--iconLeft''
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>''Exit''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_execute_validations=>''N''
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>''fa-sign-out''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579885235006818278)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Fail''
,p_static_id=>''fail''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--danger:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Fail''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_typ') ||
to_clob('e=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-thumbs-o-down''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579885501433819804)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Flow''
,p_static_id=>''flow''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--primary:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Flow''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P2_TNO1.''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-workflow''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579884895332816988)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Pass''
,p_static_id=>''pass''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--success:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Pass''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-thumbs-o-up''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579886121727823296)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Print''
,p_static_id=>''print''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--primary:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Print''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-print''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579863381933746481)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''SAVE''
,p_static_id=>''save''
,p_button_action=>''SUBMIT''
,p_button_template_options=>''#DEFAULT#:t-Button--success:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Apply Changes''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-save-as''
,p_database_action=>''UPDATE''
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(579885787635821554)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>''Status''
,p_static_id=>''status''
,p_button_action=>''REDIRECT_PAGE''
,p_button_template_options=>''#DEFAULT#:t-Button--warning:t-Button--pill''
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>''Y''
,p_button_image_alt=>''Status''
,p_button_position=>''TOP''
,p_button_alignment=>''RIGHT''
,p_button_redirect_url=>''f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::''
,p_button_condition=>''P51_FORMSTATUS''
,p_button_condition2=>''EDITRECORD''
,p_button_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_icon_css_classes=>''fa-comments-o''
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129390179679622957)
,p_name=>''P51_CALLEDFROMPAGE''
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_item_default=>''2''
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579856191110746473)
,p_name=>''P51_CREATIONTIME''
,p_source_data_type=>''DATE''
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_default=>''select to_char(sysdate,''''DD-MM-YYYY HH24:MI:SS'''') from dual''
,p_item_default_type=>''SQL_QUERY''
,p_prompt=>''Creation Time''
,p_format_mask=>''DD-MON-YYYY HH:MIPM''
,p_source=>''CREATIONTIME''
,p_display_as=>''NATIVE_DATE_PICKER_APEX''
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>''readonly=true''
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_display_when=>''P51_MEASURINGUNITCODE''
,p_display_when_type=>''ITEM_IS_NOT_NULL''
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''display_as'', ''POPUP'',
  ''max_date'', ''NONE'',
  ''min_date'', ''NONE'',
  ''multiple_months'', ''N'',
  ''show_time'', ''Y'',
  ''use_defaults'', ''Y'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579856613541746474)
,p_name=>''P51_CREATOR''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_default=>''select :GLOBAL_LOGINNAME from Dual''
,p_item_default_type=>''SQL_QUERY''
,p_prompt=>''Creator''
,p_source=>''CREATOR''
,p_display_as=>''NATIVE_DISPLAY_ONLY''
,p_cSize=>32
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''based_on'', ''VALUE'',
  ''format'', ''PLAIN'',
  ''send_on_page_submit'', ''Y'',
  ''show_line_breaks'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579853042358746470)
,p_name=>''P51_DATECRATED''
,p_source_data_type=>''DATE''
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''DATECRATED''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p') ||
to_clob('_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579853405899746470)
,p_name=>''P51_DATEMODIFY''
,p_source_data_type=>''DATE''
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''DATEMODIFY''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579852567368746469)
,p_name=>''P51_DECIMALPLACE''
,p_source_data_type=>''NUMBER''
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_default=>''0''
,p_prompt=>''Decimal Place''
,p_source=>''DECIMALPLACE''
,p_display_as=>''NATIVE_NUMBER_FIELD''
,p_cSize=>32
,p_cMaxlength=>1
,p_tag_attributes=>''min="0" max="9" step="1" inputmode="numeric"''
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''max_value'', ''9'',
  ''min_value'', ''0'',
  ''number_alignment'', ''left'',
  ''virtual_keyboard'', ''decimal'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579854193525746470)
,p_name=>''P51_DIVISORFACTOR''
,p_source_data_type=>''NUMBER''
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_default=>''1''
,p_source=>''DIVISORFACTOR''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579855382952746471)
,p_name=>''P51_FORMANPOWER''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''FORMANPOWER''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129391757184642365)
,p_name=>''P51_FORMSTATUS''
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579855008773746471)
,p_name=>''P51_GSTUQCCODE''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''GST UQC Code''
,p_source=>''GSTUQCCODE''
,p_display_as=>''NATIVE_POPUP_LOV''
,p_named_lov=>''GST_UQC''
,p_lov_display_null=>''YES''
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_lov_display_extra=>''YES''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''case_sensitive'', ''N'',
  ''display_as'', ''INLINE'',
  ''fetch_on_search'', ''Y'',
  ''initial_fetch'', ''FIRST_ROWSET'',
  ''manual_entry'', ''N'',
  ''match_type'', ''CONTAINS'',
  ''min_chars'', ''0'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000511)
,p_name=>''P51_IMART_SAVE_OP_ID''
,p_item_sequence=>999999
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000515)
,p_name=>''P51_IMART_STATUS_DONE''
,p_item_sequence=>1000002
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000514)
,p_name=>''P51_IMART_STATUS_START''
,p_item_sequence=>1000001
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000516)
,p_name=>''P51_IMART_WORKFLOW_START''
,p_item_sequence=>1000003
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_warn_on_unsaved_changes=>''I''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579853756904746470)
,p_name=>''P51_ISWEIGHMENTREQUIRED''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Is Weighment Required''
,p_source=>''ISWEIGHMENTREQUIRED''
,p_display_as=>''NATIVE_SINGLE_CHECKBOX''
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''checked_value'', ''YES'',
  ''unchecked_value'', ''NO'',
  ''use_defaults'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579851810006746468)
,p_name=>''P51_MEASURINGUNITCODE''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>20
,p_item_plug_id=>wwv_') ||
to_clob('flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Measuring Unit Code''
,p_source=>''MEASURINGUNITCODE''
,p_display_as=>''NATIVE_TEXT_FIELD''
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''disabled'', ''N'',
  ''submit_when_enter_pressed'', ''N'',
  ''subtype'', ''TEXT'',
  ''trim_spaces'', ''NONE'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579852241426746468)
,p_name=>''P51_MEASURINGUNITNAME''
,p_source_data_type=>''VARCHAR2''
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Measuring Unit Name''
,p_source=>''MEASURINGUNITNAME''
,p_display_as=>''NATIVE_TEXT_FIELD''
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''disabled'', ''N'',
  ''submit_when_enter_pressed'', ''N'',
  ''subtype'', ''TEXT'',
  ''trim_spaces'', ''NONE'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129391349190639003)
,p_name=>''P51_MODULEFLOW''
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579854577074746471)
,p_name=>''P51_MULTIPLYINGFACTOR''
,p_source_data_type=>''NUMBER''
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''MULTIPLYINGFACTOR''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129391061902635126)
,p_name=>''P51_ONTHETABLE''
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129390698945630547)
,p_name=>''P51_PASSFAILREMARK''
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579855803804746471)
,p_name=>''P51_REMARK''
,p_source_data_type=>''VARCHAR2''
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_prompt=>''Remark''
,p_source=>''REMARK''
,p_display_as=>''NATIVE_TEXT_FIELD''
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>''N''
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>''#DEFAULT#''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''disabled'', ''N'',
  ''submit_when_enter_pressed'', ''N'',
  ''subtype'', ''TEXT'',
  ''trim_spaces'', ''NONE'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129392071760644638)
,p_name=>''P51_STATUS''
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_item_default=>''nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P51_TNO), ''''Status'''')''
,p_item_default_type=>''EXPRESSION''
,p_item_default_language=>''PLSQL''
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1129390453029625278)
,p_name=>''P51_STATUSRIGHT''
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1129272710209743263)
,p_source_type=>''ALWAYS_NULL''
,p_display_as=>''NATIVE_HIDDEN''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579851350961746468)
,p_name=>''P51_TNO''
,p_source_data_type=>''NUMBER''
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_item_source_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_source=>''TNO''
,p_display_as=>''NATIVE_HIDDEN''
,p_is_persistent=>''N''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''value_protected'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2026102051000005)
,p_validation_name=>''Decimal Place must be a digit from 0 to 9''
,p_static_id=>''decimal-place-must-be-a-digit-from-0-to''
,p_validation_sequence=>10
,p_validation=>''P51_DECIMALPLACE''
,p_validation2=>''^[0-9]$''
,p_validation_type=>''REGULAR_EXPRESSION''
,p_error_message=>''Decimal Place must be a whole number from 0 to 9.''
,p_associated_item=>wwv_flow_imp.id(579852567368746469)
,p_error_display_location=>''INLINE_WITH_FIELD_AND_NOTIFICATION''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577830821109300474)
,p_name=>''Check Measuring Unit name''
,p_static_id=>''check-measuring-unit-name''
,p_event_sequence=>110
,p_triggering_element_type=>''ITEM''
,p_triggering_element=>''P51_MEASURINGUNITNAME''
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''focusout''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579977863880982525)
,p_event_id=>wwv_flow_imp.id(577830821109300474)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT') ||
to_clob('_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''if (Object.keys($v("P51_MEASURINGUNITNAME")).length===0 ) {'',
    ''    showError("Measuring Unit Name Should Not be Empty", ''''P51_MEASURINGUNITNAME'''');'',
    ''} else {'',
    ''    apex.message.clearErrors();'',
    ''}'')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579861740967746481)
,p_name=>''Close Dialog''
,p_static_id=>''close-dialog''
,p_event_sequence=>10
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579861629890746481)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''click''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579862507056746481)
,p_event_id=>wwv_flow_imp.id(579861740967746481)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-dialog-close''
,p_action=>''NATIVE_DIALOG_CLOSE''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579953746125881881)
,p_name=>''DISABLE DELETE UPDATE IF STATUS IS ACTIVE''
,p_static_id=>''disable-delete-update-if-status-is-active''
,p_event_sequence=>60
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579955160435881881)
,p_event_id=>wwv_flow_imp.id(579953746125881881)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863010836746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.DELETEPRIVILEGE= ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579954160819881881)
,p_event_id=>wwv_flow_imp.id(579953746125881881)
,p_event_result=>''TRUE''
,p_action_sequence=>60
,p_static_id=>''native-disable-2''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863010836746481)
,p_server_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_server_condition_expr1=>''P51_STATUS''
,p_server_condition_expr2=>''ACTIVE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579954710477881881)
,p_event_id=>wwv_flow_imp.id(579953746125881881)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863010836746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.DELETEPRIVILEGE= ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579958719244885273)
,p_name=>''Disable Print Button''
,p_static_id=>''disable-print-button''
,p_event_sequence=>90
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579959615932885275)
,p_event_id=>wwv_flow_imp.id(579958719244885273)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579886121727823296)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.PRINTPRIVILEGE= ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579959100201885274)
,p_event_id=>wwv_flow_imp.id(579958719244885273)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579886121727823296)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.PRINTPRIVILEGE= ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579955573539883019)
,p_name=>''DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE''
,p_static_id=>''disable-save-button-for-updateprivillege''
,p_event_sequence=>70
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579956526183883020)
,p_event_id=>wwv_flow_imp.id(579955573539883019)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863381933746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C'',
''WHERE A.TNO = B.TNO'',
''AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''AND B.BOSSUSERCODE = C.BOSSUSERCODE'',
''AND C.BOSSUSERNAME = :APP_USER'',
''AND B.UPDATEPRIVILEGE = ''''NO'''''',
''UNION ALL'',
''Select 1'',
''  From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.UPDATEPRIVILEGE = ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5799560322408830') ||
to_clob('20)
,p_event_id=>wwv_flow_imp.id(579955573539883019)
,p_event_result=>''TRUE''
,p_action_sequence=>50
,p_static_id=>''native-disable-2''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863381933746481)
,p_server_condition_type=>''VAL_OF_ITEM_IN_COND_EQ_COND2''
,p_server_condition_expr1=>''P51_STATUS''
,p_server_condition_expr2=>''ACTIVE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579956962083883020)
,p_event_id=>wwv_flow_imp.id(579955573539883019)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579863381933746481)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C'',
''WHERE A.TNO = B.TNO'',
''AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''AND B.BOSSUSERCODE = C.BOSSUSERCODE'',
''AND C.BOSSUSERNAME = :APP_USER'',
''AND B.UPDATEPRIVILEGE = ''''YES'''''',
''UNION ALL'',
''Select 1'',
''  From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.UPDATEPRIVILEGE = ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579957346299884246)
,p_name=>''Disable Status Button''
,p_static_id=>''disable-status-button''
,p_event_sequence=>80
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579958335887884246)
,p_event_id=>wwv_flow_imp.id(579957346299884246)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885787635821554)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.STATUSPRIVILEGE = ''''NO''''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579957791315884246)
,p_event_id=>wwv_flow_imp.id(579957346299884246)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885787635821554)
,p_server_condition_type=>''EXISTS''
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
''Select 1 From MODULEPRIVILEGE A'',
'' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
''   And a.bossusercode = :GLOBAL_BOSSUSERCODE'',
''   And a.companycode = :GLOBAL_COMPANYCODE'',
''   AND A.STATUSPRIVILEGE = ''''YES''''''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579947401194863660)
,p_name=>''DocumentStatus''
,p_static_id=>''documentstatus''
,p_event_sequence=>40
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579885787635821554)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579949756904863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>70
,p_execute_on_page_init=>''N''
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_STATUS''
,p_client_condition_expression=>''ACTIVE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579949264950863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>60
,p_execute_on_page_init=>''N''
,p_static_id=>''native-enable''
,p_action=>''NATIVE_ENABLE''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579950844933863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_execute_on_page_init=>''N''
,p_static_id=>''native-execute-plsql-code''
,p_action=>''NATIVE_EXECUTE_PLSQL_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''items_to_return'', ''P51_IMART_STATUS_DONE'',
  ''items_to_submit'', ''P51_TNO,P51_STATUS,P51_IMART_SAVE_OP_ID,P51_IMART_STATUS_START'',
  ''language'', ''PLSQL'',
  ''plsql_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''declare ack_keys clob;procedure ack_business is begin'',
    ''SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P51_TNO,:P51_STATUS);'',
    ''end;begin'',
    ''select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;'',
    ''imart_save_ack.begin_status(:P51_IMART_SAVE_OP_ID,GetModuleCodeForPageNo(:APP_PAGE_ID),:P51_TNO,:P51_STATUS,''''P51_TNO'''',ack_keys);'',
    ''ack_business;'',
    ''imart_save_ack.finish_status(:P51_IMART_SAVE_OP_ID);'',
    '':P51_IMART_STATUS_DONE:=:P51_IMART_SAVE_OP_ID;'',
    ''end;'')),
  ''show_processing'', ''N'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579947829384863660)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''$(''''#STATUS span'''').text($v(''''P51_STATUS''''));'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579948266093863660)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>40
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code-2''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''location.reload()'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_f') ||
to_clob('low_imp.id(579948800543863660)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>50
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579950334698863663)
,p_event_id=>wwv_flow_imp.id(579947401194863660)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-set-value''
,p_action=>''NATIVE_SET_VALUE''
,p_affected_elements_type=>''ITEM''
,p_affected_elements=>''P51_STATUS''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''return_item'', ''P164_DOCUMENTSTATUSCODE'',
  ''suppress_change_event'', ''N'',
  ''type'', ''DIALOG_RETURN_ITEM'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579952041115881018)
,p_name=>''Enable Disable Pass/Fail/Flow''
,p_static_id=>''enable-disable-pass-fail-flow''
,p_event_sequence=>50
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''ready''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579952410045881018)
,p_event_id=>wwv_flow_imp.id(579952041115881018)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_static_id=>''native-disable''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579884895332816988)
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_ONTHETABLE''
,p_client_condition_expression=>''NO''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579952854430881018)
,p_event_id=>wwv_flow_imp.id(579952041115881018)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_static_id=>''native-disable-2''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885235006818278)
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_ONTHETABLE''
,p_client_condition_expression=>''NO''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579953366563881018)
,p_event_id=>wwv_flow_imp.id(579952041115881018)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_static_id=>''native-disable-3''
,p_action=>''NATIVE_DISABLE''
,p_affected_elements_type=>''BUTTON''
,p_affected_button_id=>wwv_flow_imp.id(579885501433819804)
,p_client_condition_type=>''EQUALS''
,p_client_condition_element=>''P51_MODULEFLOW''
,p_client_condition_expression=>''NO''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2026102051000003)
,p_name=>''Exit Measuring Unit Form''
,p_static_id=>''exit-measuring-unit-form''
,p_event_sequence=>900
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(2026102051000002)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''click''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2026102051000004)
,p_event_id=>wwv_flow_imp.id(2026102051000003)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-dialog-cancel''
,p_action=>''NATIVE_DIALOG_CANCEL''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579945080413861235)
,p_name=>''Fail''
,p_static_id=>''fail''
,p_event_sequence=>30
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579885235006818278)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579946002905861238)
,p_event_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_execute_on_page_init=>''N''
,p_static_id=>''native-execute-plsql-code''
,p_action=>''NATIVE_EXECUTE_PLSQL_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''items_to_submit'', ''P51_PASSFAILREMARK,P51_TNO1'',
  ''language'', ''PLSQL'',
  ''plsql_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''declare'',
    ''		cursor cPassFail is'',
    ''				select'',
    ''						a.TNo,'',
    ''						a.TokenNo										'',
    ''				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d'',
    ''				where a.ModuleFlowTNo = b.TNo'',
    ''						and b.TNo = c.TNo'',
    ''						and a.BossUserCode = c.BossUserCode'',
    ''						and c.BossUserCode = d.BossUserCode'',
    ''						and a.ModuleTNo = :P51_TNO1'',
    ''						AND D.BOSSUSERNAME = :APP_USER'',
    ''						and a.isPass is null'',
    ''						and a.IsFail is null'',
    ''						and a.IsForwarded is null'',
    ''						and a.IsRebounded is null																				'',
    ''		;'',
    ''		vPassFail cPassFail%rowtype;'',
    ''    '',
    ''    tTokenNo NUMBER;'',
    ''    TMP VARCHAR2(100);'',
    ''    tModulecode Varchar2(30);'',
    ''begin'',
    '''',
    ''    select DISTINCT '',
    ''    	d.ModuleCode, :P130_JOBBILLNO'',
    ''                into tModuleCode,tmp'',
    ''    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d '',
    ''    where a.LocationCode = b.LocationCode'',
    ''    	and b.tno = c.tno'',
    ''    	and c.ModuleCode = d.ModuleCode --''''DELIVERYCHALLANRETURN'''''',
    ''        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
    ''    	and c.CompanyCode = :global_CompanyCode'',
    ''        and d.EntryPageNo = :APP_PAGE_ID'',
    ''        ;'',
    '''',
    ''		open cPassFail;'',
    ''		fetch cPassFail into vPassFail;'',
    ''		if cPassFail%FOUND then'',
    ''				tTokenNo := vPassFail.TokenNo;'',
    ''				close cPassFail;'',
    '''',
    ''           	'',
    ''				update PassFail a'',
    ''				set a.IsFail = ''''YES'''','',
    ''						a.remark = :P51_PASSFAILREMARK'',
    ''				where a.TNo = vPassFail.TNo;'',
    ''				'',
    ''				SendBackPassFail(tTokenNo , TMP );'',
    ''		    		'',
    ''				'',
    ''				commit;'',
    ''		else'',
    ''				close cPassFail;'',
    ''		end if;'',
    '''',
    ''	'',
    ''end;'')),
  ''show_processing'', ''N'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579946507182861239)
,p_even') ||
to_clob('t_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''location.reload()'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579946972700861239)
,p_event_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>40
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579945456469861235)
,p_event_id=>wwv_flow_imp.id(579945080413861235)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-set-value''
,p_action=>''NATIVE_SET_VALUE''
,p_affected_elements_type=>''ITEM''
,p_affected_elements=>''P51_PASSFAILREMARK''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''return_item'', ''P163_REMARK'',
  ''suppress_change_event'', ''N'',
  ''type'', ''DIALOG_RETURN_ITEM'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579942781842858852)
,p_name=>''Pass''
,p_static_id=>''pass''
,p_event_sequence=>20
,p_triggering_element_type=>''BUTTON''
,p_triggering_button_id=>wwv_flow_imp.id(579884895332816988)
,p_bind_type=>''bind''
,p_execution_type=>''IMMEDIATE''
,p_bind_event_type=>''apexafterclosedialog''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579943693077858853)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>20
,p_execute_on_page_init=>''N''
,p_static_id=>''native-execute-plsql-code''
,p_action=>''NATIVE_EXECUTE_PLSQL_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''items_to_return'', ''P51_IMART_STATUS_DONE'',
  ''items_to_submit'', ''P51_PASSFAILREMARK,P51_TNO1,P51_IMART_SAVE_OP_ID,P51_TNO,P51_IMART_WORKFLOW_START'',
  ''language'', ''PLSQL'',
  ''plsql_code'', wwv_flow_string.join(wwv_flow_t_varchar2(
    ''declare ack_keys clob;procedure ack_business is begin'',
    ''DECLARE'',
    ''  tModuleCode  Varchar2(30) := GetModuleCodeForPageNo(:APP_PAGE_ID);'',
    ''  TMP          vARCHAR2(100) ;'',
    ''cursor cPassFail is'',
    ''		select'',
    ''				a.TNo'',
    ''		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d'',
    ''		where a.ModuleFlowTNo = b.TNo'',
    ''				and b.TNo = c.TNo'',
    ''				and a.BossUserCode = c.BossUserCode'',
    ''				and c.BossUserCode = d.BossUserCode'',
    ''				and a.ModuleTNo = :P51_TNO1'',
    ''				AND D.BOSSUSERNAME = :APP_USER'',
    ''				and a.isPass is null'',
    ''				and a.IsFail is null'',
    ''				and a.IsForwarded is null'',
    ''				and a.IsRebounded is null										'',
    '';'',
    ''vPassFail cPassFail%rowtype;'',
    ''BEGIN'',
    '''',
    ''    select DISTINCT '',
    ''    	d.ModuleCode, :P130_JOBBILLNO'',
    ''                into tModuleCode,tmp'',
    ''    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d '',
    ''    where a.LocationCode = b.LocationCode'',
    ''    	and b.tno = c.tno'',
    ''    	and c.ModuleCode = d.ModuleCode --''''DELIVERYCHALLANRETURN'''''',
    ''        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)'',
    ''    	and c.CompanyCode = :global_CompanyCode'',
    ''        and d.EntryPageNo = :APP_PAGE_ID'',
    ''        ;'',
    '''',
    ''			'',
    ''	open cPassFail;'',
    ''	fetch cPassFail into vPassFail;'',
    ''	if cPassFail%FOUND then'',
    ''			'',
    ''		'',
    ''			update PassFail a'',
    ''			set a.IsPass = ''''YES'''','',
    ''				a.remark = :P51_PASSFAILRREMARK'',
    ''			where a.TNo = vPassFail.TNo;'',
    ''			COMMIT;'',
    ''			close cPassFail;'',
    ''			'',
    ''			'',
    ''			SendPassFailForward(tModuleCode, :P51_TNO1 , TMP, :global_CompanyCode );'',
    '''',
    ''    end if;'',
    ''END;'',
    ''end;begin'',
    ''select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;'',
    ''imart_save_ack.begin_v2(:P51_IMART_SAVE_OP_ID,''''P51_TNO'''',ack_keys,''''STATUS'''');'',
    ''ack_business;'',
    ''select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;'',
    ''imart_save_ack.finish_v2(:P51_IMART_SAVE_OP_ID,ack_keys);'',
    '':P51_IMART_STATUS_DONE:=:P51_IMART_SAVE_OP_ID;'',
    ''end;'')),
  ''show_processing'', ''N'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579944219999858853)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>30
,p_execute_on_page_init=>''N''
,p_static_id=>''native-javascript-code''
,p_action=>''NATIVE_JAVASCRIPT_CODE''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''js_code'', ''location.reload()'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579944663281858854)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>40
,p_execute_on_page_init=>''N''
,p_static_id=>''native-refresh''
,p_action=>''NATIVE_REFRESH''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''maintain_pagination'', ''N'')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579943198259858852)
,p_event_id=>wwv_flow_imp.id(579942781842858852)
,p_event_result=>''TRUE''
,p_action_sequence=>10
,p_execute_on_page_init=>''N''
,p_static_id=>''native-set-value''
,p_action=>''NATIVE_SET_VALUE''
,p_affected_elements_type=>''ITEM''
,p_affected_elements=>''P51_PASSFAILREMARK''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''return_item'', ''P163_REMARK'',
  ''suppress_change_event'', ''N'',
  ''type'', ''DIALOG_RETURN_ITEM'')).to_clob
,p_wait_for_result=>''Y''
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579864989166746482)
,p_process_sequence=>30
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_CLOSE_WINDOW''
,p_process_name=>''Close Dialog''
,p_static_id=>''close-dialog''
,') ||
to_clob('p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''show_success_messages'', ''N'')).to_clob
,p_error_display_location=>''INLINE_IN_NOTIFICATION''
,p_process_when_button_id=>wwv_flow_imp.id(579863010836746481)
,p_internal_uid=>139478643915819958
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579951377665868454)
,p_process_sequence=>60
,p_process_point=>''BEFORE_HEADER''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''Get Form Status And TNO''
,p_static_id=>''get-form-status-and-tno''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''begin'',
''     if :P51_TNO is null then'',
''            :P51_FORMSTATUS := ''''NEWRECORD'''';'',
''        else'',
''            :P51_FORMSTATUS := ''''EDITRECORD'''';'',
''        end if;'',
'''',
''    if :P51_TNO is null then'',
'''',
''        select globaltno.nextval into :P51_TNO from dual;'',
'''',
''    end if; '',
''end;''))
,p_process_clob_language=>''PLSQL''
,p_internal_uid=>139565032414941930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579999203690048816)
,p_process_sequence=>10
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''Get Measuring Unit Code''
,p_static_id=>''get-measuring-unit-code''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''declare'',
''    tModuleCode varchar2(30) := ''''MEASURINGUNIT'''';'',
'''',
''    tmp         number ;'',
''begin'',
''    select count(*) into tmp'',
''      from codeschememaster a'',
''     where a.modulecode = tModuleCode'',
''       and a.CodeScheme = ''''AUTO'''''',
''     ;'',
'''',
''     if nvl(tmp,0) > 0 and :P51_MEASURINGUNITCODE is null then'',
''            setCodeNext(tModuleCode);'',
''	  		:P51_MEASURINGUNITCODE := getCode(tModuleCode) ;'',
''     end if;'',
''end;''))
,p_process_clob_language=>''PLSQL''
,p_error_display_location=>''INLINE_IN_NOTIFICATION''
,p_internal_uid=>139612858439122292
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579951703139869639)
,p_process_sequence=>70
,p_process_point=>''BEFORE_HEADER''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''Get On The Table''
,p_static_id=>''get-on-the-table''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''declare'',
''tmp  number;'',
''tmp1 number;'',
''begin'',
'' -------- Checking Module Flow Prepared Or Not '',
''   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''''MODULEFLOW'''',TNO)=''''ACTIVE'''';'',
''   if nvl(tmp1,0) > 0 then'',
''       :P51_MODULEFLOW := ''''YES'''';'',
''   else'',
''       :P51_MODULEFLOW := ''''NO'''';'',
''   end if;'',
''  '',
''  ----- Checking On The Table '',
''   select count(*) into tmp from onthetable_apex where moduletno = :P51_TNO1 and loginname = :GLOBAL_LOGINNAME;'',
''   if nvl(tmp,0) > 0 then'',
''      :P51_ONTHETABLE := ''''YES'''' ;'',
''   else'',
''       :P51_ONTHETABLE := ''''NO'''';'',
''   end if;'',
''end;''))
,p_process_clob_language=>''PLSQL''
,p_internal_uid=>139565357888943115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25266988849897190)
,p_process_sequence=>95
,p_process_point=>''ON_DEMAND''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''IMART_DOCUMENT_HISTORY''
,p_static_id=>''imart-document-history''
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
''declare'',
'' l_doc varchar2(4000);l_root varchar2(128):=''''MEASURINGUNIT'''';l_record varchar2(4000);l_tno varchar2(100);l_links clob;'',
'' l_mode varchar2(20):=apex_application.g_x01;'',
'' l_key varchar2(100):=apex_application.g_x02;'',
'' l_after number:=to_number(apex_application.g_x03 default null on conversion error);'',
'' l_snapshot number:=to_number(apex_application.g_x04 default null on conversion error);'',
'' l_sort varchar2(10):=case when apex_application.g_x05=''''OLDEST'''' then ''''OLDEST'''' else ''''NEWEST'''' end;'',
'' l_filter varchar2(20):=nvl(apex_application.g_x06,''''ALL'''');'',
'' l_company varchar2(128);l_location varchar2(128);l_count number:=0;l_more boolean:=false;'',
'' l_json clob;l_pos pls_integer:=1;'',
'' function label_for(p_table varchar2,p_column varchar2) return varchar2 is v varchar2(500);'',
'' begin'',
''  select max(regexp_replace(label,''''<[^>]+>'''','''''''')) into v from apex_application_page_items'',
''  where application_id=105 and page_id=51 and item_source=p_column and label is not null;'',
''  return coalesce(v,case p_column when ''''QUANTITY1'''' then ''''Primary Quantity'''' when ''''QUANTITY2'''' then ''''Secondary Quantity'''''',
''    when ''''ITEMSPECS'''' then ''''Item Specification'''' when ''''TNO'''' then ''''Document ID'''' when ''''SNO'''' then ''''Line ID'''''',
''    when ''''IMART_AUDIT_ROW_ID'''' then ''''Audit Row ID'''' when ''''ITEMCODE'''' then ''''Item'''' else initcap(replace(p_column,''''_'''','''' '''')) end);'',
'' end;'',
'' function actor_name(p_code varchar2,p_user varchar2) return varchar2 is v varchar2(255);'',
'' begin select max(coalesce(e.employeename,b.bossusername)) into v from bossuser b left join employee e on e.employeecode=b.employeecode'',
'' where b.bossusercode=p_code or (p_code is null and upper(b.loginname)=upper(p_user));'',
'' return coalesce(v,p_user,p_code,''''Unknown user'''');end;'',
'' function readable(p_field varchar2,p_value clob) return varchar2 is v varchar2(500);k varchar2(500):=dbms_lob.substr(p_value,500,1);'',
'' begin'',
''  if k is null then return null;end if;'',
''  case p_field'',
''   when ''''PARTYCODE'''' then select max(partyname) into v from party where partycode=k;'',
''   when ''''ITEMCODE'''' then select max(itemname) into v from item where itemcode=k;'',
''   when ''''LOCATIONCODE'''' then select max(locationname) into v from location where locationcode=k;'',
''   when ''''DOCTYPECODE'''' then select max(doctypename) into v from doctype where doctypecode=k;'',
''   when ''''EMPLOYEECODE'''' then select max(employeename) into v from employee where employeecode=k;'',
''   when ''''ITEMSPECIFICATIONCODE'''' then select max(itemspecificationname) into v from itemspecification where itemspecificationcode=k;'',
''   else return null;'',
''  end case;return v;'',
'' end;'',
'' function item_context(p_line varchar2) return varchar2 is begin return case when p_line is not null then ''''Detail') ||
to_clob(' Line ''''||p_line end;end;'',
''begin'',
'' apex_json.initialize_clob_output;'',
'' apex_json.open_object;'',
'' if :APP_ID<>105 or :APP_PAGE_ID<>51 or not imart_audit.can_inquire then'',
''  apex_json.write(''''status'''',''''restricted'''');apex_json.write(''''message'''',''''Audit history access is not granted for this user.'''');'',
'' else'',
''  begin select v(''''GLOBAL_COMPANYCODE''''),cast(null as varchar2(128)),json_object(''''TNO'''' value to_char(TNO,''''TM9'''',''''NLS_NUMERIC_CHARACTERS=''''''''.,'''''''''''')),to_char(TNO,''''TM9'''',''''NLS_NUMERIC_CHARACTERS=''''''''.,''''''''''''),json_array(json_object(''''t'''' value ''''MEASURINGUNIT'''',''''c'''' val''
||''ue ''''TNO'''',''''v'''' value to_char(TNO,''''TM9'''',''''NLS_NUMERIC_CHARACTERS=''''''''.,'''''''''''')) returning clob) into l_company,l_location,l_record,l_tno,l_links from MEASURINGUNIT where TNO=to_number(:P51_TNO default null on conversion error);l_doc:=l_record;'',
''  exception when no_data_found then l_doc:=null;when too_many_rows then l_doc:=null;end;'',
''  if l_doc is null then apex_json.write(''''status'''',''''empty'''');apex_json.write(''''message'''',''''History is available after this record has been saved.'''');'',
''  elsif imart_audit.can_read(l_company,l_location)<>1 then'',
''   apex_json.write(''''status'''',''''restricted'''');apex_json.write(''''message'''',''''Audit history access is not granted for this document.'''');'',
''  else'',
''   -- A sequence boundary is not an audit row; authorize only the document''''s candidate rows below.'',
''   if l_snapshot is null then select nvl(max(audit_event_id),0) into l_snapshot from imart_audit_event;end if;'',
''   apex_json.write(''''status'''',''''ok'''');apex_json.write(''''snapshot'''',to_char(l_snapshot));'',
''   if l_mode=''''LIST'''' then'',
''    apex_json.open_array(''''activities'''');'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or exists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''''APEX_USER'''' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1'',
'')'',
'''',
''     , grouped as ('',
''      select activity_key,max(audit_event_id) sort_id,min(event_timestamp) first_time,max(event_timestamp) last_time,'',
''      max(user_name) user_name,max(bossusercode) bossusercode,max(rawtohex(request_id)) request_id,max(transaction_id) transaction_id,'',
''      sum(field_count) change_count,'',
''      count(*) event_count,'',
''      case when max(case when table_name=l_root and action_type=''''INSERT'''' and event_type=''''ROW_CHANGE'''' then 1 else 0 end)=1 then ''''CREATED'''''',
''       when max(case when action_type=''''APPROVE'''' then 1 else 0 end)=1 then ''''APPROVED'''''',
''       when max(case when action_type=''''REJECT'''' then 1 else 0 end)=1 then ''''REJECTED'''''',
''       when max(case when action_type=''''CANCEL'''' then 1 else 0 end)=1 then ''''CANCELLED'''''',
''       when max(case when table_name=l_root and action_type=''''DELETE'''' then 1 else 0 end)=1 then ''''DELETED'''''',
''       when max(case when action_type=''''SUBMIT'''' then 1 else 0 end)=1 and max(case when event_type=''''ROW_CHANGE'''' then 1 else 0 end)=0 then ''''SUBMITTED'''''',
''       else ''''UPDATED'''' end activity_type'',
''      from eligible e group by activity_key'',
''     ) select * from grouped where (l_filter=''''ALL'''' or activity_type=l_filter)'',
''     and (l_after is null or (l_sort=''''NEWEST'''' and sort_id<l_after) or (l_sort=''''OLDEST'''' and sort_id>l_after))'',
''     order by case when l_sort=''''NEWEST'''' then -sort_id else sort_id end fetch first 21 rows only'',
''    ) loop'',
''     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;'',
''     apex_json.open_object;apex_json.write(''''key'''',r.activity_key);apex_json.write(''''cursor'''',to_char(r.sort_id));'',
''     apex_json.write(''''type'''',r.activity_type);apex_json.write(''''changes'''',r.change_count);apex_json.') ||
to_clob('write(''''events'''',r.event_count);'',
''     apex_json.write(''''user'''',actor_name(r.bossusercode,r.user_name));apex_json.write(''''login'''',r.user_name);'',
''     apex_json.write(''''time'''',to_char(r.first_time at time zone sessiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''lastTime'''',to_char(r.last_time at time zone sessiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''request'''',r.request_id);apex_json.write(''''transaction'''',r.transaction_id);apex_json.close_object;'',
''    end loop;'',
''    apex_json.close_array;apex_json.write(''''more'''',l_more);'',
''   elsif l_mode=''''DETAIL'''' then'',
''    apex_json.open_array(''''changes'''');'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or exists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''''APEX_USER'''' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1'',
'')'',
'''',
''     select c.*,e.action_type,e.record_key,e.event_timestamp,e.user_name,e.bossusercode,e.outcome,'',
''     coalesce(json_value(e.record_key,''''$.SNO''''),(select coalesce(dbms_lob.substr(z.new_value,100,1),dbms_lob.substr(z.old_value,100,1))'',
''       from imart_audit_event h join imart_audit_change z on z.audit_event_id=h.audit_event_id'',
''       where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''       and h.audit_event_id<=e.audit_event_id and z.column_name=''''SNO'''''',
''       order by h.audit_event_id desc,z.audit_change_id desc fetch first 1 row only)) line_id'',
''     from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id'',
''     where e.activity_key=l_key and (l_after is null or c.audit_change_id>l_after)'',
''     order by c.audit_change_id fetch first 21 rows only'',
''    ) loop'',
''     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;'',
''     apex_json.open_object;apex_json.write(''''id'''',to_char(r.audit_change_id));apex_json.write(''''event'''',to_char(r.audit_event_id));'',
''     apex_json.write(''''table'''',r.table_name);apex_json.write(''''field'''',r.column_name);apex_json.write(''''label'''',label_for(r.table_name,r.column_name));'',
''     apex_json.write(''''action'''',r.action_type);apex_json.write(''''record'''',r.record_key);apex_json.write(''''line'''',r.line_id);'',
''     apex_json.write(''''item'''',item_context(r.line_id));'',
''     apex_json.write(''''user'''',actor_name(r.bossusercode,r.user_name));'',
''     apex_json.write(''''time'''',to_char(r.event_timestamp at time zone sessiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''old'''',dbms_lob.substr(r.old_value,2000,1));apex_json.write(''''new'''',dbms_lob.substr(r.new_value,2000,1));'',
''     if r.old_state=''''VALUE'''' and r.capture_mode=''''FULL'''' then apex_json.write(''''oldLabel'''',readable(r.column_name,r.old_value));end if;'',
''     if r.new_state=''''VALUE'''' and r.capture_mode=''''FULL'''' then apex_json.write(''''newLabel'''',readable(r.column_name,r.new_value));end if;'',
''     apex_json.write(''''oldState'''',r.old_state);apex_json.write(''''newState'''',r.new_state);apex_json.write(''''mode'''',r.capture_mode);'',
''     apex_json.write(''''long'''',greatest(nvl(dbms_lob.getlength(r.old_value),0),nvl(dbms_lob.getlength(r.new_value),0))>2000);'',
''     apex_json.close_object;'',
''    end loop;'',
''    apex_json.close_array;apex_json.write(''''more'''',l_more);'',
''    apex_json.open_array(''''events'''');'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links ') ||
to_clob('s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or exists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''''APEX_USER'''' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1'',
'')'',
'''',
''     select audit_event_id,action_type,table_name,record_key,outcome,event_type,event_timestamp,remarks,user_name,bossusercode'',
''     from eligible e where activity_key=l_key and not exists(select 1 from imart_audit_change c where c.audit_event_id=e.audit_event_id)'',
''     order by audit_event_id'',
''    ) loop'',
''     apex_json.open_object;apex_json.write(''''event'''',to_char(r.audit_event_id));apex_json.write(''''action'''',r.action_type);'',
''     apex_json.write(''''table'''',r.table_name);apex_json.write(''''record'''',r.record_key);apex_json.write(''''outcome'''',r.outcome);'',
''     apex_json.write(''''time'''',to_char(r.event_timestamp at time zone sessiontimezone,''''DD-MM-YYYY HH:MI:SS AM TZH:TZM''''));'',
''     apex_json.write(''''user'''',actor_name(r.bossusercode,r.user_name));apex_json.write(''''remarks'''',r.remarks);apex_json.close_object;'',
''    end loop;apex_json.close_array;'',
''   elsif l_mode=''''VALUE'''' then'',
''    for r in ('',
''with links as ('',
'' select t,c,v from json_table(l_links,''''$[*]'''' columns(t varchar2(128) path ''''$.t'''',c varchar2(128) path ''''$.c'''',v varchar2(4000) path ''''$.v''''))'',
''), anchor_keys as ('',
'' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v'',
'' from links s join imart_audit_event e on e.table_name=s.t'',
'' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c'',
'' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v'',
''), owned as ('',
'' select /*+ materialize */ e.* from imart_audit_event e'',
'' where e.application_id=105 and e.event_type in (''''ROW_CHANGE'''',''''BUSINESS'''') and e.outcome in (''''SUCCESS'''',''''OBSERVED'''')'',
'' and ('',
''  (e.table_name=l_root and json_equal(e.record_key,l_record))'',
''  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''''$.TNO'''')=l_tno)))'',
''  or exists(select 1 from links s where s.t=e.table_name and s.c=''''TNO'''' and json_value(e.record_key,''''$.TNO'''')=s.v)'',
''  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key'',
''   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))'',
''        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id'',
''        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key'',
''        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c'',
''        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)'',
'' )'',
''), eligible as ('',
'' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then'',
'' rawtohex(standard_hash(rawtohex(request_id)||''''|''''||transaction_id||''''|''''||nvl(bossusercode,user_name)||''''|''''||apex_session_id||''''|''''||source_type,''''SHA256''''))'',
'' else ''''EVENT-''''||to_char(audit_event_id) end activity_key'',
'' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''''APEX_USER'''' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1'',
'')'',
'''',
''     select c.old_value,c.new_value from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id'',
''     where e.activity_key=l_key and c.audit_change_id=l_after'',
''    ) loop apex_json.write(''''old'''',r.old_value);apex_json.write(''''new'''',r.new_value);e') ||
to_clob('nd loop;'',
''   else raise_application_error(-20001,''''Unsupported history request'''');end if;'',
''  end if;'',
'' end if;'',
'' apex_json.close_object;l_json:=apex_json.get_clob_output;'',
'' while l_pos<=dbms_lob.getlength(l_json) loop sys.htp.prn(dbms_lob.substr(l_json,8000,l_pos));l_pos:=l_pos+8000;end loop;'',
'' apex_json.free_output;'',
''exception when others then'',
'' apex_json.free_output;'',
'' apex_json.open_object;apex_json.write(''''status'''',''''error'''');apex_json.write(''''message'''',''''History could not be loaded. Retry or open Audit Trail.'''');apex_json.close_object;'',
''end;'',
''''))
,p_process_clob_language=>''PLSQL''
,p_internal_uid=>25266988849897190
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000512)
,p_process_sequence=>-1000000
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''IMART save receipt begin''
,p_static_id=>''imart-save-receipt-begin''
,p_process_sql_clob=>''declare ack_keys clob;begin select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.begin_v2(:P51_IMART_SAVE_OP_ID,''''P51_TNO'''',ack_keys);end;''
,p_process_clob_language=>''PLSQL''
,p_process_when=>''CREATE,SAVE''
,p_process_when_type=>''REQUEST_IN_CONDITION''
,p_internal_uid=>99061010105000512
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000513)
,p_process_sequence=>1000000
,p_process_point=>''AFTER_SUBMIT''
,p_process_type=>''NATIVE_PLSQL''
,p_process_name=>''IMART save receipt finish''
,p_static_id=>''imart-save-receipt-finish''
,p_process_sql_clob=>''declare ack_keys clob;begin select json_array(to_char(:P51_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.finish_v2(:P51_IMART_SAVE_OP_ID,ack_keys);end;''
,p_process_clob_language=>''PLSQL''
,p_process_when=>''CREATE,SAVE''
,p_process_when_type=>''REQUEST_IN_CONDITION''
,p_process_success_message=>''Document saved.''
,p_internal_uid=>99061010105000513
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579864182802746481)
,p_process_sequence=>10
,p_process_point=>''BEFORE_HEADER''
,p_region_id=>wwv_flow_imp.id(579850955118746468)
,p_process_type=>''NATIVE_FORM_INIT''
,p_process_name=>''Initialize form Measuring Unit Master''
,p_static_id=>''initialize-form-measuring-unit-master''
,p_internal_uid=>139477837551819957
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(579864615080746482)
,p_process_sequence=>20
,p_process_point=>''AFTER_SUBMIT''
,p_region_id=>wwv_flow_imp.id(579850955118746468)
,p_process_type=>''NATIVE_FORM_DML''
,p_process_name=>''Process form Measuring Unit Master''
,p_static_id=>''process-form-measuring-unit-master''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  ''lock_row'', ''Y'',
  ''prevent_lost_updates'', ''Y'',
  ''return_primary_keys_after_insert'', ''Y'',
  ''target_type'', ''REGION_SOURCE'')).to_clob
,p_error_display_location=>''INLINE_IN_NOTIFICATION''
,p_internal_uid=>139478269829819958
);
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 6 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 7 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('declare
 l_doc varchar2(4000);l_root varchar2(128):=''MEASURINGUNIT'';l_record varchar2(4000);l_tno varchar2(100);l_links clob;
 l_mode varchar2(20):=apex_application.g_x01;
 l_key varchar2(100):=apex_application.g_x02;
 l_after number:=to_number(apex_application.g_x03 default null on conversion error);
 l_snapshot number:=to_number(apex_application.g_x04 default null on conversion error);
 l_sort varchar2(10):=case when apex_application.g_x05=''OLDEST'' then ''OLDEST'' else ''NEWEST'' end;
 l_filter varchar2(20):=nvl(apex_application.g_x06,''ALL'');
 l_company varchar2(128);l_location varchar2(128);l_count number:=0;l_more boolean:=false;
 l_json clob;l_pos pls_integer:=1;
 function label_for(p_table varchar2,p_column varchar2) return varchar2 is v varchar2(500);
 begin
  select max(regexp_replace(label,''<[^>]+>'','''')) into v from apex_application_page_items
  where application_id=105 and page_id=51 and item_source=p_column and label is not null;
  return coalesce(v,case p_column when ''QUANTITY1'' then ''Primary Quantity'' when ''QUANTITY2'' then ''Secondary Quantity''
    when ''ITEMSPECS'' then ''Item Specification'' when ''TNO'' then ''Document ID'' when ''SNO'' then ''Line ID''
    when ''IMART_AUDIT_ROW_ID'' then ''Audit Row ID'' when ''ITEMCODE'' then ''Item'' else initcap(replace(p_column,''_'','' '')) end);
 end;
 function actor_name(p_code varchar2,p_user varchar2) return varchar2 is v varchar2(255);
 begin select max(coalesce(e.employeename,b.bossusername)) into v from bossuser b left join employee e on e.employeecode=b.employeecode
 where b.bossusercode=p_code or (p_code is null and upper(b.loginname)=upper(p_user));
 return coalesce(v,p_user,p_code,''Unknown user'');end;
 function readable(p_field varchar2,p_value clob) return varchar2 is v varchar2(500);k varchar2(500):=dbms_lob.substr(p_value,500,1);
 begin
  if k is null then return null;end if;
  case p_field
   when ''PARTYCODE'' then select max(partyname) into v from party where partycode=k;
   when ''ITEMCODE'' then select max(itemname) into v from item where itemcode=k;
   when ''LOCATIONCODE'' then select max(locationname) into v from location where locationcode=k;
   when ''DOCTYPECODE'' then select max(doctypename) into v from doctype where doctypecode=k;
   when ''EMPLOYEECODE'' then select max(employeename) into v from employee where employeecode=k;
   when ''ITEMSPECIFICATIONCODE'' then select max(itemspecificationname) into v from itemspecification where itemspecificationcode=k;
   else return null;
  end case;return v;
 end;
 function item_context(p_line varchar2) return varchar2 is begin return case when p_line is not null then ''Detail Line ''||p_line end;end;
begin
 apex_json.initialize_clob_output;
 apex_json.open_object;
 if :APP_ID<>105 or :APP_PAGE_ID<>51 or not imart_audit.can_inquire then
  apex_json.write(''status'',''restricted'');apex_json.write(''message'',''Audit history access is not granted for this user.'');
 else
  begin select v(''GLOBAL_COMPANYCODE''),cast(null as varchar2(128)),json_object(''TNO'' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')),to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,''''''),json_array(json_object(''t'' value ''MEASURINGUNIT'',''c'' value ''TNO'',''v'' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) returning clob) into l_company,l_location,l_record,l_tno,l_links from MEASURINGUNIT where TNO=to_number(:P51_TNO default null on conversion error);l_doc:=l_record;
  exception when no_data_found then l_doc:=null;when too_many_rows then l_doc:=null;end;
  if l_doc is null then apex_json.write(''status'',''empty'');apex_json.write(''message'',''History is available after this record has been saved.'');
  elsif imart_audit.can_read(l_company,l_location)<>1 then
   apex_json.write(''status'',''restricted'');apex_json.write(''message'',''Audit history access is not granted for this document.'');
  else
   -- A sequence boundary is not an audit row; authorize only the document''s candidate rows below.
   if l_snapshot is null then select nvl(max(audit_event_id),0) into l_snapshot from imart_audit_event;end if;
   apex_json.write(''status'',''ok'');apex_json.write(''snapshot'',to_char(l_snapshot));
   if l_mode=''LIST'' then
    apex_json.open_array(''activities'');
    for r in (
with links as (
 select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_ha') ||
to_clob('sh(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))
 else ''EVENT-''||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''APEX_USER'' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     , grouped as (
      select activity_key,max(audit_event_id) sort_id,min(event_timestamp) first_time,max(event_timestamp) last_time,
      max(user_name) user_name,max(bossusercode) bossusercode,max(rawtohex(request_id)) request_id,max(transaction_id) transaction_id,
      sum(field_count) change_count,
      count(*) event_count,
      case when max(case when table_name=l_root and action_type=''INSERT'' and event_type=''ROW_CHANGE'' then 1 else 0 end)=1 then ''CREATED''
       when max(case when action_type=''APPROVE'' then 1 else 0 end)=1 then ''APPROVED''
       when max(case when action_type=''REJECT'' then 1 else 0 end)=1 then ''REJECTED''
       when max(case when action_type=''CANCEL'' then 1 else 0 end)=1 then ''CANCELLED''
       when max(case when table_name=l_root and action_type=''DELETE'' then 1 else 0 end)=1 then ''DELETED''
       when max(case when action_type=''SUBMIT'' then 1 else 0 end)=1 and max(case when event_type=''ROW_CHANGE'' then 1 else 0 end)=0 then ''SUBMITTED''
       else ''UPDATED'' end activity_type
      from eligible e group by activity_key
     ) select * from grouped where (l_filter=''ALL'' or activity_type=l_filter)
     and (l_after is null or (l_sort=''NEWEST'' and sort_id<l_after) or (l_sort=''OLDEST'' and sort_id>l_after))
     order by case when l_sort=''NEWEST'' then -sort_id else sort_id end fetch first 21 rows only
    ) loop
     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;
     apex_json.open_object;apex_json.write(''key'',r.activity_key);apex_json.write(''cursor'',to_char(r.sort_id));
     apex_json.write(''type'',r.activity_type);apex_json.write(''changes'',r.change_count);apex_json.write(''events'',r.event_count);
     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));apex_json.write(''login'',r.user_name);
     apex_json.write(''time'',to_char(r.first_time at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));
     apex_json.write(''lastTime'',to_char(r.last_time at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));
     apex_json.write(''request'',r.request_id);apex_json.write(''transaction'',r.transaction_id);apex_json.close_object;
    end loop;
    apex_json.close_array;apex_json.write(''more'',l_more);
   elsif l_mode=''DETAIL'' then
    apex_json.open_array(''changes'');
    for r in (
with links as (
 select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))
 else ''EVENT-''||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''APEX_USER'' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     select c.*,e.action_type,e.record_key,e.event_timestamp,e.user_name,e.bossusercode,e.outcome,
     coalesce(json_value(e.record_key,''$.SNO''),(select coalesce(dbms_lob.substr(z.new_value,100,1),dbms_lob.substr(z.old_value,100,1))
       from imart_audit_event h join imart_audit_change z on z.audit_event_id=h.audit_event_id
       where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
       and h.audit_event_id<=e.audit_event_id and z.column_name=''SNO''
       order by h.audit_event_id desc,z.audit_change_id desc fetch first 1 row only)) line_id
     from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_i') ||
to_clob('d
     where e.activity_key=l_key and (l_after is null or c.audit_change_id>l_after)
     order by c.audit_change_id fetch first 21 rows only
    ) loop
     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;
     apex_json.open_object;apex_json.write(''id'',to_char(r.audit_change_id));apex_json.write(''event'',to_char(r.audit_event_id));
     apex_json.write(''table'',r.table_name);apex_json.write(''field'',r.column_name);apex_json.write(''label'',label_for(r.table_name,r.column_name));
     apex_json.write(''action'',r.action_type);apex_json.write(''record'',r.record_key);apex_json.write(''line'',r.line_id);
     apex_json.write(''item'',item_context(r.line_id));
     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));
     apex_json.write(''time'',to_char(r.event_timestamp at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));
     apex_json.write(''old'',dbms_lob.substr(r.old_value,2000,1));apex_json.write(''new'',dbms_lob.substr(r.new_value,2000,1));
     if r.old_state=''VALUE'' and r.capture_mode=''FULL'' then apex_json.write(''oldLabel'',readable(r.column_name,r.old_value));end if;
     if r.new_state=''VALUE'' and r.capture_mode=''FULL'' then apex_json.write(''newLabel'',readable(r.column_name,r.new_value));end if;
     apex_json.write(''oldState'',r.old_state);apex_json.write(''newState'',r.new_state);apex_json.write(''mode'',r.capture_mode);
     apex_json.write(''long'',greatest(nvl(dbms_lob.getlength(r.old_value),0),nvl(dbms_lob.getlength(r.new_value),0))>2000);
     apex_json.close_object;
    end loop;
    apex_json.close_array;apex_json.write(''more'',l_more);
    apex_json.open_array(''events'');
    for r in (
with links as (
 select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))
 else ''EVENT-''||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''APEX_USER'' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     select audit_event_id,action_type,table_name,record_key,outcome,event_type,event_timestamp,remarks,user_name,bossusercode
     from eligible e where activity_key=l_key and not exists(select 1 from imart_audit_change c where c.audit_event_id=e.audit_event_id)
     order by audit_event_id
    ) loop
     apex_json.open_object;apex_json.write(''event'',to_char(r.audit_event_id));apex_json.write(''action'',r.action_type);
     apex_json.write(''table'',r.table_name);apex_json.write(''record'',r.record_key);apex_json.write(''outcome'',r.outcome);
     apex_json.write(''time'',to_char(r.event_timestamp at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));
     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));apex_json.write(''remarks'',r.remarks);apex_json.close_object;
    end loop;apex_json.close_array;
   elsif l_mode=''VALUE'' then
    for r in (
with links as (
 select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))
), anchor_keys as (
 select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v
 from links s join imart_audit_event e on e.table_name=s.t
 join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c
 where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v
), owned as (
 select /*+ materialize */ e.* from imart_audit_event e
 where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')
 and (
  (e.table_name=l_root and json_equal(e.record_key,l_record))
  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))
  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)
  or exists(select 1 from anchor_keys k where k.table_name=') ||
to_clob('e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key
   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))
        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id
        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key
        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c
        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)
 )
), eligible as (
 select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then
 rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))
 else ''EVENT-''||to_char(audit_event_id) end activity_key
 from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''APEX_USER'' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1
)

     select c.old_value,c.new_value from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id
     where e.activity_key=l_key and c.audit_change_id=l_after
    ) loop apex_json.write(''old'',r.old_value);apex_json.write(''new'',r.new_value);end loop;
   else raise_application_error(-20001,''Unsupported history request'');end if;
  end if;
 end if;
 apex_json.close_object;l_json:=apex_json.get_clob_output;
 while l_pos<=dbms_lob.getlength(l_json) loop sys.htp.prn(dbms_lob.substr(l_json,8000,l_pos));l_pos:=l_pos+8000;end loop;
 apex_json.free_output;
exception when others then
 apex_json.free_output;
 apex_json.open_object;apex_json.write(''status'',''error'');apex_json.write(''message'',''History could not be loaded. Retry or open Audit Trail.'');apex_json.close_object;
end;
');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 8 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN
 s := to_clob('DECLARE
 function creation_test(p_page number,p_mode varchar2) return varchar2 is
  x imart_mr_creation%rowtype; pred varchar2(4000);
 begin
  select * into x from imart_mr_creation where page_id=p_page;
  if p_mode=''RECENT'' and x.created_column is not null then
   pred:=''mr_created.''||dbms_assert.simple_sql_name(x.created_column)||'' >= sysdate-7 and mr_created.''||dbms_assert.simple_sql_name(x.created_column)||'' <= sysdate'';
  elsif p_mode=''MINE'' and x.creator_column is not null then
   pred:=''upper(trim(mr_created.''||dbms_assert.simple_sql_name(x.creator_column)||''))=upper(trim(:APP_USER))'';
   if p_page=50 then
    pred:=''(''||pred||'' or exists(select 1 from bossuser mr_creator_identity where upper(trim(mr_creator_identity.bossusername))=upper(trim(:APP_USER)) and upper(trim(mr_creator_identity.loginname))=upper(trim(mr_created.''||dbms_assert.simple_sql_name(x.creator_column)||''))))'';
   end if;
  else return ''1=0'';end if;
  return ''exists(select 1 from ''||dbms_assert.simple_sql_name(x.table_name)||'' mr_created where mr_created.''||dbms_assert.simple_sql_name(x.identity_column)||''=mr_source.''||dbms_assert.simple_sql_name(x.identity_column)||'' and ''||pred||'')'';
 exception when no_data_found then return ''1=0'';
 end;
 function cname(p_page number) return varchar2 is
 begin return ''MR_KPI_105_''||to_char(p_page,''FM999999'');end;
 function selected_mode(p_page number) return varchar2 is m varchar2(10);cn varchar2(100):=cname(p_page);
 begin select c001 into m from apex_collections where collection_name=cn and seq_id=1;return m;
 exception when no_data_found then return ''ALL'';end;
 function selected_status(p_page number) return varchar2 is s varchar2(4000);cn varchar2(100):=cname(p_page);
 begin select c002 into s from apex_collections where collection_name=cn and seq_id=1;return s;
 exception when no_data_found then return null;end;
 procedure context(p_page number,r out imart_mr_register%rowtype,c out imart_mr_catalog%rowtype) is
 begin
  if v(''APP_ID'')<>''105'' or p_page<>to_number(v(''APP_PAGE_ID'')) then raise_application_error(-20001,''Register context mismatch'');end if;
  select * into c from imart_mr_catalog where register_page=p_page and imart_master_reports.allowed(module_code)=1 fetch first 1 row only;
  select * into r from imart_mr_register where page_id=p_page and module_code=c.module_code;
 end;
 procedure apply_status(p_page number,p_mode varchar2,p_status varchar2) is
  r imart_mr_register%rowtype;c imart_mr_catalog%rowtype;
 begin
  context(p_page,r,c);
  if p_mode not in (''ALL'',''STATUS'',''RECENT'',''MINE'') or p_mode is null or length(p_status)>4000 then raise_application_error(-20002,''Invalid KPI filter'');end if;
  if p_mode=''STATUS'' and r.status_expression is null then raise_application_error(-20003,''No status available'');end if;
  if p_mode in (''RECENT'',''MINE'') and creation_test(p_page,p_mode)=''1=0'' then raise_application_error(-20003,''Creation metadata unavailable'');end if;
  apex_collection.create_or_truncate_collection(cname(p_page));
  apex_collection.add_member(p_collection_name=>cname(p_page),p_c001=>p_mode,p_c002=>p_status);
  apex_json.open_object;apex_json.write(''ok'',true);apex_json.close_object;
 end;
 procedure payload(p_page number) is
  r imart_mr_register%rowtype;c imart_mr_catalog%rowtype;
  src clob;q clob;cur integer;n integer;b varchar2(128);seen varchar2(32767):=''|'';
  status_value varchar2(4000);amount number;total number:=0;recent number:=0;mine number:=0;nr number;nm number;
  type counts is table of number index by pls_integer;
  type labels is table of varchar2(4000) index by pls_integer;
  vals labels;nums counts;i pls_integer:=0;
  procedure card(label varchar2,value number,card_mode varchar2,status varchar2) is
  begin
   apex_json.open_object;apex_json.write(''label'',label);apex_json.write(''value'',to_char(value,''FM999G999G999G990''));
   apex_json.write(''mode'',card_mode);apex_json.write(''status'',status,true);
   apex_json.write(''selected'',selected_mode(p_page)=card_mode and (card_mode<>''STATUS'' or nvl(selected_status(p_page),chr(1))=nvl(status,chr(1))));
   if card_mode=''RECENT'' then apex_json.write(''note'',''Created in the last 7 days'');
   elsif card_mode=''MINE'' then apex_json.write(''note'',''Created by ''||v(''APP_USER''));end if;
   apex_json.close_object;
  end;
 begin
  context(p_page,r,c);
  src:=regexp_replace(r.query_sql,'';[[:space:]]*$'','''');
  src:=''select distinct ''||case when r.identity_column is not null then dbms_assert.simple_sql_name(r.identity_column)||'' mr_id,'' else ''rownum mr_id,'' end||
    case when r.status_expression is null then ''cast(null as varchar2(4000))'' else ''trim(cast(''||r.status_expression||'' as varchar2(4000)))'' end||'' mr_status,''||
    ''case when ''||creation_test(p_page,''RECENT'')||'' then 1 else 0 end mr_recent,''||
    ''case when ''||creation_test(p_page,''MINE'')||'' then 1 else 0 end mr_mine from (''||src||chr(10)||'') mr_source'';
  q:=''select mr_status,count(*),sum(mr_recent),sum(mr_mine) from (''||src||chr(10)||'') group by mr_status order by mr_status nulls last'';
  cur:=dbms_sql.open_cursor;dbms_sql.parse(cur,q,dbms_sql.native);
  for j in 1..regexp_count(src,'':[A-Za-z][A-Za-z0-9_]*'') loop
   b:=upper(regexp_substr(src,'':([A-Za-z][A-Za-z0-9_]*)'',1,j,null,1));
   if instr(seen,''|''||b||''|'')=0 then
    begin dbms_sql.bind_variable(cur,'':''||b,v(b));exception when others then if sqlcode<>-1006 then raise;end if;end;
    seen:=seen||b||''|'';
   end if;
  end loop;
  dbms_sql.define_column(cur,1,status_value,4000);dbms_sql.define_column(cur,2,amount);
  dbms_sql.define_column(cur,3,nr);dbms_sql.define_column(cur,4,nm);
  n:=dbms_sql.execute(cur);
  while dbms_sql.fetch_rows(cur)>0 loop
   dbms_sql.column_value(cur,1,status_value);dbms_sql.column_value(cur,2,amount);
   dbms_sql.column_value(cur,3,nr);dbms_sql.column_value(cur,4,nm);recent:=recent+nr;mine:=mine+nm;
   i:=i+1;vals(i):=status_value;nums(i):=amount;total:=total+amount;
  end loop;
  dbms_sql.close_cursor(cur);
  apex_json.open_object;apex_json.write(''title'',c.master_name||'' KPIs''') ||
to_clob(');apex_json.write(''region'',r.region_static_id);
  apex_json.write(''scope'',''Click a card to filter this register. Total clears only the KPI filter. New records uses the actual creation timestamp in the last rolling 7 days (server time), excluding future dates. Created by me matches the signed-in username against the original creator, across all dates. Counts use distinct masters and current page filters; report search/saved-report filters are additional.'');
  apex_json.open_array(''cards'');card(''Total'',total,''ALL'',null);
  if r.status_expression is not null then for j in 1..i loop card(nvl(vals(j),''No status''),nums(j),''STATUS'',vals(j));end loop;end if;
  if creation_test(p_page,''RECENT'')<>''1=0'' then card(''New records'',recent,''RECENT'',null);end if;
  if creation_test(p_page,''MINE'')<>''1=0'' then card(''Created by me'',mine,''MINE'',null);end if;
  apex_json.close_array;apex_json.close_object;
 exception when others then
  if cur is not null and dbms_sql.is_open(cur) then dbms_sql.close_cursor(cur);end if;raise;
 end;
BEGIN NULL; END;');
 DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block 9 compiled.');
EXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;
/
EXIT
