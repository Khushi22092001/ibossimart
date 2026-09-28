whenever sqlerror exit failure rollback
set define off
connect -name IMART

declare
  l_marker  constant varchar2(100) := 'HSPL_P118_DETAIL_TOTALS_HORIZONTAL_V1';
  l_js      varchar2(32767) := q'~
/* HSPL_P118_DETAIL_TOTALS_HORIZONTAL_V1 */
(function(){function cell(id){var item=document.getElementById(id),field=item&&item.closest('.t-Form-fieldContainer');return field&&field.parentElement&&field.parentElement.classList.contains('col')?field.parentElement:null;}function apply(){if(!document.documentElement.classList.contains('page-118')||window.innerWidth<768)return;var cells=['P118_SUMOFAMOUNT','P118_SUMOFFOOTERAMOUNT','P118_PURCHASEORDERAMOUNT'].map(cell);if(cells.some(function(item){return !item;}))return;var rows=cells.map(function(item){return item.parentElement;}),parent=rows[0]&&rows[0].parentElement;if(!parent||rows.some(function(row){return !row.classList.contains('row')||row.parentElement!==parent;}))return;if(rows[0]!==rows[1]){rows[0].appendChild(cells[1]);rows[1].remove();}if(rows[0]!==rows[2]){rows[0].appendChild(cells[2]);rows[2].remove();}rows[0].style.display='flex';rows[0].style.columnGap='12px';cells.forEach(function(item){item.style.flex='0 0 calc(33.333333% - 8px)';item.style.width='calc(33.333333% - 8px)';item.style.maxWidth='calc(33.333333% - 8px)';});}function schedule(){window.requestAnimationFrame(apply);}[1800,2600,3400,4500].forEach(function(delay){window.setTimeout(schedule,delay);});document.addEventListener('apexreadyend',schedule,{once:true});document.addEventListener('apexafterrefresh',schedule,true);document.addEventListener('click',function(event){if(event.target.closest&&event.target.closest('.t-Tabs-link'))window.setTimeout(schedule,120);},true);})();
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
           '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260928p118detailtotalsv1'),
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
