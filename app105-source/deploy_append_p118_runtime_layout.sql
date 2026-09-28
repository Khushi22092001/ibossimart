whenever sqlerror exit failure rollback
set define off
connect -name IMART

declare
  l_marker  constant varchar2(100) := 'HSPL_P118_RUNTIME_LAYOUT_V4';
  l_js      varchar2(32767) := q'~
/* HSPL_P118_RUNTIME_LAYOUT_V4 */
(function(){
  var state,lowerCards=[['Currency','Texts','Other Informations'],['Select Indent','GST In Nature And Transaction','PO Amendment Detail']];
  function title(slot){var n=slot&&slot.querySelector('.t-Region-title,.t-Region-header');return n?n.textContent.replace(/\s+/g,' ').trim():'';}
  function fieldCell(id){var item=document.getElementById(id),box=item&&item.closest('.t-Form-fieldContainer');return box&&box.parentElement&&box.parentElement.classList.contains('col')?box.parentElement:null;}
  function remember(node){if(!state.styles.has(node))state.styles.set(node,node.getAttribute('style'));}
  function style(node,values){if(!node)return;remember(node);Object.keys(values).forEach(function(key){node.style[key]=values[key];});}
  function restore(){if(!state)return;if(state.board&&state.board.isConnected){state.rows.forEach(function(row){row.slots.forEach(function(slot){row.node.appendChild(slot);});state.board.parentNode.insertBefore(row.node,state.board);});state.board.remove();}state.styles.forEach(function(value,node){if(value===null)node.removeAttribute('style');else node.setAttribute('style',value);});state=null;}
  function arrangeHeader(){var quantity=fieldCell('P118_QUANTITY'),customer=fieldCell('P118_CUSTOMERCODE'),pending=fieldCell('P118_PENDINGSOTNO'),radios=document.querySelector('#P118_SHIPTO .apex-item-grid-row');if(quantity)style(quantity,{flex:'0 0 calc(33.333333% - 12px)',width:'calc(33.333333% - 12px)',maxWidth:'calc(33.333333% - 12px)',marginLeft:'33.333333%'});if(customer&&pending){var customerRow=customer.parentElement,pendingRow=pending.parentElement;if(customerRow&&pendingRow&&customerRow!==pendingRow&&pendingRow.classList.contains('row')){customerRow.appendChild(pending);pendingRow.remove();}[customer,pending].forEach(function(cell){style(cell,{flex:'0 0 calc(50% - 6px)',width:'calc(50% - 6px)',maxWidth:'calc(50% - 6px)'});});style(pending,{marginLeft:'12px'});}if(radios)style(radios,{display:'flex',columnGap:'28px',alignItems:'center'});}
  function arrangeCards(){var ids=[['R667376656749376113','R667376419227376111','OTHER'],['R667376750619376114','R667376949381376116','POAMENDMENTDETAIL']],slots=ids.map(function(track){return track.map(function(id){var region=document.getElementById(id);return region&&region.closest('.col');});});if(slots.some(function(track){return track.some(function(cell){return !cell;});}))return;var rows=[];slots.flat().forEach(function(cell){var row=cell.parentElement;if(!rows.some(function(entry){return entry.node===row;}))rows.push({node:row,slots:Array.prototype.filter.call(row.children,function(child){return child.classList.contains('col');})});});var parent=rows[0]&&rows[0].node.parentElement;if(!parent||rows.length!==3||rows.some(function(row){return row.slots.length!==2||row.node.parentElement!==parent;}))return;var board=document.createElement('div');board.className='hspl-p118-compact-board';style(board,{display:'grid',gridTemplateColumns:'repeat(2, minmax(0, 1fr))',columnGap:'12px',alignItems:'start',marginTop:'12px'});slots.forEach(function(trackSlots){var track=document.createElement('div');track.className='hspl-p118-compact-track';style(track,{display:'flex',flexDirection:'column',gap:'12px',minWidth:'0'});trackSlots.forEach(function(cell){style(cell,{flex:'0 0 auto',width:'auto',maxWidth:'none',padding:'0',margin:'0'});track.appendChild(cell);});board.appendChild(track);});parent.insertBefore(board,rows[0].node);rows.forEach(function(row){row.node.remove();});state.board=board;state.rows=rows;}
  function apply(){var html=document.documentElement;if(!html.classList.contains('page-118'))return;if(state&&(!state.board||!state.board.isConnected))state=null;if(window.innerWidth<768){restore();return;}if(!state)state={board:null,rows:[],styles:new Map()};arrangeHeader();if(!state.board)arrangeCards();}
  function schedule(){window.requestAnimationFrame(apply);}[0,180,700,1400,2200].forEach(function(delay){window.setTimeout(schedule,delay);});document.addEventListener('apexreadyend',schedule,{once:true});document.addEventListener('apexafterrefresh',schedule,true);window.addEventListener('resize',schedule,{passive:true});
})();
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
           '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260928p118layoutv4'),
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

select dbms_lob.instr(file_content, utl_i18n.string_to_raw('HSPL_P118_RUNTIME_LAYOUT_V4', 'AL32UTF8')) as runtime_marker,
       dbms_lob.getlength(file_content) as javascript_bytes
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name = 'hspl-theme.js';

select javascript_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
