set define off
set serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

declare
  function hub_source(p_group_code varchar2, p_label varchar2) return varchar2 is
    l_source varchar2(32767);
  begin
    l_source := q'~declare
  l_count pls_integer := 0;
  l_url   varchar2(4000);
  l_icon  varchar2(4000);
begin
  htp.p('<section class="hspl-directory-grid" aria-label="#LABEL# shortcuts">');
  for r in (
    select myboxlabel,
           pageno,
           iconname,
           serialno
      from myboxtree_apexmenu
     where bossusercode = :GLOBAL_BOSSUSERCODE
       and companycode = :GLOBAL_COMPANYCODE
       and parentkey = 'BU:' || :GLOBAL_BOSSUSERCODE || '.C:' || :GLOBAL_COMPANYCODE || '.MG:#GROUP#'
       and pageno is not null
     order by serialno, upper(myboxlabel)
  ) loop
    l_count := l_count + 1;
    l_url := apex_page.get_url(
      p_page        => r.pageno,
      p_session     => v('APP_SESSION'),
      p_clear_cache => to_char(r.pageno));
    l_icon := case
      when instr(lower(nvl(r.iconname,'')), 'fa-') > 0 then r.iconname
      else 'fa-file-text-o'
    end;
    htp.p('<a class="hspl-directory-card hspl-directory-tone-' || mod(l_count - 1, 8) ||
          '" href="' || apex_escape.html_attribute(l_url) || '">');
    htp.p('<span class="hspl-directory-icon"><span class="fa ' ||
          apex_escape.html_attribute(l_icon) || '" aria-hidden="true"></span></span>');
    htp.p('<span class="hspl-directory-title">' ||
          apex_escape.html(r.myboxlabel) || '</span>');
    htp.p('<span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span>');
    htp.p('</a>');
  end loop;
  if l_count = 0 then
    htp.p('<div class="hspl-directory-empty"><span class="fa fa-folder-open-o" aria-hidden="true"></span><b>No pages available</b><p>Your current role has no authorized pages in this section.</p></div>');
  end if;
  htp.p('</section>');
end;~';
    l_source := replace(l_source, '#GROUP#', p_group_code);
    l_source := replace(l_source, '#LABEL#', apex_escape.html_attribute(p_label));
    return l_source;
  end;

  procedure make_page(
    p_page       number,
    p_name       varchar2,
    p_alias      varchar2,
    p_group_code varchar2,
    p_region_id  number ) is
    l_exists number;
  begin
    select count(*)
      into l_exists
      from apex_260100.wwv_flow_steps
     where flow_id = 105
       and id = p_page;
    if l_exists > 0 then
      wwv_flow_imp_page.remove_page(p_flow_id=>105, p_page_id=>p_page);
    end if;

    wwv_flow_imp_page.create_page(
      p_id=>p_page,
      p_name=>p_name,
      p_alias=>p_alias,
      p_step_title=>p_name,
      p_autocomplete_on_off=>'OFF',
      p_step_template=>4072355960268175073,
      p_page_template_options=>'#DEFAULT#',
      p_protection_level=>'C',
      p_page_component_map=>'03');

    wwv_flow_imp_page.create_page_plug(
      p_id=>wwv_flow_imp.id(p_region_id),
      p_plug_name=>p_name || ' pages',
      p_static_id=>'hspl-directory-content',
      p_region_template_options=>'#DEFAULT#:t-Region--noUI',
      p_plug_template=>3371237801798025892,
      p_plug_display_sequence=>10,
      p_plug_item_display_point=>'ABOVE',
      p_location=>null,
      p_plug_source=>hub_source(p_group_code,p_name),
      p_plug_source_type=>'NATIVE_PLSQL');
  end;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',
    p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,
    p_default_owner=>'IMART');

  make_page(820,'General Masters','GENERAL-MASTERS','153',720000000000000001);
  make_page(821,'Freight Management','FREIGHT-MANAGEMENT','151',720000000000000002);
  make_page(822,'Finance & Accounts','FINANCE-AND-ACCOUNTS','142',720000000000000003);
  make_page(823,'Visitor Management','VISITOR-MANAGEMENT','152',720000000000000004);
  make_page(824,'Inventory Control','INVENTORY-CONTROL','140',720000000000000005);
  make_page(825,'Reports','REPORTS-HUB','143',720000000000000006);
  make_page(826,'Dashboard','DASHBOARD-HUB','134',720000000000000007);

  wwv_flow_imp.component_end;

  update modulegroup
     set pageno = case modulegroupcode
       when '153' then 820
       when '151' then 821
       when '142' then 822
       when '152' then 823
       when '140' then 824
       when '143' then 825
       when '134' then 826
     end
   where modulegroupcode in ('153','151','142','152','140','143','134');

  commit;
  dbms_output.put_line('Created seven permission-aware module hubs and updated ' || sql%rowcount || ' module-group destinations.');
end;
/

exit
