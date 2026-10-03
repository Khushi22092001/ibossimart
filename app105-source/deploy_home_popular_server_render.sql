whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Render Popular Pages in Page 1's initial response; no client-side replacement. */
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30', p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504, p_default_application_id => 105,
    p_default_id_offset => 7541489808702750, p_default_owner => 'IMART');

  wwv_flow_imp_page.create_page_item(
    p_id => wwv_flow_id.next_val,
    p_name => 'P1_POPULAR_HTML',
    p_item_sequence => 9999,
    p_source_data_type => 'VARCHAR2',
    p_source => q'~
with module_entry_page as (
  select entrypageno, max(pageno) pageno from module where entrypageno is not null group by entrypageno
), popular as (
  select nvl(m.pageno, a.page_id) page_id,
         max(a.page_name) keep (dense_rank last order by a.view_timestamp) page_name,
         count(*) visit_count
    from apex_260100.apex_workspace_activity_log a
    left join module_entry_page m on m.entrypageno = a.page_id
   where a.workspace_id = 4744311978888504 and a.application_id = 105
     and upper(a.apex_user) = upper(v('APP_USER')) and a.page_id not in (0,1)
     and a.page_name is not null
   group by nvl(m.pageno, a.page_id)
   order by count(*) desc, max(a.view_timestamp) desc
   fetch first 8 rows only
)
select listagg(
  '<a class="imart-home-card' || case mod(row_number() over(order by visit_count desc),5)
    when 2 then ' imart-home-card--teal' when 3 then ' imart-home-card--amber'
    when 4 then ' imart-home-card--purple' when 0 then ' imart-home-card--rose' else '' end ||
  '" href="f?p=' || v('APP_ID') || ':' || page_id || ':' || v('APP_SESSION') || '::::">' ||
  '<span class="imart-home-card-icon">' || case mod(row_number() over(order by visit_count desc),2) when 0 then '&#8599;' else '&#9643;' end || '</span><h3>' ||
  apex_escape.html(page_name) || '</h3><p>Visited ' || visit_count || case when visit_count=1 then ' time' else ' times' end ||
  '</p><span class="imart-home-card-arrow">&#8594;</span></a>', '') within group(order by visit_count desc)
from popular~',
    p_source_type => 'QUERY',
    p_display_as => 'NATIVE_HIDDEN',
    p_is_persistent => 'N',
    p_attributes => wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','N')).to_clob);
  wwv_flow_imp.component_end;
end;
/

declare
  l_source clob;
  l_start pls_integer;
  l_end pls_integer;
begin
  select plug_source into l_source from apex_260100.wwv_flow_page_plugs
   where flow_id=105 and page_id=1 and static_id='iron-mart' and security_group_id=4744311978888504 for update;
  l_start := dbms_lob.instr(l_source, '<div class="imart-home-grid imart-home-grid--loading"');
  l_end := dbms_lob.instr(l_source, '</div></section><div class="imart-home-lower">', l_start);
  if l_start=0 or l_end=0 then raise_application_error(-20001,'Popular grid boundaries not found'); end if;
  update apex_260100.wwv_flow_page_plugs
     set plug_source = dbms_lob.substr(l_source,l_start-1,1) || '<div class="imart-home-grid" id="imart-popular-pages">&P1_POPULAR_HTML!RAW.</div>' || dbms_lob.substr(l_source,dbms_lob.getlength(l_source)-l_end+1,l_end), last_updated_on=sysdate
   where flow_id=105 and page_id=1 and static_id='iron-mart' and security_group_id=4744311978888504;
end;
/

declare
  l_js clob;
  l_new_js clob;
  l_start pls_integer;
  l_end pls_integer;
begin
  select javascript_code_onload into l_js from apex_260100.wwv_flow_steps
   where flow_id=105 and id=1 and security_group_id=4744311978888504 for update;
  l_start := dbms_lob.instr(l_js, '/* Home: user-specific popular pages sourced from APEX activity history. */');
  l_end := dbms_lob.instr(l_js, '/* Home: full inbound workflow launcher with server-side rights checks. */', l_start);
  if l_start=0 or l_end=0 then raise_application_error(-20002,'Popular initializer boundaries not found'); end if;
  dbms_lob.createtemporary(l_new_js,true);
  dbms_lob.copy(l_new_js,l_js,l_start-1,1,1);
  dbms_lob.copy(l_new_js,l_js,dbms_lob.getlength(l_new_js)+1,l_end,dbms_lob.getlength(l_js)-l_end+1);
  update apex_260100.wwv_flow_steps set javascript_code_onload=l_new_js,last_updated_on=sysdate
   where flow_id=105 and id=1 and security_group_id=4744311978888504;
  dbms_lob.freetemporary(l_new_js);
end;
/
commit;
exit
