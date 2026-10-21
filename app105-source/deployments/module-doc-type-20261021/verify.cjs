const fs=require('fs');process.chdir(__dirname);
const a=fs.readFileSync('before-pages.sql','utf8'),b=fs.readFileSync('deployed-pages.sql','utf8');
const ids=s=>[...s.matchAll(/p_id=>wwv_flow_imp.id\((\d+)\)/g)].map(m=>m[1]).sort();
if(JSON.stringify(ids(a))!==JSON.stringify(ids(b)))throw Error('Component ID drift');
if(!b.includes("P75_MODULECODE'').setFocus()"))throw Error('Missing focus code');
const creator=[...b.matchAll(/wwv_flow_imp_page\.create_page_item\([\s\S]*?\n\);/g)].map(m=>m[0]).filter(x=>x.includes("p_name=>'P75_CREATOR'"));
if(creator.length!==1||!creator[0].includes("p_display_as=>'NATIVE_DISPLAY_ONLY'")||!creator[0].includes("'send_on_page_submit', 'Y'"))throw Error('Creator configuration');
console.log('PASS: deployed native IDs unchanged, Module Code focus and Creator display-only');
