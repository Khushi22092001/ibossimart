const fs=require('fs');process.chdir(__dirname);
let sql=fs.readFileSync('before-pages.sql','utf8').replace(/\r/g,'');
function once(a,b){if(sql.split(a).length!==2)throw Error('Nonunique target '+a);sql=sql.replace(a,b)}
once(',p_default_id_offset=>7541489808702750',',p_default_id_offset=>0');
once(",p_name=>'Module Doc Type Master'\n,p_alias",",p_name=>'Module Doc Type Master'\n,p_javascript_code_onload=>'requestAnimationFrame(function () { apex.item(''P75_MODULECODE'').setFocus(); });'\n,p_alias");
let found=0;sql=sql.replace(/wwv_flow_imp_page\.create_page_item\([\s\S]*?\n\);/g,b=>{if(!b.includes(",p_name=>'P75_CREATOR'"))return b;found++;return b.replace("'NATIVE_TEXT_FIELD'","'NATIVE_DISPLAY_ONLY'").replace(",p_tag_attributes=>'readonly=true'\n",'').replace(/,p_attributes=>[\s\S]*?(?=\n\);)/,`,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'N')).to_clob`)});
if(found!==1||!sql.includes('wwv_flow_imp.import_end'))throw Error('Incomplete page patch');
fs.writeFileSync('pages.sql',sql); console.log('Generated page 75 only');
