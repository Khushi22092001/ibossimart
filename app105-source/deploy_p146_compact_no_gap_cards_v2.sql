whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_marker constant varchar2(100) := 'HSPL_P146_COMPACT_CARD_BOARD_V2';
  l_css    clob := q'~

/* HSPL_P146_COMPACT_CARD_BOARD_V2 */
@media (min-width: 768px) {
  html.page-146 #General .hspl-p146-card-board { grid-column: 1 / -1 !important; display: grid !important; grid-template-columns: repeat(2, minmax(0, 1fr)) !important; width: 100% !important; max-width: none !important; flex: 0 0 100% !important; gap: 12px !important; align-items: start !important; }
}
~';
  l_js     clob := q'~

/* HSPL_P146_COMPACT_CARD_BOARD_V2 */
(function(){function titleOf(card){var title=card.querySelector('.t-Region-title, .t-Region-header h1, .t-Region-header h2, .t-Region-header h3');return title?title.textContent.replace(/\s+/g,' ').trim().toLowerCase():'';}function cardSlot(card,root){var node=card;while(node&&node!==root){if(node.classList&&node.classList.contains('col'))return node;node=node.parentElement;}return null;}function arrange(){if(!document.documentElement.classList.contains('page-146')||window.innerWidth<768)return;var root=document.getElementById('General');if(!root||root.querySelector('.hspl-p146-card-board'))return;var named={};Array.prototype.forEach.call(root.querySelectorAll('.t-Region'),function(card){var name=titleOf(card);if(name)named[name]=cardSlot(card,root);});var left=[named['select no'],named['transportation info']],right=[named['reference'],named['under signed']];if(left.concat(right).some(function(slot){return !slot;}))return;var grid=left[0].parentElement&&left[0].parentElement.parentElement;if(!grid||left.concat(right).some(function(slot){return slot.parentElement.parentElement!==grid;}))return;var board=document.createElement('div'),leftTrack=document.createElement('div'),rightTrack=document.createElement('div');board.className='hspl-p146-card-board';leftTrack.className='hspl-p146-card-track';rightTrack.className='hspl-p146-card-track';board.appendChild(leftTrack);board.appendChild(rightTrack);grid.insertBefore(board,left[0].parentElement);[[leftTrack,left],[rightTrack,right]].forEach(function(entry){entry[1].forEach(function(slot){var row=slot.parentElement;entry[0].appendChild(slot);if(!row.querySelector('.col'))row.remove();});});}[350,1000,2200,3500].forEach(function(delay){window.setTimeout(arrange,delay);});document.addEventListener('apexafterrefresh',arrange,true);})();
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
select dbms_lob.instr(javascript_code, 'HSPL_P146_COMPACT_CARD_BOARD_V2') as board_v2_marker,
       dbms_lob.getlength(inline_css) as inline_css_bytes,
       dbms_lob.getlength(javascript_code) as javascript_bytes
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 146;
exit
