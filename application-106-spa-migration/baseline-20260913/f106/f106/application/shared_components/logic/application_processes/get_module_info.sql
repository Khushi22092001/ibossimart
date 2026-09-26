prompt --application/shared_components/logic/application_processes/get_module_info
begin
--   Manifest
--     APPLICATION PROCESS: GET_MODULE_INFO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(47439247659632576)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'GET_MODULE_INFO'
,p_static_id=>'get-module-info'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_input        			VARCHAR2(200) := apex_application.g_x01; -- Value from Search Box',
'    v_module_part  			VARCHAR2(100);',
'    v_transaction_part  	VARCHAR2(200);',
'    v_report_page  			NUMBER;',
'    v_form_page    			NUMBER;',
'    v_table_name   			VARCHAR2(100);',
'    v_actual_tno   			NUMBER;',
'    v_first_slash  			NUMBER;',
'    v_sql          			VARCHAR2(1000);',
'BEGIN',
'',
'    v_first_slash := INSTR(v_input, ''/'');',
'',
'    IF v_first_slash > 0 THEN',
'        v_module_part := UPPER(TRIM(SUBSTR(v_input, 1, v_first_slash - 1)));',
'        v_transaction_part := TRIM(SUBSTR(v_input, v_first_slash + 1));',
'    ELSE',
'        v_module_part := UPPER(TRIM(v_input));',
'    END IF;',
'',
'    SELECT PAGENO, ENTRYPAGENO',
'      INTO v_report_page, v_form_page',
'      FROM MODULE',
'     WHERE UPPER(MODULECODE) = v_module_part ',
'        OR UPPER(MODULENAME) = v_module_part;',
'    ',
'    HTP.P(v_report_page);',
'',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN ',
'        HTP.P(''ERROR: Module "'' || v_module_part || ''" not found'');',
'    WHEN OTHERS THEN ',
'        HTP.P(''ERROR: Unexpected Application Error'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'33845802'
);
wwv_flow_imp.component_end;
end;
/
