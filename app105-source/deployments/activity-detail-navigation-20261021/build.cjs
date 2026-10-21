const fs=require('fs');process.chdir(__dirname);let s=fs.readFileSync('before-pages.sql','utf8').replace(/\r/g,'');const lit=v=>"'"+v.replace(/'/g,"''")+"'";const expr=v=>'wwv_flow_string.join(wwv_flow_t_varchar2(\n'+v.split('\n').map(lit).join(',\n')+'))';
const js=`(function () {
 var back=document.getElementById('am-detail-back'),nav=window.navigation;
 if(!back||!nav||!nav.currentEntry||!nav.entries)return;
 var current=new URL(location.href),entries=nav.entries();
 for(var i=entries.length-1;i>=0;i--){
  var entry=entries[i];if(entry.index>=nav.currentEntry.index||!entry.url)continue;
  var previous=new URL(entry.url);
  if(previous.origin!==current.origin)break;
  if(previous.pathname!==current.pathname&&previous.pathname.indexOf('/ords/r/')===0){back.href=previous.href;return;}
 }
})();`;
fs.writeFileSync('header-actions.js',js+'\n');
if(s.includes('p_javascript_code_onload'))throw Error('Existing onload needs merge');s=s.replace(",p_alias=>'ACTIVITY-DETAIL'",",p_alias=>'ACTIVITY-DETAIL'\n,p_javascript_code_onload=>"+expr(js));
const marker=',p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(\n';s=s.replace(marker,marker+fs.readFileSync('header-actions.css','utf8').trim().split('\n').map(l=>lit(l)+',').join('\n')+'\n');
let n=0;s=s.replace(/wwv_flow_imp_page\.create_page_plug\([\s\S]*?\n\);/g,b=>{if(!b.includes('p_id=>wwv_flow_imp.id(92002610200000414)'))return b;n++;const match=b.match(/,p_plug_source=>'((?:''|[^'])*)'/);const html=match[1].replace(/''/g,"'");const one='<div class="am-detail-header-actions" role="group" aria-label="Page navigation"><a id="am-detail-back" class="t-Button t-Button--noUI" href="';const two='" title="Back"><span class="fa fa-arrow-left" aria-hidden="true"></span><span>Back</span></a><a id="am-detail-close" class="t-Button t-Button--noUI" href="';const three='" title="Close activity detail"><span class="fa fa-times" aria-hidden="true"></span><span>Close</span></a></div>';const code='declare l_url varchar2(4000):=apex_escape.html_attribute(apex_page.get_url(p_page=>1100));begin\nhtp.p('+lit(html+one)+'||l_url||'+lit(two)+'||l_url||'+lit(three)+');\nend;';return b.replace(match[0],',p_plug_source=>'+expr(code)+"\n,p_plug_source_type=>'NATIVE_PLSQL'")});if(n!==1)throw Error('Header identity');s=s.replace(/p_default_id_offset=>\d+/,'p_default_id_offset=>0');fs.writeFileSync('page1113.sql',s);
