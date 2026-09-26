whenever sqlerror exit failure rollback
set define off
declare
  l_js varchar2(32767) := q'~(function(){'use strict';function paint(){document.querySelectorAll('.t-Body-nav [aria-level]').forEach(function(item){var level=parseInt(item.getAttribute('aria-level'),10);if(!level)return;var node=item.classList.contains('a-TreeView-node')?item:item.closest('.a-TreeView-node')||item;for(var i=1;i<=5;i++)node.classList.remove('hspl-nav-level-'+i);node.classList.add('hspl-nav-level-'+Math.min(level,5));var content=item.matches('.a-TreeView-content')?item:node.querySelector(':scope>.a-TreeView-content')||item.parentElement&&item.parentElement.querySelector(':scope>.a-TreeView-content');if(content){for(var c=1;c<=5;c++)content.classList.remove('hspl-nav-content-level-'+c);content.classList.add('hspl-nav-content-level-'+Math.min(level,5));}var row=item.matches('.a-TreeView-row')?item:node.querySelector(':scope>.a-TreeView-row')||item.parentElement&&item.parentElement.querySelector(':scope>.a-TreeView-row');if(row){for(var r=1;r<=5;r++)row.classList.remove('hspl-nav-row-level-'+r);row.classList.add('hspl-nav-row-level-'+Math.min(level,5));}if(item.hasAttribute('aria-expanded')||node.querySelector(':scope>[aria-expanded]'))node.classList.add('hspl-nav-has-children');});}if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',paint);else paint();document.addEventListener('apexreadyend',paint);new MutationObserver(paint).observe(document.documentElement,{childList:true,subtree:true,attributes:true,attributeFilter:['aria-level','aria-expanded']});})();~';
  l_blob blob;
  l_raw raw(32767);
begin
  l_raw:=utl_raw.cast_to_raw(l_js);
  dbms_lob.createtemporary(l_blob,true);
  dbms_lob.writeappend(l_blob,utl_raw.length(l_raw),l_raw);
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(7711000000000005),p_file_name=>'hspl-nav-paint.js',p_mime_type=>'application/javascript',p_file_charset=>'utf-8',p_file_content=>l_blob);
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_blob);
  commit;
end;
/

update apex_260100.wwv_flows
   set javascript_file_urls = regexp_replace(regexp_replace(javascript_file_urls,'([[:space:]]*#APP_FILES#hspl-nav-hierarchy-v22[.]js[^[:space:]]*)',''),'([[:space:]]*#APP_FILES#hspl-nav-paint[.]js[^[:space:]]*)','') || chr(10) || '#APP_FILES#hspl-nav-paint.js?cb=20260911bg',
       files_version=files_version+1,
       version_scn=dbms_flashback.get_system_change_number,
       last_updated_on=sysdate
 where id=105;
commit;

begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
exit
