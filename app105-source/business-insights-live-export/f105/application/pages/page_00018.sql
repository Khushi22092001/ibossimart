prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_name=>'Procure to Pay'
,p_alias=>'PROCURE-TO-PAY'
,p_step_title=>'Procure to Pay'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'body',
'{',
'  background-image: url(''#APP_FILES#Procure_Image.png'');',
'  background-position-x: center; ',
'  background-position-y: center; ',
'  background-size: 1200px 530px;',
'  background-repeat: no-repeat;',
'}',
'',
'.btn1 {',
'    position: absolute;',
'    left: 190px;',
'  top: 140px;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(575909703951096662)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(575910039925096665)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(575909703951096662)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'New'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3::'
,p_button_css_classes=>'btn1'
,p_icon_css_classes=>'fa-file-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp.component_end;
end;
/
