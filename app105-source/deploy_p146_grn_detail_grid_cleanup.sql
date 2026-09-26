-- Remove superseded page-146 scrollbar overrides. The shared static theme now
-- measures rendered grid overflow and exposes a horizontal track only when it
-- is necessary, including both GrnDetail and GrnJob.
set define off verify off feedback on

declare
  l_css clob;
  function remove_marker_block(p_css clob, p_marker varchar2) return clob is
    l_start pls_integer;
    l_next  pls_integer;
    l_out   clob;
  begin
    l_start := dbms_lob.instr(p_css, '/* ' || p_marker || ' */');
    if l_start = 0 then return p_css; end if;
    l_next := dbms_lob.instr(p_css, '/*', l_start + 3);
    if l_next = 0 then l_next := dbms_lob.getlength(p_css) + 1; end if;
    dbms_lob.createtemporary(l_out, true);
    if l_start > 1 then
      dbms_lob.copy(l_out, p_css, l_start - 1, 1, 1);
    end if;
    if l_next <= dbms_lob.getlength(p_css) then
      dbms_lob.copy(l_out, p_css, dbms_lob.getlength(p_css) - l_next + 1, l_start, l_next);
    end if;
    return l_out;
  end remove_marker_block;
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 146
     and security_group_id = 4744311978888504
   for update;

  l_css := remove_marker_block(nvl(l_css, to_clob('')), 'GRN_DETAIL_HORIZONTAL_ENTRY_ONLY_V1');
  l_css := remove_marker_block(l_css, 'GRN_DETAIL_FORCE_HORIZONTAL_BAR_V2');

  update apex_260100.wwv_flow_steps
     set inline_css = l_css
   where flow_id = 105
     and id = 146
     and security_group_id = 4744311978888504;
  commit;
end;
/

select case
         when dbms_lob.instr(nvl(inline_css, to_clob('')), 'GRN_DETAIL_FORCE_HORIZONTAL_BAR_V2') = 0
          and dbms_lob.instr(nvl(inline_css, to_clob('')), 'GRN_DETAIL_HORIZONTAL_ENTRY_ONLY_V1') = 0
           then 'VERIFIED: Page 146 uses the shared overflow-aware grid track rule'
         else 'ERROR: superseded Page 146 scrollbar CSS remains'
       end as result
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146
   and security_group_id = 4744311978888504;

exit
