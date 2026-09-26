prompt --application/pages/sales_lifecycle_360_pages
declare
  l_css varchar2(32767) := q'~
html body .t-Body-main{overflow-y:auto!important}.slc360-hero{margin:0 0 16px;padding:28px 30px;border:1px solid #a7d9d3;border-radius:18px;background:radial-gradient(130% 130% at 92% 8%,rgba(8,145,178,.28),transparent 48%),linear-gradient(120deg,#073b4c,#086f78 55%,#12a4a1);color:#fff;box-shadow:0 12px 30px rgba(5,78,86,.22)}.slc360-eyebrow{display:block;margin-bottom:8px;color:#bffaf4;font-size:11px;font-weight:800;letter-spacing:.12em;text-transform:uppercase}.slc360-hero h1{margin:0;color:#fff;font-size:30px;letter-spacing:-.03em}.slc360-hero p{max-width:900px;margin:8px 0 0;color:#d9fffc;font-size:14px;line-height:1.5}.slc360-actions{display:flex;flex-wrap:wrap;gap:9px;margin:0 0 16px}.slc360-actions a{display:inline-flex;align-items:center;gap:7px;padding:9px 13px;border:1px solid #cde5e2;border-radius:10px;background:#fff;color:#0f766e;font-size:12px;font-weight:750;text-decoration:none;box-shadow:0 3px 9px rgba(15,118,110,.06)}.slc360-actions a:hover{background:#e5f3f1;border-color:#0f766e}.slc360-empty{display:grid;place-items:center;min-height:150px;margin:0 0 16px;padding:24px;border:1px dashed #a7d9d3;border-radius:16px;background:#f7fffd;color:#54706d;text-align:center}.slc360-empty .fa{font-size:25px;color:#0f766e}.slc360-empty b{margin-top:8px;color:#0b3b36;font-size:16px}.slc360-empty p{margin:4px 0 0}.slc360-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:12px;margin:0 0 18px}.slc360-kpis>div{min-height:112px;padding:16px;border:1px solid #cde5e2;border-radius:14px;background:linear-gradient(145deg,#fff,#f3fbfa);box-shadow:0 6px 16px rgba(15,118,110,.07)}.slc360-kpis small{display:block;color:#0f766e;font-weight:800;letter-spacing:.08em}.slc360-kpis b{display:block;margin-top:11px;color:#0b3b36;font-size:20px;line-height:1.2}.slc360-kpis span{display:block;margin-top:6px;color:#54706d;font-size:11px}.slc360-section{margin:0 0 18px;border:1px solid #cde5e2;border-radius:16px;background:#fff;box-shadow:0 7px 18px rgba(15,118,110,.06);overflow:hidden}.slc360-section-head{padding:16px 18px;border-bottom:1px solid #dcebea;background:#fbfefd}.slc360-section h2{margin:0;color:#0b3b36;font-size:18px}.slc360-section-head p{margin:4px 0 0;color:#54706d;font-size:12px}.slc360-scroll{overflow-x:auto}.slc360-section table{width:100%;min-width:840px;border-collapse:collapse}.slc360-section th{padding:11px 12px;background:#f2fbf9;color:#2e5a55;font-size:10px;letter-spacing:.06em;text-align:left;text-transform:uppercase}.slc360-section td{padding:11px 12px;border-top:1px solid #e5efee;color:#38545a;font-size:11.5px;vertical-align:top}.slc360-section tbody tr:hover{background:#f7fcfb}.slc360-section a{color:#087c80;font-weight:750;text-decoration:none}.slc360-badge,.slc360-ok,.slc360-warn{display:inline-block;padding:4px 8px;border-radius:999px;font-size:10px;font-weight:800}.slc360-badge,.slc360-ok{background:#e5f3f1;color:#0f766e}.slc360-warn{background:#fff0d8;color:#9a5800}.slc360-list{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:10px;padding:16px}.slc360-list>a{display:flex;justify-content:space-between;gap:12px;padding:14px;border:1px solid #dcebea;border-radius:12px;background:#fff;color:#38545a;text-decoration:none}.slc360-list>a:hover{border-color:#0f766e;background:#f0faf8;transform:translateY(-1px)}.slc360-list b{display:block;color:#0b3b36;font-size:12px}.slc360-list small{display:block;margin-top:4px;color:#71888d}.slc360-list>a>span:last-child{text-align:right;font-size:10px}.slc360-bars{display:grid;gap:10px;padding:17px}.slc360-bars>div{display:grid;grid-template-columns:90px 1fr 190px;align-items:center;gap:11px;color:#54706d;font-size:11px}.slc360-bars i{display:block;width:var(--w);height:12px;border-radius:99px;background:linear-gradient(90deg,#14b8a6,#0f766e)}.slc360-bars b{text-align:right;color:#2e5a55;font-size:10px}@media(max-width:1000px){.slc360-kpis{grid-template-columns:repeat(2,1fr)}.slc360-list{grid-template-columns:repeat(2,1fr)}}@media(max-width:600px){.slc360-kpis,.slc360-list{grid-template-columns:1fr}.slc360-bars>div{grid-template-columns:75px 1fr}.slc360-bars b{grid-column:1/-1;text-align:left}}
~';

  procedure make_page(
    p_page number,
    p_name varchar2,
    p_alias varchar2,
    p_item varchar2,
    p_kind varchar2,
    p_region_id number,
    p_item_id number ) is
  begin
    wwv_flow_imp_page.create_page(
      p_id=>p_page,
      p_name=>p_name,
      p_alias=>p_alias,
      p_step_title=>p_name,
      p_autocomplete_on_off=>'OFF',
      p_inline_css=>l_css,
      p_step_template=>4072355960268175073,
      p_page_template_options=>'#DEFAULT#',
      p_protection_level=>'C',
      p_page_component_map=>'03');

    wwv_flow_imp_page.create_page_plug(
      p_id=>wwv_flow_imp.id(p_region_id),
      p_plug_name=>p_name,
      p_static_id=>'slc360-content',
      p_region_template_options=>'#DEFAULT#:t-Region--noUI',
      p_plug_template=>3371237801798025892,
      p_plug_display_sequence=>10,
      p_plug_item_display_point=>'ABOVE',
      p_location=>null,
      p_plug_source=>'begin imart_slc_360.render('''||p_kind||''', :'||p_item||'); end;',
      p_plug_source_type=>'NATIVE_PLSQL');

    wwv_flow_imp_page.create_page_item(
      p_id=>wwv_flow_imp.id(p_item_id),
      p_name=>p_item,
      p_item_sequence=>10,
      p_item_plug_id=>wwv_flow_imp.id(p_region_id),
      p_source_type=>'ALWAYS_NULL',
      p_display_as=>'NATIVE_HIDDEN',
      p_encrypt_session_state_yn=>'N',
      p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','N')).to_clob);
  end;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',
    p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,
    p_default_id_offset=>9480203831466364,
    p_default_owner=>'IMART');

  make_page(722,'Sales Quotation 360','SALES-QUOTATION-360','P722_TNO','QUOTATION',71000000000000000001,71000000000000000002);
  make_page(723,'Sales Order 360','SALES-ORDER-360','P723_TNO','ORDER',71000000000000000003,71000000000000000004);
  make_page(724,'Vehicle 360','VEHICLE-360','P724_VEHICLE','VEHICLE',71000000000000000005,71000000000000000006);
  make_page(725,'Category 360','CATEGORY-360','P725_CATEGORY','CATEGORY',71000000000000000007,71000000000000000008);
  make_page(726,'Item Sales Analysis','ITEM-SALES-ANALYSIS','P726_ITEMCODE','ITEM',71000000000000000009,71000000000000000010);

  wwv_flow_imp.component_end;
end;
/
