const fs=require('fs');process.chdir(__dirname);
let sql=fs.readFileSync('before-pages.sql','utf8').replace(/\r/g,'');
function once(oldText,newText){if(sql.split(oldText).length!==2)throw Error('Expected unique target '+oldText.slice(0,70));sql=sql.replace(oldText,newText)}
once(',p_default_id_offset=>7541489808702750',',p_default_id_offset=>0');
const start=sql.indexOf("'       Case',",sql.indexOf("'select mr_source.* from (select '"));
const end=sql.indexOf("'       A.REMARK,',",start);
if(start<0||end<0)throw Error('Missing report source');
sql=sql.slice(0,start)+`'       A.MODULECODE,',
'       case when D.LOCATIONNAME is not null then D.LOCATIONNAME',
'            when C.LOCATIONCODE is not null then C.LOCATIONCODE || '' (location unavailable)''',
'            else ''No location assigned'' end LOCATIONNAME,',
`+sql.slice(end);
once("'  Order By A.MODULECODE  , d.locationname desc',","'  Order By A.MODULECODE, D.LOCATIONNAME nulls last, C.LOCATIONCODE',");
once(",p_name=>'Module Location Master'\n,p_alias",",p_name=>'Module Location Master'\n,p_javascript_code_onload=>'requestAnimationFrame(function () { apex.item(''P77_MODULECODE'').setFocus(); });'\n,p_alias");
let found=0;sql=sql.replace(/wwv_flow_imp_page\.create_page_item\([\s\S]*?\n\);/g,b=>{if(!b.includes(",p_name=>'P77_CREATOR'"))return b;found++;return b.replace("'NATIVE_TEXT_FIELD'","'NATIVE_DISPLAY_ONLY'").replace(",p_tag_attributes=>'readonly=true'\n",'').replace(/,p_attributes=>[\s\S]*?(?=\n\);)/,`,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'N')).to_clob`)});
if(found!==1||!sql.includes('wwv_flow_imp.import_end'))throw Error('Incomplete page patch');
fs.writeFileSync('pages.sql',sql);
console.log('Generated scoped pages 76/77 patch');
