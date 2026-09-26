whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 100 linesize 280
connect -name IMART

declare
  l_js             clob;
  l_process_attrs  clob;
  l_region_source  clob;
  l_scope_js       clob := q'~
/* HSPL_P708_INDENT_SCOPE_V1 */
(function ($) {
  "use strict";

  function setDateState(allUnordered, $toggle) {
    var fromItem = apex.item("P708_FROMDATE");
    var toItem = apex.item("P708_TODATE");
    var $dateInputs = $("#P708_FROMDATE_input,#P708_TODATE_input");
    var $dateButtons = $("#P708_FROMDATE_CONTAINER button,#P708_TODATE_CONTAINER button");

    if (allUnordered) {
      if (!$toggle.data("hsplScopeActive")) {
        $toggle.data("hsplPreviousFrom", fromItem.getValue() || "");
        $toggle.data("hsplPreviousTo", toItem.getValue() || "");
      }
      fromItem.setValue("", null, true);
      toItem.setValue("", null, true);
    } else if ($toggle.data("hsplScopeActive")) {
      fromItem.setValue($toggle.data("hsplPreviousFrom") || "", null, true);
      toItem.setValue($toggle.data("hsplPreviousTo") || "", null, true);
    }

    $dateInputs.prop("readonly", allUnordered).attr("aria-disabled", allUnordered ? "true" : "false");
    $dateButtons.prop("disabled", allUnordered);
    $("#P708_FROMDATE_CONTAINER,#P708_TODATE_CONTAINER").toggleClass("is-disabled", allUnordered);
    $toggle.data("hsplScopeActive", allUnordered);
  }

  function init() {
    var $enquiryNo = $("#P708_ENQUIRYNO");
    if ($enquiryNo.length) {
      $enquiryNo.attr("tabindex", "-1");
    }

    var $wrapper = $("#P708_ALLITEM_CONTAINER .t-Form-itemWrapper").first();
    if (!$wrapper.length) { return; }

    if (!$("#hsplP708AllUnordered").length) {
      $wrapper.css({display: "flex", alignItems: "center", gap: "18px", flexWrap: "wrap"});
      $wrapper.append(
        '<div class="apex-item-single-checkbox hspl-p708-indent-scope">' +
          '<input type="checkbox" id="hsplP708AllUnordered" aria-label="All Unordered Indents">' +
          '<label for="hsplP708AllUnordered" class="u-checkbox">All Unordered Indents</label>' +
        '</div>'
      );
    }

    var $toggle = $("#hsplP708AllUnordered");
    if (!$toggle.data("hsplBound")) {
      $toggle.data("hsplBound", true).on("change.hsplP708IndentScope", function () {
        setDateState(this.checked, $toggle);
      });
    }
  }

  $(init);
})(apex.jQuery);
~';

begin
  select javascript_code
    into l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 708
     and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(nvl(l_js, empty_clob()), 'HSPL_P708_INDENT_SCOPE_V1') = 0 then
    l_js := nvl(l_js, empty_clob()) || chr(10) || l_scope_js;
  end if;

  update apex_260100.wwv_flow_steps
     set javascript_code = l_js,
         last_updated_on = sysdate,
         last_updated_by = user
   where flow_id = 105
     and id = 708
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Page 708 JavaScript update count mismatch');
  end if;

  select attributes
    into l_process_attrs
    from apex_260100.wwv_flow_page_da_actions
   where id = 40572324754907088
     and event_id = 40571854563907088
     and flow_id = 105
     and page_id = 708
     and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(l_process_attrs,
       'and a.IndentDate between :P708_FROMDATE and :P708_TODATE') > 0 then
    l_process_attrs := replace(
      l_process_attrs,
      'and a.IndentDate between :P708_FROMDATE and :P708_TODATE',
      'and (:P708_FROMDATE is null or a.IndentDate >= :P708_FROMDATE)\n' ||
      '                        and (:P708_TODATE is null or a.IndentDate <= :P708_TODATE)');
  elsif dbms_lob.instr(l_process_attrs,
       ':P708_FROMDATE is null or a.IndentDate >= :P708_FROMDATE') = 0 then
    raise_application_error(-20002, 'Expected Page 708 date predicate was not found');
  end if;

  update apex_260100.wwv_flow_page_da_actions
     set attributes = l_process_attrs,
         last_updated_on = sysdate,
         last_updated_by = user
   where id = 40572324754907088
     and event_id = 40571854563907088
     and flow_id = 105
     and page_id = 708
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20003, 'Get Indent Data action update count mismatch');
  end if;

  select plug_source
    into l_region_source
    from apex_260100.wwv_flow_page_plugs
   where id = 180315603689349667
     and flow_id = 105
     and page_id = 708
     and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(l_region_source, 'a.STATUS,') > 0 then
    l_region_source := replace(l_region_source,
      'a.STATUS,',
      'to_char(b.IndentDate,''DD-MM-RRRR'') STATUS,');
  elsif dbms_lob.instr(l_region_source,
      'to_char(b.IndentDate,''DD-MM-RRRR'') STATUS,') = 0 then
    raise_application_error(-20004, 'Indent-date display expression was not found');
  end if;

  if dbms_lob.instr(l_region_source, 'order by b.IndentDate desc') = 0 then
    l_region_source := rtrim(l_region_source) || chr(10) ||
      'order by b.IndentDate desc, b.IndentNo desc';
  end if;

  update apex_260100.wwv_flow_page_plugs
     set plug_source = l_region_source,
         last_updated_on = sysdate,
         last_updated_by = user
   where id = 180315603689349667
     and flow_id = 105
     and page_id = 708
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20005, 'Indent list region update count mismatch');
  end if;

  update apex_260100.wwv_flow_region_columns
     set heading = 'Indent Date',
         is_query_only = 'Y',
         item_type = 'NATIVE_DISPLAY_ONLY',
         last_updated_on = sysdate,
         last_updated_by = user
   where id = 180316040987349671
     and flow_id = 105
     and page_id = 708
     and region_id = 180315603689349667
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20006, 'Indent Date column update count mismatch');
  end if;

  update apex_260100.wwv_flow_ig_report_columns
     set display_seq = 4,
         is_visible = 'Y',
         width = 140
   where id = 180921971763944109
     and view_id = 180919679109944091
     and column_id = 180316040987349671
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20007, 'Indent Date report column update count mismatch');
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

select case when dbms_lob.instr(javascript_code, 'HSPL_P708_INDENT_SCOPE_V1') > 0
            then 'TAB_AND_SCOPE_UI_OK' else 'TAB_AND_SCOPE_UI_MISSING' end ui_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 708 and security_group_id = 4744311978888504;

select case when dbms_lob.instr(attributes,
       ':P708_FROMDATE is null or a.IndentDate >= :P708_FROMDATE') > 0
            then 'OPTIONAL_DATE_SCOPE_OK' else 'OPTIONAL_DATE_SCOPE_MISSING' end date_scope_status
  from apex_260100.wwv_flow_page_da_actions
 where id = 40572324754907088 and flow_id = 105 and page_id = 708;

select case when dbms_lob.instr(plug_source,
       'to_char(b.IndentDate,''DD-MM-RRRR'') STATUS') > 0
            then 'INDENT_DATE_VISIBLE_OK' else 'INDENT_DATE_MISSING' end date_column_status
  from apex_260100.wwv_flow_page_plugs
 where id = 180315603689349667 and flow_id = 105 and page_id = 708;

exit
