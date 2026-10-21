const fs = require('fs');
process.chdir(__dirname);
const read = file => fs.readFileSync(file, 'utf8').replace(/\r/g, '').trim();
function once(text, old, replacement) {
  if (text.split(old).length !== 2) throw new Error('Expected one occurrence: ' + old.slice(0,100));
  return text.replace(old, () => replacement);
}
const oldPredicate = 'upper(trim(mr_created.CREATOR))=upper(trim(:APP_USER))';
const predicate = '(' + oldPredicate + ' or exists(select 1 from bossuser mr_creator_identity where upper(trim(mr_creator_identity.bossusername))=upper(trim(:APP_USER)) and upper(trim(mr_creator_identity.loginname))=upper(trim(mr_created.CREATOR))))';
let pages = once(read('before_pages50_51.sql'), oldPredicate, predicate);
// Recover missing company scope only from the event's recorded, matching APEX session.
// Technical/database events and mismatched sessions retain the existing deny behavior.
const oldAccess = 'imart_audit.can_read(e.company_code,e.location_code)=1';
const access = "imart_audit.can_read(coalesce(e.company_code,case when e.source_type=''APEX_USER'' and e.table_name=l_root then (select s.company_code from imart_audit_session s where s.audit_session_id=e.audit_session_id and s.application_id=e.application_id and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name and s.bossusercode=e.bossusercode) end),e.location_code)=1";
if (pages.split(oldAccess).length !== 5) throw new Error('Expected four history access checks');
pages = pages.split(oldAccess).join(access);
fs.writeFileSync('pages50_51.sql', pages + '\n');
let pkg = read('register_kpis_body_before.sql');
const oldLine = "   pred:='upper(trim(mr_created.'||dbms_assert.simple_sql_name(x.creator_column)||'))=upper(trim(:APP_USER))';";
pkg = once(pkg, oldLine, oldLine + `
   if p_page=50 then
    pred:='('||pred||' or exists(select 1 from bossuser mr_creator_identity where upper(trim(mr_creator_identity.bossusername))=upper(trim(:APP_USER)) and upper(trim(mr_creator_identity.loginname))=upper(trim(mr_created.'||dbms_assert.simple_sql_name(x.creator_column)||'))))';
   end if;`);
fs.writeFileSync('register_kpis_body.sql', 'CREATE OR REPLACE ' + pkg + '\n/\n');
fs.writeFileSync('restore_register_kpis.sql', 'CREATE OR REPLACE ' + read('register_kpis_body_before.sql') + '\n/\n');
const triggerHeader = 'CREATE OR REPLACE TRIGGER IMA_AT_298881C8E5DED9622EE6\nFOR INSERT OR UPDATE OR DELETE ON MEASURINGUNIT\n';
let trigger = read('measuringunit_trigger_before.sql');
fs.writeFileSync('restore_trigger.sql', triggerHeader + trigger + '\n/\n');
trigger = once(trigger, 'company_code varchar2(128);', "company_code varchar2(128):=case when c.source_type='APEX_USER' then c.company_code end;");
fs.writeFileSync('measuringunit_trigger.sql', triggerHeader + trigger + '\n/\n');
const blocks = [...pages.matchAll(/(?:^|\n)(begin\n[\s\S]*?\nend;\n)\//gi)].map(m=>m[1]);
if(blocks.length !== 7) throw new Error('Unexpected page export structure: '+blocks.length);
function decodeJoin(text) {
  let result='', end=0, first=true;
  for(const match of text.matchAll(/'((?:''|[^'])*)'/g)) {
    if(!first && text.slice(end,match.index).includes(',')) result+='\n';
    result+=match[1].replace(/''/g,"'");
    end=match.index+match[0].length; first=false;
  }
  return result;
}
const historyStart=pages.indexOf(",p_process_name=>'IMART_DOCUMENT_HISTORY'");
const historySource=pages.slice(pages.indexOf(',p_process_sql_clob=>',historyStart), pages.indexOf(',p_process_clob_language=>',historyStart));
const history=decodeJoin(historySource);
if(!history.startsWith('declare\n') || !history.trim().endsWith('end;')) throw new Error('History source extraction failed');
fs.writeFileSync('history_process.sql',history+'\n');
blocks.push(history);
const pkgBlock = pkg.replace(/^package body imart_register_kpis as/i,'DECLARE').replace(/end;\s*$/i,'BEGIN NULL; END;');
blocks.push(pkgBlock);
let check = 'WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK\nCONNECT -name IMART\nSET DEFINE OFF\nSET SERVEROUTPUT ON\n';
for(const [i,block] of blocks.entries()) {
  const chunks=[];
  for(let n=0;n<block.length;n+=6000) chunks.push("to_clob('"+block.slice(n,n+6000).replace(/'/g,"''")+"')");
  check += `DECLARE c INTEGER:=DBMS_SQL.OPEN_CURSOR; s CLOB; BEGIN\n s := ${chunks.join(' ||\n')};\n DBMS_SQL.PARSE(c,s,DBMS_SQL.NATIVE); DBMS_SQL.CLOSE_CURSOR(c); DBMS_OUTPUT.PUT_LINE('Block ${i+1} compiled.');\nEXCEPTION WHEN OTHERS THEN IF DBMS_SQL.IS_OPEN(c) THEN DBMS_SQL.CLOSE_CURSOR(c); END IF; RAISE; END;\n/\n`;
}
check+='EXIT\n';
fs.writeFileSync('check.sql',check);
console.log('Built page 50 identity matching, page 51 recorded-session scope recovery, and scoped audit-trigger company capture.');
