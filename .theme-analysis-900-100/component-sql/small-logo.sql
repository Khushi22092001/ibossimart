prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1516696681383506
,p_default_application_id=>100
,p_default_id_offset=>700000000000000000
,p_default_owner=>'SAGARDASHBOARD'
);
end;
/
 
prompt APPLICATION 900 - DASHBOARD(UI DEVELOPMENT)
--
-- Application Export:
--   Application:     900
--   Name:            DASHBOARD(UI DEVELOPMENT)
--   Date and Time:   17:00 Saturday August 29, 2026
--   Exported By:     SAGARDASHBOARD
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     APP_STATIC_FILE: 19306504578432690
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/files/smallinfomaticslogo_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D494844520000000F0000000F08060000003BD6954A0000000467414D410000B18E7CFB5193000000206348524D00007A25000080830000F9FF000080E9000075300000EA6000003A980000176F925FC54600000009704859';
wwv_flow_imp.g_varchar2_table(2) := '7300000EC400000EC401952B0E1B0000021049444154384F5D524D6F125114BD33A22D12136C48DA056C1AEB121693D8AE887687135C1877FC01D6D81F607069DCE81EBB65E7564C0CC930D0484631B65D5883C0A29086126AA953869977BDEF320CC633';
wwv_flow_imp.g_varchar2_table(3) := '3973EF3BF79CF9783380FFE1F8C7093ADD1EDA00E82A80E78A8A9728B0DBEBF98E2582B06DDBA8691AC2CA2A62BB8D530A23B14BFC3375A805CC3EC9FAEE39383C994C30140AB141F282B4E19BB778BCFD00CFEA757C5FF910CC3636D66584C1E1542A15';
wwv_flow_imp.g_varchar2_table(4) := '0C67EE0C87BF2F70285C1CD16C743D45141ED61AF5C093CFE7650CA1D3E904A251ABB1784AFDD8E725D1BC19627D6FEF79E0958042A1C08B743ACD82207E7EF59ADF57F227A868340E7826B10897CB65540DC3A01E2097CB71558809FD3178BCA235093B';
wwv_flow_imp.g_varchar2_table(5) := '3BDBFE0A40D775AECD6613D4F1981E8E100E87B94A08FB9A2F2221EF35F37B89582CC65508016A3299E485699A5C25647011167C2C615916D7783C0E209F9D7AE602A7D657A400BFF3092878E5EB47478781B7DFEFCF3F55241261219E48B0E9ECFB21BA';
wwv_flow_imp.g_varchar2_table(6) := '7E586E98448FFE305555D897C96458E370B55A0DAEA83F7B8ACED52408775757D023CFE6E656E0711C47C696BF67A954E2C1AFD139B66FDDE1A0A4433C78F8083F352D9EB75A2D3F81A8C813898C4AE523DC8EADC1FA8B22B86B7741A51BA1E382777F0B';
wwv_flow_imp.g_varchar2_table(7) := 'BED0C6667777211A8DFA6EDAD47FC383C100DEEDEFC33D4D03E17934245105B841BBF7AD6142B1F8726E6400FC05A0B8D17CA807838B0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>719306504578432690
,p_file_name=>'smallinfomaticslogo.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
