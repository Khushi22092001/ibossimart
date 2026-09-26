whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 200 linesize 280
connect -name IMART

declare
  l_js       clob;
  l_attrs    clob;
  l_newattrs clob;
  l_obj      json_object_t;
  l_marker   varchar2(100) := 'HSPL_P710_ATOMIC_DETAIL_CALC_V1';
  l_guard    clob := q'~
/* HSPL_P710_ATOMIC_DETAIL_CALC_V1 */
(function () {
  "use strict";
  if (window.hsplP710AtomicDetailCalcV1) { return; }
  window.hsplP710AtomicDetailCalcV1 = true;

  function text(v) {
    return v === null || v === undefined ? "" : String(v);
  }

  function context(el) {
    try {
      var row = el && el.closest("tr[data-id]");
      var model = apex.region("QuotationDetail")
        .widget().interactiveGrid("getViews", "grid").model;
      var record = row && model.getRecord(row.getAttribute("data-id"));
      return record ? { model: model, record: record } : null;
    } catch (ignore) { return null; }
  }

  document.addEventListener("focusin", function (event) {
    var el = event.target;
    if (!el || !el.closest || !el.closest("#quotation-detail")) { return; }
    var c = context(el);
    if (!c) { return; }
    el.dataset.hsplP710StartValue = text(el.value);
    el.dataset.hsplP710Stable = JSON.stringify({
      rate: c.model.getValue(c.record, "RATE"),
      amount: c.model.getValue(c.record, "AMOUNT"),
      footer: c.model.getValue(c.record, "FOOTERAMOUNT"),
      total: c.model.getValue(c.record, "TOTALAMOUNT")
    });
  }, true);

  document.addEventListener("focusout", function (event) {
    var el = event.target;
    if (!el || !el.dataset || el.dataset.hsplP710StartValue === undefined) { return; }
    if (el.dataset.hsplP710StartValue !== text(el.value)) { return; }
    var saved;
    try { saved = JSON.parse(el.dataset.hsplP710Stable || "{}"); }
    catch (ignore) { return; }
    window.setTimeout(function () {
      var c = context(el);
      if (!c) { return; }
      [["RATE", saved.rate], ["AMOUNT", saved.amount],
       ["FOOTERAMOUNT", saved.footer], ["TOTALAMOUNT", saved.total]]
        .forEach(function (pair) {
          var current = c.model.getValue(c.record, pair[0]);
          if ((current === null || current === "") &&
              pair[1] !== null && pair[1] !== "" && pair[1] !== undefined) {
            c.model.setValue(c.record, pair[0], pair[1]);
          }
        });
    }, 0);
  }, true);
})();
~';
begin
  select javascript_code
    into l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 710
     and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(nvl(l_js, empty_clob()), l_marker) = 0 then
    l_js := nvl(l_js, empty_clob()) || chr(10) || l_guard;
  end if;

  update apex_260100.wwv_flow_steps
     set javascript_code = l_js,
         last_updated_on = sysdate,
         last_updated_by = user
   where flow_id = 105
     and id = 710
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Page 710 JavaScript update count mismatch');
  end if;

  update apex_260100.wwv_flow_page_da_events
     set bind_event_type = 'change',
         triggering_element = 'QUANTITY1,RATE,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,RATEMEASURINGUNITCODE',
         last_updated_on = sysdate,
         last_updated_by = user
   where id = 41168016454923814
     and flow_id = 105
     and page_id = 710
     and name = 'set amount'
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Page 710 set amount event count mismatch');
  end if;

  select attributes
    into l_attrs
    from apex_260100.wwv_flow_page_da_actions
   where id = 41168478745923814
     and flow_id = 105
     and page_id = 710
     and security_group_id = 4744311978888504
   for update;

  l_newattrs := replace(
    l_attrs,
    q'~if nvl(:DISCOUNTPERCENTAGE,0) > 0 then\n        :DISCOUNTRATE      := (nvl(:DISCOUNTPERCENTAGE,0)/100)*nvl(:WITHOUTDISCOUNTRATE,0) ;\n    end if;~',
    ':DISCOUNTRATE := (nvl(:DISCOUNTPERCENTAGE,0)/100)*nvl(:WITHOUTDISCOUNTRATE,0);'
  );
  l_newattrs := replace(
    l_newattrs,
    ':RATE              := :RATEAFTERDISCOUNT ;',
    'if :RATE is null then :RATE := :RATEAFTERDISCOUNT; end if;'
  );
  l_newattrs := replace(
    l_newattrs,
    'select max(MULTIPLYINGFACTOR) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    'select nvl(max(MULTIPLYINGFACTOR),1) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;'
  );
  l_newattrs := replace(
    l_newattrs,
    q'~if :RATEMEASURINGUNITCODE = unit1 then\n       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);\n    else \n       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY2,0);\n    end if;~',
    q'~if :RATEMEASURINGUNITCODE = unit2 then\n       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY2,0);\n    else\n       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);\n    end if;~'
  );

  l_obj := json_object_t.parse(l_newattrs);
  l_obj.put('suppress_change_event', 'Y');
  l_newattrs := l_obj.to_clob;

  if dbms_lob.instr(l_newattrs,
       'if :RATE is null then :RATE := :RATEAFTERDISCOUNT; end if;') = 0
     or dbms_lob.instr(l_newattrs,
       ':DISCOUNTRATE := (nvl(:DISCOUNTPERCENTAGE,0)/100)*nvl(:WITHOUTDISCOUNTRATE,0);') = 0
     or dbms_lob.instr(l_newattrs,
       'select nvl(max(MULTIPLYINGFACTOR),1) into mfactor') = 0
     or dbms_lob.instr(l_newattrs,
       'if :RATEMEASURINGUNITCODE = unit2 then') = 0 then
    raise_application_error(-20003, 'Page 710 calculation PL/SQL patch incomplete');
  end if;

  update apex_260100.wwv_flow_page_da_actions
     set attributes = l_newattrs,
         last_updated_on = sysdate,
         last_updated_by = user
   where id = 41168478745923814
     and flow_id = 105
     and page_id = 710
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20004, 'Page 710 calculation action count mismatch');
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

select case when dbms_lob.instr(javascript_code,
       'HSPL_P710_ATOMIC_DETAIL_CALC_V1') > 0
       then 'UNCHANGED_NAV_GUARD_OK' else 'UNCHANGED_NAV_GUARD_MISSING' end js_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 710 and security_group_id = 4744311978888504;

select bind_event_type, triggering_element
  from apex_260100.wwv_flow_page_da_events
 where id = 41168016454923814
   and flow_id = 105 and page_id = 710
   and security_group_id = 4744311978888504;

select case
         when dbms_lob.instr(attributes,
              'if :RATE is null then :RATE := :RATEAFTERDISCOUNT; end if;') > 0
          and dbms_lob.instr(attributes,
              ':DISCOUNTRATE := (nvl(:DISCOUNTPERCENTAGE,0)/100)*nvl(:WITHOUTDISCOUNTRATE,0);') > 0
          and json_value(attributes, '$.suppress_change_event') = 'Y'
          and dbms_lob.instr(attributes,
              'select nvl(max(MULTIPLYINGFACTOR),1) into mfactor') > 0
          and dbms_lob.instr(attributes,
              'if :RATEMEASURINGUNITCODE = unit2 then') > 0
         then 'MANUAL_RATE_AND_DISCOUNT_OK'
         else 'CALC_PATCH_MISSING'
       end calculation_status
  from apex_260100.wwv_flow_page_da_actions
 where id = 41168478745923814
   and flow_id = 105 and page_id = 710
   and security_group_id = 4744311978888504;

exit
