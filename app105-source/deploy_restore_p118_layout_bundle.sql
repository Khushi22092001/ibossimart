whenever sqlerror exit failure rollback
set define off
connect -name IMART

declare
  l_marker  constant varchar2(100) := 'HSPL_P118_LAYOUT_RECOVERY_V1';
  l_js      varchar2(32767) := q'~
/* HSPL_P118_LAYOUT_RECOVERY_V1 */
(function(){function cell(id){var item=document.getElementById(id),field=item&&item.closest('.t-Form-fieldContainer');return field&&field.parentElement&&field.parentElement.classList.contains('col')?field.parentElement:null;}function style(node,values){if(!node)return;Object.keys(values).forEach(function(key){node.style[key]=values[key];});}function header(){var quantity=cell('P118_QUANTITY'),customer=cell('P118_CUSTOMERCODE'),pending=cell('P118_PENDINGSOTNO'),radios=document.querySelector('#P118_SHIPTO .apex-item-grid-row');if(quantity)style(quantity,{flex:'0 0 calc(33.333333% - 12px)',width:'calc(33.333333% - 12px)',maxWidth:'calc(33.333333% - 12px)',marginLeft:'33.333333%',marginTop:'-64px'});if(customer&&pending){var firstRow=customer.parentElement,secondRow=pending.parentElement;if(firstRow!==secondRow&&firstRow&&secondRow&&secondRow.classList.contains('row')){firstRow.appendChild(pending);secondRow.remove();}style(firstRow,{display:'flex',columnGap:'12px'});[customer,pending].forEach(function(node){style(node,{flex:'0 0 calc(50% - 6px)',width:'calc(50% - 6px)',maxWidth:'calc(50% - 6px)'});});}if(radios)style(radios,{display:'flex',columnGap:'28px',alignItems:'center'});}function cards(){if(document.querySelector('.hspl-p118-compact-board'))return;var ids=[['R667376656749376113','R667376419227376111','OTHER'],['R667376750619376114','R667376949381376116','POAMENDMENTDETAIL']],tracks=ids.map(function(track){return track.map(function(id){var region=document.getElementById(id);return region&&region.closest('.col');});});if(tracks.some(function(track){return track.some(function(node){return !node;});}))return;var rows=[];tracks.flat().forEach(function(node){var row=node.parentElement;if(!rows.includes(row))rows.push(row);});var parent=rows[0]&&rows[0].parentElement;if(!parent||rows.length!==3||rows.some(function(row){return row.parentElement!==parent||Array.prototype.filter.call(row.children,function(node){return node.classList.contains('col');}).length!==2;}))return;var board=document.createElement('div');board.className='hspl-p118-compact-board';style(board,{display:'grid',gridTemplateColumns:'repeat(2, minmax(0, 1fr))',columnGap:'12px',alignItems:'start',marginTop:'12px'});tracks.forEach(function(trackNodes){var track=document.createElement('div');track.className='hspl-p118-compact-track';style(track,{display:'flex',flexDirection:'column',gap:'12px',minWidth:'0'});trackNodes.forEach(function(node){style(node,{flex:'0 0 auto',width:'auto',maxWidth:'none',padding:'0',margin:'0'});track.appendChild(node);});board.appendChild(track);});parent.insertBefore(board,rows[0]);rows.forEach(function(row){row.remove();});}function totals(){var nodes=['P118_SUMOFAMOUNT','P118_SUMOFFOOTERAMOUNT','P118_PURCHASEORDERAMOUNT'].map(cell);if(nodes.some(function(node){return !node;}))return;var rows=nodes.map(function(node){return node.parentElement;}),parent=rows[0]&&rows[0].parentElement;if(!parent||rows.some(function(row){return !row.classList.contains('row')||row.parentElement!==parent;}))return;if(rows[0]!==rows[1]){rows[0].appendChild(nodes[1]);rows[1].remove();}if(rows[0]!==rows[2]){rows[0].appendChild(nodes[2]);rows[2].remove();}style(rows[0],{display:'flex',columnGap:'12px'});nodes.forEach(function(node){style(node,{flex:'0 0 calc(33.333333% - 8px)',width:'calc(33.333333% - 8px)',maxWidth:'calc(33.333333% - 8px)'});});}function apply(){if(!document.documentElement.classList.contains('page-118')||window.innerWidth<768)return;header();cards();totals();}function schedule(){window.requestAnimationFrame(apply);}[0,900,1800,2600,3600,5000,6500].forEach(function(delay){window.setTimeout(schedule,delay);});document.addEventListener('apexreadyend',schedule,{once:true});document.addEventListener('apexafterrefresh',schedule,true);document.addEventListener('click',function(event){if(event.target.closest&&event.target.closest('.t-Tabs-link'))window.setTimeout(schedule,120);},true);})();
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
           '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260928p118bundle1'),
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

select dbms_lob.instr(file_content, utl_i18n.string_to_raw('HSPL_P118_LAYOUT_RECOVERY_V1', 'AL32UTF8')) as bundle_marker,
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
