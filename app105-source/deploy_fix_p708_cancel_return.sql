whenever sqlerror exit failure rollback
set define off
connect -name IMART

declare
  l_js_code clob := q'~/* Registers do not all expose a P<page>_TNO item. The
   previous generic URL built P707_TNO for the Enquiry Register, but that item
   was intentionally removed; APEX therefore raised ERR-1002 before
   navigation. A normal return does not need a document TNO and, with no
   clear-cache directive, retains the register state. */
var returnPage = apex.item('P708_CALLEDFROMPAGE').getValue() || '707';
var url = 'f?p=' + $v('pFlowId') + ':' + returnPage + ':' +
  $v('pInstance') + '::NO::';

apex.server.process('PREPARE_URL', { x01: url }, {
  success: function (pData) {
    if (pData.success === true) apex.navigation.redirect(pData.url);
  },
  error: function (request, status, error) {
    console.log('Purchase Enquiry return failed:', status, error);
  }
});~';
begin
  update apex_260100.wwv_flow_page_da_actions
     set attributes = json_mergepatch(
           attributes,
           json_object('js_code' value l_js_code returning clob)
         ),
         last_updated_on = sysdate
   where id = 40574669690907088
     and flow_id = 105
     and page_id = 708
     and action = 'NATIVE_JAVASCRIPT_CODE';

  if sql%rowcount <> 1 then
    raise_application_error(-20001,
      'Expected exactly one Purchase Enquiry Cancel dynamic action.');
  end if;
  commit;
end;
/
exit
