whenever sqlerror exit failure rollback
set define off
connect -name IMART

declare
  l_marker  constant varchar2(100) := 'HSPL_P118_QUANTITY_VERTICAL_ALIGNMENT_V2';
  l_js      varchar2(32767) := q'~
/* HSPL_P118_QUANTITY_VERTICAL_ALIGNMENT_V2 */
(function(){function apply(){if(!document.documentElement.classList.contains('page-118')||window.innerWidth<768)return;var item=document.getElementById('P118_QUANTITY'),field=item&&item.closest('.t-Form-fieldContainer'),cell=field&&field.parentElement&&field.parentElement.classList.contains('col')?field.parentElement:null;if(cell)cell.style.marginTop='-64px';}[1800,2600,3400,4500].forEach(function(delay){window.setTimeout(apply,delay);});document.addEventListener('apexreadyend',apply,{once:true});document.addEventListener('apexafterrefresh',apply,true);})();
~';
  l_blob    blob;
  l_raw     raw(32767);
begin
  select file_content
    into l_blob
    from apex_260100.wwv_flow_static_files
   where flow_id = 105
     and security_group_id = 4744311978888504
     and file_name = 'hspl-theme.js'
   for update;

  if dbms_lob.instr(l_blob, utl_i18n.string_to_raw(l_marker, 'AL32UTF8')) = 0 then
    l_raw := utl_i18n.string_to_raw(chr(10) || l_js, 'AL32UTF8');
    dbms_lob.writeappend(l_blob, utl_raw.length(l_raw), l_raw);
    update apex_260100.wwv_flow_static_files
       set last_updated_on = sysdate,
           last_updated_by = 'CODEX'
     where flow_id = 105
       and security_group_id = 4744311978888504
       and file_name = 'hspl-theme.js';
  end if;

  update apex_260100.wwv_flows
     set javascript_file_urls = regexp_replace(
           javascript_file_urls,
           '#APP_FILES#hspl-theme[.]js[^[:space:]]*',
           '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260928p118quantityv2'),
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where id = 105
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Application 105 JavaScript cache URL was not updated');
  end if;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
