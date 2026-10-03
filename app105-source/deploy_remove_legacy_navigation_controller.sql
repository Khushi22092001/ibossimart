whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_source_blob blob;
  l_source_clob clob;
  l_result_clob clob;
  l_result_blob blob;
  l_dst integer := 1;
  l_src integer := 1;
  l_ctx integer := dbms_lob.default_lang_ctx;
  l_warning integer;
  l_start integer;
  l_finish integer;
  l_length integer;
  l_marker constant varchar2(4000) := '/* Keep navigation transitions deterministic across HOME, module landing pages';
  l_next_marker constant varchar2(4000) := '/* Independent desktop stacks for uneven pairs of form cards. */';
  l_legacy_head constant varchar2(4000) := '/* Capture a queued sidebar handoff before the rest of this shared runtime can';
  l_legacy_head_end constant varchar2(4000) := '/* HSPL_P118_DETAIL_TOTALS_HORIZONTAL_V1 */';
  procedure copy_slice(p_to in out nocopy clob, p_from clob, p_amount integer, p_from_offset integer) is
  begin
    if p_amount > 0 then
      dbms_lob.copy(p_to, p_from, p_amount, dbms_lob.getlength(p_to) + 1, p_from_offset);
    end if;
  end;
begin
  apex_util.set_security_group_id(4744311978888504);
  select file_content into l_source_blob
    from apex_application_static_files
   where application_id=105 and file_name='hspl-theme.js';

  dbms_lob.createtemporary(l_source_clob, true);
  dbms_lob.converttoclob(l_source_clob, l_source_blob, dbms_lob.lobmaxsize,
    l_dst, l_src, nls_charset_id('AL32UTF8'), l_ctx, l_warning);

  l_start := dbms_lob.instr(l_source_clob, l_marker);
  l_finish := dbms_lob.instr(l_source_clob, l_next_marker, l_start);
  if l_start = 0 or l_finish = 0 then
    raise_application_error(-20001, 'Legacy navigation controller markers were not found; no asset was changed.');
  end if;

  dbms_lob.createtemporary(l_result_clob, true);
  copy_slice(l_result_clob, l_source_clob, l_start - 1, 1);
  dbms_lob.append(l_result_clob,
    '/* Legacy navigation controller removed. Native APEX links and the dedicated sidebar controller are the only navigation-state owners. */'||chr(10)||chr(10));
  copy_slice(l_result_clob, l_source_clob, dbms_lob.getlength(l_source_clob) - l_finish + 1, l_finish);

  /* This startup block only marked a legacy handoff as unresolved. Once the
     legacy controller is gone, retaining it would leave a stale hidden tree. */
  l_start := dbms_lob.instr(l_result_clob, l_legacy_head);
  l_finish := dbms_lob.instr(l_result_clob, l_legacy_head_end, l_start);
  if l_start = 0 or l_finish = 0 then
    raise_application_error(-20002, 'Legacy navigation startup marker was not found; no asset was changed.');
  end if;
  dbms_lob.createtemporary(l_source_clob, true);
  copy_slice(l_source_clob, l_result_clob, l_start - 1, 1);
  dbms_lob.append(l_source_clob,
    '/* Sidebar state is initialized exclusively by hspl-sidebar-state.js. */'||chr(10)||chr(10));
  copy_slice(l_source_clob, l_result_clob, dbms_lob.getlength(l_result_clob) - l_finish + 1, l_finish);

  dbms_lob.createtemporary(l_result_blob, true);
  l_dst := 1; l_src := 1; l_ctx := dbms_lob.default_lang_ctx;
  dbms_lob.converttoblob(l_result_blob, l_source_clob, dbms_lob.lobmaxsize,
    l_dst, l_src, nls_charset_id('AL32UTF8'), l_ctx, l_warning);

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.create_app_static_file(
    p_id=>wwv_flow_imp.id(7709977229328829),p_file_name=>'hspl-theme.js',
    p_mime_type=>'application/javascript',p_file_charset=>'utf-8',p_file_content=>l_result_blob);
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_result_blob);
  dbms_lob.freetemporary(l_result_clob);
  dbms_lob.freetemporary(l_source_clob);
end;
/

begin
  update apex_260100.wwv_flows
     set javascript_file_urls=regexp_replace(javascript_file_urls,'hspl-theme[.]js[?][^[:space:]]*','hspl-theme.js?cb=20260929native-nav'),
         files_version=files_version+1,
         version_scn=dbms_flashback.get_system_change_number,
         last_updated_on=sysdate
   where id=105 and security_group_id=4744311978888504;
  if sql%rowcount<>1 then raise_application_error(-20003,'Application JavaScript configuration was not found.'); end if;
end;
/
commit;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
select case when instr(javascript_file_urls,'hspl-theme.js?cb=20260929native-nav')>0 then 'NATIVE_NAV_DEPLOYED' else 'MISSING' end status
from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
