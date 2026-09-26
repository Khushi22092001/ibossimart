prompt --application/pages/page_00721
begin
--   Manifest
--     PAGE: 00721
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>721
,p_name=>'Sales Lifecycle Control Tower'
,p_alias=>'SALES-LIFECYCLE-CONTROL-TOWER'
,p_step_title=>'Sales Lifecycle Control Tower'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function($){',
'  var $tip=$(''#slct-hover-tip'');',
'  if(!$tip.length){$tip=$(''<div id="slct-hover-tip" role="tooltip"></div>'').appendTo(''body'');}',
'  function esc(v){return $(''<div>'').text(v||'''').html();}',
'  function move(e,el){var x=Number(e&&e.clientX)||0,y=Number(e&&e.clientY)||0,r;if((!x&&!y)&&el){r=el.getBoundingClientRect();x=r.left+(r.width/2);y=r.bottom;}var w=$tip.outerWidth()||240,h=$tip.outerHeight()||60,left=x+16,top=y+16;if(left+w>window.innerWidth-10){left=x-w-16;}if(top+h>window.innerHeight-10){top=y-h-16;}$tip.css({left:Math.max(8,left)+''px'',top:Math.max(8,top)+''px''});}',
'  function showTip(el,e){var $el=$(el),text=$el.attr(''data-tooltip''),title=$el.attr(''data-tip-title'')||'''',mode=$el.attr(''data-tip-mode'')||''rich'',parts;if(!text){return;}if(mode===''compact''){$tip.attr(''class'',''slct-tip-compact'').text(text);}else{parts=text.split('' | '');if(!title&&parts.length===1&&parts[0].indexOf('' · '')>-1){var pair=parts[0].split('' · '');title=pair.shift();parts=[pair.join('' · '')];}$tip.attr(''class'',''slct-tip-rich'').html(''<div class="slct-tip-title"><i style="background:''+esc($el.attr(''data-tip-color'')||''#2E73C4'')+''"></i><span>''+esc(title||''Chart value'')+''</span></div>''+parts.map(function(p){var at=p.lastIndexOf('':'');if(at>0){return ''<div class="slct-tip-row"><span>''+esc(p.slice(0,at))+''</span><strong>''+esc(p.slice(at+1).trim())+''</strong></div>'';}return ''<div class="slct-tip-row"><strong>''+esc(p)+''</strong></div>'';}).join(''''));}$tip.addClass(''is-visible'');move(e.originalEvent||e,el);}',
'  $(document).off(''.slctHover'').on(''mouseenter.slctHover focusin.slctHover'',''.slct-hover'',function(e){showTip(this,e);}).on(''mousemove.slctHover'',''.slct-hover'',function(e){move(e.originalEvent||e);}).on(''mouseleave.slctHover focusout.slctHover'',''.slct-hover'',function(){$tip.removeClass(''is-visible'');}).on(''mousemove.slctHoverGuard'',function(e){if(!$(e.target).closest(''.slct-hover'').length){$tip.removeClass(''is-visible'');}}).on(''click.slctLegend'',''.slct-line-legend button'',function(){var $b=$(this),series=$b.attr(''data-series''),off=$b.attr(''aria-pressed'')===''false'';$b.attr(''aria-pressed'',off?''true'':''false'');$(''.slct-line-chart .''+series).toggleClass(''slct-series-off'',!off);});$(window).off(''scroll.slctHover resize.slctHover'').on(''scroll.slctHover resize.slctHover'',function(){$tip.removeClass(''is-visible'');});',
'  var cards=''#R70000000000000000002 .t-Card-wrap,#R70000000000000000023 .t-Card-wrap,#R70000000000000000012 .t-Card-wrap,#R70000000000000000035 .t-Card-wrap,#R70000000000000000078 .t-Card-wrap,#R70000000000000000092 .t-Card-wrap,#R7000000000000000004'
||'6 .t-Card-wrap,#R70000000000000000056 .t-Card-wrap,#R70000000000000000103 .t-Card-wrap,#R70000000000000000113 .t-Card-wrap'';',
'  function decorateCards(){ $(cards).each(function(){var $card=$(this),txt=$card.text().replace(/ +/g,'' '').trim();if(txt){$card.addClass(''slct-hover'').attr(''data-tooltip'',txt+'' Click to open the related IMART register.'');}}); }',
'  decorateCards();',
'  $(document).off(''apexafterrefresh.slctCards'').on(''apexafterrefresh.slctCards'',''#R70000000000000000002,#R70000000000000000023,#R70000000000000000012,#R70000000000000000035,#R70000000000000000078,#R70000000000000000092,#R70000000000000000046,#R700000'
||'00000000000056,#R70000000000000000103,#R70000000000000000113'',decorateCards);',
'})(apex.jQuery);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.slct-hero{position:relative;overflow:hidden;background:linear-gradient(118deg,#073b4c 0%,#086f78 54%,#12a4a1 100%);border-radius:18px;color:#fff;padding:28px 32px;box-shadow:0 12px 28px rgba(5,78,86,.24)}',
'.slct-quick-label{margin:18px 0 8px;color:#54706d;font-size:11px;font-weight:700;letter-spacing:.11em}.slct-quick-links,.slct-quick-periods{display:flex;flex-wrap:wrap;gap:9px}.slct-quick-links a,.slct-quick-periods button{display:inline-flex;align-i'
||'tems:center;gap:7px;padding:8px 13px;border:1px solid #cde5e2;border-radius:999px;background:#f7fffd;color:#0f766e;font-size:12px;font-weight:700;text-decoration:none;cursor:pointer}.slct-quick-links a:hover,.slct-quick-periods button:hover{border-co'
||'lor:#0f766e;background:#e5f3f1}.slct-quick-periods button{background:#fff;color:#2e5a55}.slct-start{margin:19px 0 8px;padding:17px 18px;border:1px solid #cde5e2;border-radius:14px;background:linear-gradient(135deg,#fff,#f2fbf9);box-shadow:0 5px 14px '
||'rgba(15,118,110,.06)}.slct-start h2{margin:0 0 13px;color:#0b3b36;font-size:18px}.slct-start-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:17px}.slct-start-grid>div{position:relative;padding-left:34px}.slct-start-grid span{posit'
||'ion:absolute;left:0;top:0;display:grid;place-items:center;width:24px;height:24px;border-radius:50%;background:#0f766e;color:#fff;font-size:12px;font-weight:700}.slct-start-grid b{display:block;color:#0b3b36;font-size:12px}.slct-start-grid p{margin:4p'
||'x 0 0;color:#54706d;font-size:11px;line-height:1.45}#report_70000000000000000078_catch .t-Card{border:1px solid #cde5e2!important;border-radius:12px!important;box-shadow:0 1px 2px rgba(16,24,40,.05),0 6px 16px rgba(15,118,110,.06)!important;backgroun'
||'d:#fff!important}#report_70000000000000000078_catch .t-Card:hover{border-color:#0f766e!important;transform:translateY(-2px)}@media(max-width:700px){.slct-start-grid{grid-template-columns:1fr}.slct-quick-links a,.slct-quick-periods button{font-size:11'
||'px;padding:7px 10px}}',
'.slct-hero:after{content:"";position:absolute;right:-55px;top:-85px;width:310px;height:310px;border:1px solid rgba(255,255,255,.18);border-radius:50%;box-shadow:-36px 46px 0 rgba(255,255,255,.07)}',
'.slct-hero h1{position:relative;z-index:1;color:#fff;margin:0 0 7px;font-size:30px;font-weight:750;letter-spacing:-.03em}.slct-hero p{position:relative;z-index:1;margin:0;color:#d9fffc;font-size:14px}',
'.slct-kicker{position:relative;z-index:1;display:inline-flex;gap:8px;align-items:center;margin-bottom:12px;color:#bffaf4;font-size:11px;font-weight:800;letter-spacing:.11em;text-transform:uppercase}.slct-kicker i{display:inline-block;width:7px;height'
||':7px;border-radius:50%;background:#8af5dc;box-shadow:0 0 0 5px rgba(138,245,220,.15)}',
'.slct-toolbar{display:flex;flex-wrap:wrap;align-items:center;gap:10px;margin:13px 0 18px;padding:12px 15px;border:1px solid #dce9e9;border-radius:12px;background:#fff;box-shadow:0 5px 15px rgba(21,62,75,.05)}.slct-filter{padding:7px 10px;border:1px s'
||'olid #e1ebed;border-radius:8px;color:#577078;font-size:12px;background:#fafdfd}.slct-filter b{margin-left:6px;color:#174d58}.slct-live{margin-left:auto;padding:7px 10px;border-radius:999px;background:#e4fbf5;color:#087b69;font-size:11px;font-weight:8'
||'00}',
'.slct-flow{display:grid;grid-template-columns:repeat(10,minmax(92px,1fr));gap:8px;margin:0 0 22px;overflow-x:auto}.slct-stage{position:relative;min-width:92px;padding:11px 10px;border:1px solid #dcebed;border-radius:10px;background:linear-gradient(18'
||unistr('0deg,#fff,#f7fbfb);color:#375963}.slct-stage:after{content:"\2192";position:absolute;right:-10px;top:13px;z-index:2;color:#5cb9b7;font-weight:800}.slct-stage:last-child:after{display:none}.slct-stage span{display:block;color:#087c80;font-size:10px;font-w')
||'eight:800;letter-spacing:.06em}.slct-stage b{display:block;margin-top:4px;font-size:11px;line-height:1.25}',
'.slct-heading{display:flex;align-items:center;justify-content:space-between;margin:4px 0 10px;color:#123f4b}.slct-heading h2{margin:0;font-size:17px;letter-spacing:-.015em}.slct-heading span{color:#638087;font-size:11px}.slct-section{margin:26px 0 10'
||'px;padding-top:3px;border-top:1px solid #dbe9e8}.slct-section h2{margin:14px 0 4px;font-size:20px;color:#123f4b;letter-spacing:-.02em}.slct-section p{margin:0;color:#638087;font-size:12px}.slct-registers{display:grid;grid-template-columns:repeat(4,mi'
||'nmax(150px,1fr));gap:11px;margin:12px 0 5px}.slct-register{display:flex;align-items:center;gap:10px;padding:13px;border:1px solid #dcebea;border-radius:12px;background:#fff;color:#174d58;text-decoration:none;box-shadow:0 4px 10px rgba(24,67,79,.05)}.'
||'slct-register:hover{border-color:#3ab9aa;transform:translateY(-1px)}.slct-register i{width:30px;height:30px;display:grid;place-items:center;border-radius:9px;background:#e6f8f4;color:#087d76}.slct-register b{display:block;font-size:12px}.slct-registe'
||'r small{display:block;margin-top:2px;color:#71888d;font-size:10px}.slct-note{display:grid;grid-template-columns:1fr 1fr;gap:12px;margin:12px 0 3px}.slct-note>div{padding:15px 16px;border-radius:12px;background:#f4faf9;border:1px solid #d8ebe7}.slct-n'
||'ote b{display:block;color:#174d58;font-size:13px}.slct-note p{margin:4px 0 0;color:#648087;font-size:11px;line-height:1.45}.t-Cards--compact .t-Card-title{font-weight:700}.t-Cards--compact .t-Card-subtitle{color:#007d80;font-size:22px;font-weight:700'
||'}#lifecycle-snapshot .t-Card,#control-tower-exceptions .t-Card,#handoff-pressure .t-Card{border-radius:12px;box-shadow:0 5px 13px rgba(24,67,79,.08)}#lifecycle-health .t-Card,#sales-trend .t-Card,#top-customers .t-Card{border-radius:12px;background:l'
||'inear-gradient(145deg,#fff,#f6fbfa);box-shadow:0 5px 13px rgba(24,67,79,.07)}#sales-trend .t-Card-subtitle{font-size:17px}@media(max-width:700px){.slct-registers{grid-template-columns:repeat(2,1fr)}.slct-note{grid-template-columns:1fr}}',
'body:has(.ds-slc-hero){--ds-dash-surface:#fff;--ds-dash-line:#cde5e2;--ds-dash-ink:#0b3b36;--ds-dash-ink2:#2e5a55;--ds-dash-muted:#54706d;--ds-dash-radius:12px;--ds-dash-shadow:0 1px 2px rgba(16,24,40,.05),0 8px 22px rgba(15,118,110,.06);--ds-dash-sh'
||'adow-lift:0 10px 24px rgba(15,118,110,.15);--ds-dash-gold:#0f766e;--ds-dash-gold-bg:#e5f3f1;--ds-dash-blue:#0891b2;--ds-dash-blue-bg:#e2f4f8;--ds-dash-teal:#0f766e;--ds-dash-teal-bg:#e5f3f1;--ds-dash-green:#15803d;--ds-dash-green-bg:#e6f4ea;--ds-dash'
||'-red:#b45309;--ds-dash-red-bg:#fbf0e2;--ds-dash-slate:#4f46e5;--ds-dash-slate-bg:#eef0fe}.ds-slc-hero{position:relative;overflow:hidden;padding:24px 26px 20px;border:1px solid #a7d9d3;border-radius:16px;background:radial-gradient(130% 130% at 92% 8%,'
||'rgba(8,145,178,.26) 0%,rgba(8,145,178,0) 48%),radial-gradient(120% 120% at 0% 100%,rgba(19,78,74,.18) 0%,rgba(19,78,74,0) 44%),linear-gradient(120deg,#d3eeea 0%,#cdebe8 34%,#daf1ef 66%,#e9f7f5 100%);box-shadow:0 1px 2px rgba(16,24,40,.05),0 12px 34px'
||' rgba(15,118,110,.12)}.ds-slc-hero-row{position:relative;z-index:1;display:flex;align-items:flex-start;gap:16px}.ds-slc-hero-icon{flex:0 0 auto;display:grid;place-items:center;width:54px;height:54px;border-radius:14px;color:#fff;font-size:22px;backgr'
||'ound:linear-gradient(135deg,#0d9488 0%,#0f766e 100%);box-shadow:0 6px 16px rgba(15,118,110,.32)}.ds-slc-hero-text{display:flex;flex-direction:column}.ds-slc-hero-eyebrow{font-size:11px;font-weight:700;letter-spacing:.12em;text-transform:uppercase;col'
||'or:#0f766e;margin-bottom:3px}.ds-slc-hero-title{font-size:27px;font-weight:700;line-height:1.15;letter-spacing:-.02em;color:#0b3b36}.ds-slc-hero-sub{margin-top:6px;font-size:13.5px;line-height:1.5;color:#2e5a55;max-width:60ch}.ds-slc-hero-chips{posit'
||'ion:relative;z-index:1;display:flex;flex-wrap:wrap;gap:8px;margin-top:18px;max-width:70%}.ds-chip{display:inline-flex;align-items:center;gap:7px;padding:7px 13px;font-size:12px;font-weight:500;color:#2e5a55;background:rgba(255,255,255,.85);border:1px'
||' solid #cde5e2;border-radius:12px;white-space:nowrap;backdrop-filter:blur(4px)}.ds-chip-ic{color:#0f766e;font-size:12px}.ds-chip-k{color:#54706d}.ds-chip b{font-weight:700;color:#0b3b36}.ds-chip--live{color:#15803d;border-color:transparent;background'
||':#e6f4ea}.ds-chip--live .ds-chip-ic,.ds-chip--live .ds-chip-k{color:#15803d}.ds-chip--live b{color:#1a5138}html.page-721 #t_Body_title{display:none!important}#slct-filters{position:relative;margin:0;padding:42px 16px 10px!important;border:1px solid #'
||'cde5e2;border-radius:12px;background:#fff;box-shadow:0 1px 2px rgba(16,24,40,.05),0 8px 22px rgba(15,118,110,.06)}#slct-filters:before{content:"Filters";position:absolute;top:14px;left:16px;padding-left:22px;font-size:11px;font-weight:700;letter-spac'
||'ing:.11em;text-transform:uppercase;color:#54706d}#R70000000000000000073{display:flex!important;align-items:flex-end;gap:10px}#R70000000000000000073 .t-Form-fieldContainer{display:block!important;flex:0 0 250px!important;width:250px!important;margin:0'
||'!important}#R70000000000000000073 .t-Form-labelContainer,#R70000000000000000073 .t-Form-inputContainer{display:block!important;width:100%!important;padding:0!important}#R70000000000000000073 .t-Form-labelContainer{margin-bottom:4px}#R7000000000000000'
||'0073 .t-Form-label{font-size:11px;font-weight:700;color:#54706d}#R70000000000000000073 .t-Button{margin:0 0 1px!important;border-radius:9px;background:#0f766e;border-color:#0f766e;box-shadow:none}#lifecycle-snapshot .t-Card{min-height:156px;padding:1'
||'4px 13px;border:1px solid #cde5e2!important;border-radius:14px!important;background:rgba(255,255,255,.98)!important;box-shadow:0 5px 15px rgba(15,76,69,.07)!important;transition:transform .18s ease,border-color .18s ease,box-shadow .18s ease}#lifecyc'
||'le-snapshot .t-Card:hover{transform:translateY(-4px);border-color:#0f766e!important;box-shadow:0 10px 24px rgba(15,118,110,.15)!important}#lifecycle-snapshot .t-Card-icon{background:#e5f3f1!important;color:#0f766e!important;border-radius:8px!importan'
||'t}#lifecycle-snapshot .t-Card-title{font-size:11px!important;font-weight:700!important;letter-spacing:.02em;color:#2e5a55!important}#lifecycle-snapshot .t-Card-subtitle{font-size:21px!important;font-weight:700!important;color:#0b3b36!important}#lifec'
||'ycle-snapshot .t-Card-body{font-size:11px!important;color:#54706d!important}#lifecycle-health .t-Card,#control-tower-exceptions .t-Card,#handoff-pressure .t-Card,#sales-trend .t-Card,#top-customers .t-Card{border:1px solid #cde5e2!important;border-ra'
||'dius:12px!important;box-shadow:0 1px 2px rgba(16,24,40,.05),0 6px 16px rgba(15,118,110,.06)!important;background:#fff!important}#lifecycle-health .t-Card:hover,#control-tower-exceptions .t-Card:hover,#handoff-pressure .t-Card:hover,#sales-trend .t-Ca'
||'rd:hover,#top-customers .t-Card:hover{border-color:#0f766e!important;transform:translateY(-2px)}.slct-section{padding-left:14px;border-top:0!important;position:relative}.slct-section:before{content:"";position:absolute;left:0;top:6px;bottom:7px;width'
||':4px;border-radius:4px;background:linear-gradient(180deg,#0891b2,#134e4a)}.slct-heading h2,.slct-section h2{font-weight:700!important;color:#0b3b36!important}.slct-register{border-color:#cde5e2!important;box-shadow:0 1px 2px rgba(16,24,40,.05),0 6px '
||'16px rgba(15,118,110,.06)!important}.slct-register:hover{border-color:#0f766e!important;background:#f0faf8}@media(max-width:900px){.ds-slc-hero-chips{max-width:100%}.slct-flow{grid-template-columns:repeat(10,110px)}.slct-live{margin-left:0}#R70000000'
||'000000000073{align-items:stretch;flex-direction:column}#R70000000000000000073 .t-Form-fieldContainer{width:100%!important;flex-basis:auto!important}#R70000000000000000073 .t-Button{align-self:flex-start}}',
'.slct-report-card-grid{display:grid!important;grid-template-columns:repeat(auto-fit,minmax(210px,1fr));gap:12px;list-style:none;margin:4px 0 18px!important;padding:0!important}.slct-report-card-grid>table{display:none!important}.slct-report-card{min-width:0;margin:0!important}.slct-report-card-link{display:flex;min-height:138px;height:100%;flex-direction:column;padding:15px;border:1px solid #cde5e2;border-radius:14px;background:linear-gradient(145deg,#fff,#f5fbfa);color:#0b3b36;text-decoration:none;box-shadow:0 5px 15px rgba(15,76,69,.07);transition:transform .18s ease,border-color .18s ease,box-shadow .18s ease}.slct-report-card-link:hover{transform:translateY(-3px);border-color:#0f766e;box-shadow:0 11px 23px rgba(15,118,110,.14);color:#0b3b36;text-decoration:none}.slct-report-card-top{display:flex;align-items:center;gap:8px;color:#0f766e}.slct-report-card-top>i{display:grid;place-items:center;width:32px;height:32px;border-radius:9px;background:#e5f3f1;font-size:14px}.slct-report-card-top>b{font-size:11px;line-height:1.25;letter-spacing:.045em;text-transform:uppercase}.slct-report-card-link>strong{display:block;margin-top:13px;color:#0b3b36;font-size:23px;line-height:1.08;letter-spacing:-.025em}.slct-report-card-link>small{display:block;margin-top:7px;color:#54706d;font-size:11px;line-height:1.35}.slct-report-card-foot{display:flex;align-items:center;justify-content:space-between;gap:8px;margin-top:auto;padding-top:11px;color:#0f766e;font-size:10px;font-weight:700}.slct-report-card-foot em{overflow:hidden;color:#71888d;font-style:normal;text-overflow:ellipsis;white-space:nowrap}.slct-report-card:nth-child(2n) .slct-report-card-top{color:#0891b2}.slct-report-card:nth-child(3n) .slct-report-card-top{color:#7c3aed}.slct-report-card:nth-child(4n) .slct-report-card-top{color:#b45309}#R70000000000000000002_cards,#R70000000000000000046_cards,#R70000000000000000091,#R70000000000000000068{display:none!important}.t-Report-pagination{display:none!important}#stage-documents .a-IRR-tableContainer,#exception-documents .a-IRR-tableContainer{max-height:520px!important;overflow:auto!important;contain:layout!important}#stage-documents .a-IRR-table thead th,#exception-documents .a-IRR-table thead th{position:sticky!important;top:0!important;z-index:3!important;background:#eef0fe!important}#stage-documents .a-IRR,#exception-documents .a-IRR{height:auto!important;min-height:0!important}#stage-documents .a-IRR-content,#exception-documents .a-IRR-content{min-height:0!important}@media(max-width:1100px){.slct-report-card-grid{grid-template-columns:repeat(3,minmax(0,1fr))}}@media(max-width:700px){.slct-report-card-grid{grid-template-columns:1fr 1fr}.slct-report-card-link{min-height:126px}}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000033)
,p_plug_name=>'Action Centre Intro'
,p_static_id=>'action-centre-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>29
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>unistr('<div class="slct-heading"><h2>Action centre \2014 lifecycle bottlenecks</h2><span>Work the hand-offs that are holding up the next document</span></div>')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000113)
,p_name=>'Agent Performance'
,p_static_id=>'agent-performance'
,p_template=>3371237801798025892
,p_display_sequence=>48
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--5cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with agent_value as (select nvl(getpartyname(c.agentcode),''Direct / no agent'') agent_name,sum(nvl(c.ccinvoiceamount,0)) amount,count(*) invoices,count(distinct c.partycode) customers from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccin'
||'voicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') group by c.agentcode),',
'ranked as (select agent_name,amount,invoices,customers,row_number() over(order by amount desc nulls last) rn from agent_value) select rn seq,apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_ch'
||unistr('ar(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',AGENT'') card_link,agent_name card_title,to_char(amount,''FM999G999G999G990D00'') card_subtitle,to_char(invoices)||'' invoices \00B7 ''||')
||unistr('to_char(customers)||'' customers \00B7 register'' card_text,null card_subtext,''fa-user'' card_icon,''fa-arrow-right-alt'' card_icon2,''u-color-14'' card_color2 from ranked where rn<=5')))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000122)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000120)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000121)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000115)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000119)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000117)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000118)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000116)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000114)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000092)
,p_name=>'Category Mix'
,p_static_id=>'category-mix'
,p_template=>3371237801798025892
,p_display_sequence=>42
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--5cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with category_value as (select nvl(ic.itemcategoryname,''Uncategorised'') category_name,sum(nvl(d.amount,0)) amount,sum(nvl(d.quantity1,0)) qty,count(distinct c.tno) invoices from ccinvoice c join ccinvoicedetail d on d.tno=c.tno left join item i on i.'
||'itemcode=d.itemcode left join itemcategory ic on ic.itemcategorycode=i.itemcategorycode where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_'
||'DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') group by nvl(ic.itemcategoryname,''Uncategorised'')),',
'ranked as (select category_name,amount,qty,invoices,row_number() over(order by amount desc nulls last) rn from category_value) select rn seq,apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_ch'
||'ar(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',CATEGORY'') card_link,category_name card_title,to_char(amount,''FM999G999G999G990D00'') card_subtitle,to_char(qty,''FM999G999G990D00'
||unistr(''')||'' qty \00B7 ''||to_char(invoices)||'' invoices \00B7 register'' card_text,null card_subtext,''fa-cubes'' card_icon,''fa-arrow-right-alt'' card_icon2,''u-color-14'' card_color2 from ranked where rn<=5')))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000101)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000099)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000100)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000094)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000098)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000096)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000097)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000095)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000093)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000091)
,p_plug_name=>'Category Mix Intro'
,p_static_id=>'category-mix-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>41
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section"><h2>Category mix</h2><p>Top invoiced item categories, resolved through the IMART Item and Item Category masters.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000168)
,p_plug_name=>'Vehicle Operational Detail'
,p_static_id=>'vehicle-operational-detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>39
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(''<style>.slct-jumps{display:flex;flex-wrap:wrap;align-items:center;gap:8px;margin-top:15px;padding-top:13px;border-top:1px solid #d7e9e6}.slct-jumps b{font-size:10px;letter-spacing:.11em;color:#54706d}.slct-jumps a{padding:6px 10px;border-radius:999px;background:#fff;border:1px solid #cde5e2;color:#0f766e;font-size:11px;font-weight:700;text-decoration:none}.slct-jumps a:hover{background:#e5f3f1;border-color:#0f766e}.slct-live-table{margin:12px 0 18px;border:1px solid #cde5e2;border-radius:14px;background:#fff;box-shadow:0 6px 16px rgba(15,118,110,.06);overflow:hidden}.slct-table-head{display:flex;align-items:center;justify-content:space-between;gap:12px;padding:15px 17px;border-bottom:1px solid #dcebea}.slct-table-head h3{margin:0;color:#0b3b36;font-size:16px}.slct-table-head p{margin:3px 0 0;color:#54706d;font-size:11px}.slct-table-head a{color:#0f766e;font-size:11px;font-weight:700;text-decoration:none}.slct-table-scroll{overflow-x:auto}.slct-live-table table{width:100%;border-collapse:collapse;min-width:760px}.slct-live-table th{padding:10px 12px;text-align:left;background:#f2fbf9;color:#2e5a55;font-size:10px;letter-spacing:.05em;text-transform:uppercase}.slct-live-table td{padding:10px 12px;border-top:1px solid #e6efee;color:#38545a;font-size:11px}.slct-live-table tbody tr:hover{background:#f7fcfb}.slct-status{display:inline-block;padding:4px 8px;border-radius:999px;background:#e5f3f1;color:#0f766e;font-size:10px;font-weight:700}.slct-flow-stats{display:grid;grid-template-columns:repeat(3,1fr);gap:10px;padding:13px 17px;background:#f8fcfb}.slct-flow-stats span{padding:10px;border:1px solid #dcebea;border-radius:10px;color:#54706d;font-size:11px}.slct-flow-stats b{display:block;color:#0b3b36;font-size:20px}@media(max-width:700px){.slct-flow-stats{grid-template-columns:1fr}.slct-table-head{align-items:flex-start;flex-direction:column}}</style><section class="slct-live-table"><div class="slct-table-head"><div><h3>Vehicle operational detail</h3><p>Current gate and weighing position, linked back to the owning dispatch and sales order.</p></div><a href="f?p=&APP_ID.:167:&APP_SESSION.">Open full register &#8594;</a></div><div class="slct-table-scroll"><table><thead><tr><th>Vehicle</th><th>Customer</th><th>Dispatch advice</th><th>Sales order</th><th>Gate in</th><th>Dwell</th><th>Status</th></tr></thead><tbody>'');',
'  for r in (select * from (select nvl(m.vehicleno,''Not recorded'') vehicle,nvl(getpartyname(m.partycode),m.partycode) customer,nvl(d.despatchadviceno,to_char(m.referencetno)) dispatch_no,nvl(s.salesorderno,''-'') order_no,m.gateintime,round((nvl(m.gateouttime,sysdate)-m.gateintime)*24,1) dwell_hours,case when m.gateintime is null then ''Gate-in pending'' when m.gateouttime is null then ''Inside'' else ''Gate-out complete'' end status from materialout m left join despatchadvice d on d.tno=m.referencetno left join salesorder s on s.tno=d.salesordertno where m.companycode=:GLOBAL_COMPANYCODE order by nvl(m.gateintime,m.materialoutdate) desc) where rownum<=20) loop',
'    htp.p(''<tr><td><b>''||apex_escape.html(r.vehicle)||''</b></td><td>''||apex_escape.html(r.customer)||''</td><td>''||apex_escape.html(r.dispatch_no)||''</td><td>''||apex_escape.html(r.order_no)||''</td><td>''||case when r.gateintime is null then ''-'' else to_char(r.gateintime,''DD-MON-YYYY HH24:MI'') end||''</td><td>''||case when r.gateintime is null then ''-'' else to_char(r.dwell_hours,''FM999G990D0'')||'' h'' end||''</td><td><span class="slct-status">''||apex_escape.html(r.status)||''</span></td></tr>'');',
'  end loop;',
'  htp.p(''</tbody></table></div></section>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000169)
,p_plug_name=>'Confirmation to Order Category Flow'
,p_static_id=>'category-flow'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>49
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare l_same number:=0; l_changed number:=0; l_unlinked number:=0;',
'begin',
'  select sum(case when qcats=ocats then 1 else 0 end),sum(case when qcats<>ocats then 1 else 0 end),sum(case when qcats is null then 1 else 0 end) into l_same,l_changed,l_unlinked from (select s.tno,q.qcats,o.ocats from salesorder s left join (select d.tno,listagg(distinct nvl(i.itemcategorycode,''Uncategorised''),'', '') within group(order by nvl(i.itemcategorycode,''Uncategorised'')) qcats from salesquotationdetail d left join item i on i.itemcode=d.itemcode group by d.tno) q on q.tno=s.salesquotationtno left join (select d.tno,listagg(distinct nvl(i.itemcategorycode,''Uncategorised''),'', '') within group(order by nvl(i.itemcategorycode,''Uncategorised'')) ocats from salesorderdetail d left join item i on i.itemcode=d.itemcode group by d.tno) o on o.tno=s.tno where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31''));',
'  htp.p(''<section class="slct-live-table"><div class="slct-table-head"><div><h3>Confirmation &#8594; order category flow</h3><p>Ironmart equivalent: quotation categories compared with the linked sales-order categories.</p></div><a href="f?p=&APP_ID.:704:&APP_SESSION.">Open quotation register &#8594;</a></div><div class="slct-flow-stats"><span><b>''||to_char(nvl(l_same,0))||''</b> Same category</span><span><b>''||to_char(nvl(l_changed,0))||''</b> Category changed</span><span><b>''||to_char(nvl(l_unlinked,0))||''</b> No quotation link</span></div><div class="slct-table-scroll"><table><thead><tr><th>Sales order</th><th>Customer</th><th>Quotation category</th><th>Order category</th><th>Flow</th></tr></thead><tbody>'');',
'  for r in (select * from (select s.salesorderno,nvl(getpartyname(s.partycode),s.partycode) customer,q.qcats quotation_category,o.ocats order_category,case when q.qcats is null then ''No quotation link'' when q.qcats=o.ocats then ''Same'' else ''Changed'' end flow_status from salesorder s left join (select d.tno,listagg(distinct nvl(i.itemcategorycode,''Uncategorised''),'', '') within group(order by nvl(i.itemcategorycode,''Uncategorised'')) qcats from salesquotationdetail d left join item i on i.itemcode=d.itemcode group by d.tno) q on q.tno=s.salesquotationtno left join (select d.tno,listagg(distinct nvl(i.itemcategorycode,''Uncategorised''),'', '') within group(order by nvl(i.itemcategorycode,''Uncategorised'')) ocats from salesorderdetail d left join item i on i.itemcode=d.itemcode group by d.tno) o on o.tno=s.tno where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') order by s.salesorderdate desc) where rownum<=20) loop',
'    htp.p(''<tr><td><b>''||apex_escape.html(r.salesorderno)||''</b></td><td>''||apex_escape.html(r.customer)||''</td><td>''||apex_escape.html(nvl(r.quotation_category,''-''))||''</td><td>''||apex_escape.html(nvl(r.order_category,''-''))||''</td><td><span class="slct-status">''||apex_escape.html(r.flow_status)||''</span></td></tr>'');',
'  end loop;',
'  htp.p(''</tbody></table></div></section>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000045)
,p_plug_name=>'Commercial Analytics Intro'
,p_static_id=>'commercial-analytics-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>unistr('<div class="slct-section"><h2>Commercial analytics</h2><p>What sold, to whom and through whom \2014 using live IMART CC Invoice and invoice-detail data for the active period.</p></div>')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000067)
,p_plug_name=>'Control Tower Data Coverage'
,p_static_id=>'control-tower-data-coverage'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>55
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-note"><div><b>Collection and credit position</b><p>Receipts, allocations and customer exposure are available through the canonical Ironmart AR pages linked above. Party credit limits are not displayed as a numeric KPI because no customer currently carries a maintained Party.CreditAmount; missing configuration is shown as unavailable, never as zero.</p></div><div><b>Data scope</b><p>All lifecycle, bottleneck, vehicle and commercial metrics on this page are derived from live IMART transaction tables for the active company. No HSPL numbers or copied records are displayed.</p></div></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000012)
,p_name=>'Control Tower Exceptions'
,p_static_id=>'control-tower-exceptions'
,p_template=>3371237801798025892
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--4cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 seq, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',QUOTE'
||unistr('_NO_PO'') card_link, ''Quoted, no PO'' card_title, to_char(count(*)) card_subtitle, ''Follow up commercial closure \00B7 click for documents'' card_text, null card_subtext, ''fa-exclamation-triangle'' card_icon, ''fa-arrow-right-alt'' card_icon2, ''u-color-9'' card')
||'_color2 from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not e'
||'xists (select 1 from poreceipt p where p.salesquotationtno=q.tno)',
'union all select 2, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',PO_NO_ORDER''), ''PO, no Sales Order'', to_char(count(*)), ''Convert committed demand \00B7 click for documents'', null, ''fa-hourglass-half'', ''fa-arrow-right-alt'', ''u-color-9'' from poreceipt p where p.companycode=:GLOBAL_COMPANYCODE and p.poreceiptdate>=nvl(')
||'to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and p.poreceiptdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from salesorder s where s.poreceipttno=p.tno)',
'union all select 3, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',ORDER_NO_DISPATCH''), ''Sales Order, no Dispatch'', to_char(count(*)), ''Review execution readiness \00B7 click for documents'', null, ''fa-truck'', ''fa-arrow-right-alt'', ''u-color-9'' from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdat')
||'e>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from despatchadvice d where d.salesordertno=s.tno)',
'union all select 4, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',INVOICE_NO_EINVOICE''), ''CC Invoice, no E-Invoice'', to_char(count(*)), ''Review statutory completion \00B7 click for documents'', null, ''fa-file-code-o'', ''fa-arrow-right-alt'', ''u-color-9'' from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinv')
||'oicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from einvoice e where e.ccinvoicetno=c.tno)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000021)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000019)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000020)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000014)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000018)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000016)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000017)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000015)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000013)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000022)
,p_plug_name=>'Control Tower Lens'
,p_static_id=>'control-tower-lens'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>15
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section slct-section--pulse"><h2>Sales execution lifecycle</h2><p>Follow each IMART sale from enquiry to tax invoice. Every stage below is live and opens its operational register.</p></div><div class="slct-toolbar"><span class="slct-'
||unistr('filter">Scope <b>Current company</b></span><span class="slct-filter">View <b>End-to-end lifecycle</b></span><span class="slct-filter">Measure <b>Documents &amp; exceptions</b></span><span class="slct-live">\25CF LIVE CONTROL TOWER</span></div><div class=')
||'"slct-heading"><h2>Lifecycle register flow</h2><span>Read left to right; click a stage card to open its operational register.</span></div><div class="slct-flow"><div class="slct-stage"><span>01</span><b>Enquiry</b></div><div class="slct-stage"><span>'
||'02</span><b>Quotation</b></div><div class="slct-stage"><span>03</span><b>PO Receipt</b></div><div class="slct-stage"><span>04</span><b>Sales Order</b></div><div class="slct-stage"><span>05</span><b>Loading</b></div><div class="slct-stage"><span>06</s'
||'pan><b>Dispatch</b></div><div class="slct-stage"><span>07</span><b>Material Out</b></div><div class="slct-stage"><span>08</span><b>Weighment</b></div><div class="slct-stage"><span>09</span><b>CC Invoice</b></div><div class="slct-stage"><span>10</span'
||'><b>E-Invoice</b></div></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000066)
,p_plug_name=>'Control Tower Registers'
,p_static_id=>'control-tower-registers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section"><h2>Operational registers</h2><p>Open the source register or customer control page for the stage that owns it.</p></div><div class="slct-registers"><a class="slct-register" href="f?p=&APP_ID.:704:&APP_SESSION."><i class="fa fa-file-text-o"></i><span><b>Quotation register</b><small>Offers and conversions</small></span></a><a class="slct-register" href="f?p=&APP_ID.:170:&APP_SESSION."><i class="fa fa-cart-check"></i><span><b>Sales order register</b><small>Execution readiness</small></span></a><a class="slct-register" href="f?p=&APP_ID.:160:&APP_SESSION."><i class="fa fa-truck"></i><span><b>Dispatch register</b><small>Despatch hand-offs</small></span></a><a class="slct-register" href="f?p=&APP_ID.:174:&APP_SESSION."><i class="fa fa-inr"></i><span><b>CC invoice register</b><small>Billing and compliance</small></span></a><a class="slct-register" href="f?p=&APP_ID.:511:&APP_SESSION."><i class="fa fa-user"></i><span><b>Customer 360</b><small>One customer from every angle</small></span></a><a class="slct-register" href="f?p=&APP_ID.:911:&APP_SESSION."><i class="fa fa-download"></i><span><b>Receipts &amp; collections</b><small>Receipt, bank and allocation position</small></span></a><a class="slct-register" href="f?p=&APP_ID.:908:&APP_SESSION."><i class="fa fa-balance-scale"></i><span><b>Customer outstanding</b><small>Net exposure and ageing</small></span></a><a class="slct-register" href="f?p=&APP_ID.:54:&APP_SESSION."><i class="fa fa-cubes"></i><span><b>Category master</b><small>Product classification source</small></span></a></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000151)
,p_plug_name=>'Documents Behind the Selected Exception'
,p_static_id=>'exception-documents'
,p_region_css_classes=>'slct-stage-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>58
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with exception_docs as (',
'select ''QUOTE_NO_PO'' drill,''Quoted, no PO'' exception_type,q.salesquotationno document_no,q.salesquotationdate document_date,nvl(getpartyname(q.partycode),q.partycode) party_name,nvl(q.salesquotationamount,0) amount,''No PO received against quotation'' '
||'exception_detail,''Follow up commercial closure'' required_action,apex_util.prepare_url(''f?p=&APP_ID.:705:&APP_SESSION.::NO:705:P705_TNO:''||q.tno) form_url from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=nvl(to_d'
||'ate(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from poreceipt p where p.salesquotationtno=q.tno)',
'union all select ''PO_NO_ORDER'',''PO, no Sales Order'',p.poreceiptno,p.poreceiptdate,nvl(getpartyname(p.partycode),p.partycode),nvl(p.poreceiptamount,0),''No sales order against PO receipt'',''Create or reconcile sales order'',apex_util.prepare_url(''f?p=&AP'
||'P_ID.:274:&APP_SESSION.::NO:274:P274_TNO:''||p.tno) from poreceipt p where p.companycode=:GLOBAL_COMPANYCODE and p.poreceiptdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and p.poreceiptdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1'
||',date''2999-12-31'') and not exists (select 1 from salesorder s where s.poreceipttno=p.tno)',
'union all select ''ORDER_NO_DISPATCH'',''Sales Order, no Dispatch'',s.salesorderno,s.salesorderdate,nvl(getpartyname(s.partycode),s.partycode),nvl(s.salesorderamount,0),''No dispatch advice against sales order'',''Schedule dispatch and confirm vehicle readi'
||'ness'',apex_util.prepare_url(''f?p=&APP_ID.:171:&APP_SESSION.::NO:171:P171_TNO:''||s.tno) from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nv'
||'l(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from despatchadvice d where d.salesordertno=s.tno)',
'union all select ''INVOICE_NO_EINVOICE'',''CC Invoice, no E-Invoice'',c.ccinvoiceno,c.ccinvoicedate,nvl(getpartyname(c.partycode),c.partycode),nvl(c.ccinvoiceamount,0),''No active e-invoice / IRN against CC invoice'',''Generate or retry the e-invoice IRN'',a'
||'pex_util.prepare_url(''f?p=&APP_ID.:175:&APP_SESSION.::NO:175:P175_TNO:''||c.tno) from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date('
||':P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from einvoice e where e.ccinvoicetno=c.tno and e.canceldate is null)',
'union all select ''INFO'',''Choose an exception above'',''Click its record count'',cast(null as date),null,cast(null as number),''Interactive register supports search, filters and export.'',''Select a condition'',null from dual where :P721_DRILL is null',
') select exception_type,document_no,document_date,party_name,amount,exception_detail,required_action,form_url from exception_docs where drill=:P721_DRILL or (drill=''INFO'' and :P721_DRILL is null) order by document_date desc nulls last,document_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Sales Lifecycle Exception Documents'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(70000000000000000152)
,p_max_row_count=>'100000'
,p_max_rows_per_page=>'20'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>70000000000000000152
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000157)
,p_db_column_name=>'AMOUNT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'VALUE AT RISK'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000155)
,p_db_column_name=>'DOCUMENT_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'DOCUMENT DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000154)
,p_db_column_name=>'DOCUMENT_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'DOCUMENT NO'
,p_column_link=>'#FORM_URL#'
,p_column_linktext=>'#DOCUMENT_NO#'
,p_column_link_attr=>'title="Open this transaction form"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000158)
,p_db_column_name=>'EXCEPTION_DETAIL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'EXCEPTION DETAIL'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000153)
,p_db_column_name=>'EXCEPTION_TYPE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'EXCEPTION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000160)
,p_db_column_name=>'FORM_URL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'FORM URL'
,p_display_in_default_rpt=>'N'
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000156)
,p_db_column_name=>'PARTY_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'PARTY / CUSTOMER'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000159)
,p_db_column_name=>'REQUIRED_ACTION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'REQUIRED ACTION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(70000000000000000161)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'SLCT_EXCEPTION_DOCUMENTS'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EXCEPTION_TYPE:DOCUMENT_NO:DOCUMENT_DATE:PARTY_NAME:AMOUNT:EXCEPTION_DETAIL:REQUIRED_ACTION'
,p_sort_column_1=>'DOCUMENT_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000142)
,p_plug_name=>'Exception Summary by Condition'
,p_static_id=>'exception-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>57
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with exception_rows as (',
'select 1 sort_order,''High'' severity,''Quoted, no PO'' condition_name,count(*) records,nvl(sum(q.salesquotationamount),0) value_at_risk,''Follow up commercial closure'' next_action,''QUOTE_NO_PO'' drill from salesquotation q where q.companycode=:GLOBAL_COMP'
||'ANYCODE and q.salesquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from poreceipt p where p.salesquotationtno=q.t'
||'no)',
'union all select 2,''High'',''PO, no Sales Order'',count(*),nvl(sum(p.poreceiptamount),0),''Create or reconcile sales order'',''PO_NO_ORDER'' from poreceipt p where p.companycode=:GLOBAL_COMPANYCODE and p.poreceiptdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRR'
||'R''),date''1900-01-01'') and p.poreceiptdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from salesorder s where s.poreceipttno=p.tno)',
'union all select 3,''Critical'',''Sales Order, no Dispatch'',count(*),nvl(sum(s.salesorderamount),0),''Schedule dispatch and confirm vehicle readiness'',''ORDER_NO_DISPATCH'' from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=nvl'
||'(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from despatchadvice d where d.salesordertno=s.tno)',
'union all select 4,''High'',''CC Invoice, no E-Invoice'',count(*),nvl(sum(c.ccinvoiceamount),0),''Generate or retry the e-invoice IRN'',''INVOICE_NO_EINVOICE'' from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FR'
||'OM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from einvoice e where e.ccinvoicetno=c.tno and e.canceldate is null)',
') select severity,condition_name,records,value_at_risk,next_action,apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_da'
||'te(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||drill)||''#exception-documents'' records_link from exception_rows order by sort_order'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Sales Lifecycle Exception Summary'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(70000000000000000143)
,p_max_row_count=>'100000'
,p_max_rows_per_page=>'20'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>70000000000000000143
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000145)
,p_db_column_name=>'CONDITION_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'CONDITION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000148)
,p_db_column_name=>'NEXT_ACTION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'REQUIRED ACTION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000146)
,p_db_column_name=>'RECORDS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'RECORDS'
,p_column_link=>'#RECORDS_LINK#'
,p_column_linktext=>'#RECORDS#'
,p_column_link_attr=>'title="Open affected documents"'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000149)
,p_db_column_name=>'RECORDS_LINK'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'RECORDS LINK'
,p_display_in_default_rpt=>'N'
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000144)
,p_db_column_name=>'SEVERITY'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'SEVERITY'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000147)
,p_db_column_name=>'VALUE_AT_RISK'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'VALUE AT RISK'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(70000000000000000150)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'SLCT_EXCEPTION_SUMMARY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEVERITY:CONDITION_NAME:RECORDS:VALUE_AT_RISK:NEXT_ACTION'
,p_sort_column_1=>'SEVERITY'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000141)
,p_plug_name=>'Exception Register Intro'
,p_static_id=>'exception-register-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>56
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>unistr('<div class="slct-section"><h2>Exception register</h2><p>Where the lifecycle needs attention \2014 stuck documents and missing downstream records, ranked by severity. Click a record count to load the exact live records below; every document number opens i')
||'ts IMART transaction form.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000140)
,p_plug_name=>'Executive Pulse'
,p_static_id=>'executive-pulse'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>19
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_from date := nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'');',
'  l_to date := nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR''),trunc(sysdate));',
'  l_so_count number:=0; l_so_value number:=0; l_inv_count number:=0; l_inv_value number:=0;',
'  l_pending_count number:=0; l_pending_value number:=0; l_quote_gap number:=0; l_quote_value number:=0;',
'  l_irn_done number:=0; l_yard number:=0; l_coverage number:=0; l_pending_pct number:=0;',
'  procedure kpi(p_tag varchar2,p_value varchar2,p_label varchar2,p_detail varchar2,p_icon varchar2,p_tone varchar2,p_drill varchar2,p_meter number,p_tip varchar2) is',
'    l_url varchar2(4000);',
'  begin',
'    l_url:=apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(l_from,''DD-MM-RRRR'')||'',''||to_char(l_to,''DD-MM-RRRR'')||'',''||p_drill);',
'    htp.p(''<a class="slct-kpi-card slct-hover" data-tone="''||apex_escape.html_attribute(p_tone)||''" style="--meter:''||to_char(greatest(0,least(100,p_meter)))||''%" data-tooltip="''||apex_escape.html_attribute(p_tip)||''" href="''||apex_escape.html_attrib'
||'ute(l_url)||''"><span class="slct-kpi-top"><span class="slct-kpi-icon"><i class="fa ''||apex_escape.html_attribute(p_icon)||''"></i></span><span class="slct-kpi-tag">''||apex_escape.html(p_tag)||''</span></span><span class="slct-kpi-value">''||apex_escape.'
||'html(p_value)||''</span><span class="slct-kpi-label">''||apex_escape.html(p_label)||''</span><span class="slct-kpi-detail"><span>''||apex_escape.html(p_detail)||''</span><span class="slct-kpi-open">Open register &#8594;</span></span><span class="slct-kpi-'
||'meter"><i></i></span></a>'');',
'  end;',
'begin',
'  select count(*),nvl(sum(salesorderamount),0) into l_so_count,l_so_value from salesorder where companycode=:GLOBAL_COMPANYCODE and salesorderdate>=l_from and salesorderdate<l_to+1;',
'  select count(*),nvl(sum(ccinvoiceamount),0) into l_inv_count,l_inv_value from ccinvoice where companycode=:GLOBAL_COMPANYCODE and ccinvoicedate>=l_from and ccinvoicedate<l_to+1;',
'  select count(*),nvl(sum(s.salesorderamount),0) into l_pending_count,l_pending_value from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=l_from and s.salesorderdate<l_to+1 and not exists (select 1 from despatchadvice d wh'
||'ere d.salesordertno=s.tno);',
'  select count(*),nvl(sum(q.salesquotationamount),0) into l_quote_gap,l_quote_value from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=l_from and q.salesquotationdate<l_to+1 and not exists (select 1 from poreceipt'
||' p where p.salesquotationtno=q.tno);',
'  select count(*) into l_irn_done from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=l_from and c.ccinvoicedate<l_to+1 and exists (select 1 from einvoice e where e.ccinvoicetno=c.tno and e.canceldate is null);',
'  select count(*) into l_yard from materialout m where m.companycode=:GLOBAL_COMPANYCODE and m.gateintime>=sysdate-2 and m.gateouttime is null;',
'  l_coverage:=round(100*l_irn_done/nullif(l_inv_count,0),1); l_pending_pct:=round(100*l_pending_count/nullif(l_so_count,0),1);',
'  htp.p(''<section class="slct-exec"><div class="slct-exec-head"><div><h2>Executive pulse</h2><p>Live, hoverable KPIs for the active period. Each card opens the matching IMART supporting register.</p></div><span class="slct-exec-live">LIVE IMART DATA<'
||'/span></div><div class="slct-kpi-grid">'');',
'  kpi(''Orders'',to_char(l_so_count,''FM999G999G990''),''Sales orders'',to_char(round(l_so_value/10000000,2),''FM999G990D00'')||'' Cr ordered'',''fa-cart-check'',''teal'',''SALES_ORDER'',100,''Sales orders created in the active date range. Click to inspect every orde'
||'r.'');',
'  kpi(''Billing'',''INR ''||to_char(round(l_inv_value/10000000,2),''FM999G990D00'')||'' Cr'',''Invoiced value'',to_char(l_inv_count,''FM999G999G990'')||'' CC invoices'',''fa-inr'',''blue'',''CC_INVOICE'',100,''Gross CC invoice value for the active period. Click to inspec'
||'t invoice documents.'');',
'  kpi(''Execution'',''INR ''||to_char(round(l_pending_value/10000000,2),''FM999G990D00'')||'' Cr'',''Pending order value'',to_char(l_pending_count,''FM999G999G990'')||'' orders have no dispatch'',''fa-hourglass-half'',''rose'',''ORDER_NO_DISPATCH'',l_pending_pct,''Orders'
||' in the active period that do not yet have a dispatch advice. Click for the ranked document register.'');',
'  kpi(''Compliance'',to_char(nvl(l_coverage,0),''FM990D0'')||''%'',''E-invoice coverage'',to_char(l_inv_count-l_irn_done,''FM999G999G990'')||'' invoices without IRN'',''fa-file-code-o'',''amber'',''INVOICE_NO_EINVOICE'',nvl(l_coverage,0),''Active e-invoices divided by '
||'CC invoices in the active period. Click to review missing IRNs.'');',
'  kpi(''Commercial'',to_char(l_quote_gap,''FM999G999G990''),''Quoted, no PO'',''INR ''||to_char(round(l_quote_value/10000000,2),''FM999G990D00'')||'' Cr at risk'',''fa-exchange'',''amber'',''QUOTE_NO_PO'',case when l_quote_gap>0 then 100 else 0 end,''Sales quotations t'
||'hat have not yet been converted to a PO receipt. Click to work the documents.'');',
'  kpi(''Gate'',to_char(l_yard,''FM999G999G990''),''Vehicles inside'',''Gate-in in last 2 days; no gate-out'',''fa-truck'',''teal'',''MATERIAL_OUT'',case when l_yard>0 then 100 else 0 end,''Live vehicle count from Material Out gate times. Click to inspect matching m'
||'ovements.'');',
'  htp.p(''</div></section>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000163)
,p_plug_name=>'Fulfilment Health Intro'
,p_static_id=>'fulfilment-health-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>24
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section"><h2>Fulfilment health</h2><p>Conversion and completion checks from the same live IMART period. Hover a metric for its purpose, then open its supporting register.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000035)
,p_name=>'Handoff Pressure'
,p_static_id=>'handoff-pressure'
,p_template=>3371237801798025892
,p_display_sequence=>36
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--4cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 seq, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',QUOTE'
||unistr('_NO_PO'') card_link, ''Quote awaiting PO'' card_title, to_char(count(*)) card_subtitle, to_char(round(nvl(avg(sysdate-q.salesquotationdate),0)))||'' avg days pending \00B7 documents'' card_text, null card_subtext, ''fa-clock-o'' card_icon, ''fa-arrow-right-alt'' ')
||'card_icon2, ''u-color-9'' card_color2 from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1'
||',date''2999-12-31'') and not exists (select 1 from poreceipt p where p.salesquotationtno=q.tno)',
'union all select 2, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',PO_NO_ORDER''), ''PO awaiting order'', to_char(count(*)), to_char(round(nvl(avg(sysdate-p.poreceiptdate),0)))||'' avg days pending \00B7 documents'', null, ''fa-clock-o'', ''fa-arrow-right-alt'', ''u-color-9'' from poreceipt p where p.companycode=:GLOBAL_COMPANYCO')
||'DE and p.poreceiptdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and p.poreceiptdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from salesorder s where s.poreceipttno=p.tno)',
'union all select 3, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',ORDER_NO_DISPATCH''), ''Order awaiting dispatch'', to_char(count(*)), to_char(round(nvl(avg(sysdate-s.salesorderdate),0)))||'' avg days pending \00B7 documents'', null, ''fa-clock-o'', ''fa-arrow-right-alt'', ''u-color-9'' from salesorder s where s.companycode=:GL')
||'OBAL_COMPANYCODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from despatchadvice d where d.salesordertno=s'
||'.tno)',
'union all select 4, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',INVOICE_NO_EINVOICE''), ''Invoice awaiting e-invoice'', to_char(count(*)), to_char(round(nvl(avg(sysdate-c.ccinvoicedate),0)))||'' avg days pending \00B7 documents'', null, ''fa-clock-o'', ''fa-arrow-right-alt'', ''u-color-9'' from ccinvoice c where c.companycode=')
||':GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from einvoice e where e.ccinvoicetno=c.tno)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000044)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000042)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000043)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000037)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000041)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000039)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000040)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000038)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000036)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000034)
,p_plug_name=>'Handoff Pressure Intro'
,p_static_id=>'handoff-pressure-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>35
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section"><h2>Handoff pressure</h2><p>Ageing of work that has not yet crossed to the next operational stage.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000068)
,p_plug_name=>'Invoiced Value Trend Intro'
,p_static_id=>'invoiced-value-trend-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>43
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section"><h2>Invoiced value trend</h2><p>Monthly invoice value across the selected period. This compact trend stays available even when the host Oracle JET chart assets are unavailable.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000102)
,p_plug_name=>'Item and Agent Performance Intro'
,p_static_id=>'item-agent-performance-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>46
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section"><h2>Item and agent performance</h2><p>Leading invoiced items and commercial agents in the selected period.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000103)
,p_name=>'Item Performance'
,p_static_id=>'item-performance'
,p_template=>3371237801798025892
,p_display_sequence=>47
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--5cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with item_value as (select nvl(i.itemname,nvl(d.itemcode,''Unmapped item'')) item_name,sum(nvl(d.amount,0)) amount,sum(nvl(d.quantity1,0)) qty,count(distinct c.tno) invoices from ccinvoice c join ccinvoicedetail d on d.tno=c.tno left join item i on i.i'
||'temcode=d.itemcode where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') group by nvl(i.itemname,nvl(d.'
||'itemcode,''Unmapped item''))),',
'ranked as (select item_name,amount,qty,invoices,row_number() over(order by amount desc nulls last) rn from item_value) select rn seq,apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_da'
||unistr('te(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',ITEM'') card_link,item_name card_title,to_char(amount,''FM999G999G999G990D00'') card_subtitle,to_char(qty,''FM999G999G990D00'')||'' qty \00B7 ''||t')
||unistr('o_char(invoices)||'' invoices \00B7 register'' card_text,null card_subtext,''fa-cube'' card_icon,''fa-arrow-right-alt'' card_icon2,''u-color-14'' card_color2 from ranked where rn<=5')))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000112)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000110)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000111)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000105)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000109)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000107)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000108)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000106)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000104)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000023)
,p_name=>'Fulfilment Health'
,p_static_id=>'lifecycle-health'
,p_template=>3371237801798025892
,p_display_sequence=>25
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--5cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with k as (select',
'(select count(*) from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31''))'
||' quote_total,',
'(select count(*) from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') '
||'and exists (select 1 from poreceipt p where p.salesquotationtno=q.tno)) quote_po,',
'(select count(*) from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')) order_total'
||',',
'(select count(*) from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and exists ('
||'select 1 from despatchadvice d where d.salesordertno=s.tno)) order_dispatch,',
'(select count(*) from despatchadvice d where d.companycode=:GLOBAL_COMPANYCODE and d.despatchadvicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and d.despatchadvicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31''))'
||' dispatch_total,',
'(select count(*) from despatchadvice d where d.companycode=:GLOBAL_COMPANYCODE and d.despatchadvicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and d.despatchadvicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') '
||'and exists (select 1 from materialout m where m.referencetno=d.tno)) dispatch_out,',
'(select count(*) from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')) invoice_total,',
'(select count(*) from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and exists (sel'
||'ect 1 from einvoice e where e.ccinvoicetno=c.tno)) einvoice_done from dual)',
'select 1 seq, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',QUOTE'
||unistr('_NO_PO'') card_link, ''Quote \2192 PO'' card_title, to_char(nvl(round(100*quote_po/nullif(quote_total,0),1),0),''FM990D0'')||''%'' card_subtitle, ''Commercial conversion \00B7 documents'' card_text, null card_subtext, ''fa-exchange'' card_icon, ''fa-arrow-right-alt'' car')
||'d_icon2, ''u-color-14'' card_color2 from k',
'union all select 2, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',ORDER_NO_DISPATCH''), ''Order \2192 Dispatch'', to_char(nvl(round(100*order_dispatch/nullif(order_total,0),1),0),''FM990D0'')||''%'', ''Fulfilment coverage \00B7 documents'', null, ''fa-truck'', ''fa-arrow-right-alt'', ''u-color-14'' from k'),
'union all select 3, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',DISPATCH''), ''Dispatch \2192 Material Out'', to_char(nvl(round(100*dispatch_out/nullif(dispatch_total,0),1),0),''FM990D0'')||''%'', ''Release completion \00B7 documents'', null, ''fa-sign-out'', ''fa-arrow-right-alt'', ''u-color-14'' from k'),
'union all select 4, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||unistr(',INVOICE_NO_EINVOICE''), ''Invoice \2192 E-Invoice'', to_char(nvl(round(100*einvoice_done/nullif(invoice_total,0),1),0),''FM990D0'')||''%'', ''Statutory completion \00B7 documents'', null, ''fa-file-code-o'', ''fa-arrow-right-alt'', ''u-color-14'' from k'),
'union all select 5, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'''
||',CC_INVOICE''), ''CC Invoice Value'', to_char(nvl((select sum(c.ccinvoiceamount) from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P'
 ||unistr('721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')),0)/10000000,''FM999G990D00'')||'' Cr'' card_subtitle, ''Billing value \00B7 documents'', null, ''fa-inr'', ''fa-arrow-right-alt'', ''u-color-14'' from dual')))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000032)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000030)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000031)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000025)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000029)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000027)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000028)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000026)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000024)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000002)
,p_name=>'Lifecycle Snapshot'
,p_static_id=>'lifecycle-snapshot'
,p_template=>3371237801798025892
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--5cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 seq, case when check_module_view_access(''SALESENQUIRY'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR'''
||unistr('),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',ENQUIRY'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end card_link, ''Sales Enquiry'' card_title, to_char(count(*)) card_subtitle, ''Demand captured \00B7 cli')
||'ck for register'' card_text, null card_subtext, ''fa-search'' card_icon, ''fa-arrow-right-alt'' card_icon2, ''u-color-14'' card_color2 from salesenquiry where companycode=:GLOBAL_COMPANYCODE and salesenquirydate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),da'
||'te''1900-01-01'') and salesenquirydate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select 2, case when check_module_view_access(''SALESQUOTATION'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-'
||unistr('MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',QUOTATION'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''Sales Quotation'', to_char(count(*)), ''Commercial offer \00B7 click for register'', null')
||', ''fa-file-text-o'', ''fa-arrow-right-alt'', ''u-color-14'' from salesquotation where companycode=:GLOBAL_COMPANYCODE and salesquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-'
||'MM-RRRR'')+1,date''2999-12-31'')',
'union all select 3, case when check_module_view_access(''PORECEIPT'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RR'
||unistr('RR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',PO_RECEIPT'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''PO Receipt'', to_char(count(*)), ''Customer commitment \00B7 click for register'', null, ''fa-')
||'cart-arrow-down'', ''fa-arrow-right-alt'', ''u-color-14'' from poreceipt where companycode=:GLOBAL_COMPANYCODE and poreceiptdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and poreceiptdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date'''
||'2999-12-31'')',
'union all select 4, case when check_module_view_access(''SALESORDER'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-R'
||unistr('RRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',SALES_ORDER'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''Sales Order'', to_char(count(*)), ''Order execution \00B7 click for register'', null, ''fa-c')
||'art-check'', ''fa-arrow-right-alt'', ''u-color-14'' from salesorder where companycode=:GLOBAL_COMPANYCODE and salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''299'
||'9-12-31'')',
'union all select 5, case when check_module_view_access(''LOADINGADVICE'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-M'
||unistr('M-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',LOADING'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''Loading Advice'', to_char(count(*)), ''Loading planned \00B7 click for register'', null, ''fa')
||'-truck'', ''fa-arrow-right-alt'', ''u-color-14'' from loadingadvice where companycode=:GLOBAL_COMPANYCODE and loadingadvicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and loadingadvicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,da'
||'te''2999-12-31'')',
'union all select 6, case when check_module_view_access(''DESPATCHADVICE'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-'
||unistr('MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',DISPATCH'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''Dispatch Advice'', to_char(count(*)), ''Dispatch scheduled \00B7 click for register'', nul')
||'l, ''fa-truck'', ''fa-arrow-right-alt'', ''u-color-14'' from despatchadvice where companycode=:GLOBAL_COMPANYCODE and despatchadvicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and despatchadvicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RR'
||'RR'')+1,date''2999-12-31'')',
'union all select 7, case when check_module_view_access(''MATERIALOUT'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-'
||unistr('RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',MATERIAL_OUT'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''Material Out'', to_char(count(*)), ''Goods released \00B7 click for register'', null, ''fa')
||'-sign-out'', ''fa-arrow-right-alt'', ''u-color-14'' from materialout where companycode=:GLOBAL_COMPANYCODE and materialoutdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and materialoutdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date'''
||'2999-12-31'')',
'union all select 8, case when check_module_view_access(''WEIGHMENT'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RR'
||unistr('RR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',WEIGHMENT'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''Weighment'', to_char(count(*)), ''Weight captured \00B7 click for register'', null, ''fa-balanc')
||'e-scale'', ''fa-arrow-right-alt'', ''u-color-14'' from weighment where companycode=:GLOBAL_COMPANYCODE and weighmentdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and weighmentdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-'
||'31'')',
'union all select 9, case when check_module_view_access(''CCINVOICE'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RR'
||unistr('RR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',CC_INVOICE'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''CC Invoice'', to_char(count(*)), ''Billing complete \00B7 click for register'', null, ''fa-inr')
||''', ''fa-arrow-right-alt'', ''u-color-14'' from ccinvoice where companycode=:GLOBAL_COMPANYCODE and ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select 10, case when check_module_view_access(''EINVOICE'',:APP_USER,:GLOBAL_COMPANYCODE)=1 then apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RR'
||unistr('RR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',EINVOICE'') else apex_util.prepare_url(''f?p=&APP_ID.:4:&APP_SESSION.'') end, ''E-Invoice'', to_char(count(*)), ''Tax document \00B7 click for register'', null, ''fa-file-code-')
||'o'', ''fa-arrow-right-alt'', ''u-color-14'' from einvoice e where e.invoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and e.invoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and exists (select 1 from ccinvoice '
||'c where c.tno=e.ccinvoicetno and c.companycode=:GLOBAL_COMPANYCODE)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000011)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000009)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000010)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000004)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000008)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000006)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000007)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000005)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000003)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000126)
,p_plug_name=>'Live Commercial Graphs'
,p_static_id=>'live-commercial-graphs'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>43
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_from       date := nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'');',
'  l_to         date := nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR''),trunc(sysdate));',
'  l_month_max  number := 1;',
'  l_cat_max    number := 1;',
'  l_quote      number := 0;',
'  l_order      number := 0;',
'  l_invoice    number := 0;',
'  l_total      number := 1;',
'  l_pct_quote  number := 0;',
'  l_pct_order  number := 0;',
'  l_plot_left  number := 58;',
'  l_plot_top   number := 18;',
'  l_plot_width number := 620;',
'  l_plot_height number := 178;',
'  l_x          number;',
'  l_y_quote    number;',
'  l_y_order    number;',
'  l_y_invoice  number;',
'  l_q_path     varchar2(32767);',
'  l_o_path     varchar2(32767);',
'  l_i_path     varchar2(32767);',
'  l_url        varchar2(4000);',
'  type t_month_record is record (month_start date, quote_amount number, order_amount number, invoice_amount number);',
'  type t_months is table of t_month_record index by pls_integer;',
'  l_months     t_months;',
'  l_month_count pls_integer := 0;',
'  function svg_num(p_value number) return varchar2 is begin return to_char(nvl(p_value,0),''FM9999990D00'',''NLS_NUMERIC_CHARACTERS=''''.,''''''); end;',
'  function line_y(p_value number) return number is begin return l_plot_top+l_plot_height*(1-nvl(p_value,0)/l_month_max); end;',
'begin',
'  select greatest(nvl(max(amount),0),1) into l_cat_max',
'    from (select sum(nvl(d.amount,0)) amount from ccinvoice c join ccinvoicedetail d on d.tno=c.tno where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=l_from and c.ccinvoicedate<l_to+1 group by d.itemcode);',
'  select count(*) into l_quote from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=l_from and q.salesquotationdate<l_to+1 and not exists (select 1 from poreceipt p where p.salesquotationtno=q.tno);',
'  select count(*) into l_order from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=l_from and s.salesorderdate<l_to+1 and not exists (select 1 from despatchadvice d where d.salesordertno=s.tno);',
'  select count(*) into l_invoice from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=l_from and c.ccinvoicedate<l_to+1 and not exists (select 1 from einvoice e where e.ccinvoicetno=c.tno and e.canceldate is null);',
'  l_total := greatest(l_quote+l_order+l_invoice,1);',
'  l_pct_quote := round(100*l_quote/l_total,2);',
'  l_pct_order := round(100*l_order/l_total,2);',
'  for r in (with win as (select trunc(l_from,''MM'') from_month,trunc(l_to,''MM'') to_month from dual),',
'                 months as (select add_months(from_month,level-1) month_start from win connect by level<=months_between(to_month,from_month)+1),',
'                 quotes as (select trunc(q.salesquotationdate,''MM'') month_start,sum(nvl(q.salesquotationamount,0)) amount from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=l_from and q.salesquotationdate<l_to+1 g'
||'roup by trunc(q.salesquotationdate,''MM'')),',
'                 orders as (select trunc(s.salesorderdate,''MM'') month_start,sum(nvl(s.salesorderamount,0)) amount from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=l_from and s.salesorderdate<l_to+1 group by trunc(s.sale'
||'sorderdate,''MM'')),',
'                 invoices as (select trunc(c.ccinvoicedate,''MM'') month_start,sum(nvl(c.ccinvoiceamount,0)) amount from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=l_from and c.ccinvoicedate<l_to+1 group by trunc(c.ccinvoi'
||'cedate,''MM''))',
'            select m.month_start,nvl(q.amount,0) quote_amount,nvl(o.amount,0) order_amount,nvl(i.amount,0) invoice_amount from months m left join quotes q on q.month_start=m.month_start left join orders o on o.month_start=m.month_start left join invo'
||'ices i on i.month_start=m.month_start order by m.month_start)',
'  loop',
'    l_month_count:=l_month_count+1;',
'    l_months(l_month_count).month_start:=r.month_start;',
'    l_months(l_month_count).quote_amount:=r.quote_amount;',
'    l_months(l_month_count).order_amount:=r.order_amount;',
'    l_months(l_month_count).invoice_amount:=r.invoice_amount;',
'    l_month_max:=greatest(l_month_max,r.quote_amount,r.order_amount,r.invoice_amount);',
'  end loop;',
'  for n in 1..l_month_count loop',
'    if l_month_count=1 then l_x:=l_plot_left+l_plot_width/2; else l_x:=l_plot_left+(n-1)*l_plot_width/(l_month_count-1); end if;',
'    l_y_quote:=line_y(l_months(n).quote_amount); l_y_order:=line_y(l_months(n).order_amount); l_y_invoice:=line_y(l_months(n).invoice_amount);',
'    l_q_path:=l_q_path||case when n=1 then ''M '' else '' L '' end||svg_num(l_x)||'' ''||svg_num(l_y_quote);',
'    l_o_path:=l_o_path||case when n=1 then ''M '' else '' L '' end||svg_num(l_x)||'' ''||svg_num(l_y_order);',
'    l_i_path:=l_i_path||case when n=1 then ''M '' else '' L '' end||svg_num(l_x)||'' ''||svg_num(l_y_invoice);',
'  end loop;',
'  htp.p(''<div class="slct-graph-wrap"><section class="slct-graph slct-lifecycle-trend"><h3>Lifecycle trend</'
||'h3><p>Monthly quotation, sales-order and CC-invoice value (INR Cr).</p><div class="slct-line-frame"><svg class="slct-line-chart" viewBox="0 0 720 240" role="img" aria-label="IMART lifecycle value trend"><defs><linearGradient id="slct-area-quote" x1="0" y1="0" x2="0" y2="1"><stop offset="0%" stop-color="#2E73C4"/><stop offset="100%" stop-color="#fff"/></linearGradient><linearGradient id="slct-area-order" x1="0" y1="0" x2="0" y2="1"><stop offset="0%" stop-color="#4CAF7D"/><stop offset="100%" stop-color="#fff"/></linearGradient><linearGradient id="slct-area-invoice" x1="0" y1="0" x2="0" y2="1"><stop offset="0%" stop-color="#26A69A"/><stop offset="100%" stop-color="#fff"/></linearGradient></defs><text x="58" y="12" class="slct-line-axis-title">Value (INR Cr)</text>'');',
'  for g in 0..4 loop',
'    htp.p(''<line class="slct-line-grid" x1="''||svg_num(l_plot_left)||''" y1="''||svg_num(l_plot_top+l_plot_height*g/4)||''" x2="''||svg_num(l_plot_left+l_plot_width)||''" y2="''||svg_num(l_plot_top+l_plot_height*g/4)||''"/><text class="slct-line-axis" x="''|'
||'|svg_num(l_plot_left-9)||''" y="''||svg_num(l_plot_top+l_plot_height*g/4+4)||''">''||apex_escape.html(to_char(round((l_month_max*(4-g)/4)/10000000,0),''FM999G990''))||''</text>'');',
'  end loop;',
'  htp.p(''<line class="slct-line-axis-base" x1="''||svg_num(l_plot_left)||''" y1="''||svg_num(l_plot_top+l_plot_height)||''" x2="''||svg_num(l_plot_left+l_plot_width)||''" y2="''||svg_num(l_plot_top+l_plot_height)||''"/><path class="slct-line-area slct-line-quote" fill="url(#slct-area-quote)" d="''||l_q_path||'' L ''||svg_num(l_plot_left+l_plot_width)||'' ''||svg_num(l_plot_top+l_plot_height)||'' L ''||svg_num(l_plot_left)||'' ''||svg_num(l_plot_top+l_plot_height)||'' Z"/><path class="slct-line-area slct-line-order" fill="url(#slct-area-order)" d="''||l_o_path||'' L ''||svg_num(l_plot_left+l_plot_width)||'' ''||svg_num(l_plot_top+l_plot_height)||'' L ''||svg_num(l_plot_left)||'' ''||svg_num(l_plot_top+l_plot_height)||'' Z"/><path class="slct-line-area slct-line-invoice" fill="url(#slct-area-invoice)" d="''||l_i_path||'' L ''||svg_num(l_plot_left+l_plot_width)||'' ''||svg_num(l_plot_top+l_plot_height)||'' L ''||svg_num(l_plot_left)||'' ''||svg_num(l_plot_top+l_plot_height)||'' Z"/><path class="slct-line-path slct-line-quote" d="''||l_q_path||''"/><path class="slct-line-path slct-line-order" d="''||l_o_path||''"/><path class="slct-line-path slct-line-invoice" d="''||l_i_path||''"/>'');',
'  for n in 1..l_month_count loop',
'    if l_month_count=1 then l_x:=l_plot_left+l_plot_width/2; else l_x:=l_plot_left+(n-1)*l_plot_width/(l_month_count-1); end if;',
'    l_y_quote:=line_y(l_months(n).quote_amount); l_y_order:=line_y(l_months(n).order_amount); l_y_invoice:=line_y(l_months(n).invoice_amount);',
'    htp.p(''<text class="slct-line-xlabel" x="''||svg_num(l_x)||''" y="''||svg_num(l_plot_top+l_plot_height+23)||''">''||apex_escape.html(to_char(l_months(n).month_start,''MON YY''))||''</text>'');',
'    for s in 1..3 loop',
'      if s=1 then l_url:=apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(greatest(l_months(n).month_start,l_from),''DD-MM-RRRR'')||'',''||to_char(least(last_day(l_months(n).month_start),l_to'
||'),''DD-MM-RRRR'')||'',SALES_QUOTATION''); htp.p(''<a href="''||apex_escape.html_attribute(l_url)||''" aria-label="Open quotation documents for ''||apex_escape.html_attribute(to_char(l_months(n).month_start,''MON YYYY''))||''"><circle class="slct-line-point slct'
||unistr('-line-quote slct-hover" cx="''||svg_num(l_x)||''" cy="''||svg_num(l_y_quote)||''" r="4" tabindex="0" data-tip-title="''||apex_escape.html_attribute(to_char(l_months(n).month_start,''MON YYYY''))||''" data-tip-color="#2E73C4" data-tooltip="Quotation (INR Cr): ''||to_char(l_months(n).quote_amount/10000000,''FM999G999')
||'G999G990D00'')||''"/></a>'');',
'      elsif s=2 then l_url:=apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(greatest(l_months(n).month_start,l_from),''DD-MM-RRRR'')||'',''||to_char(least(last_day(l_months(n).month_start),l'
||'_to),''DD-MM-RRRR'')||'',SALES_ORDER''); htp.p(''<a href="''||apex_escape.html_attribute(l_url)||''" aria-label="Open sales-order documents for ''||apex_escape.html_attribute(to_char(l_months(n).month_start,''MON YYYY''))||''"><circle class="slct-line-point slc'
||unistr('t-line-order slct-hover" cx="''||svg_num(l_x)||''" cy="''||svg_num(l_y_order)||''" r="4" tabindex="0" data-tip-title="''||apex_escape.html_attribute(to_char(l_months(n).month_start,''MON YYYY''))||''" data-tip-color="#4CAF7D" data-tooltip="Sales Order (INR Cr): ''||to_char(l_months(n).order_amount/10000000,''FM999G')
||'999G999G990D00'')||''"/></a>'');',
'      else l_url:=apex_util.prepare_url(''f?p=&APP_ID.:721:&APP_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(greatest(l_months(n).month_start,l_from),''DD-MM-RRRR'')||'',''||to_char(least(last_day(l_months(n).month_start),l_to),''DD-M'
||'M-RRRR'')||'',CC_INVOICE''); htp.p(''<a href="''||apex_escape.html_attribute(l_url)||''" aria-label="Open CC-invoice documents for ''||apex_escape.html_attribute(to_char(l_months(n).month_start,''MON YYYY''))||''"><circle class="slct-line-point slct-line-invoi'
||unistr('ce slct-hover" cx="''||svg_num(l_x)||''" cy="''||svg_num(l_y_invoice)||''" r="4" tabindex="0" data-tip-title="''||apex_escape.html_attribute(to_char(l_months(n).month_start,''MON YYYY''))||''" data-tip-color="#26A69A" data-tooltip="CC Invoice (INR Cr): ''||to_char(l_months(n).invoice_amount/10000000,''FM999G999G999')
||'G990D00'')||''"/></a>''); end if;',
'    end loop;',
'  end loop;',
'  htp.p(''</svg></div><div class="slct-line-legend"><button type="button" data-series="slct-line-quote" aria-pressed="true"><i class="slct-line-quote"></i>Quotation (INR Cr)</button><button type="button" data-series="slct-line-order" aria-pressed="true"><i class="slct-line-order"></i>Sales Order (INR Cr)</button><button type="button" data-series="slct-line-invoice" aria-pressed="true"><i class="slct-line-invoice"></i>CC Invoice (INR Cr)</button></div><p'
||' class="slct-chart-note">Click a point to open the matching IMART month and stage documents.</p></section><section class="slct-graph"><h3>Exception mix</h3><p>Hover the live mix, then click a matching action card to open its document register.</p><di'
 ||'v class="slct-donut-row"><div class="slct-donut-chart"><svg viewBox="0 0 100 100" role="img" aria-label="Exception mix by condition"><circle class="slct-donut-track" cx="50" cy="50" r="38" pathLength="100"/><circle class="slct-donut-segment slct-hover" cx="50" cy="50" r="38" pathLength="100" tabindex="0" stroke="#2E73C4" stroke-dasharray="''||svg_num(l_pct_quote)||'' ''||svg_num(100-l_pct_quote)||''" stroke-dashoffset="0" data-tip-title="Quoted, no PO" data-tip-color="#2E73C4" data-tooltip="Records: ''||to_char(l_quote)||'' | Share: ''||to_char(l_pct_quote,''FM990D0'')||''%"/><circle class="slct-donut-segment slct-hover" cx="50" cy="50" r="38" pathLength="100" tabindex="0" stroke="#26A69A" stroke-dasharray="''||svg_num(l_pct_order)||'' ''||svg_num(100-l_pct_order)||''" stroke-dashoffset="-''||svg_num(l_pct_quote)||''" data-tip-title="Order, no dispatch" data-tip-color="#26A69A" data-tooltip="Records: ''||to_char(l_order)||'' | Share: ''||to_char(l_pct_order,''FM990D0'')||''%"/><circle class="slct-donut-segment slct-hover" cx="50" cy="50" r="38" pathLength="100" tabindex="0" stroke="#4CAF7D" stroke-dasharray="''||svg_num(100-l_pct_quote-l_pct_order)||'' ''||svg_num(l_pct_quote+l_pct_order)||''" stroke-dashoffset="-''||svg_num(l_pct_quote+l_pct_order)||''" data-tip-title="Invoice, no e-invoice" data-tip-color="#4CAF7D" data-tooltip="Records: ''||to_char(l_invoice)||'' | Share: ''||to_char(100-l_pct_quote-l_pct_order,''FM990D0'')||''%"/></svg><span><small>TOTAL</small>''||to_char(l_quote+l_order+l_invoice)||''</span></div><div class="slct-donut-key"><button type="button" class="slct-hover" data-tip-mode="compact" data-tooltip="Quoted, no PO: ''||to_char(l_quote)||''" style="--dot:#2E73C4"><i></i>Quoted, no PO: '
 ||'''||to_char(l_quote)||''</button><button type="button" class="slct-hover" data-tip-mode="compact" data-tooltip="Order, no dispatch: ''||to_char(l_order)||''" style="--dot:#26A69A"><i></i>Order, no dispatch: ''||to_char(l_order)||''</button><button type="button" class="slct-hover" data-tip-mode="compact" data-tooltip="Invoice, no e-invoice: ''||to_char(l_invoice)||''" style="--dot:#4CAF7D"><i></i>Invoice, no e-invoice: ''||to_char(l_invoice)||''</button></div></div><p class="slct-chart-note">Hover an individual segment to see that condition only.</p></section><section class="slct-graph"><h3>Ca'
||'tegory mix</h3><p>Top invoiced categories by taxable line amount. Category cards below open the supporting register.</p>'');',
'  for r in (select * from (select nvl(ic.itemcategoryname,''Uncategorised'') category_name,sum(nvl(d.amount,0)) amount from ccinvoice c join ccinvoicedetail d on d.tno=c.tno left join item i on i.itemcode=d.itemcode left join itemcategory ic on ic.item'
||'categorycode=i.itemcategorycode where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=l_from and c.ccinvoicedate<l_to+1 group by nvl(ic.itemcategoryname,''Uncategorised'') order by amount desc nulls last) where rownum<=8)',
'  loop',
unistr('    htp.p(''<div class="slct-hbar slct-hover" tabindex="0" data-tip-mode="compact" data-tooltip="''||apex_escape.html_attribute(r.category_name||'' \00B7 Invoiced Value (INR Cr): ''||to_char(r.amount/10000000,''FM999G990D00''))||''"><span title="''||apex_escape.html_attribute(r.category_n')
||'ame)||''">''||apex_escape.html(r.category_name)||''</span><i style="width:''||to_char(greatest(2,least(100,round(100*r.amount/l_cat_max))))||''%"></i><b>INR ''||to_char(round(r.amount/10000000,2),''FM999G990D00'')||'' Cr</b></div>'');',
'  end loop;',
'  htp.p(''</section></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000167)
,p_plug_name=>'Sales Lifecycle Card Detail Runtime'
,p_static_id=>'sales-lifecycle-card-detail-runtime'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>7
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>#R70000000000000000023 .t-Card-body,#R70000000000000000012 .t-Card-body,#R70000000000000000035 .t-Card-body,#R70000000000000000078 .t-Card-body{display:block!important}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000166)
,p_plug_name=>'Sales Lifecycle Card Runtime'
,p_static_id=>'sales-lifecycle-card-runtime'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>/* Compact control-tower treatment for live APEX card regions. */#R70000000000000000023 .t-Cards-item,#R70000000000000000012 .t-Cards-item,#R70000000000000000035 .t-Cards-item,#R70000000000000000078 .t-Cards-item{--slct-card:#0f766e;--slct-car'
||'d-soft:#e5f3f1}#R70000000000000000012 .t-Cards-item:nth-child(1),#R70000000000000000035 .t-Cards-item:nth-child(1){--slct-card:#d97706;--slct-card-soft:#fff3df}#R70000000000000000012 .t-Cards-item:nth-child(2),#R70000000000000000035 .t-Cards-item:nth'
||'-child(2){--slct-card:#0891b2;--slct-card-soft:#e2f5f8}#R70000000000000000012 .t-Cards-item:nth-child(3),#R70000000000000000035 .t-Cards-item:nth-child(3){--slct-card:#0f8f8b;--slct-card-soft:#e3f6f3}#R70000000000000000012 .t-Cards-item:nth-child(4),'
||'#R70000000000000000035 .t-Cards-item:nth-child(4){--slct-card:#1f9d68;--slct-card-soft:#e5f6ec}#R70000000000000000023 .t-Cards-item:nth-child(2),#R70000000000000000078 .t-Cards-item:nth-child(2){--slct-card:#0891b2;--slct-card-soft:#e2f5f8}#R70000000'
||'000000000023 .t-Cards-item:nth-child(3),#R70000000000000000078 .t-Cards-item:nth-child(3){--slct-card:#7c3aed;--slct-card-soft:#f0eaff}#R70000000000000000023 .t-Cards-item:nth-child(4),#R70000000000000000078 .t-Cards-item:nth-child(4){--slct-card:#1f'
||'9d68;--slct-card-soft:#e5f6ec}#R70000000000000000023 .t-Card,#R70000000000000000012 .t-Card,#R70000000000000000035 .t-Card,#R70000000000000000078 .t-Card{min-height:122px!important;overflow:hidden!important;border:1px solid #cde5e2!important;border-r'
||'adius:13px!important;background:linear-gradient(145deg,#fff 0%,#f8fcfb 100%)!important;box-shadow:0 5px 15px rgba(15,76,69,.07)!important}#R70000000000000000023 .t-Card-wrap,#R70000000000000000012 .t-Card-wrap,#R70000000000000000035 .t-Card-wrap,#R70'
||'000000000000000078 .t-Card-wrap{position:relative!important;display:grid!important;grid-template-columns:minmax(0,1fr) 38px!important;grid-template-rows:auto 1fr auto!important;gap:4px 10px!important;min-height:122px!important;padding:14px 14px 12px!'
||'important;color:#0b3b36!important;text-decoration:none!important}#R70000000000000000023 .t-Card-titleWrap,#R70000000000000000012 .t-Card-titleWrap,#R70000000000000000035 .t-Card-titleWrap,#R70000000000000000078 .t-Card-titleWrap{grid-column:1!importa'
||'nt;grid-row:1 / span 2!important;min-width:0!important;padding:0!important}#R70000000000000000023 .t-Card-title,#R70000000000000000012 .t-Card-title,#R70000000000000000035 .t-Card-title,#R70000000000000000078 .t-Card-title{margin:0!important;color:#1'
||'63f3a!important;font-size:13px!important;font-weight:750!important;line-height:1.18!important}#R70000000000000000023 .t-Card-subtitle,#R70000000000000000012 .t-Card-subtitle,#R70000000000000000035 .t-Card-subtitle,#R70000000000000000078 .t-Card-subti'
||'tle{margin:5px 0 0!important;color:var(--slct-card)!important;font-size:26px!important;font-weight:800!important;line-height:1!important;letter-spacing:-.035em!important}#R70000000000000000023 .t-Card-icon,#R70000000000000000012 .t-Card-icon,#R700000'
||'00000000000035 .t-Card-icon,#R70000000000000000078 .t-Card-icon{position:static!important;grid-column:2!important;grid-row:1!important;display:grid!important;place-items:center!important;align-self:start!important;width:38px!important;height:38px!imp'
||'ortant;margin:0!important;border-radius:11px!important;background:var(--slct-card)!important;color:#fff!important}#R70000000000000000023 .t-Card-icon .t-Icon,#R70000000000000000012 .t-Card-icon .t-Icon,#R70000000000000000035 .t-Card-icon .t-Icon,#R70'
||'000000000000000078 .t-Card-icon .t-Icon{font-size:16px!important}#R70000000000000000023 .t-Card-body,#R70000000000000000012 .t-Card-body,#R70000000000000000035 .t-Card-body,#R70000000000000000078 .t-Card-body{grid-column:1!important;grid-row:3!import'
||'ant;min-width:0!important;margin:0!important;padding:0!important;align-self:end!important}#R70000000000000000023 .t-Card-desc,#R70000000000000000012 .t-Card-desc,#R70000000000000000035 .t-Card-desc,#R70000000000000000078 .t-Card-desc{display:-webkit-'
||'box!important;overflow:hidden!important;color:#54706d!important;font-size:10.5px!important;line-height:1.25!important;-webkit-box-orient:vertical!important;-webkit-line-clamp:2!important}#R70000000000000000023 .t-Card-icon2,#R70000000000000000012 .t-'
||'Card-icon2,#R70000000000000000035 .t-Card-icon2,#R70000000000000000078 .t-Card-icon2{position:static!important;grid-column:2!important;grid-row:3!important;display:grid!important;place-items:center!important;justify-self:end!important;align-self:end!'
||'important;width:26px!important;height:26px!important;margin:0!important;border-radius:8px!important;background:var(--slct-card-soft)!important;color:var(--slct-card)!important}#R70000000000000000023 .t-Card-icon2 .t-Icon2,#R70000000000000000012 .t-Ca'
||'rd-icon2 .t-Icon2,#R70000000000000000035 .t-Card-icon2 .t-Icon2,#R70000000000000000078 .t-Card-icon2 .t-Icon2{font-size:12px!important}#R70000000000000000023 .t-Card-colorFill,#R70000000000000000012 .t-Card-colorFill,#R70000000000000000035 .t-Card-co'
||'lorFill,#R70000000000000000078 .t-Card-colorFill{position:absolute!important;right:0!important;bottom:0!important;left:0!important;width:auto!important;height:4px!important;background:var(--slct-card)!important;opacity:1!important}#R70000000000000000'
||'012 .t-Card{border-left:1px solid #cde5e2!important}#R70000000000000000023 .t-Card:hover,#R70000000000000000012 .t-Card:hover,#R70000000000000000035 .t-Card:hover,#R70000000000000000078 .t-Card:hover{transform:translateY(-3px)!important;border-color:'
||'var(--slct-card)!important;box-shadow:0 12px 24px rgba(15,118,110,.15)!important}@media(max-width:640px){#R70000000000000000023 .t-Card-wrap,#R70000000000000000012 .t-Card-wrap,#R70000000000000000035 .t-Card-wrap,#R70000000000000000078 .t-Card-wrap{m'
||'in-height:116px!important}}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000165)
,p_plug_name=>'Sales Lifecycle Filter Runtime'
,p_static_id=>'sales-lifecycle-filter-runtime'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>#R70000000000000000073{position:relative!important;display:flex!important;align-items:flex-end!important;gap:12px!important;width:100%!important;margin:10px 0 12px!important;padding:39px 16px 12px!important;border:1px solid #cde5e2!important;b'
||'order-radius:12px!important;background:#fff!important;box-shadow:0 1px 2px rgba(16,24,40,.05),0 8px 22px rgba(15,118,110,.06)!important}#R70000000000000000073:before{content:"FILTERS";position:absolute;top:14px;left:16px;padding-left:22px;color:#5470'
||'6d;font-size:11px;font-weight:700;letter-spacing:.11em;line-height:1;text-transform:uppercase}#R70000000000000000073 .t-Form-fieldContainer{flex:0 0 250px!important;width:250px!important;margin:0!important}#R70000000000000000073 .t-Form-labelContaine'
||'r,#R70000000000000000073 .t-Form-inputContainer{display:block!important;width:100%!important;padding:0!important}#R70000000000000000073 .t-Form-labelContainer{margin-bottom:4px!important}#R70000000000000000073 .t-Form-label{font-size:11px!important;f'
||'ont-weight:700!important;color:#54706d!important}#R70000000000000000073 .t-Button{align-self:flex-end!important;margin:0 0 1px!important;border-radius:9px!important;background:#0f766e!important;border-color:#0f766e!important;box-shadow:none!important'
||'}@media(max-width:900px){#R70000000000000000073{align-items:stretch!important;flex-direction:column!important}#R70000000000000000073 .t-Form-fieldContainer{width:100%!important;flex-basis:auto!important}#R70000000000000000073 .t-Button{align-self:fle'
||'x-start!important}}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000164)
,p_plug_name=>'Sales Lifecycle Runtime Selectors'
,p_static_id=>'sales-lifecycle-runtime-selectors'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>4
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>/* Page 721 uses deterministic APEX region ids after import. */#R70000000000000000002 .t-Cards{display:flex!important;flex-wrap:nowrap!important;gap:12px!important;overflow-x:auto!important;padding:4px 2px 12px!important;scroll-snap-type:x pro'
||'ximity}#R70000000000000000002 .t-Cards-item{flex:0 0 174px!important;width:174px!important;margin:0!important;scroll-snap-align:start}#R70000000000000000002 .t-Card{position:relative!important;min-height:168px!important;padding-top:30px!important;bor'
||'der:1px solid #cde5e2!important;border-radius:14px!important;background:#fff!important;box-shadow:0 5px 15px rgba(15,76,69,.07)!important;transition:transform .18s ease,border-color .18s ease,box-shadow .18s ease}#R70000000000000000002 .t-Card:hover{'
||'transform:translateY(-4px);border-color:#0f766e!important;box-shadow:0 10px 24px rgba(15,118,110,.15)!important}#R70000000000000000002 .t-Card:before{position:absolute;top:13px;left:14px;color:#0f766e;font-size:9px;font-weight:800;letter-spacing:.09e'
||'m;content:''STEP''}#R70000000000000000002 .t-Cards-item:nth-child(1) .t-Card:before{content:''STEP 01''}#R70000000000000000002 .t-Cards-item:nth-child(2) .t-Card:before{content:''STEP 02''}#R70000000000000000002 .t-Cards-item:nth-child(3) .t-Card:before{co'
||'ntent:''STEP 03''}#R70000000000000000002 .t-Cards-item:nth-child(4) .t-Card:before{content:''STEP 04''}#R70000000000000000002 .t-Cards-item:nth-child(5) .t-Card:before{content:''STEP 05''}#R70000000000000000002 .t-Cards-item:nth-child(6) .t-Card:before{con'
||'tent:''STEP 06''}#R70000000000000000002 .t-Cards-item:nth-child(7) .t-Card:before{content:''STEP 07''}#R70000000000000000002 .t-Cards-item:nth-child(8) .t-Card:before{content:''STEP 08''}#R70000000000000000002 .t-Cards-item:nth-child(9) .t-Card:before{cont'
||unistr('ent:''STEP 09''}#R70000000000000000002 .t-Cards-item:nth-child(10) .t-Card:before{content:''STEP 10''}#R70000000000000000002 .t-Card:after{content:''\2192'';position:absolute;right:-20px;top:72px;z-index:4;display:grid;place-items:center;width:18px;height:18px')
||';border:1px solid #bfe5df;border-radius:50%;background:#fff;color:#0f766e;font-weight:800}#R70000000000000000002 .t-Cards-item:last-child .t-Card:after{display:none}#R70000000000000000023 .t-Card,#R70000000000000000012 .t-Card,#R70000000000000000035 '
||'.t-Card{min-height:130px!important;border:1px solid #cde5e2!important;border-radius:12px!important;background:#fff!important;box-shadow:0 5px 15px rgba(15,76,69,.06)!important;transition:transform .2s ease,box-shadow .2s ease,border-color .2s ease}#R'
||'70000000000000000023 .t-Card:hover,#R70000000000000000012 .t-Card:hover,#R70000000000000000035 .t-Card:hover{transform:translateY(-3px);border-color:#0f766e!important;box-shadow:0 11px 23px rgba(15,118,110,.14)!important}#R70000000000000000012 .t-Car'
||'ds-item:nth-child(1) .t-Card{border-left:4px solid #d97706!important}#R70000000000000000012 .t-Cards-item:nth-child(2) .t-Card{border-left:4px solid #f59e0b!important}#R70000000000000000012 .t-Cards-item:nth-child(3) .t-Card{border-left:4px solid #ef'
||'4444!important}#R70000000000000000012 .t-Cards-item:nth-child(4) .t-Card{border-left:4px solid #0284c7!important}#R70000000000000000127 .t-fht-thead,#R70000000000000000151 .t-fht-thead{position:static!important;inset:auto!important;top:auto!important'
||';left:auto!important;width:auto!important;transform:none!important;z-index:auto!important}#R70000000000000000127 .t-fht-thead.is-stuck,#R70000000000000000151 .t-fht-thead.is-stuck{position:static!important;top:auto!important;left:auto!important;width'
||':auto!important}#R70000000000000000127 .t-fht-tbody,#R70000000000000000151 .t-fht-tbody{position:static!important}#R70000000000000000142 .a-IRR{border:1px solid #f2d6ab;border-radius:14px;background:#fffdf8;box-shadow:0 6px 16px rgba(180,83,9,.08);pa'
||'dding:6px}#R70000000000000000142 .a-IRR-table th{color:#92400e;font-size:11px}#R70000000000000000142 .a-IRR-table td,#R70000000000000000151 .a-IRR-table td{font-size:12px}#R70000000000000000142 a{font-weight:800;color:#b45309}#R70000000000000000151 .'
||'a-IRR-table tbody tr:hover{background:#fff7e8!important}@media(max-width:900px){#R70000000000000000002 .t-Cards-item{flex-basis:160px!important;width:160px!important}#R70000000000000000002 .t-Card:after{display:none}}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000046)
,p_name=>'Sales Trend'
,p_static_id=>'sales-trend'
,p_template=>3371237801798025892
,p_display_sequence=>44
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--3cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'with win as (select trunc(nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),trunc(sysdate,''YYYY'')),''MM'') from_month,trunc(nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR''),sysdate),''MM'') to_month from dual), months as (select add_months(w.from_month,level-1) month_sta'
||'rt from win w connect by level<=months_between(w.to_month,w.from_month)+1) select row_number() over(order by m.month_start) seq, apex_util.prepare_url(''f?p=&APP_ID.:174:&APP_SESSION.'') card_link, to_char(m.month_start,''MON YY'') card_title, to_char(nv'
||'l(sum(c.ccinvoiceamount),0),''FM999G999G999G990D00'') card_subtitle, to_char(count(c.tno))||'' invoices raised'' card_text, null card_subtext, ''fa-line-chart'' card_icon, ''fa-arrow-right-alt'' card_icon2, ''u-color-14'' card_color2 from months m left join cc'
||'invoice c on c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=m.month_start and c.ccinvoicedate<add_months(m.month_start,1) group by m.month_start'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000055)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000053)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000054)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000048)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000052)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000050)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000051)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000049)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000047)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000073)
,p_plug_name=>'Filters'
,p_static_id=>'slct-filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000001)
,p_plug_name=>'Sales Lifecycle Control Tower'
,p_static_id=>'slct-hero'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="ds-slc-hero"><div class="ds-slc-hero-row"><span class="ds-slc-hero-icon"><span class="fa fa-truck"></span></span><span class="ds-slc-hero-text"><span class="ds-slc-hero-eyebrow">Commercial &middot; Sales execution</span><span class="ds-sl'
||'c-hero-title">Sales Lifecycle Control Tower</span><span class="ds-slc-hero-sub">Every IMART sale end to end &mdash; enquiry, quotation, PO receipt, order, loading, dispatch, material out, weighment, invoice and e-invoice &mdash; with the count, value'
||' and where each stage is getting stuck.</span></span></div><div class="ds-slc-hero-chips"><span class="ds-chip"><span class="fa fa-calendar ds-chip-ic"></span><span class="ds-chip-k">Period</span><b>&P721_FROM_DATE. &ndash; &P721_TO_DATE.</b></span><'
||'span class="ds-chip"><span class="fa fa-building-o ds-chip-ic"></span><span class="ds-chip-k">Company</span><b>Current company</b></span><span class="ds-chip"><span class="fa fa-map-marker ds-chip-ic"></span><span class="ds-chip-k">Location</span><b>'
 ||'All locations</b></span><span class="ds-chip"><span class="fa fa-th-large ds-chip-ic"></span><span class="ds-chip-k">Panel</span><b>A + B</b></span><span class="ds-chip ds-chip--live"><span class="fa fa-calendar-check-o ds-chip-ic"></span><span class="ds-chip-k">Invoices as of</span><b>&P721_TO_DATE.</b></span></div></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000139)
,p_plug_name=>'Sales Lifecycle Interaction Styles'
,p_static_id=>'slct-interaction-styles'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>.slct-exec{margin:4px 0 16px}.slct-exec-head{display:flex;align-items:flex-end;justify-content:space-between;gap:12px;margin:0 0 12px}.slct-exec-head h2{margin:0;color:#0b3b36;font-size:20px;letter-spacing:-.02em}.slct-exec-head p{margin:4px 0'
||' 0;color:#54706d;font-size:12px}.slct-exec-live{padding:6px 10px;border-radius:999px;background:#e6f4ea;color:#15803d;font-size:10px;font-weight:800;letter-spacing:.08em;white-space:nowrap}.slct-kpi-grid{display:grid;grid-template-columns:repeat(6,mi'
||'nmax(0,1fr));gap:12px}.slct-kpi-card{position:relative;overflow:hidden;display:block;min-height:144px;padding:14px;border:1px solid #cde5e2;border-radius:14px;background:linear-gradient(145deg,#fff 0%,#f3fbfa 100%);box-shadow:0 5px 15px rgba(15,76,69'
||',.07);color:#0b3b36;text-decoration:none;transition:transform .2s ease,box-shadow .2s ease,border-color .2s ease}.slct-kpi-card:before{content:"";position:absolute;right:-34px;bottom:-50px;width:145px;height:145px;border-radius:50%;background:var(--k'
||'pi-soft,#e5f3f1);opacity:.85;transition:transform .25s ease}.slct-kpi-card:hover,.slct-kpi-card:focus{outline:0;transform:translateY(-5px);border-color:var(--kpi,#0f766e);box-shadow:0 14px 28px rgba(15,118,110,.18)}.slct-kpi-card:hover:before,.slct-k'
||'pi-card:focus:before{transform:scale(1.24)}.slct-kpi-card[data-tone="teal"]{--kpi:#0f766e;--kpi-soft:#d9f2ee}.slct-kpi-card[data-tone="blue"]{--kpi:#0284c7;--kpi-soft:#e0f3fb}.slct-kpi-card[data-tone="amber"]{--kpi:#c06b00;--kpi-soft:#fff0d8}.slct-kp'
||'i-card[data-tone="rose"]{--kpi:#e11d48;--kpi-soft:#fde7ed}.slct-kpi-top{position:relative;z-index:1;display:flex;align-items:center;justify-content:space-between}.slct-kpi-icon{display:grid;place-items:center;width:34px;height:34px;border-radius:10px'
||';background:var(--kpi-soft);color:var(--kpi);font-size:16px}.slct-kpi-tag{color:var(--kpi);font-size:10px;font-weight:800;letter-spacing:.09em;text-transform:uppercase}.slct-kpi-value{position:relative;z-index:1;margin-top:14px;font-size:23px;font-we'
||'ight:750;line-height:1;color:#0b3b36;letter-spacing:-.04em}.slct-kpi-label{position:relative;z-index:1;margin-top:6px;color:#2e5a55;font-size:12px;font-weight:700}.slct-kpi-detail{position:relative;z-index:1;display:flex;align-items:center;justify-co'
||'ntent:space-between;gap:8px;margin-top:12px;color:#54706d;font-size:10.5px}.slct-kpi-open{color:var(--kpi);font-weight:800;white-space:nowrap}.slct-kpi-meter{position:relative;z-index:1;display:block;overflow:hidden;height:4px;margin-top:9px;border-r'
||'adius:99px;background:rgba(15,118,110,.12)}.slct-kpi-meter i{display:block;width:var(--meter,55%);height:100%;border-radius:inherit;background:var(--kpi)}#slct-hover-tip{position:fixed;z-index:99999;display:none;pointer-events:none;white-space:normal;overflow-wrap:anywhere}#slct-hover-tip.is-visible{display:block}#slct-hover-tip.slct-tip-rich{width:220px;max-width:min(260px,calc(100vw - 16px));padding:13px 15px;border:1px solid #e3e8f2;border-radius:14px;background:#fff;color:#172554;font-size:12px;line-height:1.35;box-shadow:0 10px 28px rgba(15,23,42,.18)}#slct-hover-tip.slct-tip-compact{width:max-content;max-width:min(320px,calc(100vw - 16px));padding:8px 11px;border:0;border-radius:8px;background:#172554;color:#fff;font-size:13px;font-weight:600;box-shadow:0 6px 20px rgba(15,23,42,.25)}.slct-tip-title{display:flex;align-items:flex-start;gap:8px;padding-bottom:9px;margin-bottom:8px;border-bottom:1px solid #e7ebf3;font-size:13px;font-weight:800}.slct-tip-title i{width:11px;height:11px;margin-top:3px;border-radius:3px;flex:0 0 auto}.slct-tip-row{display:flex;justify-content:space-between;gap:14px;margin-top:5px;color:#5b6780}.slct-tip-row strong{color:#172554;font-size:14px}.slct-tip-row:last-child strong{color:#2E73C4}.slct-vbar.slct-hover,.slct-hbar.slct-hover{cursor:default}.slct-vbar.slct-hover i,.slct-hbar.slct-hover i{transition:filter .12s ease,opacity .12s ease}.slct-vbar.slct-hover:hover i{filter:'
||'aturate(1.35) brightness(1.05);transform:scaleX(1.07)}.slct-hbar.slct-hover:hover i{filter:saturate(1.3) brightness(1.04)}#stage-documents .a-IRR,#exception-documents .a-IRR{overflow:visible!important;position:static!important}#stage-documents .a-IRR-tableContainer,#exception-documents .a-IRR-tableCont'
||'ainer{overflow:auto!important;max-height:520px!important;position:relative!important}#stage-documents .a-IRR-table,#exception-documents .a-IRR-table{border-collapse:separate!important;border-spacing:0!important}#stage-documents .a-IRR-table thead,#st'
||'age-documents .a-IRR-table th,#exception-documents .a-IRR-table thead,#exception-documents .a-IRR-table th{position:static!important;top:auto!important;z-index:auto!important}#stage-documents .a-IRR-tableContainer,#exception-documents .a-IRR-tableCon'
||'tainer{overflow-x:auto!important;overflow-y:auto!important}#exception-register .a-IRR{border:1px solid #f2d6ab;border-radius:14px;background:#fffdf8;box-shadow:0 6px 16px rgba(180,83,9,.08);padding:6px}#exception-register .a-IRR-table th{color:#92'
||'400e;font-size:11px}#exception-register .a-IRR-table td{font-size:12px}#exception-register a{font-weight:800;color:#b45309}@media(max-width:1200px){.slct-kpi-grid{grid-template-columns:repeat(3,minmax(0,1fr))}}@media(max-width:640px){.slct-kpi-grid{g'
||'rid-template-columns:repeat(2,minmax(0,1fr))}}@media(max-width:420px){.slct-kpi-grid{grid-template-columns:1fr}.slct-exec-head{align-items:flex-start;flex-direction:column}}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000162)
,p_plug_name=>'Sales Lifecycle Polish'
,p_static_id=>'slct-parity-polish'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>/* HSPL-style animated stage rail, backed by IMART documents */#lifecycle-snapshot .t-Cards{display:flex!important;flex-wrap:nowrap!important;gap:12px!important;overflow-x:auto!important;padding:4px 2px 10px!important;scroll-snap-type:x proxim'
||'ity}#lifecycle-snapshot .t-Cards-item{flex:0 0 174px!important;width:174px!important;margin:0!important;scroll-snap-align:start}#lifecycle-snapshot .t-Card{position:relative!important;min-height:168px!important;padding-top:30px!important}#lifecycle-s'
||'napshot .t-Card:before{position:absolute;top:13px;left:14px;color:#0f766e;font-size:9px;font-weight:800;letter-spacing:.09em;content:''STEP''}#lifecycle-snapshot .t-Cards-item:nth-child(1) .t-Card:before{content:''STEP 01''}#lifecycle-snapshot .t-Cards-i'
||'tem:nth-child(2) .t-Card:before{content:''STEP 02''}#lifecycle-snapshot .t-Cards-item:nth-child(3) .t-Card:before{content:''STEP 03''}#lifecycle-snapshot .t-Cards-item:nth-child(4) .t-Card:before{content:''STEP 04''}#lifecycle-snapshot .t-Cards-item:nth-ch'
||'ild(5) .t-Card:before{content:''STEP 05''}#lifecycle-snapshot .t-Cards-item:nth-child(6) .t-Card:before{content:''STEP 06''}#lifecycle-snapshot .t-Cards-item:nth-child(7) .t-Card:before{content:''STEP 07''}#lifecycle-snapshot .t-Cards-item:nth-child(8) .t-'
||unistr('Card:before{content:''STEP 08''}#lifecycle-snapshot .t-Cards-item:nth-child(9) .t-Card:before{content:''STEP 09''}#lifecycle-snapshot .t-Cards-item:nth-child(10) .t-Card:before{content:''STEP 10''}#lifecycle-snapshot .t-Card:after{content:''\2192'';position:abso')
||'lute;right:-20px;top:72px;z-index:4;display:grid;place-items:center;width:18px;height:18px;border:1px solid #bfe5df;border-radius:50%;background:#fff;color:#0f766e;font-weight:800}#lifecycle-snapshot .t-Cards-item:last-child .t-Card:after{display:non'
||'e}#lifecycle-health .t-Card,#control-tower-exceptions .t-Card,#handoff-pressure .t-Card{min-height:130px!important;transition:transform .2s ease,box-shadow .2s ease,border-color .2s ease}#control-tower-exceptions .t-Cards-item:nth-child(1) .t-Card{bo'
||'rder-left:4px solid #d97706!important}#control-tower-exceptions .t-Cards-item:nth-child(2) .t-Card{border-left:4px solid #f59e0b!important}#control-tower-exceptions .t-Cards-item:nth-child(3) .t-Card{border-left:4px solid #ef4444!important}#control-t'
||'ower-exceptions .t-Cards-item:nth-child(4) .t-Card{border-left:4px solid #0284c7!important}.slct-hover{cursor:pointer}.slct-donut.slct-hover{cursor:help;transition:transform .18s ease,filter .18s ease}.slct-donut.slct-hover:hover,.slct-donut.slct-hov'
||'er:focus{outline:0;transform:scale(1.045);filter:saturate(1.15)}#stage-documents .a-IRR,#exception-documents .a-IRR{position:relative!important;overflow:visible!important}#stage-documents .a-IRR-tableContainer,#exception-documents .a-IRR-tableContainer{position:relative!important;overflow-y:auto!impor'
||'tant;max-height:520px!important}#stage-documents .a-IRR-table thead,#stage-documents .a-IRR-table thead tr,#stage-documents .a-IRR-table thead th,#stage-documents .a-IRR-table thead td,#exception-documents .a-IRR-table thead,#exception-documents .a-IR'
||'R-table thead tr,#exception-documents .a-IRR-table thead th,#exception-documents .a-IRR-table thead td{position:relative!important;inset:auto!important;transform:none!important;z-index:auto!important}#stage-documents .a-IRR-table thead{display:table-'
||'header-group!important}#exception-documents .a-IRR-table thead{display:table-header-group!important}#stage-documents .a-IRR-table thead tr,#exception-documents .a-IRR-table thead tr{display:table-row!important}#stage-documents .a-IRR-table thead th,#'
||'stage-documents .a-IRR-table thead td,#exception-documents .a-IRR-table thead th,#exception-documents .a-IRR-table thead td{display:table-cell!important}#stage-documents .a-IRR-tableContainer,#exception-documents .a-IRR-tableContainer{contain:none!im'
||'portant;overflow-x:auto!important}#exception-register .a-IRR-table tbody tr:hover,#exception-documents .a-IRR-table tbody tr:hover{background:#fff7e8!important}@media(max-width:900px){#lifecycle-snapshot .t-Cards-item{flex-basis:160px!important;width'
||':160px!important}#lifecycle-snapshot .t-Card:after{display:none}}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000088)
,p_plug_name=>'Quick Links'
,p_static_id=>'slct-quick-links'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>11
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-quick-label">QUICK LINKS</div><div class="slct-quick-links"><a href="f?p=&APP_ID.:722:&APP_SESSION."><span class="fa fa-sitemap"></span> Confirmation 360</a><a href="f?p=&APP_ID.:723:&APP_SESSION."><span class="fa fa-cart-check"></span> Order 360</a><a href="f?p=&APP_ID.:724:&APP_SESSION."><span class="fa fa-truck"></span> Vehicle 360</a><a href="f?p=&APP_ID.:725:&APP_SESSION."><span class="fa fa-cubes"></span> Category 360</a><a href="f?p=&APP_ID.:726:&APP_SESSION."><span class="fa fa-line-chart"></span> Item Sales Analysis</a><a href="f?p=&APP_ID.:701:&APP_SESSION."><span class="fa fa-search"></span> Confirmation Register</a><a href="f?p=&APP_ID.:170:&APP_SESSION."><span class="fa fa-shopping-cart"></span> Order Register</a><a href="f?p=&APP_ID.:167:&APP_SESSION."><span class="fa fa-sign-out"></span> Gate-In / Material Out</a><a href="f?p=&APP_ID.:132:&APP_SESSION."><span class="fa fa-balance-scale"></span> Weighment Register</a><a href="f?p=&APP_ID.:174:&APP_SESSION."><span class="fa fa-inr"></span> CC Invoice Register</a><a href="f?p=&APP_ID.:703:&APP_SESSION."><span class="fa fa-random"></span> Confirmation Tracking</a><a href="f?p=&APP_ID.:511:&APP_SESSION."><span class="fa fa-user"></span> Customer 360</a><a href="f?p=&APP_ID.:911:&APP_SESSION."><span class="fa fa-money"></span> Receipts</a><a href="f?p=&APP_ID.:908:&APP_SESSION."><span class="fa fa-balance-scale"></span> Customer Outstanding</a></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000089)
,p_plug_name=>'Quick Periods'
,p_static_id=>'slct-quick-periods'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>13
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-quick-label">QUICK PERIOD</div><div class="slct-quick-periods"><button type="button" onclick="var f=function(d){return(''0''+d.getDate()).slice(-2)+''-''+(''0''+(d.getMonth()+1)).slice(-2)+''-''+d.getFullYear()};var n=new Date(),s=new Date(n'
||'.getFullYear(),n.getMonth(),1);apex.item(''P721_FROM_DATE'').setValue(f(s));apex.item(''P721_TO_DATE'').setValue(f(n));apex.submit({request:''APPLY_FILTERS''});">This Month</button><button type="button" onclick="var f=function(d){return(''0''+d.getDate()).sl'
||'ice(-2)+''-''+(''0''+(d.getMonth()+1)).slice(-2)+''-''+d.getFullYear()};var n=new Date(),q=Math.floor(n.getMonth()/3)*3,s=new Date(n.getFullYear(),q,1);apex.item(''P721_FROM_DATE'').setValue(f(s));apex.item(''P721_TO_DATE'').setValue(f(n));apex.submit({request'
||':''APPLY_FILTERS''});">This Quarter</button><button type="button" onclick="var f=function(d){return(''0''+d.getDate()).slice(-2)+''-''+(''0''+(d.getMonth()+1)).slice(-2)+''-''+d.getFullYear()};var n=new Date(),s=new Date(n.getMonth()&lt;3?n.getFullYear()-1:n.g'
||'etFullYear(),3,1);apex.item(''P721_FROM_DATE'').setValue(f(s));apex.item(''P721_TO_DATE'').setValue(f(n));apex.submit({request:''APPLY_FILTERS''});">This FY</button><button type="button" onclick="var f=function(d){return(''0''+d.getDate()).slice(-2)+''-''+(''0'''
||'+(d.getMonth()+1)).slice(-2)+''-''+d.getFullYear()};var n=new Date(),s=new Date(n);s.setDate(s.getDate()-29);apex.item(''P721_FROM_DATE'').setValue(f(s));apex.item(''P721_TO_DATE'').setValue(f(n));apex.submit({request:''APPLY_FILTERS''});">Last 30 Days</butt'
||'on><button type="button" onclick="var f=function(d){return(''0''+d.getDate()).slice(-2)+''-''+(''0''+(d.getMonth()+1)).slice(-2)+''-''+d.getFullYear()};var n=new Date(),s=new Date(n);s.setDate(s.getDate()-89);apex.item(''P721_FROM_DATE'').setValue(f(s));apex.i'
||'tem(''P721_TO_DATE'').setValue(f(n));apex.submit({request:''APPLY_FILTERS''});">Last 90 Days</button></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000090)
,p_plug_name=>'Start Here'
,p_static_id=>'slct-start-here'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>14
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-start"><h2>How to use this dashboard</h2><div class="slct-start-grid"><div><span>1</span><b>Set the period</b><p>Choose the date range or a quick period, then Apply. The hero chips confirm the active view.</p></div><div><span>2</span'
||'><b>Read left to right</b><p>Use the lifecycle flow to see document volume from enquiry through dispatch, billing and e-invoice.</p></div><div><span>3</span><b>Act on delays</b><p>Open a bottleneck or operational register to resolve documents that have not crossed to the next stage.</p></div></div><div class="slct-jumps"><b>GO TO</b><a href="#executive-pulse">Lifecycle pulse</a><a href="#action-centre-intro">Action centre</a><a href="#vehicle-control-intro">Vehicle control</a><a href="#commercial-analytics-intro">Commercial analytics</a><a href="#exception-register">Exception register</a></div></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000125)
,p_plug_name=>'Sales Lifecycle Styles'
,p_static_id=>'slct-style-extensions'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>.slct-graph-wrap{display:grid;grid-template-columns:minmax(0,1.5fr) minmax(280px,1fr);gap:16px;margin:12px 0 18px}.slct-graph{border:1px solid #cde5e2;border-radius:14px;background:#fff;box-shadow:0 6px 16px rgba(15,118,110,.06);padding:16px}.'
||'slct-graph h3{margin:0;color:#0b3b36;font-size:15px}.slct-graph p{margin:4px 0 14px;color:#54706d;font-size:11px}.slct-line-frame{padding:9px 10px 0;border:1px solid #e0e4f2;border-radius:10px;background:#fbfbff}.slct-line-chart{display:block;width:1'
||'00%;height:auto;overflow:visible}.slct-line-grid{stroke:#d7dce6;stroke-width:1;stroke-dasharray:2 3}.slct-line-axis-base{stroke:#718096;stroke-width:1.25}.slct-line-axis{fill:#64748b;font-size:10px;text-anchor:end}.slct-line-xlabel{fill:#64748b;font-'
||'size:10px;text-anchor:middle;font-weight:700}.slct-line-path{fill:none;stroke-width:3;stroke-linecap:round;stroke-linejoin:round}.slct-line-quote{--slct-series:#2f80d8;stroke:#2f80d8}.slct-line-order{--slct-series:#75b986;stroke:#75b986}.slct-line-in'
||'voice{--slct-series:#1aa591;stroke:#1aa591}.slct-line-point{fill:#fff;stroke-width:3;cursor:pointer;transition:r .16s ease,filter .16s ease}.slct-line-point:hover,.slct-line-point:focus{outline:0;r:6;filter:drop-shadow(0 2px 3px rgba(15,118,110,.24))'
||'}.slct-line-legend{display:flex;flex-wrap:wrap;justify-content:center;gap:14px;margin-top:11px;color:#54706d;font-size:10px}.slct-line-legend span{display:inline-flex;align-items:center;gap:5px}.slct-line-legend i{display:inline-block;width:9px;heigh'
||'t:9px;border-radius:2px;background:var(--slct-series);border:0}.slct-chart-note{text-align:center!important;margin:9px 0 0!important;color:#718096!important;font-size:10px!important}.slct-hbar{display:grid;grid-template-columns:86px 1fr 58px;align-it'
||'ems:center;gap:8px;margin:9px 0;color:#2e5a55;font-size:11px}.slct-hbar span{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.slct-hbar i{display:block;height:10px;border-radius:99px;background:linear-gradient(90deg,#14b8a6,#0f766e)}.slct-h'
||'bar b{font-size:10px;text-align:right}.slct-donut-row{display:flex;align-items:center;gap:17px;min-height:170px}.slct-donut{flex:0 0 132px;width:132px;height:132px;border-radius:50%;display:grid;place-items:center}.slct-donut:after{content:"";width:7'
||'9px;height:79px;border-radius:50%;background:#fff;box-shadow:inset 0 0 0 1px #e0eeeb}.slct-donut-key{display:grid;gap:8px;font-size:11px;color:#2e5a55}.slct-donut-key span:before{content:"";display:inline-block;width:9px;height:9px;margin-right:6px;b'
||'order-radius:50%;background:var(--dot)}#stage-documents{scroll-margin-top:18px}#stage-documents .a-IRR{border:1px solid #cde5e2;border-radius:14px;background:#fff;box-shadow:0 6px 16px rgba(15,118,110,.06);padding:6px}#stage-documents .a-IRR-header{b'
||'ackground:#f2fbf9}#stage-documents .a-IRR-table th{color:#0b3b36;font-size:11px}#stage-documents .a-IRR-table td{font-size:12px}.slct-drill-caption{margin:3px 0 11px;color:#54706d;font-size:12px}@media(max-width:900px){.slct-graph-wrap{grid-template-'
||'columns:1fr}.slct-line-frame{padding:7px 5px 0}.slct-line-legend{gap:8px}.slct-donut-row{justify-content:center}}.slct-graph-wrap{grid-template-columns:1fr 1fr;gap:16px}.slct-lifecycle-trend{grid-column:1/-1}.slct-graph{border-color:#e9edf3;border-radius:14px;box-shadow:0 1px 2px rgba(16,32,64,.04),0 8px 24px -14px rgba(16,32,64,.16);padding:18px;background:#fff}.slct-graph h3{color:#172554;font-size:18px;font-weight:800}.slct-graph p{color:#60708a;font-size:12px}.slct-line-frame{padding:8px;border:0;background:transparent}.slct-line-chart{height:360px;max-height:none;overflow:hidden;font-family:inherit;text-rendering:geometricPrecision;shape-rendering:geometricPrecision}.slct-line-grid{stroke:rgba(30,58,95,.12);stroke-width:1;stroke-dasharray:none}.slct-line-axis-base{stroke:#64748b;stroke-width:1.2}.slct-line-axis,.slct-line-xlabel{fill:#53657d;font-size:12px;font-weight:600}.slct-line-axis-title{fill:#263b57;font-size:13px;font-weight:800}.slct-line-path{stroke-width:4}.slct-line-area{stroke:none;opacity:.18;pointer-events:none}.slct-line-quote{--slct-series:#2E73C4;stroke:#2E73C4}.slct-line-order{--slct-series:#4CAF7D;stroke:#4CAF7D}.slct-line-invoice{--slct-series:#26A69A;stroke:#26A69A}.slct-line-point{fill:#fff;stroke-width:2.5;cursor:pointer;transition:filter .12s ease,opacity .12s ease}.slct-line-point:hover,.slct-line-point:focus-visible{r:5;filter:brightness(.92);outline:0}.slct-series-off{opacity:.08!important;pointer-events:none}.slct-line-legend{gap:8px 16px;margin:8px 8px 0;color:#60708a;font-size:12px}.slct-line-legend button{display:inline-flex;align-items:center;gap:7px;padding:5px 7px;border:1px solid transparent;border-radius:5px;background:transparent;color:inherit;font:inherit;cursor:pointer}.slct-line-legend button:hover{background:#f2f5fb}.slct-line-legend button:focus-visible{outline:2px solid #2E73C4;outline-offset:2px}.slct-line-legend button[aria-pressed="false"]{color:#778397;text-decoration:line-through}.slct-line-legend button[aria-pressed="false"] i{opacity:.3}.slct-chart-note{font-size:11px!important;color:#64748b!important}.slct-donut-row{justify-content:center;gap:28px;min-height:280px}.slct-donut{position:relative;flex-basis:224px;width:224px;height:224px;transition:filter .12s ease}.slct-donut:hover,.slct-donut:focus-visible{filter:brightness(.92);outline:0}.slct-donut:after{width:136px;height:136px;border:0;box-shadow:none}.slct-donut>span{position:absolute;z-index:2;display:grid;place-items:center;color:#172554;font-size:22px;font-weight:800}.slct-donut>span small{color:#53657d;font-size:12px;font-weight:600}.slct-donut-key{gap:4px;color:#60708a;font-size:12px}.slct-donut-key button{display:flex;align-items:center;gap:7px;padding:5px 7px;border:1px solid transparent;border-radius:5px;background:transparent;color:inherit;font:inherit;text-align:left}.slct-donut-key button:hover{background:#f2f5fb}.slct-donut-key i{width:10px;height:10px;border-radius:3px;background:var(--dot)}.slct-hbar{grid-template-columns:120px 1fr 88px;gap:10px;min-height:38px;margin:0;padding:7px 8px;border-bottom:1px solid rgba(30,58,95,.08);color:#263b57;font-size:12px}.slct-hbar:hover{background:#f8fafc}.slct-hbar span{font-weight:650}.slct-hbar i{height:17px;border-radius:5px;background:linear-gradient(90deg,#2E73C4,#26A69A)}.slct-hbar b{color:#172554;font-size:12px;font-weight:800}.slct-hbar:last-of-type{border-bottom:0}@media(max-width:900px){.slct-graph-wrap{grid-template-columns:1fr}.slct-lifecycle-trend{grid-column:auto}.slct-line-chart{height:auto}.slct-donut-row{flex-direction:column}.slct-hbar{grid-template-columns:92px 1fr 76px}}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000127)
,p_plug_name=>'Lifecycle Follow-up — Detail Register'
,p_static_id=>'stage-documents'
,p_region_css_classes=>'slct-stage-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>27
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with docs as (',
'select ''ENQUIRY'' drill,''Sales Enquiry'' stage,a.salesenquiryno document_no,a.salesenquirydate document_date,nvl(getpartyname(a.partycode),a.partycode) party_name,nvl(a.salesenquiryamount,0) amount,to_char(a.quotationtno) reference,''Recorded'' status,''C'
||'reate or review quotation'' next_action from salesenquiry a where a.companycode=:GLOBAL_COMPANYCODE and a.salesenquirydate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and a.salesenquirydate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,da'
||'te''2999-12-31'')',
'union all select ''QUOTATION'',''Sales Quotation'',q.salesquotationno,q.salesquotationdate,nvl(getpartyname(q.partycode),q.partycode),nvl(q.salesquotationamount,0),to_char(q.salesenquirytno),case when exists (select 1 from poreceipt p where p.salesquotat'
||'iontno=q.tno) then ''PO received'' else ''Open'' end,case when exists (select 1 from poreceipt p where p.salesquotationtno=q.tno) then ''Review PO linkage'' else ''Follow up for PO'' end from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.sal'
||'esquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''PO_RECEIPT'',''PO Receipt'',p.poreceiptno,p.poreceiptdate,nvl(getpartyname(p.partycode),p.partycode),nvl(p.poreceiptamount,0),to_char(p.salesquotationtno),case when exists (select 1 from salesorder s where s.poreceipttno=p.tno) then ''S'
||'ales order linked'' else ''Open'' end,case when exists (select 1 from salesorder s where s.poreceipttno=p.tno) then ''Review order linkage'' else ''Create sales order'' end from poreceipt p where p.companycode=:GLOBAL_COMPANYCODE and p.poreceiptdate>=nvl(to'
||'_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and p.poreceiptdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''SALES_ORDER'',''Sales Order'',s.salesorderno,s.salesorderdate,nvl(getpartyname(s.partycode),s.partycode),nvl(s.salesorderamount,0),to_char(nvl(s.poreceipttno,s.salesquotationtno)),case when exists (select 1 from despatchadvice d where '
||'d.salesordertno=s.tno) then ''Dispatch linked'' else ''Open'' end,case when exists (select 1 from despatchadvice d where d.salesordertno=s.tno) then ''Review dispatch linkage'' else ''Plan dispatch'' end from salesorder s where s.companycode=:GLOBAL_COMPANYC'
||'ODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''LOADING'',''Loading Advice'',a.loadingadviceno,a.loadingadvicedate,null,cast(null as number),to_char(a.salesordertno),case when a.vehicleno is null then ''Vehicle pending'' else ''Vehicle assigned'' end,''Review loading readiness'' from load'
||'ingadvice a where a.companycode=:GLOBAL_COMPANYCODE and a.loadingadvicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and a.loadingadvicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''DISPATCH'',''Dispatch Advice'',d.despatchadviceno,d.despatchadvicedate,nvl(getpartyname(d.partycode),d.partycode),cast(null as number),to_char(d.salesordertno),case when exists (select 1 from materialout m where m.referencetno=d.tno) t'
||'hen ''Material out linked'' else ''Open'' end,case when exists (select 1 from materialout m where m.referencetno=d.tno) then ''Review material-out linkage'' else ''Complete material out'' end from despatchadvice d where d.companycode=:GLOBAL_COMPANYCODE and '
||'d.despatchadvicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and d.despatchadvicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''MATERIAL_OUT'',''Material Out'',m.materialoutno,m.materialoutdate,nvl(getpartyname(m.partycode),m.partycode),cast(null as number),to_char(m.referencetno),case when m.gateouttime is null then ''Gate-out pending'' else ''Gate-out recorded'' '
||'end,case when m.gateouttime is null then ''Complete vehicle gate-out'' else ''Review movement'' end from materialout m where m.companycode=:GLOBAL_COMPANYCODE and m.materialoutdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and m.materi'
||'aloutdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''WEIGHMENT'',''Weighment'',w.weighmentno,w.weighmentdate,null,nvl(w.netweight,0),to_char(nvl(w.despatchadvicetno,w.referencetno)),case when nvl(w.iscanceled,''N'') in (''Y'',''YES'') then ''Cancelled'' when w.secondweight is null then ''Final we'
||'ight pending'' else ''Completed'' end,case when nvl(w.iscanceled,''N'') in (''Y'',''YES'') then ''Do not process'' when w.secondweight is null then ''Capture second weight'' else ''Review weighment'' end from weighment w where w.companycode=:GLOBAL_COMPANYCODE and '
||'w.weighmentdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and w.weighmentdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''CC_INVOICE'',''CC Invoice'',c.ccinvoiceno,c.ccinvoicedate,nvl(getpartyname(c.partycode),c.partycode),nvl(c.ccinvoiceamount,0),to_char(nvl(c.salesordertno,c.despatchadvicetno)),case when exists (select 1 from einvoice e where e.ccinvoic'
||'etno=c.tno and e.canceldate is null) then ''E-invoice active'' else ''E-invoice pending'' end,case when exists (select 1 from einvoice e where e.ccinvoicetno=c.tno and e.canceldate is null) then ''Review invoice'' else ''Generate or retry e-invoice'' end fro'
||'m ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''EINVOICE'',''E-Invoice'',e.invoiceno,e.invoicedate,nvl(getpartyname(c.partycode),c.partycode),nvl(c.ccinvoiceamount,0),to_char(e.ccinvoicetno),case when e.canceldate is null then ''Active'' else ''Cancelled'' end,case when e.canceldate is '
||'null then ''Review IRN'' else ''Reissue e-invoice if required'' end from einvoice e join ccinvoice c on c.tno=e.ccinvoicetno where c.companycode=:GLOBAL_COMPANYCODE and e.invoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and e.invo'
||'icedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'')',
'union all select ''QUOTE_NO_PO'',''Quoted, no PO'',q.salesquotationno,q.salesquotationdate,nvl(getpartyname(q.partycode),q.partycode),nvl(q.salesquotationamount,0),to_char(q.salesenquirytno),''Open - no PO'',''Follow up commercial closure'' from salesquotati'
||'on q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and q.salesquotationdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from pore'
||'ceipt p where p.salesquotationtno=q.tno)',
'union all select ''PO_NO_ORDER'',''PO, no Sales Order'',p.poreceiptno,p.poreceiptdate,nvl(getpartyname(p.partycode),p.partycode),nvl(p.poreceiptamount,0),to_char(p.salesquotationtno),''Open - no order'',''Create sales order'' from poreceipt p where p.company'
||'code=:GLOBAL_COMPANYCODE and p.poreceiptdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and p.poreceiptdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 from salesorder s where s.poreceipttno='
||'p.tno)',
'union all select ''ORDER_NO_DISPATCH'',''Sales Order, no Dispatch'',s.salesorderno,s.salesorderdate,nvl(getpartyname(s.partycode),s.partycode),nvl(s.salesorderamount,0),to_char(nvl(s.poreceipttno,s.salesquotationtno)),''Open - no dispatch'',''Plan dispatch'''
||' from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderdate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and s.salesorderdate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (select 1 fro'
||'m despatchadvice d where d.salesordertno=s.tno)',
'union all select ''INVOICE_NO_EINVOICE'',''CC Invoice, no E-Invoice'',c.ccinvoiceno,c.ccinvoicedate,nvl(getpartyname(c.partycode),c.partycode),nvl(c.ccinvoiceamount,0),to_char(nvl(c.salesordertno,c.despatchadvicetno)),''E-invoice pending'',''Generate or ret'
||'ry e-invoice'' from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') and not exists (se'
||'lect 1 from einvoice e where e.ccinvoicetno=c.tno and e.canceldate is null)',
'union all select ''CATEGORY'',''Category 360'',nvl(ic.itemcategoryname,''Uncategorised''),max(c.ccinvoicedate),null,sum(nvl(d.amount,0)),to_char(count(distinct c.tno))||'' invoices'',''Invoiced value'',''Review category performance'' from ccinvoice c join ccinvo'
||'icedetail d on d.tno=c.tno left join item i on i.itemcode=d.itemcode left join itemcategory ic on ic.itemcategorycode=i.itemcategorycode where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-'
||'01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') group by nvl(ic.itemcategoryname,''Uncategorised'')',
'union all select ''ITEM'',''Item Performance'',nvl(i.itemname,d.itemcode),max(c.ccinvoicedate),null,sum(nvl(d.amount,0)),to_char(count(distinct c.tno))||'' invoices'',''Invoiced value'',''Review item performance'' from ccinvoice c join ccinvoicedetail d on d.t'
||'no=c.tno left join item i on i.itemcode=d.itemcode where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'''
||') group by nvl(i.itemname,d.itemcode)',
'union all select ''CUSTOMER'',''Top Customers'',nvl(getpartyname(c.partycode),c.partycode),max(c.ccinvoicedate),nvl(getpartyname(c.partycode),c.partycode),sum(nvl(c.ccinvoiceamount,0)),to_char(count(*))||'' invoices'',''Invoiced value'',''Review customer posi'
||'tion'' from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') group by c.partycode',
'union all select ''AGENT'',''Agent Performance'',nvl(getpartyname(c.agentcode),''Direct / no agent''),max(c.ccinvoicedate),null,sum(nvl(c.ccinvoiceamount,0)),to_char(count(*))||'' invoices'',''Invoiced value'',''Review agent performance'' from ccinvoice c where '
||'c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and c.ccinvoicedate<nvl(to_date(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') group by c.agentcode',
'union all select null,''How to use this register'',''Select a lifecycle, exception or commercial card'',cast(null as date),null,cast(null as number),null,''Ready'',''The matching live IMART records will appear here.'' from dual where 1=0',
') select stage,document_no,document_date,party_name,amount,reference,status,next_action,case drill',
'when ''ENQUIRY'' then apex_util.prepare_url(''f?p=&APP_ID.:702:&APP_SESSION.::NO:702:P702_TNO:''||(select to_char(max(a.tno)) from salesenquiry a where a.companycode=:GLOBAL_COMPANYCODE and a.salesenquiryno=docs.document_no))',
'when ''QUOTATION'' then apex_util.prepare_url(''f?p=&APP_ID.:705:&APP_SESSION.::NO:705:P705_TNO:''||(select to_char(max(q.tno)) from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationno=docs.document_no))',
'when ''QUOTE_NO_PO'' then apex_util.prepare_url(''f?p=&APP_ID.:705:&APP_SESSION.::NO:705:P705_TNO:''||(select to_char(max(q.tno)) from salesquotation q where q.companycode=:GLOBAL_COMPANYCODE and q.salesquotationno=docs.document_no))',
'when ''PO_RECEIPT'' then apex_util.prepare_url(''f?p=&APP_ID.:274:&APP_SESSION.::NO:274:P274_TNO:''||(select to_char(max(p.tno)) from poreceipt p where p.companycode=:GLOBAL_COMPANYCODE and p.poreceiptno=docs.document_no))',
'when ''PO_NO_ORDER'' then apex_util.prepare_url(''f?p=&APP_ID.:274:&APP_SESSION.::NO:274:P274_TNO:''||(select to_char(max(p.tno)) from poreceipt p where p.companycode=:GLOBAL_COMPANYCODE and p.poreceiptno=docs.document_no))',
'when ''SALES_ORDER'' then apex_util.prepare_url(''f?p=&APP_ID.:171:&APP_SESSION.::NO:171:P171_TNO:''||(select to_char(max(s.tno)) from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderno=docs.document_no))',
'when ''ORDER_NO_DISPATCH'' then apex_util.prepare_url(''f?p=&APP_ID.:171:&APP_SESSION.::NO:171:P171_TNO:''||(select to_char(max(s.tno)) from salesorder s where s.companycode=:GLOBAL_COMPANYCODE and s.salesorderno=docs.document_no))',
'when ''LOADING'' then apex_util.prepare_url(''f?p=&APP_ID.:155:&APP_SESSION.::NO:155:P155_TNO:''||(select to_char(max(a.tno)) from loadingadvice a where a.companycode=:GLOBAL_COMPANYCODE and a.loadingadviceno=docs.document_no))',
'when ''DISPATCH'' then apex_util.prepare_url(''f?p=&APP_ID.:161:&APP_SESSION.::NO:161:P161_TNO:''||(select to_char(max(d.tno)) from despatchadvice d where d.companycode=:GLOBAL_COMPANYCODE and d.despatchadviceno=docs.document_no))',
'when ''MATERIAL_OUT'' then apex_util.prepare_url(''f?p=&APP_ID.:168:&APP_SESSION.::NO:168:P168_TNO:''||(select to_char(max(m.tno)) from materialout m where m.companycode=:GLOBAL_COMPANYCODE and m.materialoutno=docs.document_no))',
'when ''WEIGHMENT'' then apex_util.prepare_url(''f?p=&APP_ID.:133:&APP_SESSION.::NO:133:P133_TNO:''||(select to_char(max(w.tno)) from weighment w where w.companycode=:GLOBAL_COMPANYCODE and w.weighmentno=docs.document_no))',
'when ''CC_INVOICE'' then apex_util.prepare_url(''f?p=&APP_ID.:175:&APP_SESSION.::NO:175:P175_TNO:''||(select to_char(max(c.tno)) from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoiceno=docs.document_no))',
'when ''INVOICE_NO_EINVOICE'' then apex_util.prepare_url(''f?p=&APP_ID.:175:&APP_SESSION.::NO:175:P175_TNO:''||(select to_char(max(c.tno)) from ccinvoice c where c.companycode=:GLOBAL_COMPANYCODE and c.ccinvoiceno=docs.document_no))',
'when ''EINVOICE'' then apex_util.prepare_url(''f?p=&APP_ID.:182:&APP_SESSION.::NO:182:P182_TNO:''||(select to_char(max(e.tno)) from einvoice e where e.invoiceno=docs.document_no)) end form_url from docs where drill=nvl(:P721_DRILL,''ENQUIRY'') order by d'
||'ocument_date desc nulls last,document_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'nvl(:P721_DRILL,''-'') not in (''QUOTE_NO_PO'',''PO_NO_ORDER'',''ORDER_NO_DISPATCH'',''INVOICE_NO_EINVOICE'')'
,p_plug_display_when_cond2=>'PLSQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Sales Lifecycle Supporting Documents'
,p_prn_header_bg_color=>'#E5F3F1'
,p_prn_header_font_color=>'#0B3B36'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#0B3B36'
,p_prn_border_width=>.5
,p_prn_border_color=>'#CDE5E2'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(70000000000000000128)
,p_max_row_count=>'100000'
,p_max_rows_per_page=>'20'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>70000000000000000128
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000133)
,p_db_column_name=>'AMOUNT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'AMOUNT / NET WEIGHT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000131)
,p_db_column_name=>'DOCUMENT_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'DOCUMENT DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000130)
,p_db_column_name=>'DOCUMENT_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'DOCUMENT NO'
,p_column_link=>'#FORM_URL#'
,p_column_linktext=>'#DOCUMENT_NO#'
,p_column_link_attr=>'title="Open this transaction form"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000138)
,p_db_column_name=>'FORM_URL'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'FORM URL'
,p_display_in_default_rpt=>'N'
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000136)
,p_db_column_name=>'NEXT_ACTION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'NEXT ACTION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000132)
,p_db_column_name=>'PARTY_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'PARTY / CUSTOMER'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000134)
,p_db_column_name=>'REFERENCE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'REFERENCE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000129)
,p_db_column_name=>'STAGE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'STAGE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(70000000000000000135)
,p_db_column_name=>'STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'STATUS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(70000000000000000137)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'SLCT_STAGE_DOCUMENTS'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STAGE:DOCUMENT_NO:DOCUMENT_DATE:PARTY_NAME:AMOUNT:REFERENCE:STATUS:NEXT_ACTION'
,p_sort_column_1=>'DOCUMENT_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000056)
,p_name=>'Top Customers'
,p_static_id=>'top-customers'
,p_template=>3371237801798025892
,p_display_sequence=>45
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--5cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>'with customer_value as (select partycode, sum(nvl(ccinvoiceamount,0)) amount, count(*) docs from ccinvoice where companycode=:GLOBAL_COMPANYCODE and ccinvoicedate>=nvl(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),date''1900-01-01'') and ccinvoicedate<nvl(to_d'
||'ate(:P721_TO_DATE,''DD-MM-RRRR'')+1,date''2999-12-31'') group by partycode), ranked as (select partycode, amount, docs, row_number() over(order by amount desc nulls last) rn from customer_value) select rn seq, apex_util.prepare_url(''f?p=&APP_ID.:721:&APP'
||'_SESSION.::NO:721:P721_FROM_DATE,P721_TO_DATE,P721_DRILL:''||to_char(to_date(:P721_FROM_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',''||to_char(to_date(:P721_TO_DATE,''DD-MM-RRRR''),''DD-MM-RRRR'')||'',CUSTOMER'') card_link, nvl(getpartyname(partycode),nvl(partycode'
||unistr(',''Unassigned customer'')) card_title, to_char(amount,''FM999G999G999G990D00'') card_subtitle, to_char(docs)||'' invoices \00B7 register'' card_text, null card_subtext, ''fa-building-o'' card_icon, ''fa-arrow-right-alt'' card_icon2, ''u-color-14'' card_color2 from r')
||'anked where rn<=5'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000065)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000063)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000064)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000058)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000062)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000060)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000061)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000059)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000057)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000077)
,p_plug_name=>'Vehicle Control Tower Intro'
,p_static_id=>'vehicle-control-intro'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>37
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div class="slct-section"><h2>Vehicle control tower</h2><p>Live operational view independent of the sales-date range. Gate and weighment metrics use the actual IMART Material Out and Weighment records.</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(70000000000000000078)
,p_name=>'Vehicle KPIs'
,p_static_id=>'vehicle-kpis'
,p_template=>3371237801798025892
,p_display_sequence=>38
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--4cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with k as (select (select count(*) from materialout a where a.companycode=:GLOBAL_COMPANYCODE and a.gateintime>sysdate-2 and a.gateouttime is null) inside_count,',
'(select count(*) from weighment a where a.companycode=:GLOBAL_COMPANYCODE and a.weighmentdate>sysdate-2 and a.secondweight is null) awaiting_weigh,',
'(select round(median((a.gateouttime-a.gateintime)*24),1) from materialout a where a.companycode=:GLOBAL_COMPANYCODE and a.gateintime is not null and a.gateouttime is not null and a.gateouttime>sysdate-90 and (a.gateouttime-a.gateintime)*24 between 0 '
||'and 72) median_dwell,',
'(select count(*) from materialout a where a.companycode=:GLOBAL_COMPANYCODE and a.gateintime<=sysdate-2 and a.gateintime>sysdate-400 and a.gateouttime is null) stale_gate from dual)',
'select 1 seq,apex_util.prepare_url(''f?p=&APP_ID.:167:&APP_SESSION.'') card_link,''Vehicles Inside'' card_title,to_char(inside_count) card_subtitle,''Gated in (last 2 days), not out'' card_text,null card_subtext,''fa-truck'' card_icon,''fa-arrow-right-alt'' ca'
||'rd_icon2,''u-color-14'' card_color2 from k',
'union all select 2,apex_util.prepare_url(''f?p=&APP_ID.:132:&APP_SESSION.''),''Awaiting Final Weigh'',to_char(awaiting_weigh),''First weight done, second pending'',null,''fa-balance-scale'',''fa-arrow-right-alt'',''u-color-9'' from k',
'union all select 3,apex_util.prepare_url(''f?p=&APP_ID.:167:&APP_SESSION.''),''Median Dwell'',to_char(nvl(median_dwell,0),''FM990D0'')||'' h'',''Gate-in to gate-out (clean trips, 90d)'',null,''fa-clock-o'',''fa-arrow-right-alt'',''u-color-14'' from k',
unistr('union all select 4,apex_util.prepare_url(''f?p=&APP_ID.:167:&APP_SESSION.''),''Gate-out Not Recorded'',to_char(stale_gate),''Open gate-ins over 2 days \00B7 data gap'',null,''fa-exclamation-triangle'',''fa-arrow-right-alt'',''u-color-9'' from k')))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(71000000000000000200)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000087)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR2'
,p_column_display_sequence=>90
,p_column_heading=>'Card Color2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000085)
,p_query_column_id=>7
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>70
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000086)
,p_query_column_id=>8
,p_column_alias=>'CARD_ICON2'
,p_column_display_sequence=>80
,p_column_heading=>'Card Icon2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000080)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Card Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000084)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000082)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtitle'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000083)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000081)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(70000000000000000079)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70000000000000000076)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_button_name=>'APPLY_FILTERS'
,p_static_id=>'apply-filters'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply filters'
,p_icon_css_classes=>'fa-filter'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'N'
,p_grid_column_span=>2
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(70000000000000000192)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_button_name=>'RESET_FILTERS'
,p_static_id=>'reset-filters'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_redirect_url=>'f?p=&APP_ID.:721:&APP_SESSION.::NO:721'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70000000000000000124)
,p_name=>'P721_DRILL'
,p_item_sequence=>99
,p_item_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70000000000000000074)
,p_name=>'P721_FROM_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_item_default=>'trunc(sysdate,''YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From date'
,p_placeholder=>'From date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70000000000000000075)
,p_name=>'P721_TO_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To date'
,p_placeholder=>'To date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70000000000000000193)
,p_name=>'P721_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_item_default=>':GLOBAL_COMPANYCODE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select companyname d, companycode r from company where companycode = :GLOBAL_COMPANYCODE'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70000000000000000194)
,p_name=>'P721_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_item_default=>'~ALL~'
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:All locations;~ALL~'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70000000000000000195)
,p_name=>'P721_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(70000000000000000073)
,p_item_default=>'AB'
,p_prompt=>'Panel'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:A + B;AB,A;A,B;B'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000190)
,p_plug_name=>'Dashboard Register Standardisation'
,p_static_id=>'slct-register-standardisation'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>99
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<style>body.page-721 #stage-documents .a-IRR,body.page-721 #exception-register .a-IRR,body.page-721 #exception-documents .a-IRR{overflow:visible!important;position:relative!important;padding:0!important;border:1px solid #d9e2ec!important;border-radius:12px!important;background:#fff!important;box-shadow:0 1px 2px rgba(16,24,40,.05),0 7px 18px rgba(15,23,42,.06)!important}body.page-721 #stage-documents .a-IRR-toolbar,body.page-721 #exception-register .a-IRR-toolbar,body.page-721 #exception-documents .a-IRR-toolbar{border-bottom:1px solid #d9e2ec!important;border-radius:11px 11px 0 0!important;background:#f8fafc!important}body.page-721 #stage-documents .a-IRR-tableContainer,body.page-721 #exception-documents .a-IRR-tableContainer{position:relative!important;contain:none!important;max-height:520px!important;overflow:auto!important}body.page-721 #exception-register .a-IRR-tableContainer{position:relative!important;contain:none!important;overflow:auto!important}body.page-721 #stage-documents .a-IRR-table,body.page-721 #exception-register .a-IRR-table,body.page-721 #exception-documents .a-IRR-table{border-collapse:separate!important;border-spacing:0!important}body.page-721 #stage-documents .a-IRR-table thead,body.page-721 #exception-register .a-IRR-table thead,body.page-721 #exception-documents .a-IRR-table thead{display:table-header-group!important}body.page-721 #stage-documents .a-IRR-table thead th,body.page-721 #exception-register .a-IRR-table thead th,body.page-721 #exception-documents .a-IRR-table thead th{position:sticky!important;inset:auto!important;top:0!important;z-index:6!important;padding:11px 12px!important;border-bottom:1px solid #cbd5e1!important;background:#eef2f7!important;color:#334155!important;font-size:11px!important;font-weight:700!important;letter-spacing:.035em!important;text-transform:uppercase!important}body.page-721 #stage-documents .a-IRR-table td,body.page-721 #exception-register .a-IRR-table td,body.page-721 #exception-documents .a-IRR-table td{padding:10px 12px!important;border-bottom:1px solid #e8edf3!important;color:#334155!important;font-size:12px!important}body.page-721 #stage-documents .a-IRR-table tbody tr:hover,body.page-721 #exception-register .a-IRR-table tbody tr:hover,body.page-721 #exception-documents .a-IRR-table tbody tr:hover{background:#f1f7ff!important}body.page-721 #stage-documents .t-fht-thead,body.page-721 #exception-register .t-fht-thead,body.page-721 #exception-documents .t-fht-thead{display:none!important}body.page-721 #stage-documents .a-IRR-paginationWrap,body.page-721 #exception-register .a-IRR-paginationWrap,body.page-721 #exception-documents .a-IRR-paginationWrap{padding:9px 12px!important;border-top:1px solid #d9e2ec!important;background:#fff!important}</style>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000196)
,p_plug_name=>'SLC Visual Completion'
,p_static_id=>'slct-visual-completion'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>98
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'html.page-721 body{background:#f4f7fb}',
'html.page-721 .t-Body-contentInner{max-width:none}',
'html.page-721 #slct-filters{border:1px solid #dce5ed!important;border-radius:16px!important;background:#fff!important;box-shadow:0 8px 24px rgba(15,23,42,.06)!important}',
'html.page-721 #slct-filters .t-Region-body{padding:20px 24px 18px!important}',
'html.page-721 #slct-filters .t-Form-label{color:#334155!important;font-size:12px!important;font-weight:750!important}',
'html.page-721 #slct-filters .apex-item-text,html.page-721 #slct-filters .apex-item-select{height:44px!important;border-color:#cfd9e6!important;border-radius:10px!important;background:#fff!important;color:#172554!important}',
'html.page-721 #B70000000000000000076,html.page-721 #B70000000000000000192{min-height:44px!important;margin-top:8px!important;padding:0 18px!important;border-radius:10px!important;font-weight:750!important}',
'html.page-721 #B70000000000000000076{background:#5b55df!important;border-color:#5b55df!important;color:#fff!important;box-shadow:0 5px 12px rgba(91,85,223,.22)!important}',
'html.page-721 #B70000000000000000192{border:1px solid #d7e0eb!important;background:#fff!important;color:#334155!important}',
'html.page-721 #R70000000000000000073{display:flex!important;flex-wrap:wrap!important}',
'html.page-721 #R70000000000000000073>.t-Form-fieldContainer{flex:0 0 19%!important;width:19%!important;max-width:19%!important}',
'html.page-721 #R70000000000000000073>#B70000000000000000076{margin-left:16px!important}',
'html.page-721 #slct-quick-periods{margin-top:-2px!important}',
'html.page-721 .slct-quick-periods{gap:10px!important}',
'html.page-721 .slct-quick-periods button{min-height:34px;padding:7px 16px!important;border:1px solid #d5e0ea!important;background:#fff!important;box-shadow:0 2px 6px rgba(15,23,42,.04)!important}',
'html.page-721 .slct-start{border:1px solid #dce5ed!important;border-radius:16px!important;background:#fff!important;box-shadow:0 8px 24px rgba(15,23,42,.06)!important}',
'html.page-721 .slct-start-grid>div{min-height:102px!important;border-color:#c9e5e1!important;background:linear-gradient(145deg,#fff,#f2fbfa)!important}',
'html.page-721 .slct-section{margin:24px 0 12px!important;padding-left:14px!important;border-left:4px solid #0f766e!important}',
'html.page-721 .slct-section h2{color:#113f3b!important;font-size:20px!important;font-weight:800!important}',
'html.page-721 .slct-heading{margin:12px 0 14px!important}',
'html.page-721 .slct-heading h2{color:#172554!important;font-size:19px!important;font-weight:800!important}',
'html.page-721 .slct-flow{display:grid!important;grid-template-columns:repeat(5,minmax(0,1fr))!important;gap:14px!important;overflow:visible!important;margin-bottom:26px!important}',
'html.page-721 .slct-stage{min-width:0!important;min-height:118px!important;padding:54px 15px 15px!important;border:1px solid #c9e5e1!important;border-radius:15px!important;background:linear-gradient(145deg,#fff 0%,#f2fbfa 100%)!important;box-shadow:0 5px 16px rgba(15,118,110,.07)!important;transition:transform .18s ease,box-shadow .18s ease!important}',
'html.page-721 .slct-stage:before{content:"";position:absolute;left:15px;top:14px;width:31px;height:31px;border-radius:9px;background:linear-gradient(145deg,#d9f3ef,#edf9f7);box-shadow:inset 0 0 0 1px #c4e8e2}',
'html.page-721 .slct-stage:hover{transform:translateY(-3px);box-shadow:0 11px 24px rgba(15,118,110,.13)!important}',
'html.page-721 .slct-stage span{position:absolute;left:25px;top:23px;z-index:1;color:#0f766e!important;font-size:10px!important}',
'html.page-721 .slct-stage b{margin:0!important;color:#174c47!important;font-size:14px!important;line-height:1.3!important}',
'html.page-721 .slct-stage:after{right:-13px!important;top:48px!important;display:grid!important;place-items:center;width:24px;height:24px;border:1px solid #c9e5e1;border-radius:50%;background:#fff;color:#0f8d83!important}',
'html.page-721 .slct-stage:nth-child(5n):after,html.page-721 .slct-stage:last-child:after{display:none!important}',
'html.page-721 .slct-kpi-grid{grid-template-columns:repeat(6,minmax(0,1fr))!important;gap:14px!important}',
'html.page-721 .slct-kpi-card{min-height:176px!important;padding:16px!important;border-radius:16px!important}',
'html.page-721 .slct-kpi-value{display:block!important;margin-top:13px!important;font-size:24px!important;line-height:1.08!important}',
'html.page-721 .slct-kpi-label{display:block!important;margin-top:5px!important;min-height:31px!important;font-size:12px!important;line-height:1.28!important}',
'html.page-721 .slct-kpi-detail{margin-top:8px!important;font-size:10.5px!important;line-height:1.25!important}',
'html.page-721 .slct-kpi-open{display:block!important;margin-top:4px!important}',
'html.page-721 #lifecycle-health .t-Cards{display:grid!important;grid-template-columns:repeat(5,minmax(0,1fr))!important;gap:14px!important}',
'html.page-721 #lifecycle-health .t-Cards-item{width:auto!important;margin:0!important}',
'html.page-721 #lifecycle-health .t-Card{min-height:152px!important;border-radius:16px!important;box-shadow:0 5px 16px rgba(15,23,42,.07)!important}',
'html.page-721 .slct-graph-wrap{gap:18px!important}',
'html.page-721 .slct-graph{border-radius:16px!important;box-shadow:0 8px 24px rgba(15,23,42,.07)!important}',
'html.page-721 .slct-donut-chart{position:relative;flex:0 0 224px;width:224px;height:224px;display:grid;place-items:center}',
'html.page-721 .slct-donut-chart svg{width:224px;height:224px;overflow:visible;transform:rotate(-90deg)}',
'html.page-721 .slct-donut-track{fill:none;stroke:#edf2f7;stroke-width:18}',
'html.page-721 .slct-donut-segment{fill:none;stroke-width:18;cursor:help;transition:stroke-width .16s ease,filter .16s ease}',
'html.page-721 .slct-donut-segment:hover,html.page-721 .slct-donut-segment:focus{stroke-width:21;filter:brightness(.94);outline:0}',
'html.page-721 .slct-donut-chart>span{position:absolute;z-index:2;display:grid;place-items:center;color:#172554;font-size:22px;font-weight:800;pointer-events:none}',
'html.page-721 .slct-donut-chart>span small{color:#53657d;font-size:12px;font-weight:650}',
'html.page-721 .slct-static-table{overflow:auto;border:1px solid #dce5ed;border-radius:14px;background:#fff}',
'@media(max-width:1250px){html.page-721 .slct-kpi-grid{grid-template-columns:repeat(3,minmax(0,1fr))!important}html.page-721 #lifecycle-health .t-Cards{grid-template-columns:repeat(3,minmax(0,1fr))!important}}',
'@media(max-width:900px){html.page-721 .slct-flow{grid-template-columns:repeat(2,minmax(0,1fr))!important}html.page-721 .slct-stage:nth-child(5n):after{display:grid!important}html.page-721 .slct-stage:nth-child(2n):after{display:none!important}html.page-721 #lifecycle-health .t-Cards{grid-template-columns:repeat(2,minmax(0,1fr))!important}}',
'@media(max-width:640px){html.page-721 .slct-kpi-grid,html.page-721 #lifecycle-health .t-Cards{grid-template-columns:1fr!important}html.page-721 .slct-flow{grid-template-columns:1fr!important}html.page-721 .slct-stage:after{display:none!important}}',
'</style>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70000000000000000191)
,p_plug_name=>'Dashboard Register Live-ID Rules'
,p_static_id=>'slct-register-live-id-rules'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'html.page-721 #R70000000000000000127_worksheet_region,html.page-721 #R70000000000000000142_worksheet_region,html.page-721 #R70000000000000000151_worksheet_region{overflow:visible!important;position:relative!important;padding:0!important;border:1px solid #d9e2ec!important;border-radius:12px!important;background:#fff!important;box-shadow:0 1px 2px rgba(16,24,40,.05),0 7px 18px rgba(15,23,42,.06)!important}',
'html.page-721 #R70000000000000000127_toolbar,html.page-721 #R70000000000000000142_toolbar,html.page-721 #R70000000000000000151_toolbar{border-bottom:1px solid #d9e2ec!important;border-radius:11px 11px 0 0!important;background:#f8fafc!important}',
'html.page-721 #R70000000000000000127_data_panel .a-IRR-tableContainer,html.page-721 #R70000000000000000151_data_panel .a-IRR-tableContainer{position:relative!important;contain:none!important;max-height:none!important;overflow:visible!important}',
'html.page-721 #R70000000000000000142_data_panel .a-IRR-tableContainer{position:relative!important;contain:none!important;overflow:auto!important}',
'html.page-721 #R70000000000000000127_data_panel .a-IRR-table,html.page-721 #R70000000000000000142_data_panel .a-IRR-table,html.page-721 #R70000000000000000151_data_panel .a-IRR-table{border-collapse:separate!important;border-spacing:0!important}',
'html.page-721 #R70000000000000000127_data_panel .t-fht-tbody .a-IRR-table thead,html.page-721 #R70000000000000000142_data_panel .t-fht-tbody .a-IRR-table thead,html.page-721 #R70000000000000000151_data_panel .t-fht-tbody .a-IRR-table thead{display:none!important}',
'html.page-721 #R70000000000000000127_data_panel .t-fht-tbody .a-IRR-table thead th,html.page-721 #R70000000000000000142_data_panel .t-fht-tbody .a-IRR-table thead th,html.page-721 #R70000000000000000151_data_panel .t-fht-tbody .a-IRR-table thead th{position:sticky!important;inset:auto!important;top:0!important;z-index:6!important;padding:11px 12px!important;border-bottom:1px solid #cbd5e1!important;background:#eef2f7!important;color:#334155!important;font-size:11px!important;font-weight:700!important;letter-spacing:.035em!important;text-transform:uppercase!important}',
'html.page-721 #R70000000000000000127_data_panel .a-IRR-table td,html.page-721 #R70000000000000000142_data_panel .a-IRR-table td,html.page-721 #R70000000000000000151_data_panel .a-IRR-table td{padding:10px 12px!important;border-bottom:1px solid #e8edf3!important;color:#334155!important;font-size:12px!important}',
'html.page-721 #R70000000000000000127_data_panel .a-IRR-table tbody tr:hover,html.page-721 #R70000000000000000142_data_panel .a-IRR-table tbody tr:hover,html.page-721 #R70000000000000000151_data_panel .a-IRR-table tbody tr:hover{background:#f1f7ff!important}',
'html.page-721 #R70000000000000000127_data_panel .t-fht-wrapper,html.page-721 #R70000000000000000151_data_panel .t-fht-wrapper{height:auto!important;overflow:visible!important}',
'html.page-721 #R70000000000000000127_data_panel .t-fht-tbody,html.page-721 #R70000000000000000151_data_panel .t-fht-tbody{position:relative!important;max-height:456px!important;overflow:auto!important}',
'html.page-721 #R70000000000000000127_data_panel .t-fht-thead,html.page-721 #R70000000000000000142_data_panel .t-fht-thead,html.page-721 #R70000000000000000151_data_panel .t-fht-thead{display:block!important;position:relative!important;inset:auto!important;top:auto!important;left:auto!important;z-index:8!important;width:100%!important;transform:none!important;background:#eef2f7!important}',
'html.page-721 #R70000000000000000127_data_panel .js-stickyWidget-placeholder,html.page-721 #R70000000000000000142_data_panel .js-stickyWidget-placeholder,html.page-721 #R70000000000000000151_data_panel .js-stickyWidget-placeholder{display:none!important;height:0!important}',
'html.page-721 #R70000000000000000127_data_panel .t-fht-thead th,html.page-721 #R70000000000000000142_data_panel .t-fht-thead th,html.page-721 #R70000000000000000151_data_panel .t-fht-thead th{padding:11px 12px!important;border-bottom:1px solid #cbd5e1!important;background:#eef2f7!important;color:#334155!important;font-size:11px!important;font-weight:700!important;letter-spacing:.035em!important;text-transform:uppercase!important}',
'html.page-721 #R70000000000000000127_worksheet_region .a-IRR-paginationWrap,html.page-721 #R70000000000000000142_worksheet_region .a-IRR-paginationWrap,html.page-721 #R70000000000000000151_worksheet_region .a-IRR-paginationWrap{padding:9px 12px!important;border-top:1px solid #d9e2ec!important;background:#fff!important}',
'</style>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
