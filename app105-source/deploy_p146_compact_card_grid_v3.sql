whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_marker constant varchar2(100) := 'HSPL_P146_COMPACT_CARD_GRID_V3';
  l_css    clob := q'~

/* HSPL_P146_COMPACT_CARD_GRID_V3 */
@media (min-width: 768px) {
  html.page-146 #General .hspl-p146-native-card-grid { display: grid !important; grid-template-columns: repeat(2, minmax(0, 1fr)) !important; column-gap: 12px !important; row-gap: 0 !important; align-items: start !important; }
  html.page-146 #General .hspl-p146-native-card-grid > .hspl-p146-native-card-row { display: contents !important; }
  html.page-146 #General .hspl-p146-card-select-no, html.page-146 #General .hspl-p146-card-transportation { grid-column: 1 !important; width: 100% !important; min-width: 0 !important; }
  html.page-146 #General .hspl-p146-card-reference, html.page-146 #General .hspl-p146-card-under-signed { grid-column: 2 !important; width: 100% !important; min-width: 0 !important; }
  html.page-146 #General .hspl-p146-card-select-no, html.page-146 #General .hspl-p146-card-reference { grid-row: 1 !important; }
  html.page-146 #General .hspl-p146-card-transportation, html.page-146 #General .hspl-p146-card-under-signed { grid-row: 2 !important; }
}
~';
  l_js     clob := q'~

/* HSPL_P146_COMPACT_CARD_GRID_V3 */
(function(){function titleOf(card){var title=card.querySelector('.t-Region-title, .t-Region-header h1, .t-Region-header h2, .t-Region-header h3');return title?title.textContent.replace(/\s+/g,' ').trim().toLowerCase():'';}function rowOf(card,root){var node=card.parentElement;while(node&&node!==root){if(node.classList&&node.classList.contains('row'))return node;node=node.parentElement;}return null;}function arrange(){if(!document.documentElement.classList.contains('page-146')||window.innerWidth<768)return;var root=document.getElementById('General');if(!root)return;var named={};Array.prototype.forEach.call(root.querySelectorAll('.t-Region'),function(card){var name=titleOf(card);if(name)named[name]=card;});var cards=[named['select no'],named['reference'],named['transportation info'],named['under signed']];if(cards.some(function(card){return !card;}))return;var rows=cards.map(function(card){return rowOf(card,root);});if(rows.some(function(row){return !row;}))return;var grid=rows[0].parentElement;if(!grid||rows.some(function(row){return row.parentElement!==grid;}))return;grid.classList.add('hspl-p146-native-card-grid');rows.forEach(function(row){row.classList.add('hspl-p146-native-card-row');});cards[0].classList.add('hspl-p146-card-select-no');cards[1].classList.add('hspl-p146-card-reference');cards[2].classList.add('hspl-p146-card-transportation');cards[3].classList.add('hspl-p146-card-under-signed');}[400,1200,2600,4200].forEach(function(delay){window.setTimeout(arrange,delay);});document.addEventListener('DOMContentLoaded',arrange);document.addEventListener('apexafterrefresh',arrange,true);})();
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css      = to_clob(inline_css) || l_css,
         javascript_code = to_clob(javascript_code) || l_js
   where flow_id = 105
     and id = 146
     and dbms_lob.instr(javascript_code, l_marker) = 0;
  if sql%rowcount > 1 then raise_application_error(-20001, 'More than one GRN page was updated'); end if;
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

set pagesize 100
set linesize 220
select dbms_lob.instr(javascript_code, 'HSPL_P146_COMPACT_CARD_GRID_V3') as card_grid_v3_marker,
       dbms_lob.getlength(inline_css) as inline_css_bytes,
       dbms_lob.getlength(javascript_code) as javascript_bytes
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 146;
exit
