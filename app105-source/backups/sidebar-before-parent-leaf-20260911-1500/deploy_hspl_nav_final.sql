whenever sqlerror exit failure rollback
set define off
declare
  l_css  varchar2(32767) := q'~/* App 105 navigation-only compatibility layer. Loaded after App 103 v22. */
body:not(.t-PageBody--login) #t_Body_nav{display:flex!important;flex-direction:column!important;overflow:hidden!important}
body:not(.t-PageBody--login) #t_Body_nav #t_TreeNav{flex:1 1 auto!important;min-height:0!important;height:100%!important;max-height:100%!important;overflow-x:hidden!important;overflow-y:auto!important;overscroll-behavior:contain!important;scrollbar-gutter:stable!important}
body:not(.t-PageBody--login) #t_Body_nav #t_TreeNav .a-TreeView-node.hspl-nav-has-children>.a-TreeView-toggle{top:14px!important;transform:none!important;margin:0!important}
body:not(.t-PageBody--login) #t_Body_nav #t_TreeNav .a-TreeView-node.hspl-nav-level-3.hspl-nav-has-children>.a-TreeView-toggle,body:not(.t-PageBody--login) #t_Body_nav #t_TreeNav .a-TreeView-node.hspl-nav-level-4.hspl-nav-has-children>.a-TreeView-toggle{top:10px!important}
body.js-navCollapsed:not(.t-PageBody--login) #t_Body_nav #t_TreeNav>ul>.a-TreeView-node--topLevel>.a-TreeView-content{display:flex!important;align-items:center!important;justify-content:center!important;grid-template-columns:none!important;width:42px!important;min-width:42px!important;height:48px!important;margin:3px 0!important;padding:3px!important;transform:none!important;box-sizing:border-box!important}
body.js-navCollapsed:not(.t-PageBody--login) #t_Body_nav #t_TreeNav>ul>.a-TreeView-node--topLevel>.a-TreeView-content>.fa{flex:0 0 34px!important;width:34px!important;min-width:34px!important;margin:0!important}
body.js-navCollapsed:not(.t-PageBody--login) #t_Body_nav #t_TreeNav>ul>.a-TreeView-node--topLevel{width:42px!important;min-width:42px!important;margin:0!important}
body.js-navExpanded:not(.t-PageBody--login) #t_Body_nav #t_TreeNav>ul>.a-TreeView-node--topLevel>:is(.a-TreeView-row,.a-TreeView-content){left:auto!important;right:auto!important;transform:none!important;width:calc(100% - 14px)!important;margin-left:7px!important;margin-right:7px!important;box-sizing:border-box!important}
~';
  l_blob blob;
  l_raw  raw(32767);
begin
  l_raw := utl_raw.cast_to_raw(l_css);
  dbms_lob.createtemporary(l_blob, true);
  dbms_lob.writeappend(l_blob, utl_raw.length(l_raw), l_raw);

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',
    p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,
    p_default_owner=>'IMART'
  );
  wwv_flow_imp_shared.create_app_static_file(
    p_id=>wwv_flow_imp.id(7711000000000004),
    p_file_name=>'hspl-nav-final.css',
    p_mime_type=>'text/css',
    p_file_charset=>'utf-8',
    p_file_content=>l_blob
  );
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_blob);
  commit;
end;
/

update apex_260100.wwv_flows
   set css_file_urls = regexp_replace(css_file_urls,'([[:space:]]*#APP_FILES#hspl-nav-final[.]css[^[:space:]]*)','') || chr(10) ||
                       '#APP_FILES#hspl-nav-final.css?cb=20260911bf'
 where id=105;
commit;
exit
