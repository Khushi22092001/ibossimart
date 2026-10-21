const fs=require('fs');process.chdir(__dirname);
const before=fs.readFileSync('before-pages.sql','utf8'),after=fs.readFileSync('deployed-pages.sql','utf8');
function ids(s){return [...s.matchAll(/p_id=>wwv_flow_imp.id\((\d+)\)/g)].map(x=>x[1]).sort()}
if(JSON.stringify(ids(before))!==JSON.stringify(ids(after)))throw Error('Component ID drift');
for(const text of ["P77_MODULECODE'').setFocus()","p_display_as=>'NATIVE_DISPLAY_ONLY'","(location unavailable)","No location assigned"]){if(!after.includes(text))throw Error('Missing '+text)}
if(after.includes('When ROW_NUMBER()'))throw Error('Blanking logic remains');
console.log('PASS: stable native component IDs, focus code, display-only Creator and nonblank location labels');
