whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/*
  Native APEX register-state preservation.

  These form-processing branches return to Interactive Report list pages.
  Their prior f?p URLs named the target list page in Clear Cache, which wipes
  that page's session state (including saved IR filters, sort and pagination).
  Keep the same target pages and success messages, but leave Clear Cache empty.
  Explicit Reset/Clear Filters actions are intentionally not changed.
*/
begin
  update apex_260100.wwv_flow_step_branches
     set branch_action = case id
       when 585343251220311242 then 'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
       when 607740467592288639 then 'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
       when 608102473651164435 then 'f?p=&APP_ID.:158:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
       when 608753854530894790 then 'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
       when 614414973568176053 then 'f?p=&APP_ID.:192:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
     end,
     clear_page_cache = null
   where flow_id = 105
     and security_group_id = 4744311978888504
     and id in (
       585343251220311242,
       607740467592288639,
       608102473651164435,
       608753854530894790,
       614414973568176053
     );

  if sql%rowcount <> 5 then
    raise_application_error(-20001,
      'Expected to update exactly five register-return branches; found ' || sql%rowcount);
  end if;

  commit;
end;
/

exit
