prompt --application/shared_components/plugins/dynamic_action/uc_notifications
begin
--   Manifest
--     PLUGIN: UC_NOTIFICATIONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(167124377933688426)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'UC_NOTIFICATIONS'
,p_display_name=>'UC - Notifications'
,p_apexlang_name=>'ucNotifications'
,p_category=>'EXECUTE'
,p_image_prefix=>nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','UC_NOTIFICATIONS'),'')
,p_javascript_file_urls=>'#PLUGIN_FILES#js/script#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render',
'  ( p_dynamic_action apex_plugin.t_dynamic_action',
'  , p_plugin         apex_plugin.t_plugin',
'  )',
'return apex_plugin.t_dynamic_action_render_result',
'as',
'    l_result                 apex_plugin.t_dynamic_action_render_result;',
'',
'    -- component settings / application level',
'    l_default_position       p_dynamic_action.attribute_01%type := nvl(p_plugin.attribute_01, ''top-right'');',
'    l_default_success_icon   p_dynamic_action.attribute_01%type := nvl(p_plugin.attribute_02, ''fa-check-circle'');',
'    l_default_info_icon      p_dynamic_action.attribute_01%type := nvl(p_plugin.attribute_03, ''fa-info-circle'');',
'    l_default_warning_icon   p_dynamic_action.attribute_01%type := nvl(p_plugin.attribute_04, ''fa-exclamation-triangle'');',
'    l_default_error_icon     p_dynamic_action.attribute_01%type := nvl(p_plugin.attribute_05, ''fa-times-circle'');',
'    l_default_options        p_dynamic_action.attribute_01%type := nvl(p_plugin.attribute_06, ''escape-html:newest-on-top:client-side-substitutions:dismiss-on-click:dismiss-on-button'');',
'    l_errors_as_warnings     boolean                            := instr(p_plugin.attribute_06, ''errors-as-warnings'') > 0;',
'    l_default_dismiss_after  pls_integer                        := apex_plugin_util.replace_substitutions(p_plugin.attribute_07);',
'',
'    -- general attributes',
'    l_action                p_dynamic_action.attribute_01%type := p_dynamic_action.attribute_01;',
'    l_message_type          p_dynamic_action.attribute_02%type := p_dynamic_action.attribute_02;',
'    l_static_title          p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_03;',
'    l_static_message        p_dynamic_action.attribute_04%type := p_dynamic_action.attribute_04;',
'    l_js_title_code         p_dynamic_action.attribute_05%type := p_dynamic_action.attribute_05;',
'    l_js_message_code       p_dynamic_action.attribute_06%type := p_dynamic_action.attribute_06;',
'    l_override_defaults     boolean                            := nvl(p_dynamic_action.attribute_09,''N'') = ''Y'';',
'',
'    l_options               apex_t_varchar2 := apex_string.split(case when l_override_defaults then p_dynamic_action.attribute_07 else l_default_options end, '':'');',
'',
'    -- options',
'    l_auto_dismiss          boolean  := ''autodismiss''               member of l_options;',
'    l_escape                boolean  := ''escape-html''               member of l_options;',
'    l_auto_dismiss_success  boolean  := ''autodismiss-success''       member of l_options;',
'    l_auto_dismiss_warning  boolean  := ''autodismiss-warning''       member of l_options;',
'    l_auto_dismiss_error    boolean  := ''autodismiss-error''         member of l_options;',
'    l_auto_dismiss_info     boolean  := ''autodismiss-info''          member of l_options;',
'    l_client_substitutions  boolean  := ''client-side-substitutions'' member of l_options;',
'    l_clear_all             boolean  := ''remove-notifications''      member of l_options;',
'    l_show_dismiss_button   boolean  := ''dismiss-on-button''         member of l_options;',
'    l_dismiss_on_click      boolean  := ''dismiss-on-click''          member of l_options;',
'    l_newest_on_top         boolean  := ''newest-on-top''             member of l_options;',
'    l_prevent_duplicates    boolean  := ''prevent-duplicates''        member of l_options;',
'    l_inline_item_error     boolean  := p_dynamic_action.attribute_12 is not null;',
'    l_position              p_dynamic_action.attribute_08%type := case when l_override_defaults then p_dynamic_action.attribute_08 else l_default_position end;',
'    l_icon_override         p_dynamic_action.attribute_10%type := case when l_override_defaults then p_dynamic_action.attribute_10 else null end;',
'    l_icon                  p_dynamic_action.attribute_10%type;',
'    l_auto_dismiss_after    pls_integer                        := case when l_override_defaults then apex_plugin_util.replace_substitutions(p_dynamic_action.attribute_11) else l_default_dismiss_after end;',
'    l_page_items            p_dynamic_action.attribute_12%type := p_dynamic_action.attribute_12;',
'    l_replace_errors_with   p_dynamic_action.attribute_13%type := nvl(p_dynamic_action.attribute_13, ''warning''); -- only used in case of Convert Native APEX Notifications',
'',
'    -- Javascript Initialization Code',
'    l_init_js_fn            varchar2(32767)                    := nvl(apex_plugin_util.replace_substitutions(p_dynamic_action.init_javascript_code), ''undefined'');',
'',
'begin',
'',
'    -- debug info',
'    if apex_application.g_debug and substr(:DEBUG,6) >= 6',
'    then',
'        apex_plugin_util.debug_dynamic_action',
'          ( p_plugin         => p_plugin',
'          , p_dynamic_action => p_dynamic_action',
'          );',
'    end if;',
'',
'    -- we add the files here since they are used across multiple plug-ins, so specifying a key will make sure only one file is added',
'    apex_css.add_file',
'      ( p_name           => apex_plugin_util.replace_substitutions(''uctr#MIN#.css'')',
'      , p_directory      => p_plugin.file_prefix || ''css/''',
'      , p_skip_extension => true',
'      , p_key            => ''uctr''',
'      );',
'    apex_javascript.add_library',
'      ( p_name           => apex_plugin_util.replace_substitutions(''uctr#MIN#.js'')',
'      , p_directory      => p_plugin.file_prefix || ''js/''',
'      , p_skip_extension => true',
'      , p_key            => ''uctr''',
'      );',
'',
'    -- if we haven''t overridden the defaults then what is the component setting',
'    if not l_override_defaults then',
'        l_auto_dismiss :=',
'            case l_action',
'              when ''success'' then l_auto_dismiss_success',
'              when ''warning'' then l_auto_dismiss_warning',
'              when ''error''   then l_auto_dismiss_error',
'              when ''info''    then l_auto_dismiss_info',
'              else false',
'            end;',
'    end if;',
'',
'    -- define our JSON config',
'    apex_json.initialize_clob_output;',
'    apex_json.open_object;',
'',
'    -- notification plugin settings',
'    apex_json.write(''type''             , l_action);',
'',
'    if l_action != ''clear-all''',
'    then',
'        apex_json.write(''substituteValues'' , l_client_substitutions);',
'        -- notification settings',
'        apex_json.open_object(''options'');',
'        apex_json.write(''position''         , l_position);',
'        apex_json.write(''autoDismiss''      , l_auto_dismiss);',
'        apex_json.write(''clearAll''         , l_clear_all);',
'        apex_json.open_array(''dismiss'');',
'',
'        if l_dismiss_on_click    then apex_json.write(''onClick'');  end if;',
'        if l_show_dismiss_button then apex_json.write(''onButton''); end if;',
'',
'        apex_json.close_array;',
'',
'        if l_auto_dismiss and l_auto_dismiss_after is not null',
'        then',
'            apex_json.write(''dismissAfter'' , l_auto_dismiss_after*1000);',
'        end if;',
'',
'        apex_json.write(''newestOnTop''      , l_newest_on_top);',
'        apex_json.write(''preventDuplicates'', l_prevent_duplicates);',
'        apex_json.write(''escapeHtml''       , l_escape);',
'',
'        -- the icon either comes from component settings or is overridden in the action itself',
'        if l_icon_override is not null',
'        then',
'            l_icon := l_icon_override;',
'        else',
'            l_icon :=',
'                case l_action',
'                    when ''success'' then',
'                        l_default_success_icon',
'                    when ''info'' then',
'                        l_default_info_icon',
'                    when ''warning'' then',
'                        l_default_warning_icon',
'                    when ''error'' then',
'                        l_default_error_icon',
'                 end;',
'',
'        end if;',
'',
'        apex_json.write(''iconClass''        , apex_plugin_util.replace_substitutions(l_icon));',
'        apex_json.write(''replaceErrorsWith'', l_replace_errors_with);',
'        apex_json.close_object;',
'',
'        if l_action in (''success'', ''info'', ''warning'', ''error'')',
'        then',
'',
'            -- additional error information for page items',
'            apex_json.write(''inlineItemErrors'' , l_inline_item_error);',
'',
'            if l_inline_item_error',
'            then',
'                apex_json.write(''inlinePageItems'', trim(both '','' from trim(l_page_items)));',
'            end if;',
'',
'            -- notification message',
'            if l_message_type =  ''static''',
'            then',
'                apex_json.write(''title''        , case when l_client_substitutions then l_static_title   else apex_plugin_util.replace_substitutions(l_static_title)   end);',
'                apex_json.write(''message''      , case when l_client_substitutions then l_static_message else apex_plugin_util.replace_substitutions(l_static_message) end);',
'            else',
'                if l_js_title_code is not null',
'                then',
'                    apex_json.write_raw',
'                      ( p_name  => ''title''',
'                      , p_value => case l_message_type',
'                           when ''javascript-expression'' then',
'                              ''function(){return ('' || l_js_title_code || '');}''',
'                           when ''javascript-function-body'' then',
'                               l_js_title_code',
'                           end',
'                      );',
'                end if;',
'',
'                apex_json.write_raw',
'                  ( p_name  => ''message''',
'                  , p_value => case l_message_type',
'                       when ''javascript-expression'' then',
'                          ''function(){return ('' || l_js_message_code || '');}''',
'                       when ''javascript-function-body'' then',
'                           l_js_message_code',
'                       end',
'                  );',
'            end if;',
'        end if;',
'    end if;',
'',
'    apex_json.close_object;',
'',
'    l_result.javascript_function := ''function(){uc.utils.notification(this, '' || apex_json.get_clob_output || '', ''|| l_init_js_fn || '');}'';',
'',
'    apex_json.free_output;',
'',
'    return l_result;',
'end render;',
''))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>false
,p_version_scn=>'48761732'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    The <strong>UC - Notifications</strong> dynamic action plug-in is built on top of a custom Javascript library and allows you to show success and error messages, as well as additional info and warning message types. It matches the look of native A'
||'PEX success/error messages, and can be styled to your liking through Themeroller.',
'</p>',
'<p>',
'    Using this dynamic action you can show multiple messages of each type, customize them by setting their icon, position, how they are dismissed, and more.',
'</p>',
'<p>',
'    You can derive the message using static text with substitution support or from a Javascript expression or function. You can use HTML in the message or escape HTML for tighter security. You can see a wide range of examples below:',
'</p>'))
,p_version_identifier=>'23.1.0'
,p_about_url=>'https://plug-ins-pro.com'
,p_files_version=>508
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167124630709688426)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Position'
,p_apexlang_name=>'position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'top-right'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select the default position you would like your notifications to be displayed at. You can override this setting if needed within the notification dynamic action.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167127066175688425)
,p_plugin_attribute_id=>wwv_flow_imp.id(167124630709688426)
,p_display_sequence=>50
,p_display_value=>'Bottom Center'
,p_return_value=>'bottom-center'
,p_apexlang_name=>'bottomCenter'
,p_help_text=>'<p>The message is shown centered at the bottom of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167127557574688425)
,p_plugin_attribute_id=>wwv_flow_imp.id(167124630709688426)
,p_display_sequence=>60
,p_display_value=>'Bottom Left'
,p_return_value=>'bottom-left'
,p_apexlang_name=>'bottomLeft'
,p_help_text=>'<p>The message is shown in the bottom left corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167126526481688425)
,p_plugin_attribute_id=>wwv_flow_imp.id(167124630709688426)
,p_display_sequence=>40
,p_display_value=>'Bottom Right'
,p_return_value=>'bottom-right'
,p_apexlang_name=>'bottomRight'
,p_help_text=>'<p>The message is shown in the bottom right corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167125553446688425)
,p_plugin_attribute_id=>wwv_flow_imp.id(167124630709688426)
,p_display_sequence=>20
,p_display_value=>'Top Center'
,p_return_value=>'top-center'
,p_apexlang_name=>'topCenter'
,p_help_text=>'<p>The message is shown centered in the top of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167126055568688425)
,p_plugin_attribute_id=>wwv_flow_imp.id(167124630709688426)
,p_display_sequence=>30
,p_display_value=>'Top Left'
,p_return_value=>'top-left'
,p_apexlang_name=>'topLeft'
,p_is_quick_pick=>true
,p_help_text=>'<p>The message is shown in the top left corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167125050984688425)
,p_plugin_attribute_id=>wwv_flow_imp.id(167124630709688426)
,p_display_sequence=>10
,p_display_value=>'Top Right'
,p_return_value=>'top-right'
,p_apexlang_name=>'topRight'
,p_is_quick_pick=>true
,p_help_text=>'<p>The message is shown in the top right corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167135988910688422)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Action'
,p_apexlang_name=>'action'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'success'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the type of action to execute. You can show a notification, whereby: each type has a specific default colour assigned e.g.</p>',
'<ul>',
'<li>Success -&gt; Green</li>',
'<li>Info -&gt; Blue</li>',
'<li>Warning -&gt; Orange</li>',
'<li>Error -&gt; Red</li>',
'</ul><div><b>Note:</b> these colours can be changed using the themeroller (extra setup required) or using CSS overrides. Please refer to the demo application for more details.</div>',
'<p>You can also choose to clear all notifications, or convert the native APEX notifications to FOS notifications.</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167138376558688421)
,p_plugin_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_display_sequence=>50
,p_display_value=>'Clear All Notifications'
,p_return_value=>'clear-all'
,p_apexlang_name=>'clearAllNotifications'
,p_help_text=>'<p>Clear all notifications on the page, including error notifications associated with page items.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167138812062688421)
,p_plugin_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_display_sequence=>60
,p_display_value=>'Convert Native APEX Notifications'
,p_return_value=>'convert'
,p_apexlang_name=>'convertNativeApexNotifications'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Replace the native APEX notifications with their FOS counterparts. This allows notifications generated by APEX, or via the <code>apex.message</code> API to benefit from the same FOS Notifications enhancements such as autodismiss, click to dismiss,'
||' custom positions, etc.</p>',
'<p>It is best to instantiate this plug-in with this option once, on the global page, on page load.</p>',
'<p>This will convert all APEX notifications, application wide, to FOS notifications.</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167137890752688421)
,p_plugin_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_display_sequence=>40
,p_display_value=>'Show Error'
,p_return_value=>'error'
,p_apexlang_name=>'showError'
,p_help_text=>'<p>Use this option in the case you want to indicate an error occurred e.g. you cannot delete a record. By default it will show a red message with an exclamation bade icon.</p><p><b>Note:</b>&nbsp;we have provided themeroller support for you to be abl'
||'e to change the background &amp; text colour of the message.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167136818081688421)
,p_plugin_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_display_sequence=>20
,p_display_value=>'Show Info'
,p_return_value=>'info'
,p_apexlang_name=>'showInfo'
,p_help_text=>'<p>Use this option in the case you want to show some sort of informational message e.g. giving the user an informational tip. By default it will show a blue message with an information comment bubble icon.</p><p><b>Note:</b> we have provided themerol'
||'ler support for you to be able to change the background &amp; text colour of the message.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167136376928688421)
,p_plugin_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_display_sequence=>10
,p_display_value=>'Show Success'
,p_return_value=>'success'
,p_apexlang_name=>'showSuccess'
,p_help_text=>'<p>Use this option in the case you want to indicate something was successful e.g. record created. By default it will show a green message with a tick icon.</p><p><b>Note:</b>&nbsp;we have provided themeroller support for you to be able to change the '
||'background &amp; text colour of the message.<br></p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167137367557688421)
,p_plugin_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_display_sequence=>30
,p_display_value=>'Show Warning'
,p_return_value=>'warning'
,p_apexlang_name=>'showWarning'
,p_help_text=>'<p>Use this option in the case you want to indicate something the user shouldn''t do e.g. navigate away when changes aren''t saved. By default it will show an orange message with a warning triangle icon.</p><p><b>Note:</b>&nbsp;we have provided themero'
||'ller support for you to be able to change the background &amp; text colour of the message.</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167128002265688424)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Icon Success'
,p_apexlang_name=>'iconSuccess'
,p_attribute_type=>'ICON'
,p_is_required=>true
,p_default_value=>'fa-check-circle'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This setting defines the icon shown in the success notification. Please provide the font-apex icon CSS Class e.g. </p>',
'<code>',
'fa-check-circle',
'</code>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167139375814688420)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Message Type'
,p_apexlang_name=>'messageType'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'static'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_IN_LIST'
,p_depending_on_expression=>'clear-all,convert'
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select the message type. You can choose a static message that supports client side page item substitutions i.e. &amp;ITEM_NAME. or alternatively for full control you can derive both the title and message from a Javascript expression or Function.</'
||'p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167140243235688420)
,p_plugin_attribute_id=>wwv_flow_imp.id(167139375814688420)
,p_display_sequence=>20
,p_display_value=>'Javascript Expression'
,p_return_value=>'javascript-expression'
,p_apexlang_name=>'javascriptExpression'
,p_help_text=>'You can define the title &amp; message using a Javascript expression e.g. if you wanted more programatic control for your notification contents e.g. including the current timestamp in the notification.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167140745640688420)
,p_plugin_attribute_id=>wwv_flow_imp.id(167139375814688420)
,p_display_sequence=>30
,p_display_value=>'Javascript Function'
,p_return_value=>'javascript-function-body'
,p_apexlang_name=>'javascriptFunction'
,p_help_text=>'You can define the title &amp; message using a Javascript function e.g. if you wanted more programatic control for your notification contents e.g. including the current timestamp in the notification.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167139790655688420)
,p_plugin_attribute_id=>wwv_flow_imp.id(167139375814688420)
,p_display_sequence=>10
,p_display_value=>'Static Text'
,p_return_value=>'static'
,p_apexlang_name=>'staticText'
,p_help_text=>'You can define notifications with static text with page item substitutions'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167128410367688424)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Icon Info'
,p_apexlang_name=>'iconInfo'
,p_attribute_type=>'ICON'
,p_is_required=>true
,p_default_value=>'fa-info-circle'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This setting defines the icon shown in the info notification. Please provide the font-apex icon CSS Class e.g. </p>',
'<code>',
'fa-info-circle',
'</code>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167141277024688420)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Title'
,p_apexlang_name=>'title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_imp.id(167139375814688420)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'static'
,p_help_text=>'<p>Enter the text you would like to display in the notification title. You can leave this setting blank if you do not want to include a title. You can use substitution strings in the title.&nbsp;</p><p><b>Note:</b> you have the ability in the "Extra '
||'Options" attribute to determine if these substitution occur at the time of page render (server-side) or at the time of execution in the browser (client-side)</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167128840428688424)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'Icon Warning'
,p_apexlang_name=>'iconWarning'
,p_attribute_type=>'ICON'
,p_is_required=>true
,p_default_value=>'fa-exclamation-triangle'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This setting defines the icon shown in the warning notification. Please provide the font-apex icon CSS Class e.g. </p>',
'<code>',
'fa-exclamation-triangle',
'</code>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167141617567688420)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'Message'
,p_apexlang_name=>'message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_imp.id(167139375814688420)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'static'
,p_help_text=>'<p>The notification message you wish to display. You can use substitution strings in the message.&nbsp;</p><p><b>Note:</b>&nbsp;if you use a single substitution string for the message and when it is substituted it is blank/null then the notification '
||'will not be shown, even if you have a title defined. You could say that this is a method to make the notification conditional.</p><p>Also you have the ability in the "Extra Options" attribute to determine if these substitution occur at the time of pa'
||'ge render (server-side) or at the time of execution in the browser (client-side)<br></p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167129236228688424)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Icon Error'
,p_apexlang_name=>'iconError'
,p_attribute_type=>'ICON'
,p_is_required=>true
,p_default_value=>'fa-times-circle'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This setting defines the icon shown in the error notification. Please provide the font-apex icon CSS Class e.g. </p>',
'<code>',
'fa-times-circle',
'</code>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167142077436688419)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Title'
,p_apexlang_name=>'title2'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167139375814688420)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'static'
,p_help_text=>'<p>Enter the javascript expression/function that will return the notification title.</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167129642461688424)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attribute_06'
,p_prompt=>'Options'
,p_apexlang_name=>'options'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_default_value=>'escape-html:newest-on-top:client-side-substitutions:dismiss-on-click:dismiss-on-button'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Choose extra options/settings to apply to your notification</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167131576964688423)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>40
,p_display_value=>'Autodismiss Error Notifications'
,p_return_value=>'autodismiss-error'
,p_apexlang_name=>'autodismissErrorNotifications'
,p_help_text=>'<p>Whether to autodismiss error notifications after a specific amount of time. Enabling this option will also add a visual timer below the notification. When the timer runs out, the notification is removed. If the user hovers over the notification, t'
||'he timer will be stopped and removed. The user has to then manually dismiss the notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167130581349688423)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>20
,p_display_value=>'Autodismiss Info Notifications'
,p_return_value=>'autodismiss-info'
,p_apexlang_name=>'autodismissInfoNotifications'
,p_help_text=>'<p>Whether to autodismiss info notifications after a specific amount of time. Enabling this option will also add a visual timer below the notification. When the timer runs out, the notification is removed. If the user hovers over the notification, th'
||'e timer will be stopped and removed. The user has to then manually dismiss the notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167130052167688424)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>10
,p_display_value=>'Autodismiss Success Notifications'
,p_return_value=>'autodismiss-success'
,p_apexlang_name=>'autodismissSuccessNotifications'
,p_help_text=>'<p>Whether to autodismiss success notifications after a specific amount of time. Enabling this option will also add a visual timer below the notification. When the timer runs out, the notification is removed. If the user hovers over the notification,'
||' the timer will be stopped and removed. The user has to then manually dismiss the notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167131096706688423)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>30
,p_display_value=>'Autodismiss Warning Notifications'
,p_return_value=>'autodismiss-warning'
,p_apexlang_name=>'autodismissWarningNotifications'
,p_help_text=>'<p>Whether to autodismiss warning notifications after a specific amount of time. Enabling this option will also add a visual timer below the notification. When the timer runs out, the notification is removed. If the user hovers over the notification,'
||' the timer will be stopped and removed. The user has to then manually dismiss the notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167134533334688422)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>110
,p_display_value=>'Dismiss On Close Button Click'
,p_return_value=>'dismiss-on-button'
,p_apexlang_name=>'dismissOnCloseButtonClick'
,p_help_text=>'<p>Whether to render an X button that dismisses the notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167134046143688422)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>100
,p_display_value=>'Dismiss On Notification Click/Tap'
,p_return_value=>'dismiss-on-click'
,p_apexlang_name=>'dismissOnNotificationClickTap'
,p_help_text=>'<p>Whether the notification is dismissed on click or tap.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167132541508688423)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>70
,p_display_value=>'Escape HTML'
,p_return_value=>'escape-html'
,p_apexlang_name=>'escapeHtml'
,p_help_text=>'<p>Check this option to escape any HTML in the text to ensure tighter security.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167135025625688422)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>120
,p_display_value=>'[External] Replace APEX Errors with FOS Warnings'
,p_return_value=>'show-errors-as-warnings'
,p_apexlang_name=>'externalReplaceApexErrorsWithFosWarnings'
,p_help_text=>'This attribute is not yet in use'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167133059068688423)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>80
,p_display_value=>'Newest On Top'
,p_return_value=>'newest-on-top'
,p_apexlang_name=>'newestOnTop'
,p_help_text=>'<p>Check this option to show all new messages at the top, when existing messages are still being displayed. If you leave this unchecked they will be shown at the bottom.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167133538755688422)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>90
,p_display_value=>'Perform Client-side Substitutions'
,p_return_value=>'client-side-substitutions'
,p_apexlang_name=>'performClientSideSubstitutions'
,p_help_text=>'<p>Check this option to perform page item substitutions in the browser at the time of execution of the notification.</p><p><b>Note: </b>when using this setting the page items you reference in the title/message must be from this page or defined on pag'
||'e zero</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167132092631688423)
,p_plugin_attribute_id=>wwv_flow_imp.id(167129642461688424)
,p_display_sequence=>50
,p_display_value=>'Prevent Duplicates'
,p_return_value=>'prevent-duplicates'
,p_apexlang_name=>'preventDuplicates'
,p_help_text=>'<p>Ensures the notification will not be shown if it has the same title and message as the previous notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167142401970688419)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attribute_06'
,p_prompt=>'Message'
,p_apexlang_name=>'message2'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167139375814688420)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'static'
,p_help_text=>'<p>Enter the javascript expression/function that will return the notification message.</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167135549211688422)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>110
,p_static_id=>'attribute_07'
,p_prompt=>'Autodismiss After'
,p_apexlang_name=>'autodismissAfter'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_unit=>'seconds'
,p_is_translatable=>false
,p_help_text=>'<p>Enter the number of seconds to display the notification before it is automatically removed.</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167142807763688419)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'attribute_07'
,p_prompt=>'Options'
,p_apexlang_name=>'options'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_default_value=>'escape-html:newest-on-top:client-side-substitutions:dismiss-on-click:dismiss-on-button'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167150604557688416)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Choose extra options/settings to apply to your notification</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167143245321688419)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>10
,p_display_value=>'Autodismiss'
,p_return_value=>'autodismiss'
,p_apexlang_name=>'autodismiss'
,p_help_text=>'<p>Whether to autodismiss the notification after a specific amount of time. Enabling this option will also add a visual timer below the notification. When the timer runs out, the notification is removed. If the user hovers over the notification, the '
||'timer will be stopped and removed. The user has to then manually dismiss the notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167146788536688418)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>80
,p_display_value=>'Dismiss On Close Button Click'
,p_return_value=>'dismiss-on-button'
,p_apexlang_name=>'dismissOnCloseButtonClick'
,p_help_text=>'<p>Whether to render an X button that dismisses the notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167146232599688418)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>70
,p_display_value=>'Dismiss On Notification Click/Tap'
,p_return_value=>'dismiss-on-click'
,p_apexlang_name=>'dismissOnNotificationClickTap'
,p_help_text=>'<p>Whether the notification is dismissed on click or tap.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167144749829688418)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>40
,p_display_value=>'Escape HTML'
,p_return_value=>'escape-html'
,p_apexlang_name=>'escapeHtml'
,p_help_text=>'<p>Check this option to escape any HTML in the text to ensure tighter security.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167145213352688418)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>50
,p_display_value=>'Newest On Top'
,p_return_value=>'newest-on-top'
,p_apexlang_name=>'newestOnTop'
,p_help_text=>'<p>Check this option to show all new messages at the top, when existing messages are still being displayed. If you leave this unchecked they will be shown at the bottom.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167145792954688418)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>60
,p_display_value=>'Perform Client-side Substitutions'
,p_return_value=>'client-side-substitutions'
,p_apexlang_name=>'performClientSideSubstitutions'
,p_help_text=>'<p>Check this option to perform page item substitutions in the browser at the time of execution of the notification.</p><p><b>Note: </b>when using this setting the page items you reference in the title/message must be from this page or defined on pag'
||'e zero</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167143795455688419)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>20
,p_display_value=>'Prevent Duplicates'
,p_return_value=>'prevent-duplicates'
,p_apexlang_name=>'preventDuplicates'
,p_help_text=>'<p>Ensures the notification will not be shown if it has the same title and message as the previous notification.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167144253470688419)
,p_plugin_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_display_sequence=>30
,p_display_value=>'Remove All Notifications First'
,p_return_value=>'remove-notifications'
,p_apexlang_name=>'removeAllNotificationsFirst'
,p_help_text=>'<p>Check this option to remove all existing notifications before showing this notification</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167147208691688418)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>100
,p_static_id=>'attribute_08'
,p_prompt=>'Position'
,p_apexlang_name=>'position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'top-right'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167150604557688416)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select the position where you would like the notification to be displayed.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167149687868688417)
,p_plugin_attribute_id=>wwv_flow_imp.id(167147208691688418)
,p_display_sequence=>60
,p_display_value=>'Bottom Center'
,p_return_value=>'bottom-center'
,p_apexlang_name=>'bottomCenter'
,p_help_text=>'<p>The message is shown centered at the bottom of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167150101792688416)
,p_plugin_attribute_id=>wwv_flow_imp.id(167147208691688418)
,p_display_sequence=>70
,p_display_value=>'Bottom Left'
,p_return_value=>'bottom-left'
,p_apexlang_name=>'bottomLeft'
,p_help_text=>'<p>The message is shown in the bottom left corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167149192074688417)
,p_plugin_attribute_id=>wwv_flow_imp.id(167147208691688418)
,p_display_sequence=>50
,p_display_value=>'Bottom Right'
,p_return_value=>'bottom-right'
,p_apexlang_name=>'bottomRight'
,p_help_text=>'<p>The message is shown in the bottom right corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167148149578688417)
,p_plugin_attribute_id=>wwv_flow_imp.id(167147208691688418)
,p_display_sequence=>20
,p_display_value=>'Top Center'
,p_return_value=>'top-center'
,p_apexlang_name=>'topCenter'
,p_help_text=>'<p>The message is shown centered in the top of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167148640826688417)
,p_plugin_attribute_id=>wwv_flow_imp.id(167147208691688418)
,p_display_sequence=>30
,p_display_value=>'Top Left'
,p_return_value=>'top-left'
,p_apexlang_name=>'topLeft'
,p_help_text=>'<p>The message is shown in the top left corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167147611110688417)
,p_plugin_attribute_id=>wwv_flow_imp.id(167147208691688418)
,p_display_sequence=>10
,p_display_value=>'Top Right'
,p_return_value=>'top-right'
,p_apexlang_name=>'topRight'
,p_help_text=>'<p>The message is shown in the top right corner of the browser window</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167150604557688416)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>65
,p_static_id=>'attribute_09'
,p_prompt=>'Override Defaults'
,p_apexlang_name=>'overrideDefaults'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'clear-all'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enable this option to override the settings defined under "Shared Components" -> "Component Settings" -> "FOS - Notifications"</p>',
'<p><b>Note:</b> when you enable this setting all defaults are overridden</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167151081140688416)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'attribute_10'
,p_prompt=>'Icon'
,p_apexlang_name=>'icon'
,p_attribute_type=>'ICON'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167150604557688416)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This setting defines the icon shown in this particular notification, it will override the application level setting. Please provide the font-apex icon CSS Class e.g. </p>',
'<code>',
'fa-info-circle',
'</code>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167151428554688416)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>75
,p_static_id=>'attribute_11'
,p_prompt=>'Autodismiss After'
,p_apexlang_name=>'autodismissAfter'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'10'
,p_unit=>'seconds'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167142807763688419)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'autodismiss'
,p_help_text=>'<p>Enter the number of seconds to display the notification before it is automatically removed.</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167151802396688416)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>63
,p_static_id=>'attribute_12'
,p_prompt=>'Associated Item(s)	'
,p_apexlang_name=>'associatedItemS'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'error'
,p_help_text=>'<p>Associate the notification error messages with one or more page items. If you would like to clear these error messages using a dynamic action please use the "FOS - Message Actions" plug-in and the "Clear Errors" action.</p>'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(167152289998688416)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_static_id=>'attribute_13'
,p_prompt=>'Replace Errors With'
,p_apexlang_name=>'replaceErrorsWith'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'warning'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(167135988910688422)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'convert'
,p_lov_type=>'STATIC'
,p_help_text=>'<p>By default APEX "errors" are actually "warnings" in that they are orange, not red. FOS - Notifications however supports both warnings and errors. Choose to which type of FOS notifications an APEX error should be mapped.</p>'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167153170833688415)
,p_plugin_attribute_id=>wwv_flow_imp.id(167152289998688416)
,p_display_sequence=>20
,p_display_value=>'FOS Errors'
,p_return_value=>'error'
,p_apexlang_name=>'fosErrors'
,p_help_text=>'Map erros to FOS errors - red'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(167152662611688415)
,p_plugin_attribute_id=>wwv_flow_imp.id(167152289998688416)
,p_display_sequence=>10
,p_display_value=>'FOS Warnings'
,p_return_value=>'warning'
,p_apexlang_name=>'fosWarnings'
,p_help_text=>'Map erros to FOS warnings - orange'
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(167198638180688394)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'function(config){',
'    config.type = ''error'';',
'}',
'</pre>'))
,p_help_text=>'<p>This setting allows you to define a Javascript initialization function that allows you to override any settings right before the notification is shown. These are the values which you can override:</p>'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A0A0A094E6F7465730A09092A206162736F6C757465206C65667420616E642072696768742076616C7565732073686F756C64206E6F7720626520706C61636573206F6E2074686520636F6E7461696E657220656C656D656E742C206E6F7420746865';
wwv_flow_imp.g_varchar2_table(2) := '20696E646976696475616C206E6F74696669636174696F6E730A0A2A2F0A2F2A2A0A202A204669786573206C696E6B207374796C696E6720696E206572726F72730A202A2F0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E';
wwv_flow_imp.g_varchar2_table(3) := '696E6720612C0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E6765722061207B0A2020636F6C6F723A20696E68657269743B0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0A7D0A0A2F2A2A0A20';
wwv_flow_imp.g_varchar2_table(4) := '2A20436F6C6F72697A6564204261636B67726F756E640A202A2F0A2E75632D416C6572742D2D686F72697A6F6E74616C207B0A2020626F726465722D7261646975733A203270783B0A7D0A0A2E75632D416C6572742D69636F6E202E742D49636F6E207B';
wwv_flow_imp.g_varchar2_table(5) := '0A2020636F6C6F723A20234646463B0A7D0A0A2F2A2A0A20202A204D6F6469666965723A205761726E696E670A20202A2F0A2E75632D416C6572742D2D7761726E696E67202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F';
wwv_flow_imp.g_varchar2_table(6) := '723A20236662636634613B0A7D0A0A2E75632D416C6572742D2D7761726E696E672E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207267626128323531';
wwv_flow_imp.g_varchar2_table(7) := '2C203230372C2037342C20302E3135293B0A7D0A0A2F2A2A0A20202A204D6F6469666965723A20537563636573730A20202A2F0A2E75632D416C6572742D2D73756363657373202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F';
wwv_flow_imp.g_varchar2_table(8) := '6C6F723A20233342414132433B0A7D0A0A2E75632D416C6572742D2D737563636573732E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A20726762612835';
wwv_flow_imp.g_varchar2_table(9) := '392C203137302C2034342C20302E3135293B0A7D0A0A2F2A2A0A20202A204D6F6469666965723A20496E666F726D6174696F6E0A20202A2F0A2E75632D416C6572742D2D696E666F202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020';
wwv_flow_imp.g_varchar2_table(10) := '636F6C6F723A20233030373664663B0A7D0A0A2E75632D416C6572742D2D696E666F2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C';
wwv_flow_imp.g_varchar2_table(11) := '203131382C203232332C20302E3135293B0A7D0A0A2F2A2A0A20202A204D6F6469666965723A20537563636573730A20202A2F0A2E75632D416C6572742D2D64616E676572202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C';
wwv_flow_imp.g_varchar2_table(12) := '6F723A20236634343333363B0A7D0A0A2E75632D416C6572742D2D64616E6765722E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207267626128323434';
wwv_flow_imp.g_varchar2_table(13) := '2C2036372C2035342C20302E3135293B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233236323632363B0A7D0A0A2F2A0A2E7563';
wwv_flow_imp.g_varchar2_table(14) := '2D416C6572742D2D64616E6765727B0A094062673A206C69676874656E2840675F44616E6765722D42472C20343025293B0A096261636B67726F756E642D636F6C6F723A204062673B0A09636F6C6F723A206661646528636F6E7472617374284062672C';
wwv_flow_imp.g_varchar2_table(15) := '2064657361747572617465286461726B656E284062672C202031303025292C2031303025292C2064657361747572617465286C69676874656E284062672C202031303025292C2035302529292C2031303025293B0A7D0A2E75632D416C6572742D2D696E';
wwv_flow_imp.g_varchar2_table(16) := '666F207B0A094062673A206C69676874656E2840675F496E666F2D42472C20353525293B0A096261636B67726F756E642D636F6C6F723A204062673B0A09636F6C6F723A206661646528636F6E7472617374284062672C20646573617475726174652864';
wwv_flow_imp.g_varchar2_table(17) := '61726B656E284062672C202031303025292C2031303025292C2064657361747572617465286C69676874656E284062672C202031303025292C2035302529292C2031303025293B0A7D0A2A2F0A2E75632D416C6572742D2D706167652E75632D416C6572';
wwv_flow_imp.g_varchar2_table(18) := '742D2D73756363657373207B0A20206261636B67726F756E642D636F6C6F723A20726762612835392C203137302C2034342C20302E39293B0A2020636F6C6F723A20234646463B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(19) := '2D73756363657373202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20234646463B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572';
wwv_flow_imp.g_varchar2_table(20) := '742D2D73756363657373202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20696E68657269743B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D73756363657373202E742D427574746F6E';
wwv_flow_imp.g_varchar2_table(21) := '2D2D636C6F7365416C657274207B0A2020636F6C6F723A20234646462021696D706F7274616E743B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67207B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(22) := '236662636634613B0A2020636F6C6F723A20233434333430323B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_imp.g_varchar2_table(23) := '207472616E73706172656E743B0A2020636F6C6F723A20233434333430323B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F';
wwv_flow_imp.g_varchar2_table(24) := '723A20696E68657269743B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F723A20234646462021696D706F7274616E743B0A7D';
wwv_flow_imp.g_varchar2_table(25) := '0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F207B0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0A2020636F6C6F723A20234646463B0A7D0A0A2E75632D416C6572742D2D706167652E7563';
wwv_flow_imp.g_varchar2_table(26) := '2D416C6572742D2D696E666F202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20234646463B0A7D0A0A2E75632D416C6572742D2D706167652E75632D';
wwv_flow_imp.g_varchar2_table(27) := '416C6572742D2D696E666F202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20696E68657269743B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F202E742D427574746F6E2D2D';
wwv_flow_imp.g_varchar2_table(28) := '636C6F7365416C657274207B0A2020636F6C6F723A20234646462021696D706F7274616E743B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572207B0A20206261636B67726F756E642D636F6C6F723A20236634';
wwv_flow_imp.g_varchar2_table(29) := '343333363B0A2020636F6C6F723A20234646463B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E7370';
wwv_flow_imp.g_varchar2_table(30) := '6172656E743B0A2020636F6C6F723A20234646463B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20696E68657269743B';
wwv_flow_imp.g_varchar2_table(31) := '0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F723A20234646462021696D706F7274616E743B0A7D0A0A2F2A20486F72697A6F6E';
wwv_flow_imp.g_varchar2_table(32) := '74616C20416C657274203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D68';
wwv_flow_imp.g_varchar2_table(33) := '6F72697A6F6E74616C207B0A20206D617267696E2D626F74746F6D3A20312E3672656D3B0A2020706F736974696F6E3A2072656C61746976653B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D77726170207B';
wwv_flow_imp.g_varchar2_table(34) := '0A2020646973706C61793A20666C65783B0A2020666C65782D646972656374696F6E3A20726F773B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A202070616464696E673A20302031367078';
wwv_flow_imp.g_varchar2_table(35) := '3B0A2020666C65782D736872696E6B3A20303B0A2020646973706C61793A20666C65783B0A2020616C69676E2D6974656D733A2063656E7465723B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D636F6E7465';
wwv_flow_imp.g_varchar2_table(36) := '6E74207B0A202070616464696E673A20313670783B0A2020666C65783A203120303B0A2020646973706C61793A20666C65783B0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0A20206A7573746966792D636F6E74656E743A2063656E';
wwv_flow_imp.g_varchar2_table(37) := '7465723B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D627574746F6E73207B0A2020666C65782D736872696E6B3A20303B0A2020746578742D616C69676E3A2072696768743B0A202077686974652D737061';
wwv_flow_imp.g_varchar2_table(38) := '63653A206E6F777261703B0A202070616464696E672D72696768743A20312E3672656D3B0A2020646973706C61793A20666C65783B0A2020616C69676E2D6974656D733A2063656E7465723B0A7D0A0A2E752D52544C202E75632D416C6572742D2D686F';
wwv_flow_imp.g_varchar2_table(39) := '72697A6F6E74616C202E75632D416C6572742D627574746F6E73207B0A202070616464696E672D72696768743A20303B0A202070616464696E672D6C6566743A20312E3672656D3B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75';
wwv_flow_imp.g_varchar2_table(40) := '632D416C6572742D627574746F6E733A656D707479207B0A2020646973706C61793A206E6F6E653B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D7469746C65207B0A2020666F6E742D73697A653A20327265';
wwv_flow_imp.g_varchar2_table(41) := '6D3B0A20206C696E652D6865696768743A20322E3472656D3B0A20206D617267696E2D626F74746F6D3A20303B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D626F64793A656D707479207B0A202064697370';
wwv_flow_imp.g_varchar2_table(42) := '6C61793A206E6F6E653B0A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020666F6E742D73697A653A20333270783B0A202077696474683A20333270783B0A2020746578';
wwv_flow_imp.g_varchar2_table(43) := '742D616C69676E3A2063656E7465723B0A20206865696768743A20333270783B0A20206C696E652D6865696768743A20313B0A7D0A0A2F2A203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(44) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D20436F6D6D6F6E2050726F70657274696573203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(45) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D686F72697A6F6E74616C207B0A2020626F726465723A2031707820736F6C6964207267626128302C20302C20302C20302E31293B0A2020626F782D7368';
wwv_flow_imp.g_varchar2_table(46) := '61646F773A20302032707820347078202D327078207267626128302C20302C20302C20302E303735293B0A7D0A0A2E75632D416C6572742D2D6E6F49636F6E2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E20';
wwv_flow_imp.g_varchar2_table(47) := '7B0A2020646973706C61793A206E6F6E652021696D706F7274616E743B0A7D0A0A2E75632D416C6572742D2D6E6F49636F6E202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020646973706C61793A206E6F6E653B0A7D0A0A2E742D42';
wwv_flow_imp.g_varchar2_table(48) := '6F64792D616C657274207B0A20206D617267696E3A20303B0A7D0A0A2E742D426F64792D616C657274202E75632D416C657274207B0A20206D617267696E2D626F74746F6D3A20303B0A7D0A0A2F2A2050616765204E6F74696669636174696F6E202853';
wwv_flow_imp.g_varchar2_table(49) := '756363657373206F72204D65737361676529203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E7563';
wwv_flow_imp.g_varchar2_table(50) := '2D416C6572742D2D70616765207B0A20207472616E736974696F6E3A20302E327320656173652D6F75743B0A20206D61782D77696474683A2036343070783B0A20206D696E2D77696474683A2033323070783B0A20202F2A706F736974696F6E3A206669';
wwv_flow_imp.g_varchar2_table(51) := '7865643B20746F703A20312E3672656D3B2072696768743A20312E3672656D3B2A2F0A20207A2D696E6465783A20313030303B0A2020626F726465722D77696474683A20303B0A2020626F782D736861646F773A20302030203020302E3172656D207267';
wwv_flow_imp.g_varchar2_table(52) := '626128302C20302C20302C20302E312920696E7365742C20302033707820397078202D327078207267626128302C20302C20302C20302E31293B0A20202F2A20466F72207665727920736D616C6C2073637265656E732C2066697420746865206D657373';
wwv_flow_imp.g_varchar2_table(53) := '61676520746F2074686520746F70206F66207468652073637265656E202A2F0A20202F2A2053657420426F726465722052616469757320746F2030206173206D657373616765206578697374732077697468696E20636F6E74656E74202A2F0A20202F2A';
wwv_flow_imp.g_varchar2_table(54) := '2050616765204C6576656C205761726E696E6720616E64204572726F7273203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(55) := '3D3D3D3D3D202A2F0A20202F2A205363726F6C6C62617273202A2F0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D627574746F6E73207B0A202070616464696E672D72696768743A20303B0A7D0A0A2E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(56) := '2D70616765202E75632D416C6572742D69636F6E207B0A202070616464696E672D6C6566743A20312E3672656D3B0A202070616464696E672D72696768743A203870783B0A7D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E75632D41';
wwv_flow_imp.g_varchar2_table(57) := '6C6572742D69636F6E207B0A202070616464696E672D6C6566743A203870783B0A202070616464696E672D72696768743A20312E3672656D3B0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D69636F6E202E742D49636F6E20';
wwv_flow_imp.g_varchar2_table(58) := '7B0A2020666F6E742D73697A653A20323470783B0A202077696474683A20323470783B0A20206865696768743A20323470783B0A20206C696E652D6865696768743A20313B0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D62';
wwv_flow_imp.g_varchar2_table(59) := '6F6479207B0A202070616464696E672D626F74746F6D3A203870783B0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D636F6E74656E74207B0A202070616464696E673A203870783B0A7D0A0A2E75632D416C6572742D2D7061';
wwv_flow_imp.g_varchar2_table(60) := '6765202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020706F736974696F6E3A206162736F6C7574653B0A202072696768743A202D3870783B0A2020746F703A202D3870783B0A202070616464696E673A203470783B0A20206D696E2D77';
wwv_flow_imp.g_varchar2_table(61) := '696474683A20303B0A20206261636B67726F756E642D636F6C6F723A20233030302021696D706F7274616E743B0A2020636F6C6F723A20234646462021696D706F7274616E743B0A2020626F782D736861646F773A203020302030203170782072676261';
wwv_flow_imp.g_varchar2_table(62) := '283235352C203235352C203235352C20302E3235292021696D706F7274616E743B0A2020626F726465722D7261646975733A20323470783B0A20207472616E736974696F6E3A202D7765626B69742D7472616E73666F726D20302E313235732065617365';
wwv_flow_imp.g_varchar2_table(63) := '3B0A20207472616E736974696F6E3A207472616E73666F726D20302E3132357320656173653B0A20207472616E736974696F6E3A207472616E73666F726D20302E3132357320656173652C202D7765626B69742D7472616E73666F726D20302E31323573';
wwv_flow_imp.g_varchar2_table(64) := '20656173653B0A7D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C657274207B0A202072696768743A206175746F3B0A20206C6566743A202D3870783B0A7D0A0A2E75632D416C6572742D2D';
wwv_flow_imp.g_varchar2_table(65) := '70616765202E742D427574746F6E2D2D636C6F7365416C6572743A686F766572207B0A20202D7765626B69742D7472616E73666F726D3A207363616C6528312E3135293B0A20207472616E73666F726D3A207363616C6528312E3135293B0A7D0A0A2E75';
wwv_flow_imp.g_varchar2_table(66) := '632D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C6572743A616374697665207B0A20202D7765626B69742D7472616E73666F726D3A207363616C6528302E3835293B0A20207472616E73666F726D3A207363616C6528302E';
wwv_flow_imp.g_varchar2_table(67) := '3835293B0A7D0A0A2F2A2E752D52544C202E75632D416C6572742D2D70616765207B2072696768743A206175746F3B206C6566743A20312E3672656D3B207D2A2F0A2E75632D416C6572742D2D706167652E75632D416C657274207B0A2020626F726465';
wwv_flow_imp.g_varchar2_table(68) := '722D7261646975733A20302E3472656D3B0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D7469746C65207B0A202070616464696E673A2038707820303B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C657274';
wwv_flow_imp.g_varchar2_table(69) := '2D2D7761726E696E67202E612D4E6F74696669636174696F6E207B0A20206D617267696E2D72696768743A203870783B0A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F';
wwv_flow_imp.g_varchar2_table(70) := '6E2D7469746C65207B0A2020666F6E742D73697A653A20312E3472656D3B0A20206C696E652D6865696768743A203272656D3B0A2020666F6E742D7765696768743A203730303B0A20206D617267696E3A20303B0A7D0A0A2E75632D416C6572742D2D70';
wwv_flow_imp.g_varchar2_table(71) := '6167652E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E2D6C697374207B0A20206D61782D6865696768743A2031323870783B0A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E';
wwv_flow_imp.g_varchar2_table(72) := '2D6C697374207B0A20206D61782D6865696768743A20393670783B0A20206F766572666C6F773A206175746F3B0A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6C696E6B3A686F766572207B0A202074657874';
wwv_flow_imp.g_varchar2_table(73) := '2D6465636F726174696F6E3A20756E6465726C696E653B0A7D0A0A2E75632D416C6572742D2D70616765203A3A2D7765626B69742D7363726F6C6C626172207B0A202077696474683A203870783B0A20206865696768743A203870783B0A7D0A0A2E7563';
wwv_flow_imp.g_varchar2_table(74) := '2D416C6572742D2D70616765203A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0A7D0A0A2E75632D416C6572742D2D70616765';
wwv_flow_imp.g_varchar2_table(75) := '203A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D74';
wwv_flow_imp.g_varchar2_table(76) := '69746C65207B0A2020646973706C61793A20626C6F636B3B0A2020666F6E742D7765696768743A203730303B0A2020666F6E742D73697A653A20312E3872656D3B0A20206D617267696E2D626F74746F6D3A20303B0A20206D617267696E2D7269676874';
wwv_flow_imp.g_varchar2_table(77) := '3A20313670783B0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D626F6479207B0A20206D617267696E2D72696768743A20313670783B0A7D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E75632D416C6572';
wwv_flow_imp.g_varchar2_table(78) := '742D7469746C65207B0A20206D617267696E2D72696768743A20303B0A20206D617267696E2D6C6566743A20313670783B0A7D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E75632D416C6572742D626F6479207B0A20206D61726769';
wwv_flow_imp.g_varchar2_table(79) := '6E2D72696768743A20303B0A20206D617267696E2D6C6566743A20313670783B0A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6C697374207B0A20206D617267696E3A203470782030203020303B0A20207061';
wwv_flow_imp.g_varchar2_table(80) := '6464696E673A20303B0A20206C6973742D7374796C653A206E6F6E653B0A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D207B0A202070616464696E672D6C6566743A20323070783B0A2020706F7369';
wwv_flow_imp.g_varchar2_table(81) := '74696F6E3A2072656C61746976653B0A2020666F6E742D73697A653A20313470783B0A20206C696E652D6865696768743A20323070783B0A20206D617267696E2D626F74746F6D3A203470783B0A20202F2A20457874726120536D616C6C205363726565';
wwv_flow_imp.g_varchar2_table(82) := '6E73202A2F0A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6C6173742D6368696C64207B0A20206D617267696E2D626F74746F6D3A20303B0A7D0A0A2E752D52544C202E75632D416C6572742D2D';
wwv_flow_imp.g_varchar2_table(83) := '70616765202E612D4E6F74696669636174696F6E2D6974656D207B0A202070616464696E672D6C6566743A20303B0A202070616464696E672D72696768743A20323070783B0A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F746966696361';
wwv_flow_imp.g_varchar2_table(84) := '74696F6E2D6974656D3A6265666F7265207B0A2020636F6E74656E743A2027273B0A2020706F736974696F6E3A206162736F6C7574653B0A20206D617267696E3A203870783B0A2020746F703A20303B0A20206C6566743A20303B0A202077696474683A';
wwv_flow_imp.g_varchar2_table(85) := '203470783B0A20206865696768743A203470783B0A2020626F726465722D7261646975733A20313030253B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B0A7D0A0A2F2A2E752D52544C202E75632D';
wwv_flow_imp.g_varchar2_table(86) := '416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6265666F7265207B2072696768743A20303B206C6566743A206175746F3B207D2A2F0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D';
wwv_flow_imp.g_varchar2_table(87) := '6974656D202E612D427574746F6E2D2D6E6F74696669636174696F6E207B0A202070616464696E673A203270783B0A20206F7061636974793A20302E37353B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A0A2E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(88) := '2D70616765202E68746D6C64624F7261457272207B0A20206D617267696E2D746F703A20302E3872656D3B0A2020646973706C61793A20626C6F636B3B0A2020666F6E742D73697A653A20312E3172656D3B0A20206C696E652D6865696768743A20312E';
wwv_flow_imp.g_varchar2_table(89) := '3672656D3B0A2020666F6E742D66616D696C793A20274D656E6C6F272C2027436F6E736F6C6173272C206D6F6E6F73706163652C2073657269663B0A202077686974652D73706163653A207072652D6C696E653B0A7D0A0A2F2A2041636365737369626C';
wwv_flow_imp.g_varchar2_table(90) := '652048656164696E67203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D61';
wwv_flow_imp.g_varchar2_table(91) := '636365737369626C6548656164696E67202E75632D416C6572742D7469746C65207B0A2020626F726465723A20303B0A2020636C69703A20726563742830203020302030293B0A20206865696768743A203170783B0A20206D617267696E3A202D317078';
wwv_flow_imp.g_varchar2_table(92) := '3B0A20206F766572666C6F773A2068696464656E3B0A202070616464696E673A20303B0A2020706F736974696F6E3A206162736F6C7574653B0A202077696474683A203170783B0A7D0A0A2F2A2048696464656E2048656164696E6720284E6F74204163';
wwv_flow_imp.g_varchar2_table(93) := '6365737369626C6529203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D72';
wwv_flow_imp.g_varchar2_table(94) := '656D6F766548656164696E67202E75632D416C6572742D7469746C65207B0A2020646973706C61793A206E6F6E653B0A7D0A0A406D6564696120286D61782D77696474683A20343830707829207B0A20202E75632D416C6572742D2D70616765207B0A20';
wwv_flow_imp.g_varchar2_table(95) := '2020202F2A6C6566743A20312E3672656D3B2A2F0A202020206D696E2D77696474683A20303B0A202020206D61782D77696474683A206E6F6E653B0A20207D0A0A20202E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D69';
wwv_flow_imp.g_varchar2_table(96) := '74656D207B0A20202020666F6E742D73697A653A20313270783B0A20207D0A7D0A0A406D6564696120286D61782D77696474683A20373638707829207B0A20202E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D7469746C';
wwv_flow_imp.g_varchar2_table(97) := '65207B0A20202020666F6E742D73697A653A20312E3872656D3B0A20207D0A7D0A0A2F2A202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(98) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2F2A2049636F6E2E637373202A2F0A2E75632D416C657274202E742D49636F6E2E69636F6E2D636C6F73653A6265666F7265207B0A2020666F6E742D66616D696C793A2022617065782D35';
wwv_flow_imp.g_varchar2_table(99) := '2D69636F6E2D666F6E74223B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A0A2E75632D416C657274202E742D49636F6E2E69636F6E2D636C6F73653A6265666F726520';
wwv_flow_imp.g_varchar2_table(100) := '7B0A20206C696E652D6865696768743A20313670783B0A2020666F6E742D73697A653A20313670783B0A2020636F6E74656E743A20225C65306132223B0A7D0A0A2F2A202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(101) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E756374722D746F702D63656E746572207B0A2020746F703A20312E3672656D3B0A202072696768743A2030';
wwv_flow_imp.g_varchar2_table(102) := '3B0A202077696474683A20313030253B0A7D0A0A2E756374722D626F74746F6D2D63656E746572207B0A2020626F74746F6D3A20312E3672656D3B0A202072696768743A20303B0A202077696474683A20313030253B0A7D0A0A2E756374722D746F702D';
wwv_flow_imp.g_varchar2_table(103) := '7269676874207B0A2020746F703A20312E3672656D3B0A202072696768743A20312E3672656D3B0A7D0A0A2E756374722D746F702D6C656674207B0A2020746F703A20312E3672656D3B0A20206C6566743A20312E3672656D3B0A7D0A0A2E756374722D';
wwv_flow_imp.g_varchar2_table(104) := '626F74746F6D2D7269676874207B0A202072696768743A20312E3672656D3B0A2020626F74746F6D3A20312E3672656D3B0A7D0A0A2E756374722D626F74746F6D2D6C656674207B0A2020626F74746F6D3A20312E3672656D3B0A20206C6566743A2031';
wwv_flow_imp.g_varchar2_table(105) := '2E3672656D3B0A7D0A0A2E756374722D636F6E7461696E6572207B0A2020706F736974696F6E3A2066697865643B0A20207A2D696E6465783A203939393939393B0A2020706F696E7465722D6576656E74733A206E6F6E653B0A20202F2A6F7665727269';
wwv_flow_imp.g_varchar2_table(106) := '6465732A2F0A7D0A0A2E756374722D636F6E7461696E65723E646976207B0A2020706F696E7465722D6576656E74733A206175746F3B0A7D0A0A2E756374722D636F6E7461696E65722E756374722D746F702D63656E7465723E6469762C0A2E75637472';
wwv_flow_imp.g_varchar2_table(107) := '2D636F6E7461696E65722E756374722D626F74746F6D2D63656E7465723E646976207B0A20202F2A77696474683A2033303070783B2A2F0A20206D617267696E2D6C6566743A206175746F3B0A20206D617267696E2D72696768743A206175746F3B0A7D';
wwv_flow_imp.g_varchar2_table(108) := '0A0A2E756374722D70726F6772657373207B0A2020706F736974696F6E3A206162736F6C7574653B0A2020626F74746F6D3A20303B0A20206865696768743A203470783B0A20206261636B67726F756E642D636F6C6F723A20626C61636B3B0A20206F70';
wwv_flow_imp.g_varchar2_table(109) := '61636974793A20302E343B0A7D0A0A68746D6C3A6E6F74282E752D52544C29202E756374722D70726F6772657373207B0A20206C6566743A20303B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20302E3472656D3B0A7D0A0A';
wwv_flow_imp.g_varchar2_table(110) := '68746D6C2E752D52544C202E756374722D70726F6772657373207B0A202072696768743A20303B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20302E3472656D3B0A7D0A0A406D6564696120286D61782D77696474683A20';
wwv_flow_imp.g_varchar2_table(111) := '343830707829207B0A20202E756374722D636F6E7461696E6572207B0A202020206C6566743A20312E3672656D3B0A2020202072696768743A20312E3672656D3B0A20207D0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168072693606050320)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'css/uctr.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A0A0A094E6F7465730A09092A206162736F6C757465206C65667420616E642072696768742076616C7565732073686F756C64206E6F7720626520706C61636573206F6E2074686520636F6E7461696E657220656C656D656E742C206E6F7420746865';
wwv_flow_imp.g_varchar2_table(2) := '20696E646976696475616C206E6F74696669636174696F6E730A0A2A2F0A0A40675F436F6E7461696E65722D426F726465725261646975733A203270783B0A40675F5761726E696E672D42473A20236662636634613B0A40675F537563636573732D4247';
wwv_flow_imp.g_varchar2_table(3) := '3A20233342414132433B0A40675F44616E6765722D42473A20236634343333363B0A40675F496E666F2D42473A20233030373664663B0A0A40675F416363656E742D4F473A20234644464446443B0A40675F526567696F6E2D4865616465722D42473A20';
wwv_flow_imp.g_varchar2_table(4) := '6C69676874656E2840675F416363656E742D4F472C203425293B0A40675F526567696F6E2D42473A206C69676874656E2840675F526567696F6E2D4865616465722D42472C20323025293B0A0A40675F526567696F6E2D46473A206661646528636F6E74';
wwv_flow_imp.g_varchar2_table(5) := '726173742840675F526567696F6E2D42472C2064657361747572617465286461726B656E2840675F526567696F6E2D42472C2020383525292C2031303025292C2064657361747572617465286C69676874656E2840675F526567696F6E2D42472C202038';
wwv_flow_imp.g_varchar2_table(6) := '3525292C2035302529292C2031303025293B0A0A40675F537563636573732D46473A20234646463B0A40675F44616E6765722D46473A20234646463B0A40675F496E666F2D46473A20234646463B0A40675F5761726E696E672D46473A20636F6E747261';
wwv_flow_imp.g_varchar2_table(7) := '73742840675F5761726E696E672D42472C206461726B656E2840675F5761726E696E672D42472C202020353025292C206C69676874656E2840675F5761726E696E672D42472C202020353025292C2020343325293B0A0A0A2F2A2A0A202A204669786573';
wwv_flow_imp.g_varchar2_table(8) := '206C696E6B207374796C696E6720696E206572726F72730A202A2F0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E6720612C0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E6765722061';
wwv_flow_imp.g_varchar2_table(9) := '207B0A2020636F6C6F723A20696E68657269743B0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0A7D0A0A2F2A2A0A202A20436F6C6F72697A6564204261636B67726F756E640A202A2F0A202E75632D416C6572742D2D686F';
wwv_flow_imp.g_varchar2_table(10) := '72697A6F6E74616C207B0A202020626F726465722D7261646975733A2040675F436F6E7461696E65722D426F726465725261646975730A207D0A200A202E75632D416C6572742D69636F6E202E742D49636F6E207B0A202020636F6C6F723A2023464646';
wwv_flow_imp.g_varchar2_table(11) := '3B0A207D0A200A200A202F2A2A0A20202A204D6F6469666965723A205761726E696E670A20202A2F0A202E75632D416C6572742D2D7761726E696E677B0A2020202E75632D416C6572742D69636F6E202E742D49636F6E207B0A0920636F6C6F723A2040';
wwv_flow_imp.g_varchar2_table(12) := '675F5761726E696E672D42473B0A2020207D0A200A202020262E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A09206261636B67726F756E642D636F6C6F723A20666164656F75742840675F5761726E69';
wwv_flow_imp.g_varchar2_table(13) := '6E672D42472C20383525293B0A2020207D0A207D0A200A200A202F2A2A0A20202A204D6F6469666965723A20537563636573730A20202A2F0A202E75632D416C6572742D2D73756363657373207B0A2020202E75632D416C6572742D69636F6E202E742D';
wwv_flow_imp.g_varchar2_table(14) := '49636F6E207B0A0920636F6C6F723A2040675F537563636573732D42473B0A2020207D0A200A202020262E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A09206261636B67726F756E642D636F6C6F723A';
wwv_flow_imp.g_varchar2_table(15) := '20666164656F75742840675F537563636573732D42472C20383525293B0A2020207D0A207D0A200A202F2A2A0A20202A204D6F6469666965723A20496E666F726D6174696F6E0A20202A2F0A202E75632D416C6572742D2D696E666F207B0A2020202E75';
wwv_flow_imp.g_varchar2_table(16) := '632D416C6572742D69636F6E202E742D49636F6E207B0A0920636F6C6F723A2040675F496E666F2D42473B0A2020207D0A200A202020262E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A09206261636B';
wwv_flow_imp.g_varchar2_table(17) := '67726F756E642D636F6C6F723A20666164656F75742840675F496E666F2D42472C20383525293B0A2020207D0A207D0A200A202F2A2A0A20202A204D6F6469666965723A20537563636573730A20202A2F0A202E75632D416C6572742D2D64616E676572';
wwv_flow_imp.g_varchar2_table(18) := '7B0A2020202E75632D416C6572742D69636F6E202E742D49636F6E207B0A0920636F6C6F723A2040675F44616E6765722D42473B0A2020207D0A200A202020262E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E';
wwv_flow_imp.g_varchar2_table(19) := '207B0A09206261636B67726F756E642D636F6C6F723A20666164656F75742840675F44616E6765722D42472C20383525293B0A2020207D0A207D0A200A202E75632D416C6572742D2D686F72697A6F6E74616C7B0A2020206261636B67726F756E642D63';
wwv_flow_imp.g_varchar2_table(20) := '6F6C6F723A2040675F526567696F6E2D42473B0A202020636F6C6F723A2040675F526567696F6E2D46473B0A207D0A0A2F2A0A2E75632D416C6572742D2D64616E6765727B0A094062673A206C69676874656E2840675F44616E6765722D42472C203430';
wwv_flow_imp.g_varchar2_table(21) := '25293B0A096261636B67726F756E642D636F6C6F723A204062673B0A09636F6C6F723A206661646528636F6E7472617374284062672C2064657361747572617465286461726B656E284062672C202031303025292C2031303025292C2064657361747572';
wwv_flow_imp.g_varchar2_table(22) := '617465286C69676874656E284062672C202031303025292C2035302529292C2031303025293B0A7D0A2E75632D416C6572742D2D696E666F207B0A094062673A206C69676874656E2840675F496E666F2D42472C20353525293B0A096261636B67726F75';
wwv_flow_imp.g_varchar2_table(23) := '6E642D636F6C6F723A204062673B0A09636F6C6F723A206661646528636F6E7472617374284062672C2064657361747572617465286461726B656E284062672C202031303025292C2031303025292C2064657361747572617465286C69676874656E2840';
wwv_flow_imp.g_varchar2_table(24) := '62672C202031303025292C2035302529292C2031303025293B0A7D0A2A2F0A0A202E75632D416C6572742D2D70616765207B0A202020262E75632D416C6572742D2D73756363657373207B0A09206261636B67726F756E642D636F6C6F723A2066616465';
wwv_flow_imp.g_varchar2_table(25) := '6F75742840675F537563636573732D42472C20313025293B0A0920636F6C6F723A2040675F537563636573732D46473B0A200A09202E75632D416C6572742D69636F6E207B0A092020206261636B67726F756E642D636F6C6F723A207472616E73706172';
wwv_flow_imp.g_varchar2_table(26) := '656E743B0A09202020636F6C6F723A2040675F537563636573732D46473B0A200A092020202E742D49636F6E207B0A090920636F6C6F723A20696E68657269743B0A092020207D0A09207D0A200A09202E742D427574746F6E2D2D636C6F7365416C6572';
wwv_flow_imp.g_varchar2_table(27) := '74207B0A09202020636F6C6F723A2040675F537563636573732D46472021696D706F7274616E743B0A09207D0A2020207D0A2020262E75632D416C6572742D2D7761726E696E67207B0A202020206261636B67726F756E642D636F6C6F723A2040675F57';
wwv_flow_imp.g_varchar2_table(28) := '61726E696E672D42473B0A20202020636F6C6F723A2040675F5761726E696E672D46473B0A0A09202E75632D416C6572742D69636F6E207B0A092020206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A09202020636F6C6F';
wwv_flow_imp.g_varchar2_table(29) := '723A2040675F5761726E696E672D46473B0A200A092020202E742D49636F6E207B0A090920636F6C6F723A20696E68657269743B0A092020207D0A09207D0A200A09202E742D427574746F6E2D2D636C6F7365416C657274207B0A09202020636F6C6F72';
wwv_flow_imp.g_varchar2_table(30) := '3A2040675F537563636573732D46472021696D706F7274616E743B0A09207D0A20207D0A2020262E75632D416C6572742D2D696E666F207B0A202020206261636B67726F756E642D636F6C6F723A2040675F496E666F2D42473B0A20202020636F6C6F72';
wwv_flow_imp.g_varchar2_table(31) := '3A2040675F496E666F2D46473B0A0A09202E75632D416C6572742D69636F6E207B0A092020206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A09202020636F6C6F723A2040675F496E666F2D46473B0A200A092020202E74';
wwv_flow_imp.g_varchar2_table(32) := '2D49636F6E207B0A090920636F6C6F723A20696E68657269743B0A092020207D0A09207D0A200A09202E742D427574746F6E2D2D636C6F7365416C657274207B0A09202020636F6C6F723A2040675F496E666F2D46472021696D706F7274616E743B0A09';
wwv_flow_imp.g_varchar2_table(33) := '207D0A20207D0A202020262E75632D416C6572742D2D64616E676572207B0A202020206261636B67726F756E642D636F6C6F723A2040675F44616E6765722D42473B0A20202020636F6C6F723A2040675F44616E6765722D46473B0A0A09202E75632D41';
wwv_flow_imp.g_varchar2_table(34) := '6C6572742D69636F6E207B0A092020206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A09202020636F6C6F723A2040675F44616E6765722D46473B0A200A092020202E742D49636F6E207B0A090920636F6C6F723A20696E';
wwv_flow_imp.g_varchar2_table(35) := '68657269743B0A092020207D0A09207D0A200A09202E742D427574746F6E2D2D636C6F7365416C657274207B0A09202020636F6C6F723A2040675F44616E6765722D46472021696D706F7274616E743B0A09207D0A20207D0A7D0A0A2F2A20486F72697A';
wwv_flow_imp.g_varchar2_table(36) := '6F6E74616C20416C657274203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(37) := '2D686F72697A6F6E74616C207B206D617267696E2D626F74746F6D3A20312E3672656D3B20706F736974696F6E3A2072656C61746976653B207D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D77726170207B2064';
wwv_flow_imp.g_varchar2_table(38) := '6973706C61793A20666C65783B20666C65782D646972656374696F6E3A20726F773B207D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B2070616464696E673A203020313670783B20666C65782D73';
wwv_flow_imp.g_varchar2_table(39) := '6872696E6B3A20303B20646973706C61793A20666C65783B20616C69676E2D6974656D733A2063656E7465723B207D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D636F6E74656E74207B2070616464696E673A20';
wwv_flow_imp.g_varchar2_table(40) := '313670783B20666C65783A203120303B20646973706C61793A20666C65783B20666C65782D646972656374696F6E3A20636F6C756D6E3B206A7573746966792D636F6E74656E743A2063656E7465723B207D0A0A2E75632D416C6572742D2D686F72697A';
wwv_flow_imp.g_varchar2_table(41) := '6F6E74616C202E75632D416C6572742D627574746F6E73207B20666C65782D736872696E6B3A20303B20746578742D616C69676E3A2072696768743B2077686974652D73706163653A206E6F777261703B2070616464696E672D72696768743A20312E36';
wwv_flow_imp.g_varchar2_table(42) := '72656D3B20646973706C61793A20666C65783B20616C69676E2D6974656D733A2063656E7465723B207D0A0A2E752D52544C202E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D627574746F6E73207B2070616464696E67';
wwv_flow_imp.g_varchar2_table(43) := '2D72696768743A20303B2070616464696E672D6C6566743A20312E3672656D3B207D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D627574746F6E733A656D707479207B20646973706C61793A206E6F6E653B207D';
wwv_flow_imp.g_varchar2_table(44) := '0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D7469746C65207B20666F6E742D73697A653A20322E3072656D3B206C696E652D6865696768743A20322E3472656D3B206D617267696E2D626F74746F6D3A20303B20';
wwv_flow_imp.g_varchar2_table(45) := '7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D626F64793A656D707479207B20646973706C61793A206E6F6E653B207D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D6963';
wwv_flow_imp.g_varchar2_table(46) := '6F6E202E742D49636F6E207B20666F6E742D73697A653A20333270783B2077696474683A20333270783B20746578742D616C69676E3A2063656E7465723B206865696768743A20333270783B206C696E652D6865696768743A20313B207D0A0A2F2A203D';
wwv_flow_imp.g_varchar2_table(47) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D20436F6D6D6F6E2050726F70657274696573203D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(48) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D686F72697A6F6E74616C207B20626F72646572';
wwv_flow_imp.g_varchar2_table(49) := '3A2031707820736F6C6964207267626128302C20302C20302C20302E31293B20626F782D736861646F773A20302032707820347078202D327078207267626128302C20302C20302C20302E303735293B207D0A0A2E75632D416C6572742D2D6E6F49636F';
wwv_flow_imp.g_varchar2_table(50) := '6E2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B20646973706C61793A206E6F6E652021696D706F7274616E743B207D0A0A2E75632D416C6572742D2D6E6F49636F6E202E75632D416C6572742D69636F';
wwv_flow_imp.g_varchar2_table(51) := '6E202E742D49636F6E207B20646973706C61793A206E6F6E653B207D0A0A2E742D426F64792D616C657274207B206D617267696E3A20303B207D0A0A2E742D426F64792D616C657274202E75632D416C657274207B206D617267696E2D626F74746F6D3A';
wwv_flow_imp.g_varchar2_table(52) := '20303B207D0A0A2F2A2050616765204E6F74696669636174696F6E202853756363657373206F72204D65737361676529203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(53) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D70616765207B207472616E736974696F6E3A202E327320656173652D6F75743B206D61782D77696474683A2036343070783B206D696E2D77696474683A20';
wwv_flow_imp.g_varchar2_table(54) := '33323070783B202F2A706F736974696F6E3A2066697865643B20746F703A20312E3672656D3B2072696768743A20312E3672656D3B2A2F207A2D696E6465783A20313030303B20626F726465722D77696474683A20303B20626F782D736861646F773A20';
wwv_flow_imp.g_varchar2_table(55) := '302030203020302E3172656D207267626128302C20302C20302C20302E312920696E7365742C20302033707820397078202D327078207267626128302C20302C20302C20302E31293B202F2A20466F72207665727920736D616C6C2073637265656E732C';
wwv_flow_imp.g_varchar2_table(56) := '2066697420746865206D65737361676520746F2074686520746F70206F66207468652073637265656E202A2F202F2A2053657420426F726465722052616469757320746F2030206173206D657373616765206578697374732077697468696E20636F6E74';
wwv_flow_imp.g_varchar2_table(57) := '656E74202A2F202F2A2050616765204C6576656C205761726E696E6720616E64204572726F7273203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(58) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F202F2A205363726F6C6C62617273202A2F207D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D627574746F6E73207B2070616464696E672D72696768743A20303B207D0A0A2E75632D41';
wwv_flow_imp.g_varchar2_table(59) := '6C6572742D2D70616765202E75632D416C6572742D69636F6E207B2070616464696E672D6C6566743A20312E3672656D3B2070616464696E672D72696768743A203870783B207D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E75632D';
wwv_flow_imp.g_varchar2_table(60) := '416C6572742D69636F6E207B2070616464696E672D6C6566743A203870783B2070616464696E672D72696768743A20312E3672656D3B207D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D69636F6E202E742D49636F6E207B2066';
wwv_flow_imp.g_varchar2_table(61) := '6F6E742D73697A653A20323470783B2077696474683A20323470783B206865696768743A20323470783B206C696E652D6865696768743A20313B207D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D626F6479207B207061646469';
wwv_flow_imp.g_varchar2_table(62) := '6E672D626F74746F6D3A203870783B207D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D636F6E74656E74207B2070616464696E673A203870783B207D0A0A2E75632D416C6572742D2D70616765202E742D427574746F6E2D2D63';
wwv_flow_imp.g_varchar2_table(63) := '6C6F7365416C657274207B20706F736974696F6E3A206162736F6C7574653B2072696768743A202D3870783B20746F703A202D3870783B2070616464696E673A203470783B206D696E2D77696474683A20303B206261636B67726F756E642D636F6C6F72';
wwv_flow_imp.g_varchar2_table(64) := '3A20233030302021696D706F7274616E743B20636F6C6F723A20234646462021696D706F7274616E743B20626F782D736861646F773A203020302030203170782072676261283235352C203235352C203235352C20302E3235292021696D706F7274616E';
wwv_flow_imp.g_varchar2_table(65) := '743B20626F726465722D7261646975733A20323470783B207472616E736974696F6E3A202D7765626B69742D7472616E73666F726D20302E3132357320656173653B207472616E736974696F6E3A207472616E73666F726D20302E313235732065617365';
wwv_flow_imp.g_varchar2_table(66) := '3B207472616E736974696F6E3A207472616E73666F726D20302E3132357320656173652C202D7765626B69742D7472616E73666F726D20302E3132357320656173653B207D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E742D427574';
wwv_flow_imp.g_varchar2_table(67) := '746F6E2D2D636C6F7365416C657274207B2072696768743A206175746F3B206C6566743A202D3870783B207D0A0A2E75632D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C6572743A686F766572207B202D7765626B69742D';
wwv_flow_imp.g_varchar2_table(68) := '7472616E73666F726D3A207363616C6528312E3135293B207472616E73666F726D3A207363616C6528312E3135293B207D0A0A2E75632D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C6572743A616374697665207B202D77';
wwv_flow_imp.g_varchar2_table(69) := '65626B69742D7472616E73666F726D3A207363616C6528302E3835293B207472616E73666F726D3A207363616C6528302E3835293B207D0A0A2F2A2E752D52544C202E75632D416C6572742D2D70616765207B2072696768743A206175746F3B206C6566';
wwv_flow_imp.g_varchar2_table(70) := '743A20312E3672656D3B207D2A2F0A0A2E75632D416C6572742D2D706167652E75632D416C657274207B20626F726465722D7261646975733A20302E3472656D3B207D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D7469746C65';
wwv_flow_imp.g_varchar2_table(71) := '207B2070616464696E673A2038707820303B207D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E207B206D617267696E2D72696768743A203870783B207D0A0A2E75632D';
wwv_flow_imp.g_varchar2_table(72) := '416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E2D7469746C65207B20666F6E742D73697A653A20312E3472656D3B206C696E652D6865696768743A203272656D3B20666F6E742D776569';
wwv_flow_imp.g_varchar2_table(73) := '6768743A203730303B206D617267696E3A20303B207D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E2D6C697374207B206D61782D6865696768743A2031323870783B20';
wwv_flow_imp.g_varchar2_table(74) := '7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6C697374207B206D61782D6865696768743A20393670783B206F766572666C6F773A206175746F3B207D0A0A2E75632D416C6572742D2D70616765202E612D4E6F';
wwv_flow_imp.g_varchar2_table(75) := '74696669636174696F6E2D6C696E6B3A686F766572207B20746578742D6465636F726174696F6E3A20756E6465726C696E653B207D0A0A2E75632D416C6572742D2D70616765203A3A2D7765626B69742D7363726F6C6C626172207B2077696474683A20';
wwv_flow_imp.g_varchar2_table(76) := '3870783B206865696768743A203870783B207D0A0A2E75632D416C6572742D2D70616765203A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E32';
wwv_flow_imp.g_varchar2_table(77) := '35293B207D0A0A2E75632D416C6572742D2D70616765203A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B207D0A0A2E75632D416C65';
wwv_flow_imp.g_varchar2_table(78) := '72742D2D70616765202E75632D416C6572742D7469746C65207B20646973706C61793A20626C6F636B3B20666F6E742D7765696768743A203730303B20666F6E742D73697A653A20312E3872656D3B206D617267696E2D626F74746F6D3A20303B206D61';
wwv_flow_imp.g_varchar2_table(79) := '7267696E2D72696768743A20313670783B207D0A2E75632D416C6572742D2D70616765202E75632D416C6572742D626F647920207B206D617267696E2D72696768743A20313670783B207D0A0A2E752D52544C202E75632D416C6572742D2D7061676520';
wwv_flow_imp.g_varchar2_table(80) := '2E75632D416C6572742D7469746C65207B206D617267696E2D72696768743A20303B206D617267696E2D6C6566743A20313670783B207D0A2E752D52544C202E75632D416C6572742D2D70616765202E75632D416C6572742D626F647920207B206D6172';
wwv_flow_imp.g_varchar2_table(81) := '67696E2D72696768743A20303B206D617267696E2D6C6566743A20313670783B207D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6C697374207B206D617267696E3A203470782030203020303B2070616464696E';
wwv_flow_imp.g_varchar2_table(82) := '673A20303B206C6973742D7374796C653A206E6F6E653B207D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D207B2070616464696E672D6C6566743A20323070783B20706F736974696F6E3A2072656C61';
wwv_flow_imp.g_varchar2_table(83) := '746976653B20666F6E742D73697A653A20313470783B206C696E652D6865696768743A20323070783B206D617267696E2D626F74746F6D3A203470783B202F2A20457874726120536D616C6C2053637265656E73202A2F207D0A0A2E75632D416C657274';
wwv_flow_imp.g_varchar2_table(84) := '2D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6C6173742D6368696C64207B206D617267696E2D626F74746F6D3A20303B207D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E';
wwv_flow_imp.g_varchar2_table(85) := '2D6974656D207B2070616464696E672D6C6566743A20303B2070616464696E672D72696768743A20323070783B207D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6265666F7265207B20636F6E7465';
wwv_flow_imp.g_varchar2_table(86) := '6E743A2027273B20706F736974696F6E3A206162736F6C7574653B206D617267696E3A203870783B20746F703A20303B206C6566743A20303B2077696474683A203470783B206865696768743A203470783B20626F726465722D7261646975733A203130';
wwv_flow_imp.g_varchar2_table(87) := '30253B206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B207D0A0A2F2A2E752D52544C202E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6265666F7265207B20';
wwv_flow_imp.g_varchar2_table(88) := '72696768743A20303B206C6566743A206175746F3B207D2A2F0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D202E612D427574746F6E2D2D6E6F74696669636174696F6E207B2070616464696E673A2032';
wwv_flow_imp.g_varchar2_table(89) := '70783B206F7061636974793A202E37353B20766572746963616C2D616C69676E3A20746F703B207D0A0A2E75632D416C6572742D2D70616765202E68746D6C64624F7261457272207B206D617267696E2D746F703A20302E3872656D3B20646973706C61';
wwv_flow_imp.g_varchar2_table(90) := '793A20626C6F636B3B20666F6E742D73697A653A20312E3172656D3B206C696E652D6865696768743A20312E3672656D3B20666F6E742D66616D696C793A20274D656E6C6F272C2027436F6E736F6C6173272C206D6F6E6F73706163652C207365726966';
wwv_flow_imp.g_varchar2_table(91) := '3B2077686974652D73706163653A207072652D6C696E653B207D0A0A2F2A2041636365737369626C652048656164696E67203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(92) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D61636365737369626C6548656164696E67202E75632D416C6572742D7469746C65207B20626F726465723A20303B20636C69703A207265637428302030';
wwv_flow_imp.g_varchar2_table(93) := '20302030293B206865696768743A203170783B206D617267696E3A202D3170783B206F766572666C6F773A2068696464656E3B2070616464696E673A20303B20706F736974696F6E3A206162736F6C7574653B2077696474683A203170783B207D0A0A2F';
wwv_flow_imp.g_varchar2_table(94) := '2A2048696464656E2048656164696E6720284E6F742041636365737369626C6529203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(95) := '3D3D3D3D3D3D3D3D202A2F0A2E75632D416C6572742D2D72656D6F766548656164696E67202E75632D416C6572742D7469746C65207B20646973706C61793A206E6F6E653B207D0A0A406D6564696120286D61782D77696474683A20343830707829207B';
wwv_flow_imp.g_varchar2_table(96) := '0A092E75632D416C6572742D2D70616765207B0A09092F2A6C6566743A20312E3672656D3B2A2F0A09096D696E2D77696474683A20303B0A09096D61782D77696474683A206E6F6E653B0A097D0A092E75632D416C6572742D2D70616765202E612D4E6F';
wwv_flow_imp.g_varchar2_table(97) := '74696669636174696F6E2D6974656D207B0A0909666F6E742D73697A653A20313270783B0A097D0A7D0A0A406D6564696120286D61782D77696474683A20373638707829207B0A092E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C';
wwv_flow_imp.g_varchar2_table(98) := '6572742D7469746C65207B0A0909666F6E742D73697A653A20312E3872656D3B0A097D0A7D0A0A2F2A202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(99) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2F2A2049636F6E2E637373202A2F0A0A2E75632D416C657274202E742D49636F6E2E69636F6E2D636C6F73653A6265666F7265207B20666F6E742D66616D696C793A20226170';
wwv_flow_imp.g_varchar2_table(100) := '65782D352D69636F6E2D666F6E74223B20646973706C61793A20696E6C696E652D626C6F636B3B20766572746963616C2D616C69676E3A20746F703B207D0A0A2E75632D416C657274202E742D49636F6E2E69636F6E2D636C6F73653A6265666F726520';
wwv_flow_imp.g_varchar2_table(101) := '7B206C696E652D6865696768743A20313670783B20666F6E742D73697A653A20313670783B20636F6E74656E743A20225C65306132223B207D0A0A2F2A202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(102) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A0A2F2F23656E64726567696F6E0A0A2E756374722D746F702D63656E746572207B0A09746F703A20312E3672656D3B0A0972';
wwv_flow_imp.g_varchar2_table(103) := '696768743A20303B0A0977696474683A20313030253B0A7D0A0A2E756374722D626F74746F6D2D63656E746572207B0A09626F74746F6D3A20312E3672656D3B0A0972696768743A20303B0A0977696474683A20313030253B0A7D0A0A2E756374722D74';
wwv_flow_imp.g_varchar2_table(104) := '6F702D7269676874207B0A09746F703A20312E3672656D3B0A0972696768743A20312E3672656D3B0A7D0A0A2E756374722D746F702D6C656674207B0A09746F703A20312E3672656D3B0A096C6566743A20312E3672656D3B0A7D0A0A2E756374722D62';
wwv_flow_imp.g_varchar2_table(105) := '6F74746F6D2D7269676874207B0A0972696768743A20312E3672656D3B0A09626F74746F6D3A20312E3672656D3B0A7D0A0A2E756374722D626F74746F6D2D6C656674207B0A09626F74746F6D3A20312E3672656D3B0A096C6566743A20312E3672656D';
wwv_flow_imp.g_varchar2_table(106) := '3B0A7D0A0A2E756374722D636F6E7461696E6572207B0A09706F736974696F6E3A2066697865643B0A097A2D696E6465783A203939393939393B0A0A092F2F64697361626C6520706F696E746572206576656E747320666F722074686520636F6E746169';
wwv_flow_imp.g_varchar2_table(107) := '6E65720A09706F696E7465722D6576656E74733A206E6F6E653B0A092F2F62757420656E61626C65207468656D20666F7220746865206368696C6472656E0A093E20646976207B0A0909706F696E7465722D6576656E74733A206175746F3B0A097D200A';
wwv_flow_imp.g_varchar2_table(108) := '0A092F2A6F76657272696465732A2F0A09262E756374722D746F702D63656E746572203E206469762C0A09262E756374722D626F74746F6D2D63656E746572203E20646976207B0A09092F2A77696474683A2033303070783B2A2F0A09096D617267696E';
wwv_flow_imp.g_varchar2_table(109) := '2D6C6566743A206175746F3B0A09096D617267696E2D72696768743A206175746F3B0A097D0A7D0A0A2F2F2070726F677265737320626172207374796C696E670A2E756374722D70726F6772657373207B0A09706F736974696F6E3A206162736F6C7574';
wwv_flow_imp.g_varchar2_table(110) := '653B0A09626F74746F6D3A20303B0A096865696768743A203470783B0A096261636B67726F756E642D636F6C6F723A20626C61636B3B0A096F7061636974793A20302E343B0A7D0A0A68746D6C3A6E6F74282E752D52544C29202E756374722D70726F67';
wwv_flow_imp.g_varchar2_table(111) := '726573737B0A096C6566743A20303B0A09626F726465722D626F74746F6D2D6C6566742D7261646975733A20302E3472656D3B0A7D0A0A68746D6C2E752D52544C202E756374722D70726F6772657373207B0A0972696768743A20303B0A09626F726465';
wwv_flow_imp.g_varchar2_table(112) := '722D626F74746F6D2D72696768742D7261646975733A20302E3472656D3B0A7D0A0A406D6564696120286D61782D77696474683A20343830707829207B0A092E756374722D636F6E7461696E6572207B0A09096C6566743A20312E3672656D3B0A090972';
wwv_flow_imp.g_varchar2_table(113) := '696768743A20312E3672656D3B0A097D0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168072966157050316)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'css/uctr.less'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E67657220612C0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E672061207B0A2020636F6C6F723A20696E68657269743B0A2020746578742D64';
wwv_flow_imp.g_varchar2_table(2) := '65636F726174696F6E3A20756E6465726C696E650A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C207B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20236666663B0A2020636F';
wwv_flow_imp.g_varchar2_table(3) := '6C6F723A20233236323632363B0A20206D617267696E2D626F74746F6D3A20312E3672656D3B0A2020706F736974696F6E3A2072656C61746976653B0A2020626F726465723A2031707820736F6C6964207267626128302C20302C20302C202E31293B0A';
wwv_flow_imp.g_varchar2_table(4) := '2020626F782D736861646F773A20302032707820347078202D327078207267626128302C20302C20302C202E303735290A7D0A0A2E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20236666660A7D0A0A2E75632D416C';
wwv_flow_imp.g_varchar2_table(5) := '6572742D2D7761726E696E67202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20236662636634610A7D0A0A2E75632D416C6572742D2D7761726E696E672E75632D416C6572742D2D686F72697A6F6E74616C202E75';
wwv_flow_imp.g_varchar2_table(6) := '632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A2072676261283235312C203230372C2037342C202E3135290A7D0A0A2E75632D416C6572742D2D73756363657373202E75632D416C6572742D69636F6E202E742D49';
wwv_flow_imp.g_varchar2_table(7) := '636F6E207B0A2020636F6C6F723A20233362616132630A7D0A0A2E75632D416C6572742D2D737563636573732E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_imp.g_varchar2_table(8) := '723A20726762612835392C203137302C2034342C202E3135290A7D0A0A2E75632D416C6572742D2D696E666F202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20233030373664660A7D0A0A2E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(9) := '2D696E666F2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C203131382C203232332C202E3135290A7D0A0A2E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(10) := '2D64616E676572202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20236634343333360A7D0A0A2E75632D416C6572742D2D64616E6765722E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572';
wwv_flow_imp.g_varchar2_table(11) := '742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A2072676261283234342C2036372C2035342C202E3135290A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D73756363657373207B0A20206261636B67726F';
wwv_flow_imp.g_varchar2_table(12) := '756E642D636F6C6F723A20726762612835392C203137302C2034342C202E39293B0A2020636F6C6F723A20236666660A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D73756363657373202E75632D416C6572742D69636F6E20';
wwv_flow_imp.g_varchar2_table(13) := '7B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20236666660A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572202E75632D416C6572742D69636F6E20';
wwv_flow_imp.g_varchar2_table(14) := '2E742D49636F6E2C0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F202E75632D416C6572742D69636F6E202E742D49636F6E2C0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D73756363657373202E75';
wwv_flow_imp.g_varchar2_table(15) := '632D416C6572742D69636F6E202E742D49636F6E2C0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20696E68657269740A7D0A';
wwv_flow_imp.g_varchar2_table(16) := '0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D73756363657373202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F723A20236666662021696D706F7274616E740A7D0A0A2E75632D416C6572742D2D7061';
wwv_flow_imp.g_varchar2_table(17) := '67652E75632D416C6572742D2D7761726E696E67207B0A20206261636B67726F756E642D636F6C6F723A20236662636634613B0A2020636F6C6F723A20233434333430320A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761';
wwv_flow_imp.g_varchar2_table(18) := '726E696E67202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20233434333430320A7D0A0A2E75632D416C6572742D2D706167652E75632D416C657274';
wwv_flow_imp.g_varchar2_table(19) := '2D2D7761726E696E67202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F723A20236666662021696D706F7274616E740A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F207B0A2020626163';
wwv_flow_imp.g_varchar2_table(20) := '6B67726F756E642D636F6C6F723A20233030373664663B0A2020636F6C6F723A20236666660A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E';
wwv_flow_imp.g_varchar2_table(21) := '642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20236666660A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F';
wwv_flow_imp.g_varchar2_table(22) := '723A20236666662021696D706F7274616E740A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572207B0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0A2020636F6C6F723A20236666660A';
wwv_flow_imp.g_varchar2_table(23) := '7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572202E75632D416C6572742D69636F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20236666660A';
wwv_flow_imp.g_varchar2_table(24) := '7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F723A20236666662021696D706F7274616E740A7D0A0A2E75632D416C6572742D2D68';
wwv_flow_imp.g_varchar2_table(25) := '6F72697A6F6E74616C202E75632D416C6572742D77726170207B0A2020646973706C61793A20666C65783B0A2020666C65782D646972656374696F6E3A20726F770A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C657274';
wwv_flow_imp.g_varchar2_table(26) := '2D69636F6E207B0A202070616464696E673A203020313670783B0A2020666C65782D736872696E6B3A20303B0A2020646973706C61793A20666C65783B0A2020616C69676E2D6974656D733A2063656E7465720A7D0A0A2E75632D416C6572742D2D686F';
wwv_flow_imp.g_varchar2_table(27) := '72697A6F6E74616C202E75632D416C6572742D636F6E74656E74207B0A202070616464696E673A20313670783B0A2020666C65783A203120303B0A2020646973706C61793A20666C65783B0A2020666C65782D646972656374696F6E3A20636F6C756D6E';
wwv_flow_imp.g_varchar2_table(28) := '3B0A20206A7573746966792D636F6E74656E743A2063656E7465720A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D627574746F6E73207B0A2020666C65782D736872696E6B3A20303B0A2020746578742D616C';
wwv_flow_imp.g_varchar2_table(29) := '69676E3A2072696768743B0A202077686974652D73706163653A206E6F777261703B0A202070616464696E672D72696768743A20312E3672656D3B0A2020646973706C61793A20666C65783B0A2020616C69676E2D6974656D733A2063656E7465720A7D';
wwv_flow_imp.g_varchar2_table(30) := '0A0A2E752D52544C202E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D627574746F6E73207B0A202070616464696E672D72696768743A20303B0A202070616464696E672D6C6566743A20312E3672656D0A7D0A0A2E7563';
wwv_flow_imp.g_varchar2_table(31) := '2D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D626F64793A656D7074792C0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D627574746F6E733A656D707479207B0A2020646973706C61793A20';
wwv_flow_imp.g_varchar2_table(32) := '6E6F6E650A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D7469746C65207B0A2020666F6E742D73697A653A203272656D3B0A20206C696E652D6865696768743A20322E3472656D3B0A20206D617267696E2D62';
wwv_flow_imp.g_varchar2_table(33) := '6F74746F6D3A20300A7D0A0A2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020666F6E742D73697A653A20333270783B0A202077696474683A20333270783B0A2020746578742D';
wwv_flow_imp.g_varchar2_table(34) := '616C69676E3A2063656E7465723B0A20206865696768743A20333270783B0A20206C696E652D6865696768743A20310A7D0A0A2E75632D416C6572742D2D6E6F49636F6E2E75632D416C6572742D2D686F72697A6F6E74616C202E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(35) := '69636F6E207B0A2020646973706C61793A206E6F6E652021696D706F7274616E740A7D0A0A2E75632D416C6572742D2D6E6F49636F6E202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020646973706C61793A206E6F6E650A7D0A0A2E';
wwv_flow_imp.g_varchar2_table(36) := '742D426F64792D616C657274207B0A20206D617267696E3A20300A7D0A0A2E742D426F64792D616C657274202E75632D416C657274207B0A20206D617267696E2D626F74746F6D3A20300A7D0A0A2E75632D416C6572742D2D70616765207B0A20207472';
wwv_flow_imp.g_varchar2_table(37) := '616E736974696F6E3A202E327320656173652D6F75743B0A20206D61782D77696474683A2036343070783B0A20206D696E2D77696474683A2033323070783B0A20207A2D696E6465783A20313030303B0A2020626F726465722D77696474683A20303B0A';
wwv_flow_imp.g_varchar2_table(38) := '2020626F782D736861646F773A203020302030202E3172656D207267626128302C20302C20302C202E312920696E7365742C20302033707820397078202D327078207267626128302C20302C20302C202E31290A7D0A0A2E75632D416C6572742D2D7061';
wwv_flow_imp.g_varchar2_table(39) := '6765202E75632D416C6572742D627574746F6E73207B0A202070616464696E672D72696768743A20300A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D69636F6E207B0A202070616464696E672D6C6566743A20312E3672656D';
wwv_flow_imp.g_varchar2_table(40) := '3B0A202070616464696E672D72696768743A203870780A7D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E75632D416C6572742D69636F6E207B0A202070616464696E672D6C6566743A203870783B0A202070616464696E672D726967';
wwv_flow_imp.g_varchar2_table(41) := '68743A20312E3672656D0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D69636F6E202E742D49636F6E207B0A2020666F6E742D73697A653A20323470783B0A202077696474683A20323470783B0A20206865696768743A2032';
wwv_flow_imp.g_varchar2_table(42) := '3470783B0A20206C696E652D6865696768743A20310A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D626F6479207B0A202070616464696E672D626F74746F6D3A203870780A7D0A0A2E75632D416C6572742D2D70616765202E';
wwv_flow_imp.g_varchar2_table(43) := '75632D416C6572742D636F6E74656E74207B0A202070616464696E673A203870780A7D0A0A2E75632D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020706F736974696F6E3A206162736F6C7574653B0A20';
wwv_flow_imp.g_varchar2_table(44) := '2072696768743A202D3870783B0A2020746F703A202D3870783B0A202070616464696E673A203470783B0A20206D696E2D77696474683A20303B0A20206261636B67726F756E642D636F6C6F723A20233030302021696D706F7274616E743B0A2020636F';
wwv_flow_imp.g_varchar2_table(45) := '6C6F723A20236666662021696D706F7274616E743B0A2020626F782D736861646F773A203020302030203170782072676261283235352C203235352C203235352C202E3235292021696D706F7274616E743B0A2020626F726465722D7261646975733A20';
wwv_flow_imp.g_varchar2_table(46) := '323470783B0A20207472616E736974696F6E3A207472616E73666F726D202E3132357320656173653B0A20207472616E736974696F6E3A207472616E73666F726D202E3132357320656173652C202D7765626B69742D7472616E73666F726D202E313235';
wwv_flow_imp.g_varchar2_table(47) := '7320656173650A7D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C657274207B0A202072696768743A206175746F3B0A20206C6566743A202D3870780A7D0A0A2E75632D416C6572742D2D70';
wwv_flow_imp.g_varchar2_table(48) := '616765202E742D427574746F6E2D2D636C6F7365416C6572743A686F766572207B0A20202D7765626B69742D7472616E73666F726D3A207363616C6528312E3135293B0A20207472616E73666F726D3A207363616C6528312E3135290A7D0A0A2E75632D';
wwv_flow_imp.g_varchar2_table(49) := '416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C6572743A616374697665207B0A20202D7765626B69742D7472616E73666F726D3A207363616C65282E3835293B0A20207472616E73666F726D3A207363616C65282E3835290A';
wwv_flow_imp.g_varchar2_table(50) := '7D0A0A2E75632D416C6572742D2D706167652E75632D416C657274207B0A2020626F726465722D7261646975733A202E3472656D0A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D7469746C65207B0A202070616464696E673A';
wwv_flow_imp.g_varchar2_table(51) := '2038707820300A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E207B0A20206D617267696E2D72696768743A203870780A7D0A0A2E75632D416C6572742D2D70616765';
wwv_flow_imp.g_varchar2_table(52) := '2E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E2D7469746C65207B0A2020666F6E742D73697A653A20312E3472656D3B0A20206C696E652D6865696768743A203272656D3B0A2020666F6E742D7765696768743A20';
wwv_flow_imp.g_varchar2_table(53) := '3730303B0A20206D617267696E3A20300A7D0A0A2E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E2D6C697374207B0A20206D61782D6865696768743A2031323870780A7D0A0A';
wwv_flow_imp.g_varchar2_table(54) := '2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6C697374207B0A20206D61782D6865696768743A20393670783B0A20206F766572666C6F773A206175746F0A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F';
wwv_flow_imp.g_varchar2_table(55) := '74696669636174696F6E2D6C696E6B3A686F766572207B0A2020746578742D6465636F726174696F6E3A20756E6465726C696E650A7D0A0A2E75632D416C6572742D2D70616765203A3A2D7765626B69742D7363726F6C6C626172207B0A202077696474';
wwv_flow_imp.g_varchar2_table(56) := '683A203870783B0A20206865696768743A203870780A7D0A0A2E75632D416C6572742D2D70616765203A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20';
wwv_flow_imp.g_varchar2_table(57) := '302C202E3235290A7D0A0A2E75632D416C6572742D2D706167653A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C202E3035290A7D0A0A2E75632D';
wwv_flow_imp.g_varchar2_table(58) := '416C6572742D2D70616765202E75632D416C6572742D7469746C65207B0A2020646973706C61793A20626C6F636B3B0A2020666F6E742D7765696768743A203730303B0A2020666F6E742D73697A653A20312E3872656D3B0A20206D617267696E2D626F';
wwv_flow_imp.g_varchar2_table(59) := '74746F6D3A20303B0A20206D617267696E2D72696768743A20313670780A7D0A0A2E75632D416C6572742D2D70616765202E75632D416C6572742D626F6479207B0A20206D617267696E2D72696768743A20313670780A7D0A0A2E752D52544C202E7563';
wwv_flow_imp.g_varchar2_table(60) := '2D416C6572742D2D70616765202E75632D416C6572742D626F64792C0A2E752D52544C202E75632D416C6572742D2D70616765202E75632D416C6572742D7469746C65207B0A20206D617267696E2D72696768743A20303B0A20206D617267696E2D6C65';
wwv_flow_imp.g_varchar2_table(61) := '66743A20313670780A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6C697374207B0A20206D617267696E3A20347078203020303B0A202070616464696E673A20303B0A20206C6973742D7374796C653A206E6F';
wwv_flow_imp.g_varchar2_table(62) := '6E650A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D207B0A202070616464696E672D6C6566743A20323070783B0A2020706F736974696F6E3A2072656C61746976653B0A2020666F6E742D73697A65';
wwv_flow_imp.g_varchar2_table(63) := '3A20313470783B0A20206C696E652D6865696768743A20323070783B0A20206D617267696E2D626F74746F6D3A203470780A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6C6173742D6368696C64';
wwv_flow_imp.g_varchar2_table(64) := '207B0A20206D617267696E2D626F74746F6D3A20300A7D0A0A2E752D52544C202E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D207B0A202070616464696E672D6C6566743A20303B0A202070616464696E672D';
wwv_flow_imp.g_varchar2_table(65) := '72696768743A20323070780A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6265666F7265207B0A2020636F6E74656E743A2027273B0A2020706F736974696F6E3A206162736F6C7574653B0A2020';
wwv_flow_imp.g_varchar2_table(66) := '6D617267696E3A203870783B0A2020746F703A20303B0A20206C6566743A20303B0A202077696474683A203470783B0A20206865696768743A203470783B0A2020626F726465722D7261646975733A20313030253B0A20206261636B67726F756E642D63';
wwv_flow_imp.g_varchar2_table(67) := '6F6C6F723A207267626128302C20302C20302C202E35290A7D0A0A2E75632D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D202E612D427574746F6E2D2D6E6F74696669636174696F6E207B0A202070616464696E673A';
wwv_flow_imp.g_varchar2_table(68) := '203270783B0A20206F7061636974793A202E37353B0A2020766572746963616C2D616C69676E3A20746F700A7D0A0A2E75632D416C6572742D2D70616765202E68746D6C64624F7261457272207B0A20206D617267696E2D746F703A202E3872656D3B0A';
wwv_flow_imp.g_varchar2_table(69) := '2020646973706C61793A20626C6F636B3B0A2020666F6E742D73697A653A20312E3172656D3B0A20206C696E652D6865696768743A20312E3672656D3B0A2020666F6E742D66616D696C793A20274D656E6C6F272C2027436F6E736F6C6173272C206D6F';
wwv_flow_imp.g_varchar2_table(70) := '6E6F73706163652C2073657269663B0A202077686974652D73706163653A207072652D6C696E650A7D0A0A2E75632D416C6572742D2D61636365737369626C6548656164696E67202E75632D416C6572742D7469746C65207B0A2020626F726465723A20';
wwv_flow_imp.g_varchar2_table(71) := '303B0A2020636C69703A20726563742830203020302030293B0A20206865696768743A203170783B0A20206D617267696E3A202D3170783B0A20206F766572666C6F773A2068696464656E3B0A202070616464696E673A20303B0A2020706F736974696F';
wwv_flow_imp.g_varchar2_table(72) := '6E3A206162736F6C7574653B0A202077696474683A203170780A7D0A0A2E75632D416C6572742D2D72656D6F766548656164696E67202E75632D416C6572742D7469746C65207B0A2020646973706C61793A206E6F6E650A7D0A0A406D6564696120286D';
wwv_flow_imp.g_varchar2_table(73) := '61782D77696474683A343830707829207B0A20202E75632D416C6572742D2D70616765207B0A202020206D696E2D77696474683A20303B0A202020206D61782D77696474683A206E6F6E650A20207D0A0A20202E75632D416C6572742D2D70616765202E';
wwv_flow_imp.g_varchar2_table(74) := '612D4E6F74696669636174696F6E2D6974656D207B0A20202020666F6E742D73697A653A20313270780A20207D0A7D0A0A406D6564696120286D61782D77696474683A373638707829207B0A20202E75632D416C6572742D2D686F72697A6F6E74616C20';
wwv_flow_imp.g_varchar2_table(75) := '2E75632D416C6572742D7469746C65207B0A20202020666F6E742D73697A653A20312E3872656D0A20207D0A7D0A0A2E75632D416C657274202E742D49636F6E2E69636F6E2D636C6F73653A6265666F7265207B0A2020666F6E742D66616D696C793A20';
wwv_flow_imp.g_varchar2_table(76) := '22617065782D352D69636F6E2D666F6E74223B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A2020766572746963616C2D616C69676E3A20746F703B0A20206C696E652D6865696768743A20313670783B0A2020666F6E742D73697A65';
wwv_flow_imp.g_varchar2_table(77) := '3A20313670783B0A2020636F6E74656E743A20225C65306132220A7D0A0A2E756374722D746F702D63656E746572207B0A2020746F703A20312E3672656D3B0A202072696768743A20303B0A202077696474683A20313030250A7D0A0A2E756374722D62';
wwv_flow_imp.g_varchar2_table(78) := '6F74746F6D2D63656E746572207B0A2020626F74746F6D3A20312E3672656D3B0A202072696768743A20303B0A202077696474683A20313030250A7D0A0A2E756374722D746F702D7269676874207B0A2020746F703A20312E3672656D3B0A2020726967';
wwv_flow_imp.g_varchar2_table(79) := '68743A20312E3672656D0A7D0A0A2E756374722D746F702D6C656674207B0A2020746F703A20312E3672656D3B0A20206C6566743A20312E3672656D0A7D0A0A2E756374722D626F74746F6D2D7269676874207B0A202072696768743A20312E3672656D';
wwv_flow_imp.g_varchar2_table(80) := '3B0A2020626F74746F6D3A20312E3672656D0A7D0A0A2E756374722D626F74746F6D2D6C656674207B0A2020626F74746F6D3A20312E3672656D3B0A20206C6566743A20312E3672656D0A7D0A0A2E756374722D636F6E7461696E6572207B0A2020706F';
wwv_flow_imp.g_varchar2_table(81) := '736974696F6E3A2066697865643B0A20207A2D696E6465783A203939393939393B0A2020706F696E7465722D6576656E74733A206E6F6E650A7D0A0A2E756374722D636F6E7461696E65723E646976207B0A2020706F696E7465722D6576656E74733A20';
wwv_flow_imp.g_varchar2_table(82) := '6175746F0A7D0A0A2E756374722D636F6E7461696E65722E756374722D626F74746F6D2D63656E7465723E6469762C0A2E756374722D636F6E7461696E65722E756374722D746F702D63656E7465723E646976207B0A20206D617267696E2D6C6566743A';
wwv_flow_imp.g_varchar2_table(83) := '206175746F3B0A20206D617267696E2D72696768743A206175746F0A7D0A0A2E756374722D70726F6772657373207B0A2020706F736974696F6E3A206162736F6C7574653B0A2020626F74746F6D3A20303B0A20206865696768743A203470783B0A2020';
wwv_flow_imp.g_varchar2_table(84) := '6261636B67726F756E642D636F6C6F723A20233030303B0A20206F7061636974793A202E340A7D0A0A68746D6C3A6E6F74282E752D52544C29202E756374722D70726F6772657373207B0A20206C6566743A20303B0A2020626F726465722D626F74746F';
wwv_flow_imp.g_varchar2_table(85) := '6D2D6C6566742D7261646975733A202E3472656D0A7D0A0A68746D6C2E752D52544C202E756374722D70726F6772657373207B0A202072696768743A20303B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A202E3472656D0A';
wwv_flow_imp.g_varchar2_table(86) := '7D0A0A406D6564696120286D61782D77696474683A343830707829207B0A20202E756374722D636F6E7461696E6572207B0A202020206C6566743A20312E3672656D3B0A2020202072696768743A20312E3672656D0A20207D0A7D0A0A2F2A2320736F75';
wwv_flow_imp.g_varchar2_table(87) := '7263654D617070696E6755524C3D756374722E6373732E6D61702A2F';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168073309809050312)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'css/uctr.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A20676C6F62616C7320617065782C756374722C24202A2F0A0A766172207563203D2077696E646F772E7563207C7C207B7D3B0A75632E7574696C73203D2075632E7574696C73207C7C207B7D3B0A0A2F2A2A0A202A20436F6E766572747320746865';
wwv_flow_imp.g_varchar2_table(2) := '206E61746976652041504558206E6F74696669636174696F6E7320746F205543206E6F74696669636174696F6E730A202A2F0A75632E7574696C732E636F6E766572744E61746976654E6F74696669636174696F6E73203D2066756E6374696F6E20286F';
wwv_flow_imp.g_varchar2_table(3) := '7074696F6E7329207B0A0A202020202F2F207265706C6163696E6720616E792073756363657373206E6F74696669636174696F6E20776869636820697320616C72656164792070617274206F662074686520646F6D206F6E2070616765206C6F61640A20';
wwv_flow_imp.g_varchar2_table(4) := '2020202F2F206572726F72206D6573736167657320617265206E657665722070617274206F66207468652070616765206F6E2070616765206C6F61640A2020202076617220737563636573734E6F746966456C656D24203D2024282723415045585F5355';
wwv_flow_imp.g_varchar2_table(5) := '43434553535F4D45535341474527293B0A0A2020202069662028737563636573734E6F746966456C656D242E697328273A76697369626C65272929207B0A2020202020202020756374725B2773756363657373275D282428272E742D416C6572742D7469';
wwv_flow_imp.g_varchar2_table(6) := '746C65272C20737563636573734E6F746966456C656D24292E7465787428292C206E756C6C2C206F7074696F6E73293B0A2020202020202020617065782E6D6573736167652E68696465506167655375636365737328293B0A202020207D0A0A20202020';
wwv_flow_imp.g_varchar2_table(7) := '2F2F207265706C6163696E6720616E792073756273657175656E74206E6F74696669636174696F6E730A20202020617065782E6D6573736167652E7365745468656D65486F6F6B73287B0A20202020202020206265666F726553686F773A2066756E6374';
wwv_flow_imp.g_varchar2_table(8) := '696F6E2028704D7367547970652C2070456C656D656E742429207B0A20202020202020202020202069662028704D736754797065203D3D3D20617065782E6D6573736167652E545950452E5355434345535329207B0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(9) := '2020766172206D657373616765456C656D24203D202428272E742D416C6572742D7469746C65272C2070456C656D656E7424293B0A20202020202020202020202020202020766172206D657373616765203D206D657373616765456C656D242E74657874';
wwv_flow_imp.g_varchar2_table(10) := '28293B0A20202020202020202020202020202020756374725B2773756363657373275D286D6573736167652C206E756C6C2C206F7074696F6E73293B0A202020202020202020202020202020202F2F20656E73757265732041504558206E6F7469666963';
wwv_flow_imp.g_varchar2_table(11) := '6174696F6E20646F65736E27742073686F770A2020202020202020202020202020202072657475726E2066616C73653B0A2020202020202020202020207D20656C73652069662028704D736754797065203D3D3D20617065782E6D6573736167652E5459';
wwv_flow_imp.g_varchar2_table(12) := '50452E4552524F5229207B0A20202020202020202020202020202020766172207469746C65203D202428272E612D4E6F74696669636174696F6E2D7469746C65272C2070456C656D656E7424292E7465787428293B0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(13) := '2020766172206D657373616765456C656D24203D202428272E612D4E6F74696669636174696F6E2D6C697374272C2070456C656D656E7424292E636C6F6E6528293B0A0A2020202020202020202020202020202076617220746F61737472456C656D2420';
wwv_flow_imp.g_varchar2_table(14) := '3D20756374725B6F7074696F6E732E7265706C6163654572726F7273576974685D286D657373616765456C656D242C207469746C652C206F7074696F6E73293B0A0A202020202020202020202020202020202F2F2076657279206F6674656E2041504558';
wwv_flow_imp.g_varchar2_table(15) := '206E6174697665206E6F74696669636174696F6E732068617665206275696C742D696E206C696E6B7320746F206E6176696761746520746F20746865206572726F6E656F7573206974656D0A202020202020202020202020202020202F2F206F72206120';
wwv_flow_imp.g_varchar2_table(16) := '627574746F6E20746F2073686F77206D6F726520696E666F206F6E20746865206572726F7220287768656E20636F6D696E672066726F6D2074686520736572766572290A202020202020202020202020202020202F2F20746865206576656E742068616E';
wwv_flow_imp.g_varchar2_table(17) := '646C657273206F6E20746865736520656C656D656E74732061726520717569746520747269636B7920616E64206E6F742070617274206F662074686520656C656D656E742074686174207765206A75737420636C6F6E65642E0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(18) := '2020202020202F2F2074686520666F6C6C6F77696E6720706173736573206261636B207375636820636C69636B206576656E747320696E746F207468656972206F726967696E616C20656C656D656E74730A202020202020202020202020202020202F2F';
wwv_flow_imp.g_varchar2_table(19) := '207768696368206172652061637475616C6C79207374696C6C206F6E2074686520706167652C206A7573742068696464656E0A2020202020202020202020202020202076617220616C6C4E6F74696669636174696F6E4C696E6B7324203D20746F617374';
wwv_flow_imp.g_varchar2_table(20) := '72456C656D242E66696E6428272E612D4E6F74696669636174696F6E2D6C696E6B27293B0A20202020202020202020202020202020616C6C4E6F74696669636174696F6E4C696E6B73242E6F6E2827636C69636B272C2066756E6374696F6E2028657665';
wwv_flow_imp.g_varchar2_table(21) := '6E7429207B0A202020202020202020202020202020202020202076617220696E646578203D20616C6C4E6F74696669636174696F6E4C696E6B73242E696E6465782824287468697329293B0A20202020202020202020202020202020202020202428272E';
wwv_flow_imp.g_varchar2_table(22) := '612D4E6F74696669636174696F6E2D6C696E6B272C2024282723415045585F4552524F525F4D4553534147452729295B696E6465785D2E747269676765722827636C69636B27293B0A202020202020202020202020202020207D293B0A0A202020202020';
wwv_flow_imp.g_varchar2_table(23) := '2020202020202020202076617220616C6C44657461696C427574746F6E7324203D20746F61737472456C656D242E66696E6428272E6A732D73686F7744657461696C7327293B0A20202020202020202020202020202020616C6C44657461696C42757474';
wwv_flow_imp.g_varchar2_table(24) := '6F6E73242E6F6E2827636C69636B272C2066756E6374696F6E20286576656E7429207B0A202020202020202020202020202020202020202076617220696E646578203D20616C6C44657461696C427574746F6E73242E696E646578282428746869732929';
wwv_flow_imp.g_varchar2_table(25) := '3B0A20202020202020202020202020202020202020202428272E6A732D73686F7744657461696C73272C2024282723415045585F4552524F525F4D4553534147452729295B696E6465785D2E747269676765722827636C69636B27293B0A202020202020';
wwv_flow_imp.g_varchar2_table(26) := '202020202020202020207D293B0A0A202020202020202020202020202020202F2F20656E73757265732041504558206E6F74696669636174696F6E20646F65736E27742073686F770A2020202020202020202020202020202072657475726E2066616C73';
wwv_flow_imp.g_varchar2_table(27) := '653B0A2020202020202020202020207D0A20202020202020207D2C0A20202020202020206265666F7265486964653A2066756E6374696F6E2028612C206229207B0A2020202020202020202020202F2F2062792064656661756C742C2041504558207769';
wwv_flow_imp.g_varchar2_table(28) := '6C6C20636C65617220616C6C2070726576696F7573206E6F74696669636174696F6E73207768656E2073686F77696E672061206E6577206F6E650A2020202020202020202020202F2F2077652077696C6C207265737065637420746861742C20616E6420';
wwv_flow_imp.g_varchar2_table(29) := '616C736F20636C65617220746865205543206E6F74696669636174696F6E730A202020202020202020202020756374722E636C656172416C6C28293B0A20202020202020207D0A202020207D293B0A7D0A0A2F2A2A0A202A20412064796E616D69632061';
wwv_flow_imp.g_varchar2_table(30) := '6374696F6E20746F20656173696C7920637265617465206E6F74696669636174696F6E206D6573736167657320696E20415045582E204974206973206261736564206F6E2074686520546F61737472206F70656E20736F75726365206A51756572792070';
wwv_flow_imp.g_varchar2_table(31) := '6C7567696E0A202A0A202A2040706172616D207B6F626A6563747D2020206461436F6E7465787420202020202044796E616D696320416374696F6E20636F6E746578742061732070617373656420696E20627920415045580A202A2040706172616D207B';
wwv_flow_imp.g_varchar2_table(32) := '6F626A6563747D202020636F6E666967202020202020202020436F6E66696775726174696F6E206F626A65637420686F6C64696E6720746865206E6F74696669636174696F6E2073657474696E67730A202A2040706172616D207B737472696E677D2020';
wwv_flow_imp.g_varchar2_table(33) := '20636F6E6669672E74797065202020205468652074797065206F6620616374696F6E20746F2062652074616B656E2E205B737563636573737C6572726F727C7761726E696E677C696E666F7C636C6561722D616C6C7C636F6E766572745D0A202A204070';
wwv_flow_imp.g_varchar2_table(34) := '6172616D207B66756E6374696F6E7D205B696E6974466E5D202020202020204A5320696E697469616C697A6174696F6E2066756E6374696F6E2077686963682077696C6C20616C6C6F7720796F7520746F206F766572726964652073657474696E677320';
wwv_flow_imp.g_varchar2_table(35) := '7269676874206265666F726520746865206E6F746966696361746F6E2069732073656E740A202A2F0A75632E7574696C732E6E6F74696669636174696F6E203D2066756E6374696F6E20286461436F6E746578742C20636F6E6669672C20696E6974466E';
wwv_flow_imp.g_varchar2_table(36) := '29207B0A20202020766172206D6573736167652C207469746C653B0A0A202020202F2F20706172616D6574657220636865636B730A202020206461436F6E74657874203D206461436F6E74657874207C7C20746869733B0A20202020636F6E666967203D';
wwv_flow_imp.g_varchar2_table(37) := '20636F6E666967207C7C207B7D3B0A20202020636F6E6669672E74797065203D20636F6E6669672E74797065207C7C2027696E666F273B0A0A20202020617065782E64656275672E696E666F28275543202D204E6F74696669636174696F6E73272C2063';
wwv_flow_imp.g_varchar2_table(38) := '6F6E666967293B0A0A202020202F2F206561726C79206578697420696620776520617265206A75737420636C656172696E6720746865206E6F74696669636174696F6E730A2020202069662028636F6E6669672E74797065203D3D3D2027636C6561722D';
wwv_flow_imp.g_varchar2_table(39) := '616C6C2729207B0A2020202020202020617065782E6D6573736167652E636C6561724572726F727328293B0A202020202020202072657475726E20756374722E636C656172416C6C28293B0A202020207D0A0A202020202F2F206561726C792065786974';
wwv_flow_imp.g_varchar2_table(40) := '20696620776520617265206A75737420636F6E76657274696E67207468652041504558206E6F74696669636174696F6E730A2020202069662028636F6E6669672E74797065203D3D3D2027636F6E766572742729207B0A202020202020202075632E7574';
wwv_flow_imp.g_varchar2_table(41) := '696C732E636F6E766572744E61746976654E6F74696669636174696F6E7328636F6E6669672E6F7074696F6E73293B0A202020202020202072657475726E3B0A202020207D0A0A202020202F2F20646566696E65206F7572206D65737361676520646574';
wwv_flow_imp.g_varchar2_table(42) := '61696C73207768696368206D61792064796E616D6963616C6C7920636F6D652066726F6D2061204A6176617363726970742063616C6C0A2020202069662028636F6E6669672E6D65737361676520696E7374616E63656F662046756E6374696F6E29207B';
wwv_flow_imp.g_varchar2_table(43) := '0A20202020202020206D657373616765203D20636F6E6669672E6D6573736167652E63616C6C286461436F6E746578742C20636F6E666967293B0A202020207D20656C7365207B0A20202020202020206D657373616765203D20636F6E6669672E6D6573';
wwv_flow_imp.g_varchar2_table(44) := '736167653B0A202020207D0A0A2020202069662028636F6E6669672E7469746C6520696E7374616E63656F662046756E6374696F6E29207B0A20202020202020207469746C65203D20636F6E6669672E7469746C652E63616C6C286461436F6E74657874';
wwv_flow_imp.g_varchar2_table(45) := '2C20636F6E666967293B0A202020207D20656C7365207B0A20202020202020207469746C65203D20636F6E6669672E7469746C653B0A202020207D0A0A202020202F2F2077652077696C6C206E6F7420706572666F726D2061206E6F7469666963617469';
wwv_flow_imp.g_varchar2_table(46) := '6F6E206966206F7572206D65737361676520626F6479206973206E756C6C2F656D70747920737472696E670A2020202069662028216D65737361676520262620217469746C65292072657475726E3B0A0A202020202F2F20205265706C6163696E672073';
wwv_flow_imp.g_varchar2_table(47) := '7562737469747574696F6E20737472696E67730A2020202069662028636F6E6669672E7375627374697475746556616C75657329207B0A20202020202020202F2F2020576520646F6E27742065736361706520746865206D657373616765206279206465';
wwv_flow_imp.g_varchar2_table(48) := '6661756C742E205765206C65742074686520646576656C6F70657220646563696465207768657468657220746F206573636170650A20202020202020202F2F20207468652077686F6C65206D6573736167652C206F72206A75737420696E76696475616C';
wwv_flow_imp.g_varchar2_table(49) := '2070616765206974656D73207669612026504147455F4954454D2148544D4C2E0A2020202020202020696620287469746C6529207B0A2020202020202020202020207469746C65203D20617065782E7574696C2E6170706C7954656D706C617465287469';
wwv_flow_imp.g_varchar2_table(50) := '746C652C207B0A2020202020202020202020202020202064656661756C7445736361706546696C7465723A206E756C6C0A2020202020202020202020207D293B0A20202020202020207D0A2020202020202020696620286D65737361676529207B0A2020';
wwv_flow_imp.g_varchar2_table(51) := '202020202020202020206D657373616765203D20617065782E7574696C2E6170706C7954656D706C617465286D6573736167652C207B0A2020202020202020202020202020202064656661756C7445736361706546696C7465723A206E756C6C0A202020';
wwv_flow_imp.g_varchar2_table(52) := '2020202020202020207D293B0A20202020202020207D0A20202020202020202F2F2077652077696C6C206E6F7420706572666F726D2061206E6F74696669636174696F6E206966206F7572206D65737361676520626F6479206973206E756C6C2F656D70';
wwv_flow_imp.g_varchar2_table(53) := '747920737472696E672061667465720A20202020202020202F2F20737562737469747574696F6E7320617265206D61646520616E6420746865206D65737361676520697320656D7074790A202020202020202069662028216D6573736167652026262021';
wwv_flow_imp.g_varchar2_table(54) := '7469746C65292072657475726E3B0A202020207D0A0A202020202F2F20446566696E65206F7572206E6F74696669636174696F6E2073657474696E67730A2020202076617220756374724F7074696F6E73203D20242E657874656E64287B7D2C20636F6E';
wwv_flow_imp.g_varchar2_table(55) := '6669672E6F7074696F6E73293B0A0A202020202F2F20416C6C6F772074686520646576656C6F70657220746F20706572666F726D20616E79206C617374202863656E7472616C697A656429206368616E676573207573696E67204A617661736372697074';
wwv_flow_imp.g_varchar2_table(56) := '20496E697469616C697A6174696F6E20436F64652073657474696E670A2020202069662028696E6974466E20696E7374616E63656F662046756E6374696F6E29207B0A2020202020202020696E6974466E2E63616C6C286461436F6E746578742C207563';
wwv_flow_imp.g_varchar2_table(57) := '74724F7074696F6E73293B0A202020207D0A0A202020202F2F20617373636F6169746520616E7920696E6C696E652070616765206974656D206572726F72730A2020202069662028636F6E6669672E696E6C696E654974656D4572726F72732026262063';
wwv_flow_imp.g_varchar2_table(58) := '6F6E6669672E696E6C696E65506167654974656D7329207B0A2020202020202020636F6E6669672E696E6C696E65506167654974656D732E73706C697428272C27292E666F72456163682866756E6374696F6E2028706167654974656D29207B0A202020';
wwv_flow_imp.g_varchar2_table(59) := '2020202020202020202F2F2053686F77206F75722041504558206572726F72206D6573736167650A202020202020202020202020617065782E6D6573736167652E73686F774572726F7273287B0A20202020202020202020202020202020747970653A20';
wwv_flow_imp.g_varchar2_table(60) := '276572726F72272C0A202020202020202020202020202020206C6F636174696F6E3A2027696E6C696E65272C0A20202020202020202020202020202020706167654974656D3A20706167654974656D2C0A202020202020202020202020202020206D6573';
wwv_flow_imp.g_varchar2_table(61) := '736167653A206D6573736167652C0A202020202020202020202020202020202F2F616E79206573636170696E6720697320617373756D656420746F2068617665206265656E20646F6E65206279206E6F770A20202020202020202020202020202020756E';
wwv_flow_imp.g_varchar2_table(62) := '736166653A2066616C73650A2020202020202020202020207D293B0A20202020202020207D293B0A202020207D0A0A202020202F2F20506572666F726D207468652061637475616C206E6F74696669636174696F6E0A20202020756374725B636F6E6669';
wwv_flow_imp.g_varchar2_table(63) := '672E747970655D286D6573736167652C207469746C652C20756374724F7074696F6E73293B0A7D3B0A0A0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168074191123044653)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'js/script.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '7661722075633D77696E646F772E75637C7C7B7D3B75632E7574696C733D75632E7574696C737C7C7B7D2C75632E7574696C732E636F6E766572744E61746976654E6F74696669636174696F6E733D66756E6374696F6E2865297B76617220743D242822';
wwv_flow_imp.g_varchar2_table(2) := '23415045585F535543434553535F4D45535341474522293B742E697328223A76697369626C652229262628756374722E73756363657373282428222E742D416C6572742D7469746C65222C74292E7465787428292C6E756C6C2C65292C617065782E6D65';
wwv_flow_imp.g_varchar2_table(3) := '73736167652E6869646550616765537563636573732829292C617065782E6D6573736167652E7365745468656D65486F6F6B73287B6265666F726553686F773A66756E6374696F6E28742C69297B696628743D3D3D617065782E6D6573736167652E5459';
wwv_flow_imp.g_varchar2_table(4) := '50452E53554343455353297B76617220613D28733D2428222E742D416C6572742D7469746C65222C6929292E7465787428293B72657475726E20756374722E7375636365737328612C6E756C6C2C65292C21317D696628743D3D3D617065782E6D657373';
wwv_flow_imp.g_varchar2_table(5) := '6167652E545950452E4552524F52297B766172206E3D2428222E612D4E6F74696669636174696F6E2D7469746C65222C69292E7465787428292C733D2428222E612D4E6F74696669636174696F6E2D6C697374222C69292E636C6F6E6528292C6C3D7563';
wwv_flow_imp.g_varchar2_table(6) := '74725B652E7265706C6163654572726F7273576974685D28732C6E2C65292C633D6C2E66696E6428222E612D4E6F74696669636174696F6E2D6C696E6B22293B632E6F6E2822636C69636B222C66756E6374696F6E2865297B76617220743D632E696E64';
wwv_flow_imp.g_varchar2_table(7) := '65782824287468697329293B2428222E612D4E6F74696669636174696F6E2D6C696E6B222C24282223415045585F4552524F525F4D4553534147452229295B745D2E747269676765722822636C69636B22297D293B766172206F3D6C2E66696E6428222E';
wwv_flow_imp.g_varchar2_table(8) := '6A732D73686F7744657461696C7322293B72657475726E206F2E6F6E2822636C69636B222C66756E6374696F6E2865297B76617220743D6F2E696E6465782824287468697329293B2428222E6A732D73686F7744657461696C73222C2428222341504558';
wwv_flow_imp.g_varchar2_table(9) := '5F4552524F525F4D4553534147452229295B745D2E747269676765722822636C69636B22297D292C21317D7D2C6265666F7265486964653A66756E6374696F6E28652C74297B756374722E636C656172416C6C28297D7D297D2C75632E7574696C732E6E';
wwv_flow_imp.g_varchar2_table(10) := '6F74696669636174696F6E3D66756E6374696F6E28652C742C69297B76617220612C6E3B696628653D657C7C746869732C28743D747C7C7B7D292E747970653D742E747970657C7C22696E666F222C617065782E64656275672E696E666F28225543202D';
wwv_flow_imp.g_varchar2_table(11) := '204E6F74696669636174696F6E73222C74292C22636C6561722D616C6C223D3D3D742E747970652972657475726E20617065782E6D6573736167652E636C6561724572726F727328292C756374722E636C656172416C6C28293B69662822636F6E766572';
wwv_flow_imp.g_varchar2_table(12) := '7422213D3D742E74797065297B696628613D742E6D65737361676520696E7374616E63656F662046756E6374696F6E3F742E6D6573736167652E63616C6C28652C74293A742E6D6573736167652C6E3D742E7469746C6520696E7374616E63656F662046';
wwv_flow_imp.g_varchar2_table(13) := '756E6374696F6E3F742E7469746C652E63616C6C28652C74293A742E7469746C652C28617C7C6E2926262821742E7375627374697475746556616C7565737C7C286E2626286E3D617065782E7574696C2E6170706C7954656D706C617465286E2C7B6465';
wwv_flow_imp.g_varchar2_table(14) := '6661756C7445736361706546696C7465723A6E756C6C7D29292C61262628613D617065782E7574696C2E6170706C7954656D706C61746528612C7B64656661756C7445736361706546696C7465723A6E756C6C7D29292C617C7C6E2929297B7661722073';
wwv_flow_imp.g_varchar2_table(15) := '3D242E657874656E64287B7D2C742E6F7074696F6E73293B6920696E7374616E63656F662046756E6374696F6E2626692E63616C6C28652C73292C742E696E6C696E654974656D4572726F72732626742E696E6C696E65506167654974656D732626742E';
wwv_flow_imp.g_varchar2_table(16) := '696E6C696E65506167654974656D732E73706C697428222C22292E666F72456163682866756E6374696F6E2865297B617065782E6D6573736167652E73686F774572726F7273287B747970653A226572726F72222C6C6F636174696F6E3A22696E6C696E';
wwv_flow_imp.g_varchar2_table(17) := '65222C706167654974656D3A652C6D6573736167653A612C756E736166653A21317D297D292C756374725B742E747970655D28612C6E2C73297D7D656C73652075632E7574696C732E636F6E766572744E61746976654E6F74696669636174696F6E7328';
wwv_flow_imp.g_varchar2_table(18) := '742E6F7074696F6E73297D3B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168074494955044649)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'js/script.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A0A202A2052544C20737570706F72742073686F756C6420626520646F6E6520696E20637373206F6E6C792E20636C61737320752D52544C20657869737473206F6E2074686520626F6479207768656E206170657820697320696E2052544C206D6F64';
wwv_flow_imp.g_varchar2_table(2) := '652E0A202A204E6F7465207468617420746869732073686F756C64206F6E6C792061666665637420656C656D656E74732077697468696E20746865206E6F74696669636174696F6E2C206E6F742074686520706F736974696F6E696E67206F6620746865';
wwv_flow_imp.g_varchar2_table(3) := '2061637475616C206E6F74696669636174696F6E2E0A202A20546869732069732074616B656E2063617265206F66206279206120706C75672D696E2073657474696E67732E0A202A0A202A2F0A0A2F2A0A202A20466F7374720A202A20436F7079726967';
wwv_flow_imp.g_varchar2_table(4) := '687420323032300A202A20417574686F72733A2053746566616E20446F6272650A202A0A202A204372656469747320666F722074686520626173652076657273696F6E20676F20746F3A2068747470733A2F2F6769746875622E636F6D2F436F64655365';
wwv_flow_imp.g_varchar2_table(5) := '76656E2F746F617374720A202A204F726967696E616C20417574686F72733A204A6F686E20506170612C2048616E7320466AC3A46C6C656D61726B2C20616E642054696D2046657272656C6C2E0A202A204152494120537570706F72743A204772657461';
wwv_flow_imp.g_varchar2_table(6) := '204B7261667369670A202A0A202A20416C6C205269676874732052657365727665642E0A202A205573652C20726570726F64756374696F6E2C20646973747269627574696F6E2C20616E64206D6F64696669636174696F6E206F66207468697320636F64';
wwv_flow_imp.g_varchar2_table(7) := '65206973207375626A65637420746F20746865207465726D7320616E640A202A20636F6E646974696F6E73206F6620746865204D4954206C6963656E73652C20617661696C61626C6520617420687474703A2F2F7777772E6F70656E736F757263652E6F';
wwv_flow_imp.g_varchar2_table(8) := '72672F6C6963656E7365732F6D69742D6C6963656E73652E7068700A202A0A202A2050726F6A6563743A2068747470733A2F2F6769746875622E636F6D2F666F65782D6F70656E2D736F757263652F756374720A202A2F0A77696E646F772E7563747220';
wwv_flow_imp.g_varchar2_table(9) := '3D202866756E6374696F6E202829207B0A0A2020202076617220434F4E5441494E45525F434C415353203D2027756374722D636F6E7461696E6572273B0A0A2020202076617220746F61737454797065203D207B0A202020202020202073756363657373';
wwv_flow_imp.g_varchar2_table(10) := '3A202773756363657373272C0A2020202020202020696E666F3A2027696E666F272C0A20202020202020207761726E696E673A20277761726E696E67272C0A20202020202020206572726F723A20276572726F72270A202020207D3B0A0A202020207661';
wwv_flow_imp.g_varchar2_table(11) := '722069636F6E436C6173736573203D207B0A2020202020202020737563636573733A202766612D636865636B2D636972636C65272C0A2020202020202020696E666F3A202766612D696E666F2D636972636C65272C0A20202020202020207761726E696E';
wwv_flow_imp.g_varchar2_table(12) := '673A202766612D6578636C616D6174696F6E2D747269616E676C65272C0A20202020202020206572726F723A202766612D74696D65732D636972636C65270A202020207D3B0A0A2020202076617220636F6E7461696E657273203D207B7D3B0A20202020';
wwv_flow_imp.g_varchar2_table(13) := '7661722070726576696F7573546F617374203D207B7D3B0A0A2020202066756E6374696F6E206E6F746966795479706528747970652C206D6573736167652C207469746C652C206F7074696F6E7329207B0A0A20202020202020207661722066696E616C';
wwv_flow_imp.g_varchar2_table(14) := '4F7074696F6E73203D20242E657874656E64287B7D2C207B0A2020202020202020202020206469736D6973733A205B276F6E436C69636B272C20276F6E427574746F6E275D2C2020202F2F207768656E20746F206469736D69737320746865206E6F7469';
wwv_flow_imp.g_varchar2_table(15) := '6669636174696F6E0A2020202020202020202020206469736D69737341667465723A206E756C6C2C20202020202020202020202020202020202F2F2061206E756D62657220696E206D696C6C697365636F6E647320616674657220776869636820746865';
wwv_flow_imp.g_varchar2_table(16) := '206E6F74696669636174696F6E2073686F756C64206265206175746F6D61746963616C6C792072656D6F7665642E20686F766572696E67206F7220636C69636B696E6720746865206E6F74696669636174696F6E2073746F70732074686973206576656E';
wwv_flow_imp.g_varchar2_table(17) := '740A2020202020202020202020206E65776573744F6E546F703A20747275652C2020202020202020202020202020202020202F2F2061646420746F2074686520746F70206F6620746865206C6973740A20202020202020202020202070726576656E7444';
wwv_flow_imp.g_varchar2_table(18) := '75706C6963617465733A2066616C73652C20202020202020202020202F2F20646F206E6F742073686F7720746865206E6F74696669636174696F6E20696620697420686173207468652073616D65207469746C6520616E64206D65737361676520617320';
wwv_flow_imp.g_varchar2_table(19) := '746865206C617374206F6E6520616E6420696620746865206C617374206F6E65206973207374696C6C2076697369626C650A20202020202020202020202065736361706548746D6C3A20747275652C202020202020202020202020202020202020202F2F';
wwv_flow_imp.g_varchar2_table(20) := '207768657468657220746F2065736361706520746865207469746C6520616E64206D6573736167650A202020202020202020202020706F736974696F6E3A2027746F702D7269676874272C20202020202020202020202020202F2F206F6E65206F662036';
wwv_flow_imp.g_varchar2_table(21) := '3A205B746F707C626F74746F6D5D2D5B72696768747C63656E7465727C6C6566745D0A20202020202020202020202069636F6E436C6173733A206E756C6C2C20202020202020202020202020202020202020202F2F207768656E206C65667420746F206E';
wwv_flow_imp.g_varchar2_table(22) := '756C6C2C2069742077696C6C2062652064656661756C74656420746F2074686520636F72726573706F6E64696E672069636F6E2066726F6D2069636F6E436C61737365730A202020202020202020202020636C656172416C6C3A2066616C736520202020';
wwv_flow_imp.g_varchar2_table(23) := '20202020202020202020202020202020202F2F207472756520746F20636C65617220616C6C206E6F74696669636174696F6E732066697273740A20202020202020207D2C206F7074696F6E73293B0A0A20202020202020202F2F20696620746865206D65';
wwv_flow_imp.g_varchar2_table(24) := '73736167652061747472696275746520697320616E206F626A6563740A202020202020202069662028747970656F66206D657373616765203D3D3D20276F626A6563742729207B0A2020202020202020202020206D6573736167652E74797065203D2074';
wwv_flow_imp.g_varchar2_table(25) := '7970653B0A20202020202020202020202072657475726E206E6F7469667928242E657874656E642866696E616C4F7074696F6E732C207B0A20202020202020202020202020202020747970653A20747970650A2020202020202020202020207D2C206D65';
wwv_flow_imp.g_varchar2_table(26) := '737361676529293B0A20202020202020207D20656C736520696620286D657373616765207C7C207469746C6529207B0A20202020202020202020202069662028217469746C65202626206D65737361676529207B0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(27) := '207469746C65203D206D6573736167653B0A202020202020202020202020202020206D657373616765203D20756E646566696E65643B0A2020202020202020202020207D0A20202020202020202020202072657475726E206E6F7469667928242E657874';
wwv_flow_imp.g_varchar2_table(28) := '656E64287B7D2C207B0A20202020202020202020202020202020747970653A20747970652C0A202020202020202020202020202020206D6573736167653A206D6573736167652C0A202020202020202020202020202020207469746C653A207469746C65';
wwv_flow_imp.g_varchar2_table(29) := '0A2020202020202020202020207D2C2066696E616C4F7074696F6E7329293B0A20202020202020207D20656C7365207B0A202020202020202020202020617065782E64656275672E696E666F2827756374723A206E6F207469746C65206F72206D657373';
wwv_flow_imp.g_varchar2_table(30) := '616765207761732070726F76696465642E206E6F742073686F77696E67206E6F74696669636174696F6E2E27293B0A20202020202020207D0A202020207D0A0A2020202066756E6374696F6E2073756363657373286D6573736167652C207469746C652C';
wwv_flow_imp.g_varchar2_table(31) := '206F7074696F6E7329207B0A202020202020202072657475726E206E6F746966795479706528746F617374547970652E737563636573732C206D6573736167652C207469746C652C206F7074696F6E73293B0A202020207D0A0A2020202066756E637469';
wwv_flow_imp.g_varchar2_table(32) := '6F6E207761726E696E67286D6573736167652C207469746C652C206F7074696F6E7329207B0A202020202020202072657475726E206E6F746966795479706528746F617374547970652E7761726E696E672C206D6573736167652C207469746C652C206F';
wwv_flow_imp.g_varchar2_table(33) := '7074696F6E73293B0A202020207D0A0A2020202066756E6374696F6E20696E666F286D6573736167652C207469746C652C206F7074696F6E7329207B0A202020202020202072657475726E206E6F746966795479706528746F617374547970652E696E66';
wwv_flow_imp.g_varchar2_table(34) := '6F2C206D6573736167652C207469746C652C206F7074696F6E73293B0A202020207D0A0A2020202066756E6374696F6E206572726F72286D6573736167652C207469746C652C206F7074696F6E7329207B0A202020202020202072657475726E206E6F74';
wwv_flow_imp.g_varchar2_table(35) := '6966795479706528746F617374547970652E6572726F722C206D6573736167652C207469746C652C206F7074696F6E73293B0A202020207D0A0A2020202066756E6374696F6E20636C656172416C6C2829207B0A20202020202020202428272E27202B20';
wwv_flow_imp.g_varchar2_table(36) := '434F4E5441494E45525F434C415353292E6368696C6472656E28292E72656D6F766528293B0A202020207D0A0A202020202F2F20696E7465726E616C2066756E6374696F6E730A0A2020202066756E6374696F6E20676574436F6E7461696E657228706F';
wwv_flow_imp.g_varchar2_table(37) := '736974696F6E29207B0A0A202020202020202066756E6374696F6E20637265617465436F6E7461696E657228706F736974696F6E29207B0A2020202020202020202020207661722024636F6E7461696E6572203D202428273C6469762F3E27292E616464';
wwv_flow_imp.g_varchar2_table(38) := '436C6173732827756374722D27202B20706F736974696F6E292E616464436C61737328434F4E5441494E45525F434C415353293B0A202020202020202020202020242827626F647927292E617070656E642824636F6E7461696E6572293B0A2020202020';
wwv_flow_imp.g_varchar2_table(39) := '20202020202020636F6E7461696E6572735B706F736974696F6E5D203D2024636F6E7461696E65723B0A20202020202020202020202072657475726E2024636F6E7461696E65723B0A20202020202020207D0A0A202020202020202072657475726E2063';
wwv_flow_imp.g_varchar2_table(40) := '6F6E7461696E6572735B706F736974696F6E5D207C7C20637265617465436F6E7461696E657228706F736974696F6E293B0A202020207D0A0A2020202066756E6374696F6E206E6F7469667928636F6E66696729207B0A0A202020202020202076617220';
wwv_flow_imp.g_varchar2_table(41) := '24636F6E7461696E6572203D20676574436F6E7461696E657228636F6E6669672E706F736974696F6E293B0A0A2020202020202020766172206469736D6973734F6E436C69636B203D20636F6E6669672E6469736D6973732E696E636C7564657328276F';
wwv_flow_imp.g_varchar2_table(42) := '6E436C69636B27293B0A2020202020202020766172206469736D6973734F6E427574746F6E203D20636F6E6669672E6469736D6973732E696E636C7564657328276F6E427574746F6E27293B0A0A20202020202020202F2A0A20202020202020203C6469';
wwv_flow_imp.g_varchar2_table(43) := '7620636C6173733D2275632D416C6572742075632D416C6572742D2D686F72697A6F6E74616C2075632D416C6572742D2D706167652075632D416C6572742D2D737563636573732220726F6C653D22616C657274223E0A2020202020202020202020203C';
wwv_flow_imp.g_varchar2_table(44) := '64697620636C6173733D2275632D416C6572742D77726170223E0A202020202020202020202020202020203C64697620636C6173733D2275632D416C6572742D69636F6E223E0A20202020202020202020202020202020202020203C7370616E20636C61';
wwv_flow_imp.g_varchar2_table(45) := '73733D22742D49636F6E2066612066612D636865636B2D636972636C65223E3C2F7370616E3E0A202020202020202020202020202020203C2F6469763E0A202020202020202020202020202020203C64697620636C6173733D2275632D416C6572742D63';
wwv_flow_imp.g_varchar2_table(46) := '6F6E74656E74223E0A20202020202020202020202020202020202020203C683220636C6173733D2275632D416C6572742D7469746C65223E3C2F68323E0A20202020202020202020202020202020202020203C64697620636C6173733D2275632D416C65';
wwv_flow_imp.g_varchar2_table(47) := '72742D626F6479223E3C2F6469763E0A202020202020202020202020202020203C2F6469763E0A202020202020202020202020202020203C64697620636C6173733D2275632D416C6572742D627574746F6E73223E0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(48) := '2020202020203C627574746F6E20636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F554920742D427574746F6E2D2D69636F6E20742D427574746F6E2D2D636C6F7365416C6572742220747970653D22627574746F6E22207469746C';
wwv_flow_imp.g_varchar2_table(49) := '653D22436C6F7365204E6F74696669636174696F6E223E3C7370616E20636C6173733D22742D49636F6E2069636F6E2D636C6F7365223E3C2F7370616E3E3C2F627574746F6E3E0A202020202020202020202020202020203C2F6469763E0A2020202020';
wwv_flow_imp.g_varchar2_table(50) := '202020202020203C2F6469763E0A20202020202020203C2F6469763E0A20202020202020202A2F0A0A20202020202020207661722074797065436C617373203D207B0A2020202020202020202020202273756363657373223A202275632D416C6572742D';
wwv_flow_imp.g_varchar2_table(51) := '2D73756363657373222C0A202020202020202020202020226572726F72223A202275632D416C6572742D2D64616E676572222C0A202020202020202020202020227761726E696E67223A202275632D416C6572742D2D7761726E696E67222C0A20202020';
wwv_flow_imp.g_varchar2_table(52) := '202020202020202022696E666F223A202275632D416C6572742D2D696E666F220A20202020202020207D3B0A0A20202020202020207661722024746F617374456C656D656E74203D202428273C64697620636C6173733D2275632D416C6572742075632D';
wwv_flow_imp.g_varchar2_table(53) := '416C6572742D2D686F72697A6F6E74616C2075632D416C6572742D2D706167652027202B2074797065436C6173735B636F6E6669672E747970655D202B20272220726F6C653D22616C657274223E3C2F6469763E27293B0A202020202020202076617220';
wwv_flow_imp.g_varchar2_table(54) := '24746F61737457726170203D202428273C64697620636C6173733D2275632D416C6572742D77726170223E27293B0A2020202020202020766172202469636F6E57726170203D202428273C64697620636C6173733D2275632D416C6572742D69636F6E22';
wwv_flow_imp.g_varchar2_table(55) := '3E3C2F6469763E27293B0A2020202020202020766172202469636F6E456C656D203D202428273C7370616E20636C6173733D22742D49636F6E2066612027202B2028636F6E6669672E69636F6E436C617373207C7C2069636F6E436C61737365735B636F';
wwv_flow_imp.g_varchar2_table(56) := '6E6669672E747970655D29202B2027223E3C2F7370616E3E27293B0A20202020202020207661722024636F6E74656E74456C656D203D202428273C64697620636C6173733D2275632D416C6572742D636F6E74656E74223E3C2F6469763E27293B0A2020';
wwv_flow_imp.g_varchar2_table(57) := '20202020202076617220247469746C65456C656D656E74203D202428273C683220636C6173733D2275632D416C6572742D7469746C65223E3C2F68323E27293B0A202020202020202076617220246D657373616765456C656D656E74203D202428273C64';
wwv_flow_imp.g_varchar2_table(58) := '697620636C6173733D2275632D416C6572742D626F6479223E3C2F6469763E27293B0A20202020202020207661722024627574746F6E57726170706572203D202428273C64697620636C6173733D2275632D416C6572742D627574746F6E73223E3C2F64';
wwv_flow_imp.g_varchar2_table(59) := '69763E27293B0A20202020202020207661722024636C6F7365456C656D656E743B0A0A2020202020202020696620286469736D6973734F6E427574746F6E29207B0A20202020202020202020202024636C6F7365456C656D656E74203D202428273C6275';
wwv_flow_imp.g_varchar2_table(60) := '74746F6E20636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F554920742D427574746F6E2D2D69636F6E20742D427574746F6E2D2D636C6F7365416C6572742220747970653D22627574746F6E22207469746C653D22436C6F736520';
wwv_flow_imp.g_varchar2_table(61) := '4E6F74696669636174696F6E223E3C7370616E20636C6173733D22742D49636F6E2069636F6E2D636C6F7365223E3C2F7370616E3E3C2F627574746F6E3E27293B0A20202020202020207D0A0A202020202020202024746F617374456C656D656E742E61';
wwv_flow_imp.g_varchar2_table(62) := '7070656E642824746F61737457726170293B0A202020202020202024746F617374577261702E617070656E64282469636F6E57726170293B0A20202020202020202469636F6E577261702E617070656E64282469636F6E456C656D293B0A202020202020';
wwv_flow_imp.g_varchar2_table(63) := '202024746F617374577261702E617070656E642824636F6E74656E74456C656D293B0A202020202020202024636F6E74656E74456C656D2E617070656E6428247469746C65456C656D656E74293B0A202020202020202024636F6E74656E74456C656D2E';
wwv_flow_imp.g_varchar2_table(64) := '617070656E6428246D657373616765456C656D656E74293B0A202020202020202024746F617374577261702E617070656E642824627574746F6E57726170706572293B0A0A2020202020202020696620286469736D6973734F6E427574746F6E29207B0A';
wwv_flow_imp.g_varchar2_table(65) := '20202020202020202020202024627574746F6E577261707065722E617070656E642824636C6F7365456C656D656E74293B0A20202020202020207D0A0A20202020202020202F2F2073657474696E6720746865207469746C650A20202020202020207661';
wwv_flow_imp.g_varchar2_table(66) := '72207469746C65203D20636F6E6669672E7469746C653B0A2020202020202020696620287469746C6529207B0A20202020202020202020202069662028636F6E6669672E65736361706548746D6C29207B0A202020202020202020202020202020207469';
wwv_flow_imp.g_varchar2_table(67) := '746C65203D20617065782E7574696C2E65736361706548544D4C287469746C65293B0A2020202020202020202020207D0A202020202020202020202020247469746C65456C656D656E742E617070656E64287469746C65293B0A20202020202020207D0A';
wwv_flow_imp.g_varchar2_table(68) := '0A20202020202020202F2F73657474696E6720746865206D6573736167650A2020202020202020766172206D657373616765203D20636F6E6669672E6D6573736167653B0A2020202020202020696620286D65737361676529207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(69) := '2020202069662028636F6E6669672E65736361706548746D6C20262620747970656F66206D657373616765203D3D2027737472696E672729207B0A202020202020202020202020202020206D657373616765203D20617065782E7574696C2E6573636170';
wwv_flow_imp.g_varchar2_table(70) := '6548544D4C286D657373616765293B0A2020202020202020202020207D0A202020202020202020202020246D657373616765456C656D656E742E617070656E64286D657373616765293B0A20202020202020207D0A0A20202020202020202F2F2061766F';
wwv_flow_imp.g_varchar2_table(71) := '6964696E67206475706C6963617465732C20627574206F6E6C7920636F6E7365637574697665206F6E65730A202020202020202069662028636F6E6669672E70726576656E744475706C6963617465732026262070726576696F7573546F617374202626';
wwv_flow_imp.g_varchar2_table(72) := '2070726576696F7573546F6173742E24656C656D2026262070726576696F7573546F6173742E24656C656D2E697328273A76697369626C65272929207B0A2020202020202020202020206966202870726576696F7573546F6173742E7469746C65203D3D';
wwv_flow_imp.g_varchar2_table(73) := '207469746C652026262070726576696F7573546F6173742E6D657373616765203D3D206D65737361676529207B0A2020202020202020202020202020202072657475726E3B0A2020202020202020202020207D0A20202020202020207D0A0A2020202020';
wwv_flow_imp.g_varchar2_table(74) := '20202070726576696F7573546F617374203D207B0A20202020202020202020202024656C656D3A2024746F617374456C656D656E742C0A2020202020202020202020207469746C653A207469746C652C0A2020202020202020202020206D657373616765';
wwv_flow_imp.g_varchar2_table(75) := '3A206D6573736167650A20202020202020207D3B0A0A20202020202020202F2F206F7074696F6E616C6C7920636C65617220616C6C206D657373616765732066697273740A202020202020202069662028636F6E6669672E636C656172416C6C29207B0A';
wwv_flow_imp.g_varchar2_table(76) := '202020202020202020202020636C656172416C6C28293B0A20202020202020207D0A20202020202020202F2F206164647320746865206E6F74696669636174696F6E20746F2074686520636F6E7461696E65720A202020202020202069662028636F6E66';
wwv_flow_imp.g_varchar2_table(77) := '69672E6E65776573744F6E546F7029207B0A20202020202020202020202024636F6E7461696E65722E70726570656E642824746F617374456C656D656E74293B0A20202020202020207D20656C7365207B0A20202020202020202020202024636F6E7461';
wwv_flow_imp.g_varchar2_table(78) := '696E65722E617070656E642824746F617374456C656D656E74293B0A20202020202020207D0A0A20202020202020202F2F2073657474696E672074686520636F727265637420415249412076616C75650A2020202020202020766172206172696156616C';
wwv_flow_imp.g_varchar2_table(79) := '75653B0A20202020202020207377697463682028636F6E6669672E7479706529207B0A20202020202020202020202063617365202773756363657373273A0A202020202020202020202020636173652027696E666F273A0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(80) := '202020206172696156616C7565203D2027706F6C697465273B0A20202020202020202020202020202020627265616B3B0A20202020202020202020202064656661756C743A0A202020202020202020202020202020206172696156616C7565203D202761';
wwv_flow_imp.g_varchar2_table(81) := '7373657274697665273B0A20202020202020207D0A202020202020202024746F617374456C656D656E742E617474722827617269612D6C697665272C206172696156616C7565293B0A0A20202020202020202F2F73657474696E672074696D657220616E';
wwv_flow_imp.g_varchar2_table(82) := '642070726F6772657373206261720A2020202020202020766172202470726F6772657373456C656D656E74203D202428273C6469762F3E27293B0A202020202020202069662028636F6E6669672E6469736D6973734166746572203E203029207B0A2020';
wwv_flow_imp.g_varchar2_table(83) := '202020202020202020202470726F6772657373456C656D656E742E616464436C6173732827756374722D70726F677265737327293B0A20202020202020202020202024746F617374456C656D656E742E617070656E64282470726F6772657373456C656D';
wwv_flow_imp.g_varchar2_table(84) := '656E74293B0A0A2020202020202020202020207661722074696D656F75744964203D2073657454696D656F75742866756E6374696F6E202829207B0A2020202020202020202020202020202024746F617374456C656D656E742E72656D6F766528293B0A';
wwv_flow_imp.g_varchar2_table(85) := '2020202020202020202020207D2C20636F6E6669672E6469736D6973734166746572293B0A2020202020202020202020207661722070726F67726573735374617274416E696D44656C6179203D203130303B0A0A2020202020202020202020202470726F';
wwv_flow_imp.g_varchar2_table(86) := '6772657373456C656D656E742E637373287B0A20202020202020202020202020202020277769647468273A202731303025272C0A20202020202020202020202020202020277472616E736974696F6E273A202777696474682027202B202828636F6E6669';
wwv_flow_imp.g_varchar2_table(87) := '672E6469736D6973734166746572202D2070726F67726573735374617274416E696D44656C617929202F203130303029202B202773206C696E656172270A2020202020202020202020207D293B0A20202020202020202020202073657454696D656F7574';
wwv_flow_imp.g_varchar2_table(88) := '2866756E6374696F6E202829207B0A202020202020202020202020202020202470726F6772657373456C656D656E742E63737328277769647468272C20273027293B0A2020202020202020202020207D2C2070726F67726573735374617274416E696D44';
wwv_flow_imp.g_varchar2_table(89) := '656C6179293B0A0A2020202020202020202020202F2F206F6E20686F766572206F7220636C69636B2C2072656D6F7665207468652074696D657220616E642070726F6772657373206261720A20202020202020202020202024746F617374456C656D656E';
wwv_flow_imp.g_varchar2_table(90) := '742E6F6E28276D6F7573656F76657220636C69636B272C2066756E6374696F6E202829207B0A20202020202020202020202020202020636C65617254696D656F75742874696D656F75744964293B0A202020202020202020202020202020202470726F67';
wwv_flow_imp.g_varchar2_table(91) := '72657373456C656D656E742E72656D6F766528293B0A2020202020202020202020207D293B0A20202020202020207D0A0A20202020202020202F2F68616E646C696E6720616E79206576656E74730A2020202020202020696620286469736D6973734F6E';
wwv_flow_imp.g_varchar2_table(92) := '436C69636B29207B0A20202020202020202020202024746F617374456C656D656E742E6F6E2827636C69636B272C2066756E6374696F6E20286576656E7429207B0A202020202020202020202020202020202F2F20646F206E6F74206469736D69737320';
wwv_flow_imp.g_varchar2_table(93) := '69662074686520636C69636B656420656C656D656E7420697320616E20616E63686F72206F72206120627574746F6E0A20202020202020202020202020202020696620285B2741272C2027425554544F4E275D2E696E636C756465732824286576656E74';
wwv_flow_imp.g_varchar2_table(94) := '2E746172676574292E70726F7028276E6F64654E616D6527292929207B0A202020202020202020202020202020202020202072657475726E3B0A202020202020202020202020202020207D0A0A202020202020202020202020202020202F2F20646F206E';
wwv_flow_imp.g_varchar2_table(95) := '6F74206469736D6973732069662074686520757365722069732073656C656374696E6720746578740A202020202020202020202020202020207661722073656C656374696F6E203D2077696E646F772E67657453656C656374696F6E28293B0A20202020';
wwv_flow_imp.g_varchar2_table(96) := '2020202020202020202020206966202873656C656374696F6E2026260A202020202020202020202020202020202020202073656C656374696F6E2E74797065203D3D202752616E6765272026260A20202020202020202020202020202020202020207365';
wwv_flow_imp.g_varchar2_table(97) := '6C656374696F6E2E616E63686F724E6F64652026260A2020202020202020202020202020202020202020242873656C656374696F6E2E616E63686F724E6F64652C2024746F617374456C656D656E74292E6C656E677468203E203029207B0A2020202020';
wwv_flow_imp.g_varchar2_table(98) := '20202020202020202020202020202072657475726E3B0A202020202020202020202020202020207D0A0A2020202020202020202020202020202024746F617374456C656D656E742E72656D6F766528293B0A2020202020202020202020207D293B0A2020';
wwv_flow_imp.g_varchar2_table(99) := '2020202020207D0A0A2020202020202020696620286469736D6973734F6E427574746F6E29207B0A20202020202020202020202024636C6F7365456C656D656E742E6F6E2827636C69636B272C2066756E6374696F6E202829207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(100) := '202020202020202024746F617374456C656D656E742E72656D6F766528293B0A2020202020202020202020207D293B0A20202020202020207D0A0A20202020202020202F2F20706572686170732074686520646576656C6F7065722077616E747320746F';
wwv_flow_imp.g_varchar2_table(101) := '20646F20736F6D657468696E67206164646974696F6E616C6C79207768656E20746865206E6F74696669636174696F6E20697320636C69636B65640A202020202020202069662028747970656F6620636F6E6669672E6F6E636C69636B203D3D3D202766';
wwv_flow_imp.g_varchar2_table(102) := '756E6374696F6E2729207B0A20202020202020202020202024746F617374456C656D656E742E6F6E2827636C69636B272C20636F6E6669672E6F6E636C69636B293B0A202020202020202020202020696620286469736D6973734F6E427574746F6E2920';
wwv_flow_imp.g_varchar2_table(103) := '24636C6F7365456C656D656E742E6F6E2827636C69636B272C20636F6E6669672E6F6E636C69636B293B0A20202020202020207D0A0A202020202020202072657475726E2024746F617374456C656D656E743B0A202020207D0A0A202020207265747572';
wwv_flow_imp.g_varchar2_table(104) := '6E207B0A2020202020202020737563636573733A20737563636573732C0A2020202020202020696E666F3A20696E666F2C0A20202020202020207761726E696E673A207761726E696E672C0A20202020202020206572726F723A206572726F722C0A2020';
wwv_flow_imp.g_varchar2_table(105) := '202020202020636C656172416C6C3A20636C656172416C6C2C0A202020202020202076657273696F6E3A202732302E322E30270A202020207D3B0A0A7D2928293B0A0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168074894945044645)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'js/uctr.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '77696E646F772E756374723D66756E6374696F6E28297B76617220653D22756374722D636F6E7461696E6572222C6E3D7B737563636573733A2273756363657373222C696E666F3A22696E666F222C7761726E696E673A227761726E696E67222C657272';
wwv_flow_imp.g_varchar2_table(2) := '6F723A226572726F72227D2C743D7B737563636573733A2266612D636865636B2D636972636C65222C696E666F3A2266612D696E666F2D636972636C65222C7761726E696E673A2266612D6578636C616D6174696F6E2D747269616E676C65222C657272';
wwv_flow_imp.g_varchar2_table(3) := '6F723A2266612D74696D65732D636972636C65227D2C693D7B7D2C733D7B7D3B66756E6374696F6E206328652C6E2C742C69297B76617220733D242E657874656E64287B7D2C7B6469736D6973733A5B226F6E436C69636B222C226F6E427574746F6E22';
wwv_flow_imp.g_varchar2_table(4) := '5D2C6469736D69737341667465723A6E756C6C2C6E65776573744F6E546F703A21302C70726576656E744475706C6963617465733A21312C65736361706548746D6C3A21302C706F736974696F6E3A22746F702D7269676874222C69636F6E436C617373';
wwv_flow_imp.g_varchar2_table(5) := '3A6E756C6C2C636C656172416C6C3A21317D2C69293B72657475726E226F626A656374223D3D747970656F66206E3F286E2E747970653D652C7228242E657874656E6428732C7B747970653A657D2C6E2929293A6E7C7C743F28217426266E262628743D';
wwv_flow_imp.g_varchar2_table(6) := '6E2C6E3D766F69642030292C7228242E657874656E64287B7D2C7B747970653A652C6D6573736167653A6E2C7469746C653A747D2C732929293A766F696420617065782E64656275672E696E666F2822756374723A206E6F207469746C65206F72206D65';
wwv_flow_imp.g_varchar2_table(7) := '7373616765207761732070726F76696465642E206E6F742073686F77696E67206E6F74696669636174696F6E2E22297D66756E6374696F6E206F28297B2428222E222B65292E6368696C6472656E28292E72656D6F766528297D66756E6374696F6E2072';
wwv_flow_imp.g_varchar2_table(8) := '286E297B76617220632C722C613D28633D6E2E706F736974696F6E2C695B635D7C7C66756E6374696F6E286E297B76617220743D2428223C6469762F3E22292E616464436C6173732822756374722D222B6E292E616464436C6173732865293B72657475';
wwv_flow_imp.g_varchar2_table(9) := '726E20242822626F647922292E617070656E642874292C695B6E5D3D742C747D286329292C6C3D6E2E6469736D6973732E696E636C7564657328226F6E436C69636B22292C753D6E2E6469736D6973732E696E636C7564657328226F6E427574746F6E22';
wwv_flow_imp.g_varchar2_table(10) := '292C703D2428273C64697620636C6173733D2275632D416C6572742075632D416C6572742D2D686F72697A6F6E74616C2075632D416C6572742D2D7061676520272B7B737563636573733A2275632D416C6572742D2D73756363657373222C6572726F72';
wwv_flow_imp.g_varchar2_table(11) := '3A2275632D416C6572742D2D64616E676572222C7761726E696E673A2275632D416C6572742D2D7761726E696E67222C696E666F3A2275632D416C6572742D2D696E666F227D5B6E2E747970655D2B272220726F6C653D22616C657274223E3C2F646976';
wwv_flow_imp.g_varchar2_table(12) := '3E27292C643D2428273C64697620636C6173733D2275632D416C6572742D77726170223E27292C663D2428273C64697620636C6173733D2275632D416C6572742D69636F6E223E3C2F6469763E27292C763D2428273C7370616E20636C6173733D22742D';
wwv_flow_imp.g_varchar2_table(13) := '49636F6E20666120272B286E2E69636F6E436C6173737C7C745B6E2E747970655D292B27223E3C2F7370616E3E27292C6D3D2428273C64697620636C6173733D2275632D416C6572742D636F6E74656E74223E3C2F6469763E27292C673D2428273C6832';
wwv_flow_imp.g_varchar2_table(14) := '20636C6173733D2275632D416C6572742D7469746C65223E3C2F68323E27292C413D2428273C64697620636C6173733D2275632D416C6572742D626F6479223E3C2F6469763E27292C773D2428273C64697620636C6173733D2275632D416C6572742D62';
wwv_flow_imp.g_varchar2_table(15) := '7574746F6E73223E3C2F6469763E27293B75262628723D2428273C627574746F6E20636C6173733D22742D427574746F6E20742D427574746F6E2D2D6E6F554920742D427574746F6E2D2D69636F6E20742D427574746F6E2D2D636C6F7365416C657274';
wwv_flow_imp.g_varchar2_table(16) := '2220747970653D22627574746F6E22207469746C653D22436C6F7365204E6F74696669636174696F6E223E3C7370616E20636C6173733D22742D49636F6E2069636F6E2D636C6F7365223E3C2F7370616E3E3C2F627574746F6E3E2729292C702E617070';
wwv_flow_imp.g_varchar2_table(17) := '656E642864292C642E617070656E642866292C662E617070656E642876292C642E617070656E64286D292C6D2E617070656E642867292C6D2E617070656E642841292C642E617070656E642877292C752626772E617070656E642872293B76617220683D';
wwv_flow_imp.g_varchar2_table(18) := '6E2E7469746C653B682626286E2E65736361706548746D6C262628683D617065782E7574696C2E65736361706548544D4C286829292C672E617070656E64286829293B76617220793D6E2E6D6573736167653B696628792626286E2E6573636170654874';
wwv_flow_imp.g_varchar2_table(19) := '6D6C262622737472696E67223D3D747970656F662079262628793D617065782E7574696C2E65736361706548544D4C287929292C412E617070656E64287929292C21286E2E70726576656E744475706C6963617465732626732626732E24656C656D2626';
wwv_flow_imp.g_varchar2_table(20) := '732E24656C656D2E697328223A76697369626C6522292626732E7469746C653D3D682626732E6D6573736167653D3D7929297B766172206B3B73776974636828733D7B24656C656D3A702C7469746C653A682C6D6573736167653A797D2C6E2E636C6561';
wwv_flow_imp.g_varchar2_table(21) := '72416C6C26266F28292C6E2E6E65776573744F6E546F703F612E70726570656E642870293A612E617070656E642870292C6E2E74797065297B636173652273756363657373223A6361736522696E666F223A6B3D22706F6C697465223B627265616B3B64';
wwv_flow_imp.g_varchar2_table(22) := '656661756C743A6B3D22617373657274697665227D702E617474722822617269612D6C697665222C6B293B76617220623D2428223C6469762F3E22293B6966286E2E6469736D69737341667465723E30297B622E616464436C6173732822756374722D70';
wwv_flow_imp.g_varchar2_table(23) := '726F677265737322292C702E617070656E642862293B76617220543D73657454696D656F75742866756E6374696F6E28297B702E72656D6F766528297D2C6E2E6469736D6973734166746572293B622E637373287B77696474683A2231303025222C7472';
wwv_flow_imp.g_varchar2_table(24) := '616E736974696F6E3A22776964746820222B286E2E6469736D69737341667465722D313030292F3165332B2273206C696E656172227D292C73657454696D656F75742866756E6374696F6E28297B622E63737328227769647468222C223022297D2C3130';
wwv_flow_imp.g_varchar2_table(25) := '30292C702E6F6E28226D6F7573656F76657220636C69636B222C66756E6374696F6E28297B636C65617254696D656F75742854292C622E72656D6F766528297D297D72657475726E206C2626702E6F6E2822636C69636B222C66756E6374696F6E286529';
wwv_flow_imp.g_varchar2_table(26) := '7B696628215B2241222C22425554544F4E225D2E696E636C75646573282428652E746172676574292E70726F7028226E6F64654E616D65222929297B766172206E3D77696E646F772E67657453656C656374696F6E28293B6E26262252616E6765223D3D';
wwv_flow_imp.g_varchar2_table(27) := '6E2E7479706526266E2E616E63686F724E6F6465262624286E2E616E63686F724E6F64652C70292E6C656E6774683E307C7C702E72656D6F766528297D7D292C752626722E6F6E2822636C69636B222C66756E6374696F6E28297B702E72656D6F766528';
wwv_flow_imp.g_varchar2_table(28) := '297D292C2266756E6374696F6E223D3D747970656F66206E2E6F6E636C69636B262628702E6F6E2822636C69636B222C6E2E6F6E636C69636B292C752626722E6F6E2822636C69636B222C6E2E6F6E636C69636B29292C707D7D72657475726E7B737563';
wwv_flow_imp.g_varchar2_table(29) := '636573733A66756E6374696F6E28652C742C69297B72657475726E2063286E2E737563636573732C652C742C69297D2C696E666F3A66756E6374696F6E28652C742C69297B72657475726E2063286E2E696E666F2C652C742C69297D2C7761726E696E67';
wwv_flow_imp.g_varchar2_table(30) := '3A66756E6374696F6E28652C742C69297B72657475726E2063286E2E7761726E696E672C652C742C69297D2C6572726F723A66756E6374696F6E28652C742C69297B72657475726E2063286E2E6572726F722C652C742C69297D2C636C656172416C6C3A';
wwv_flow_imp.g_varchar2_table(31) := '6F2C76657273696F6E3A2232302E322E30227D7D28293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168075193040044642)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'js/uctr.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2F0A2F2A205468656D65726F6C6C65722047726F7570202A2F0A2F2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2F0A2F2A0A7B0A20202020227472616E736C617465223A20747275652C0A';
wwv_flow_imp.g_varchar2_table(2) := '202020202267726F757073223A5B0A20202020202020207B0A202020202020202020202020226E616D65223A20225543202D204E6F74696669636174696F6E73222C0A20202020202020202020202022636F6D6D6F6E223A2066616C73652C0A20202020';
wwv_flow_imp.g_varchar2_table(3) := '20202020202020202273657175656E6365223A203230303530300A20202020202020207D0A202020205D0A7D0A2A2F0A2F2A2A2A2A2A2A2A2A2A2A2A2A2A2F0A2F2A205661726961626C6573202A2F0A2F2A2A2A2A2A2A2A2A2A2A2A2A2A2F0A2F2A0A7B';
wwv_flow_imp.g_varchar2_table(4) := '0A2020227661722220202020203A20224075632D6E6F7469662D7469746C652D666F6E742D73697A65222C0A2020226E616D6522202020203A20225469746C6520466F6E742053697A65222C0A2020227479706522202020203A20226E756D626572222C';
wwv_flow_imp.g_varchar2_table(5) := '0A202022756E697473222020203A202272656D222C0A20202272616E6765222020203A207B0A20202020226D696E22202020202020203A20312C0A20202020226D617822202020202020203A20332C0A2020202022696E6372656D656E7422203A20302E';
wwv_flow_imp.g_varchar2_table(6) := '310A20207D2C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73220A7D0A2A2F0A4075632D6E6F7469662D7469746C652D666F6E742D73697A653A20312E3872656D3B0A2F2A0A7B0A2020227661722220202020203A';
wwv_flow_imp.g_varchar2_table(7) := '20224075632D6E6F7469662D7469746C652D666F6E742D776569676874222C0A2020226E616D6522202020203A20225469746C6520466F6E7420576569676874222C0A2020227479706522202020203A20226E756D626572222C0A20202272616E676522';
wwv_flow_imp.g_varchar2_table(8) := '2020203A207B0A20202020226D696E22202020202020203A203130302C0A20202020226D617822202020202020203A203930302C0A2020202022696E6372656D656E7422203A203130300A20207D2C0A20202267726F7570222020203A20225543202D20';
wwv_flow_imp.g_varchar2_table(9) := '4E6F74696669636174696F6E73220A7D0A2A2F0A4075632D6E6F7469662D7469746C652D666F6E742D7765696768743A203730303B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D6D6573736167652D666F6E742D73697A';
wwv_flow_imp.g_varchar2_table(10) := '65222C0A2020226E616D6522202020203A20224D65737361676520466F6E742053697A65222C0A2020227479706522202020203A20226E756D626572222C0A202022756E697473222020203A202272656D222C0A20202272616E6765222020203A207B0A';
wwv_flow_imp.g_varchar2_table(11) := '20202020226D696E22202020202020203A20312C0A20202020226D617822202020202020203A20332C0A2020202022696E6372656D656E7422203A20302E310A20207D2C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F';
wwv_flow_imp.g_varchar2_table(12) := '6E73220A7D0A2A2F0A4075632D6E6F7469662D6D6573736167652D666F6E742D73697A653A20312E3472656D3B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D6D6573736167652D666F6E742D776569676874222C0A2020';
wwv_flow_imp.g_varchar2_table(13) := '226E616D6522202020203A20224D65737361676520466F6E7420576569676874222C0A2020227479706522202020203A20226E756D626572222C0A20202272616E6765222020203A207B0A20202020226D696E22202020202020203A203130302C0A2020';
wwv_flow_imp.g_varchar2_table(14) := '2020226D617822202020202020203A203930302C0A2020202022696E6372656D656E7422203A203130300A20207D2C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73220A7D0A2A2F0A4075632D6E6F7469662D6D65';
wwv_flow_imp.g_varchar2_table(15) := '73736167652D666F6E742D7765696768743A203530303B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D6D696E2D7769647468222C0A2020226E616D6522202020203A20224D696E205769647468222C0A20202274797065';
wwv_flow_imp.g_varchar2_table(16) := '22202020203A20226E756D626572222C0A202022756E697473222020203A20227078222C0A20202272616E6765222020203A207B0A20202020226D696E22202020202020203A203130302C0A20202020226D617822202020202020203A20323030302C0A';
wwv_flow_imp.g_varchar2_table(17) := '2020202022696E6372656D656E7422203A2032300A20207D2C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73220A7D0A2A2F0A4075632D6E6F7469662D6D696E2D77696474683A2033323070783B0A2F2A0A7B0A20';
wwv_flow_imp.g_varchar2_table(18) := '20227661722220202020203A20224075632D6E6F7469662D6D61782D7769647468222C0A2020226E616D6522202020203A20224D6178205769647468222C0A2020227479706522202020203A20226E756D626572222C0A202022756E697473222020203A';
wwv_flow_imp.g_varchar2_table(19) := '20227078222C0A20202272616E6765222020203A207B0A20202020226D696E22202020202020203A203130302C0A20202020226D617822202020202020203A20323030302C0A2020202022696E6372656D656E7422203A2032300A20207D2C0A20202267';
wwv_flow_imp.g_varchar2_table(20) := '726F7570222020203A20225543202D204E6F74696669636174696F6E73220A7D0A2A2F0A4075632D6E6F7469662D6D61782D77696474683A2036343070783B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D6F7061636974';
wwv_flow_imp.g_varchar2_table(21) := '79222C0A2020226E616D6522202020203A20224E6F74696669636174696F6E204F706163697479222C0A2020227479706522202020203A20226E756D626572222C0A20202272616E6765222020203A207B0A20202020226D696E22202020202020203A20';
wwv_flow_imp.g_varchar2_table(22) := '302E312C0A20202020226D617822202020202020203A20312C0A2020202022696E6372656D656E7422203A20302E310A20207D2C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73220A7D0A2A2F0A4075632D6E6F74';
wwv_flow_imp.g_varchar2_table(23) := '69662D6F7061636974793A20302E393B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D737563636573732D6267222C0A2020226E616D6522202020203A20224261636B67726F756E64222C0A202022747970652220202020';
wwv_flow_imp.g_varchar2_table(24) := '3A2022636F6C6F72222C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73222C0A20202273756267726F7570223A202253756363657373220A7D0A2A2F0A4075632D6E6F7469662D737563636573732D62673A204067';
wwv_flow_imp.g_varchar2_table(25) := '5F537563636573732D42473B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D737563636573732D636F6C6F72222C0A2020226E616D6522202020203A2022436F6C6F72222C0A2020227479706522202020203A2022636F6C';
wwv_flow_imp.g_varchar2_table(26) := '6F72222C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73222C0A20202273756267726F7570223A202253756363657373220A7D0A2A2F0A4075632D6E6F7469662D737563636573732D636F6C6F723A2040675F5375';
wwv_flow_imp.g_varchar2_table(27) := '63636573732D46473B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D6572726F722D6267222C0A2020226E616D6522202020203A20224261636B67726F756E64222C0A2020227479706522202020203A2022636F6C6F7222';
wwv_flow_imp.g_varchar2_table(28) := '2C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73222C0A20202273756267726F7570223A20224572726F72220A7D0A2A2F0A4075632D6E6F7469662D6572726F722D62673A2040675F44616E6765722D42473B0A2F';
wwv_flow_imp.g_varchar2_table(29) := '2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D6572726F722D636F6C6F72222C0A2020226E616D6522202020203A2022436F6C6F72222C0A2020227479706522202020203A2022636F6C6F72222C0A20202267726F7570222020';
wwv_flow_imp.g_varchar2_table(30) := '203A20225543202D204E6F74696669636174696F6E73222C0A20202273756267726F7570223A20224572726F72220A7D0A2A2F0A4075632D6E6F7469662D6572726F722D636F6C6F723A2040675F44616E6765722D46473B0A2F2A0A7B0A202022766172';
wwv_flow_imp.g_varchar2_table(31) := '2220202020203A20224075632D6E6F7469662D7761726E696E672D6267222C0A2020226E616D6522202020203A20224261636B67726F756E64222C0A2020227479706522202020203A2022636F6C6F72222C0A20202267726F7570222020203A20225543';
wwv_flow_imp.g_varchar2_table(32) := '202D204E6F74696669636174696F6E73222C0A20202273756267726F7570223A20225761726E696E67220A7D0A2A2F0A4075632D6E6F7469662D7761726E696E672D62673A2040675F5761726E696E672D42473B0A2F2A0A7B0A20202276617222202020';
wwv_flow_imp.g_varchar2_table(33) := '20203A20224075632D6E6F7469662D7761726E696E672D636F6C6F72222C0A2020226E616D6522202020203A2022436F6C6F72222C0A2020227479706522202020203A2022636F6C6F72222C0A20202267726F7570222020203A20225543202D204E6F74';
wwv_flow_imp.g_varchar2_table(34) := '696669636174696F6E73222C0A20202273756267726F7570223A20225761726E696E67220A7D0A2A2F0A4075632D6E6F7469662D7761726E696E672D636F6C6F723A2040675F5761726E696E672D46473B0A2F2A0A7B0A2020227661722220202020203A';
wwv_flow_imp.g_varchar2_table(35) := '20224075632D6E6F7469662D696E666F2D6267222C0A2020226E616D6522202020203A20224261636B67726F756E64222C0A2020227479706522202020203A2022636F6C6F72222C0A20202267726F7570222020203A20225543202D204E6F7469666963';
wwv_flow_imp.g_varchar2_table(36) := '6174696F6E73222C0A20202273756267726F7570223A2022496E666F220A7D0A2A2F0A4075632D6E6F7469662D696E666F2D62673A2040675F496E666F2D42473B0A2F2A0A7B0A2020227661722220202020203A20224075632D6E6F7469662D696E666F';
wwv_flow_imp.g_varchar2_table(37) := '2D636F6C6F72222C0A2020226E616D6522202020203A2022436F6C6F72222C0A2020227479706522202020203A2022636F6C6F72222C0A20202267726F7570222020203A20225543202D204E6F74696669636174696F6E73222C0A20202273756267726F';
wwv_flow_imp.g_varchar2_table(38) := '7570223A2022496E666F220A7D0A2A2F0A4075632D6E6F7469662D696E666F2D636F6C6F723A2040675F496E666F2D46473B0A2F2A2A2A2A2A2A2A2A2A2A2A2F0A2F2A2043535320202020202A2F0A2F2A2A2A2A2A2A2A2A2A2A2A2F0A2E756374722D63';
wwv_flow_imp.g_varchar2_table(39) := '6F6E7461696E6572202E75632D416C6572742D2D70616765207B0A202020206D696E2D77696474683A204075632D6E6F7469662D6D696E2D77696474682021696D706F7274616E743B0A202020206D61782D77696474683A204075632D6E6F7469662D6D';
wwv_flow_imp.g_varchar2_table(40) := '61782D77696474682021696D706F7274616E743B0A20202020666F6E742D73697A653A204075632D6E6F7469662D6D6573736167652D666F6E742D73697A652021696D706F7274616E743B0A7D0A2E756374722D636F6E7461696E6572202E75632D416C';
wwv_flow_imp.g_varchar2_table(41) := '6572742D2D70616765202E75632D416C6572742D7469746C65207B0A20202020666F6E742D7765696768743A204075632D6E6F7469662D7469746C652D666F6E742D7765696768742021696D706F7274616E743B0A20202020666F6E742D73697A653A20';
wwv_flow_imp.g_varchar2_table(42) := '4075632D6E6F7469662D7469746C652D666F6E742D73697A652021696D706F7274616E743B0A7D0A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D70616765202E75632D416C6572742D626F6479207B0A20202020666F6E742D7765';
wwv_flow_imp.g_varchar2_table(43) := '696768743A204075632D6E6F7469662D6D6573736167652D666F6E742D7765696768742021696D706F7274616E743B0A7D0A2F2F20737563636573730A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E75632D416C6572';
wwv_flow_imp.g_varchar2_table(44) := '742D2D73756363657373207B0A202020206261636B67726F756E642D636F6C6F723A207267626128726564284075632D6E6F7469662D737563636573732D6267292C20677265656E284075632D6E6F7469662D737563636573732D6267292C20626C7565';
wwv_flow_imp.g_varchar2_table(45) := '284075632D6E6F7469662D737563636573732D6267292C204075632D6E6F7469662D6F706163697479292021696D706F7274616E743B0A20202020636F6C6F723A204075632D6E6F7469662D737563636573732D636F6C6F722021696D706F7274616E74';
wwv_flow_imp.g_varchar2_table(46) := '3B0A7D0A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E75632D416C6572742D2D737563636573733A686F766572207B0A202020206261636B67726F756E642D636F6C6F723A204075632D6E6F7469662D737563636573';
wwv_flow_imp.g_varchar2_table(47) := '732D62672021696D706F7274616E743B0A7D0A2F2F696E666F0A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F207B0A20206261636B67726F756E642D636F6C6F723A207267626128';
wwv_flow_imp.g_varchar2_table(48) := '726564284075632D6E6F7469662D696E666F2D6267292C20677265656E284075632D6E6F7469662D696E666F2D6267292C20626C7565284075632D6E6F7469662D696E666F2D6267292C204075632D6E6F7469662D6F706163697479292021696D706F72';
wwv_flow_imp.g_varchar2_table(49) := '74616E743B0A2020636F6C6F723A204075632D6E6F7469662D696E666F2D636F6C6F722021696D706F7274616E743B0A7D0A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E75632D416C6572742D2D696E666F3A686F76';
wwv_flow_imp.g_varchar2_table(50) := '6572207B0A20206261636B67726F756E642D636F6C6F723A204075632D6E6F7469662D696E666F2D62672021696D706F7274616E743B0A7D0A2F2F207761726E696E670A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E';
wwv_flow_imp.g_varchar2_table(51) := '75632D416C6572742D2D7761726E696E67207B0A20206261636B67726F756E642D636F6C6F723A207267626128726564284075632D6E6F7469662D7761726E696E672D6267292C20677265656E284075632D6E6F7469662D7761726E696E672D6267292C';
wwv_flow_imp.g_varchar2_table(52) := '20626C7565284075632D6E6F7469662D7761726E696E672D6267292C204075632D6E6F7469662D6F706163697479292021696D706F7274616E743B0A2020636F6C6F723A204075632D6E6F7469662D7761726E696E672D636F6C6F722021696D706F7274';
wwv_flow_imp.g_varchar2_table(53) := '616E743B0A7D0A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E75632D416C6572742D2D7761726E696E673A686F766572207B0A20206261636B67726F756E642D636F6C6F723A204075632D6E6F7469662D7761726E69';
wwv_flow_imp.g_varchar2_table(54) := '6E672D62672021696D706F7274616E743B0A7D0A2F2F206572726F720A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E75632D416C6572742D2D64616E676572207B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(55) := '7267626128726564284075632D6E6F7469662D6572726F722D6267292C20677265656E284075632D6E6F7469662D6572726F722D6267292C20626C7565284075632D6E6F7469662D6572726F722D6267292C204075632D6E6F7469662D6F706163697479';
wwv_flow_imp.g_varchar2_table(56) := '292021696D706F7274616E743B0A2020636F6C6F723A204075632D6E6F7469662D6572726F722D636F6C6F722021696D706F7274616E743B0A7D0A2E756374722D636F6E7461696E6572202E75632D416C6572742D2D706167652E75632D416C6572742D';
wwv_flow_imp.g_varchar2_table(57) := '2D64616E6765723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A204075632D6E6F7469662D6572726F722D62672021696D706F7274616E743B0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(168075677920044019)
,p_plugin_id=>wwv_flow_imp.id(167124377933688426)
,p_file_name=>'less/uc-notification-themeroller.less'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260913121332Z')
,p_updated_on=>wwv_flow_imp.dz('20260913121332Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
