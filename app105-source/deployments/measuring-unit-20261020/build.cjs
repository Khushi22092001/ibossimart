const fs = require('fs');
const path = require('path');
process.chdir(__dirname);
let sql = fs.readFileSync('before_page51.sql', 'utf8').replace(/\r/g, '');
if (!sql.includes('wwv_flow_imp.import_end')) throw new Error('Incomplete live page backup');
function replaceItem(name, change) {
  const pattern = /wwv_flow_imp_page\.create_page_item\([\s\S]*?\n\);/g;
  let found = 0;
  sql = sql.replace(pattern, block => {
    if (!block.includes(`,p_name=>'${name}'`)) return block;
    found++;
    return change(block);
  });
  if (found !== 1) throw new Error(`Expected exactly one item: ${name}`);
}
replaceItem('P51_DECIMALPLACE', block => block
  .replace(",p_source_data_type=>'NUMBER'", ",p_source_data_type=>'NUMBER'\n,p_is_required=>true\n,p_item_default=>'0'")
  .replace(',p_cMaxlength=>255', ',p_cMaxlength=>1\n,p_tag_attributes=>\'min="0" max="9" step="1" inputmode="numeric"\'')
  .replace(',p_field_template=>2318601014859922299', ',p_field_template=>2526760615038828570')
  .replace("  'number_alignment', 'left',", "  'min_value', '0',\n  'max_value', '9',\n  'number_alignment', 'left',"));
replaceItem('P51_CREATOR', block => block
  .replace("'NATIVE_TEXT_FIELD'", "'NATIVE_DISPLAY_ONLY'")
  .replace(",p_tag_attributes=>'readonly=true'\n", '')
  .replace(/,p_attributes=>[\s\S]*?(?=\n\);)/, `,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'N')).to_clob`));
replaceItem('P51_GSTUQCCODE', block => block
  .replace("'NATIVE_TEXT_FIELD'", "'NATIVE_POPUP_LOV'\n,p_named_lov=>'GST_UQC'\n,p_lov=>'select UQC_CODE || '' - '' || DESCRIPTION as DISPLAY_VALUE, UQC_CODE from GST_UQC order by UQC_CODE'\n,p_lov_display_null=>'YES'\n,p_lov_display_extra=>'YES'")
  .replace(/,p_attributes=>[\s\S]*?(?=\n\);)/, `,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'INLINE',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob`));
const lov = `begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(2026102051000001)
,p_lov_name=>'GST_UQC'
,p_lov_query=>'select UQC_CODE || '' - '' || DESCRIPTION as DISPLAY_VALUE, UQC_CODE from GST_UQC order by UQC_CODE'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'UQC_CODE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_default_sort_column_name=>'UQC_CODE'
,p_default_sort_direction=>'ASC'
);
end;
/
`;
sql = sql.replace('prompt --application/pages/delete_00051', lov + '\nprompt --application/pages/delete_00051');
const additions = `wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026102051000002)
,p_button_sequence=>95
,p_button_plug_id=>wwv_flow_imp.id(579850955118746468)
,p_button_name=>'EXIT'
,p_button_static_id=>'p51_exit'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Exit'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_icon_css_classes=>'fa-sign-out'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2026102051000003)
,p_name=>'Exit Measuring Unit Form'
,p_event_sequence=>900
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2026102051000002)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2026102051000004)
,p_event_id=>wwv_flow_imp.id(2026102051000003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2026102051000005)
,p_validation_name=>'Decimal Place must be a digit from 0 to 9'
,p_validation_sequence=>10
,p_validation=>'P51_DECIMALPLACE'
,p_validation2=>'^[0-9]$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Decimal Place must be a whole number from 0 to 9.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_imp.id(579852567368746469)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
`;
const marker = 'wwv_flow_imp_page.create_page_process(';
sql = sql.replace(marker, () => additions + marker);
fs.writeFileSync('page51_and_lov.sql', sql);
// Parse every PL/SQL import block without executing it, checking API signatures.
const blocks = [...sql.matchAll(/(?:^|\n)(begin\n[\s\S]*?\nend;\n)\//gi)].map(m => m[1]);
if (blocks.length < 4) throw new Error('Could not identify import blocks');
let check = `WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK\nCONNECT -name IMART\nSET DEFINE OFF\nSET SERVEROUTPUT ON\n`;
for (const [i, block] of blocks.entries()) {
  const chunks = [];
  for (let n=0; n<block.length; n+=6000) chunks.push(`to_clob('${block.slice(n,n+6000).replace(/'/g, "''")}')`);
  check += `DECLARE\n c INTEGER := DBMS_SQL.OPEN_CURSOR;\n s CLOB;\nBEGIN\n s := ${chunks.join(' ||\n')} ;\n DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE);\n DBMS_SQL.CLOSE_CURSOR(c);\n DBMS_OUTPUT.PUT_LINE('Import block ${i+1} compiled.');\nEXCEPTION WHEN OTHERS THEN\n IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF;\n RAISE;\nEND;\n/\n`;
}
check += 'EXIT\n';
fs.writeFileSync('check.sql', check);
console.log(`Built page 51, shared GST_UQC LOV, and compilation check (${blocks.length} blocks).`);
