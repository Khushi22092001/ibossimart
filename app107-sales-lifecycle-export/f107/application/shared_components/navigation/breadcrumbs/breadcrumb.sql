prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(583251902940425790)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(461867319885583448)
,p_short_name=>'Account Day Book'
,p_static_id=>'account-day-book'
,p_link=>'f?p=&APP_ID.:125:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>125
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(583557240903426357)
,p_short_name=>'Administration'
,p_static_id=>'administration'
,p_link=>'f?p=&APP_ID.:10000:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10000
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(465936021314899863)
,p_short_name=>'ATTENDENCE'
,p_static_id=>'attendence'
,p_link=>'f?p=&APP_ID.:631:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>631
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(622553133957282673)
,p_short_name=>'E-Invoice Report'
,p_static_id=>'e-invoice-report'
,p_link=>'f?p=&APP_ID.:134:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>134
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(465079703598811580)
,p_short_name=>'EMPLOYEE DEDUCTION EARNING'
,p_static_id=>'employee-deduction-earning'
,p_link=>'f?p=&APP_ID.:625:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>625
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(452681980212884053)
,p_short_name=>'F Search'
,p_static_id=>'f-search'
,p_link=>'f?p=&APP_ID.:9994:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9994
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(482799918961819739)
,p_short_name=>'Fixed Assets'
,p_static_id=>'fixed-assets'
,p_link=>'f?p=&APP_ID.:680:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>680
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(460060501419667189)
,p_short_name=>'HAR_SALEINCENTIVERATE'
,p_static_id=>'har-saleincentiverate'
,p_link=>'f?p=&APP_ID.:218:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>218
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(583252087190425792)
,p_short_name=>'Home'
,p_static_id=>'home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(598439604250238672)
,p_short_name=>'Purchase Order List'
,p_static_id=>'purchase-order-list'
,p_link=>'f?p=&APP_ID.:117:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>117
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(196374122973257718)
,p_short_name=>'Purchase Party Amount Report'
,p_static_id=>'purchase-party-amount-report'
,p_link=>'f?p=&APP_ID.:291:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>291
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(618659349036011388)
,p_short_name=>'Terms &amp; Condistion HeadList'
,p_static_id=>'terms-amp-condistion-headlist'
,p_link=>'f?p=&APP_ID.:172:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>172
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(618660479683011394)
,p_parent_id=>wwv_flow_imp.id(618659349036011388)
,p_short_name=>'Terms &amp; Condition'
,p_static_id=>'terms-amp-condition'
,p_link=>'f?p=&APP_ID.:173:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>173
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(624361211602097615)
,p_short_name=>'test'
,p_static_id=>'test'
,p_link=>'f?p=&APP_ID.:157:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>157
);
wwv_flow_imp.component_end;
end;
/
