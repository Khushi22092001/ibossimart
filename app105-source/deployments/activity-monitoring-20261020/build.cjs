// Native APEX 26.1 components, generated from verified application 105 metadata.
// No deployment is performed by this builder.
const fs=require('fs'),path=require('path');
const root=__dirname;const write=(f,s)=>fs.writeFileSync(path.join(root,f),s.replace(/\r\n/g,'\n'));
const q=s=>"'"+String(s).replace(/'/g,"''")+"'";
const expr=s=>s.length<3000?q(s):'wwv_flow_string.join(wwv_flow_t_varchar2('+s.split('\n').map(q).join(',\n')+'))';
let seq=92002610200000000n; const id=()=>String(++seq),ref=n=>`wwv_flow_imp.id(${n})`;
const auth='91004000000000002',exportAuth='92002610209999999';
const filterNames=['FROM','TO','COMPANY','LOCATION','USER','EMPLOYEE','DEPARTMENT','MODULE','PAGE','ACTION','OUTCOME','SOURCE','TABLE','RECORD'];
const rawState=n=>`apex_util.get_session_state('P1100_${n}')`;
const state=n=>`(select /*+ no_unnest */ ${rawState(n)} from dual)`;
const grainBind=':P1100_GRAIN';
const day=(n,sql=true)=>{const value=rawState(n),e=`case when validate_conversion(${value} as date,'FXYYYY-MM-DD')=1 then to_date(${value},'FXYYYY-MM-DD') end`;return sql?`(select /*+ no_unnest */ ${e} from dual)`:e;};
const currentDay="trunc(cast(systimestamp at time zone 'Asia/Kolkata' as date))";
const lovBounds=`event_timestamp>=from_tz(cast(${day('FROM')} as timestamp),'Asia/Kolkata') and event_timestamp<from_tz(cast(${day('TO')}+1 as timestamp),'Asia/Kolkata')`;
const safe=s=>`case when regexp_like(to_char(${s}),'^[[:space:][:cntrl:]]*[=+@-]') then chr(39)||to_char(${s}) else to_char(${s}) end`;
const recordIdentity="case when e.table_name is not null and coalesce(rawtohex(e.record_key_hash),e.record_key) is not null then length(e.table_name)||':'||e.table_name||':'||coalesce(rawtohex(e.record_key_hash),e.record_key) end";
let base=`select e.audit_event_id,e.event_timestamp,
 cast(e.event_timestamp at time zone 'Asia/Kolkata' as timestamp) local_timestamp,
 e.user_name,e.bossusercode,e.employee_code,em.employee_name current_employee_name,em.department_code current_department_code,dp.department_name current_department_name,e.company_code,e.location_code,
 coalesce(c.company_name,e.company_code,'Unscoped') company_name,
 coalesce(l.location_name,e.location_code,'Unspecified') location_name,
 nvl(e.resolved_module_code,'UNMAPPED') module_code,e.module_name,e.module_mapping_source,
 e.page_id,e.page_name,e.form_name,e.table_name,e.record_key,e.record_key_hash,
 ${recordIdentity} record_identity,e.parent_table,e.parent_key,e.transaction_reference,
 rawtohex(e.request_id) correlation_id,e.transaction_id,e.audit_session_id,e.apex_session_id,
 e.action_type original_action,e.event_type,e.source_type,e.outcome,e.error_code,
 case when e.action_type in ('INSERT','UPDATE','DELETE','APPROVE','REJECT','EXPORT','LOGIN','LOGOUT') then e.action_type
 when e.action_type in ('VIEW','READ') then 'VIEW'
 when e.table_name='BOSSUSERROLE' and e.event_type='ROW_CHANGE' then 'PERMISSION / ROLE CHANGE'
 else 'OTHER' end operation,
 case when e.outcome='FAILURE' then 'Captured failure'
 when e.action_type='DELETE' then 'Deletion activity'
 when e.table_name in ('BOSSUSER','BOSSUSERROLE') and e.event_type='ROW_CHANGE' then 'Administrative entity change'
 else null end exception_reason,
 case when e.event_type='ROW_CHANGE' and e.outcome='SUCCESS' then 1 else 0 end successful_row_operation,
 case when exists(select 1 from module m where upper(m.mastertablename)=e.table_name) then 'Current ERP master mapping' else null end master_mapping
from IMART_AUDIT_EVENT_V e
left join (select companycode,max(companyname) company_name from company group by companycode)c on c.companycode=e.company_code
left join (select locationcode,max(locationname) location_name from location group by locationcode)l on l.locationcode=e.location_code
left join (select employeecode,case when count(distinct employeename)=1 then max(employeename) else 'Ambiguous current directory name' end employee_name,case when count(distinct departmentcode)=1 then max(departmentcode) end department_code from employee group by employeecode)em on em.employeecode=e.employee_code
left join (select departmentcode,max(departmentname) department_name from department group by departmentcode)dp on dp.departmentcode=em.department_code
where e.application_id=105`;
// Reuse the inspected module resolution and the SAME centralized permission
// function. Cache its result only inside each SQL statement, per company/location;
// do not cache permissions across requests or change any existing security object.
const originalEventDdl=fs.readFileSync(path.join(root,'audit_event_view.sql'),'utf8');
let securedEventSql=originalEventDdl.slice(originalEventDdl.indexOf('select e.')).trim().replace(/;\s*$/,'');
const originalPolicy='IMART_AUDIT.can_read(e.company_code,e.location_code)=1';
const securityPredicate='(select /*+ no_unnest */ IMART_AUDIT.can_read(e.company_code,e.location_code) from dual)=1';
if(!securedEventSql.includes('where '+originalPolicy))throw Error('Inspected audit view security boundary changed');
securedEventSql=securedEventSql.replace('where '+originalPolicy,'where '+securityPredicate);
const neededEventFields=new Set([...base.matchAll(/\be\.([a-z_]+)/gi)].map(m=>m[1].toUpperCase()));
securedEventSql=securedEventSql.replace(/e\."([A-Z_]+)",/g,(part,col)=>neededEventFields.has(col)?part:'');
base=base.replace('IMART_AUDIT_EVENT_V e','('+securedEventSql+') e');
const scope=`select e.* from IMART_ACTIVITY_EVENTS_V e
where e.event_timestamp>=from_tz(cast(${day('FROM')} as timestamp),'Asia/Kolkata')
and e.event_timestamp<from_tz(cast(${day('TO')}+1 as timestamp),'Asia/Kolkata')
and ${day('TO')}>=${day('FROM')} and ${day('TO')}-${day('FROM')}<=365
${['COMPANY:company_code','LOCATION:location_code','USER:user_name','EMPLOYEE:employee_code','MODULE:module_code','PAGE:page_id','ACTION:operation','OUTCOME:outcome','SOURCE:source_type','TABLE:table_name','RECORD:record_key'].map(x=>{let[n,c]=x.split(':');return `and (${state(n)} is null or ${c==='page_id'?'to_char(e.page_id)':`e.${c}`}=${state(n)})`;}).join('\n')}`;
// Replace select e.* explicitly, including future schema changes cannot expose extra fields.
const fields=['audit_event_id','event_timestamp','local_timestamp','user_name','bossusercode','employee_code','company_code','location_code','company_name','location_name','module_code','module_name','module_mapping_source','page_id','page_name','form_name','table_name','record_key','record_key_hash','record_identity','parent_table','parent_key','transaction_reference','correlation_id','transaction_id','audit_session_id','apex_session_id','original_action','event_type','source_type','outcome','error_code','operation','exception_reason','successful_row_operation','master_mapping'];
fields.push('current_employee_name','current_department_code','current_department_name');
const scoped=scope.replace('e.*',fields.map(c=>'e.'+c).join(','))+`\nand (${state('DEPARTMENT')} is null or e.current_department_code=${state('DEPARTMENT')})`;
write('01_reporting_views.sql',`-- NEW objects only. Preflight rejects existing names; no OR REPLACE, FORCE or grants.\ncreate view IMART_ACTIVITY_EVENTS_V as\n${base};\n\ncreate view IMART_ACTIVITY_SCOPE_V as\n${scoped};\n`);

const metrics=`count(*) total_events,
 sum(case when outcome='SUCCESS' then 1 else 0 end) successful_events,
 sum(case when outcome='FAILURE' then 1 else 0 end) failed_events,
 sum(case when outcome='OBSERVED' then 1 else 0 end) observed_events,
 sum(case when operation='INSERT' then 1 else 0 end) inserts,
 sum(case when operation='UPDATE' then 1 else 0 end) updates,
 sum(case when operation='DELETE' then 1 else 0 end) deletes,
 sum(case when operation not in ('INSERT','UPDATE','DELETE') then 1 else 0 end) other_events,
 count(distinct case when source_type='APEX_USER' then user_name end) active_users,
 count(distinct record_identity) distinct_records,
 sum(successful_row_operation) successful_row_operations`;
const summaries=[
 [1101,'Daily Activity Summary','ACTIVITY-DAILY',['activity_period','company_name','location_name','module_name'],`to_char(local_timestamp,case when ${grainBind}='HOUR' then 'YYYY-MM-DD HH24' when ${grainBind}='MONTH' then 'YYYY-MM' else 'YYYY-MM-DD' end) activity_period,company_name,location_name,module_name`,['activity_period','company_name','location_name','module_name'],['PERIOD','COMPANY','LOCATION','MODULE'],['activity_period','company_code','location_code','module_code']],
 [1102,'User Activity Summary','ACTIVITY-USERS',['user_name','bossusercode','employee_code','current_employee_name','current_department_name','company_name','location_name'],`user_name,bossusercode,employee_code,current_employee_name,current_department_name,company_name,location_name`,['user_name','bossusercode','employee_code','current_employee_name','current_department_name','company_name','location_name'],['USER','COMPANY','LOCATION'],['user_name','company_code','location_code']],
 [1103,'Module Activity Summary','ACTIVITY-MODULES',['module_name','page_name','form_name','module_mapping_source'],`module_name,page_name,form_name,module_mapping_source`,['module_name','page_name','form_name','module_mapping_source'],['MODULE','PAGE'],['module_code','page_id']],
 [1104,'Company Activity Summary','ACTIVITY-COMPANIES',['company_code','company_name'],`company_code,company_name`,['company_code','company_name'],['COMPANY'],['company_code']],
 [1105,'Location Activity Summary','ACTIVITY-LOCATIONS',['company_name','location_code','location_name'],`company_name,location_code,location_name`,['company_name','location_code','location_name'],['COMPANY','LOCATION'],['company_code','location_code']],
 [1106,'User × Module Matrix','ACTIVITY-USER-MODULE',['user_name','module_name'],`user_name,module_name`,['user_name','module_name'],['USER','MODULE'],['user_name','module_code']],
 [1107,'Company × Location Matrix','ACTIVITY-COMPANY-LOCATION',['company_name','location_name'],`company_name,location_name`,['company_name','location_name'],['COMPANY','LOCATION'],['company_code','location_code']],
 [1108,'Operation Activity MIS','ACTIVITY-OPERATIONS',['operation','original_action','module_name','company_name','location_name','user_name'],`operation,original_action,module_name,company_name,location_name,user_name`,['operation','original_action','module_name','company_name','location_name','user_name'],['ACTION','MODULE','USER'],['operation','module_code','user_name']]
];
const reports=[];const numeric=['TOTAL_EVENTS','SUCCESSFUL_EVENTS','FAILED_EVENTS','OBSERVED_EVENTS','INSERTS','UPDATES','DELETES','OTHER_EVENTS','ACTIVE_USERS','DISTINCT_RECORDS','SUCCESSFUL_ROW_OPERATIONS'];
function drill(dimensions,values,page=1113){let items=dimensions.map((_,i)=>`P${page}_D${i+1},P${page}_V${i+1}`).join(',');let val=dimensions.map((d,i)=>q(d)+`||','||`+`replace(replace(nvl(to_char(${values[i]}),'~NULL~'),'%','%25'),',','%2C')`).join(`||','||`);return `apex_page.get_url(p_page=>${page},p_clear_cache=>'RP,${page}',p_items=>${q(items)},p_values=>${val})`;}
for(const [page,title,alias,cols,projection,group,dims,keys] of summaries){
 let groupCols=[...new Set([...group,...keys])];
 // Matrix totals are emitted separately, retaining correct distinct users/records at every level.
 let isMatrix=page===1106||page===1107;
 let grouping=isMatrix?`group by grouping sets ((${groupCols.join(',')}),(${groupCols.filter(c=>c!==group[1]&&c!==keys[1]).join(',')}),(${groupCols.filter(c=>c!==group[0]&&c!==keys[0]).join(',')}),())`:`group by ${groupCols.join(',')}`;
 let sql=`select ${projection},${keys.filter(c=>!group.includes(c)).map(c=>c+',').join('')}\n${metrics},min(local_timestamp) first_activity,max(local_timestamp) last_activity${isMatrix?`,case when grouping(${keys[0]})=1 and grouping(${keys[1]})=1 then 'Grand total' when grouping(${keys[0]})=1 then 'Column total' when grouping(${keys[1]})=1 then 'Row total' else 'Detail' end row_kind`:''}\nfrom IMART_ACTIVITY_SCOPE_V group by ${groupCols.join(',')}`;
 if(page===1101){sql=`select ${projection},company_code,location_code,module_code,${metrics},min(local_timestamp) first_activity,max(local_timestamp) last_activity from IMART_ACTIVITY_SCOPE_V group by ${projection.split(',company_name')[0].replace(' activity_period','')},company_name,location_name,module_name,company_code,location_code,module_code`;}
 if(isMatrix)sql=sql.replace(`group by ${groupCols.join(',')}`,grouping);
 const outCols=[...new Set([...cols,...keys.filter(c=>!group.includes(c))]),...numeric.map(x=>x.toLowerCase()),'first_activity','last_activity',...(isMatrix?['row_kind']:[])];
 let url=drill(dims,keys);if(page===1101)url=drill(dims,['activity_period','company_code','location_code','module_code']);
 if(isMatrix)url=`case when row_kind='Detail' then ${url} when row_kind='Row total' then ${drill([dims[0]],[keys[0]])} when row_kind='Column total' then ${drill([dims[1]],[keys[1]])} else apex_page.get_url(p_page=>1113,p_clear_cache=>'RP,1113') end`;
 reports.push({page,title,alias,sql:`select ${outCols.map(c=>numeric.includes(c.toUpperCase())||c.endsWith('_activity')?c:`${safe(c)} ${c}`).join(',')},${url} detail_url from (${sql})`,columns:[...outCols,'detail_url'],description:isMatrix?'Searchable matrix equivalent. Row, column and grand totals are distinct aggregate rows; do not add totals to detail rows.':'Captured audit events within the common reporting scope. Successful, failed and observed outcomes remain separate.'});
}
const eventColumns=['audit_event_id','local_timestamp','user_name','bossusercode','employee_code','current_employee_name','current_department_name','company_name','location_name','module_name','page_name','form_name','original_action','operation','event_type','table_name','record_key','transaction_reference','outcome','error_code','audit_session_id','apex_session_id','source_type','correlation_id','transaction_id','exception_reason'];
const eventProjection=eventColumns.map(c=>['audit_event_id','local_timestamp','error_code','audit_session_id'].includes(c)?c:`${safe(c)} ${c}`).join(',');
const eventURL="apex_page.get_url(p_page=>1091,p_clear_cache=>'1091',p_items=>'P1091_EVENT_ID',p_values=>to_char(audit_event_id))";
const sessionReport={page:1110,title:'Observed authenticated sessions',columns:['audit_session_id','user_name','company_name','session_started','session_end','last_activity','session_minutes','end_status'],sql:`select s.audit_session_id,${safe('s.user_name')} user_name,${safe('max(e.company_name)')} company_name,
 cast(s.observed_at at time zone 'Asia/Kolkata' as timestamp) session_started,
 cast(min(case when e.event_type='AUTHENTICATION' and e.original_action in ('LOGOUT','SESSION_EXPIRED') and e.event_timestamp>=s.observed_at then e.event_timestamp end) at time zone 'Asia/Kolkata' as timestamp) session_end,
 max(e.local_timestamp) last_activity,
 round((cast(min(case when e.event_type='AUTHENTICATION' and e.original_action in ('LOGOUT','SESSION_EXPIRED') and e.event_timestamp>=s.observed_at then sys_extract_utc(e.event_timestamp) end) as date)-cast(sys_extract_utc(s.observed_at) as date))*1440,2) session_minutes,
 case when count(case when e.event_type='AUTHENTICATION' and e.original_action in ('LOGOUT','SESSION_EXPIRED') and e.event_timestamp>=s.observed_at then 1 end)>0 then 'Recorded end within selected period' else 'No recorded end within selected period' end end_status
 from IMART_ACTIVITY_SCOPE_V e join IMART_AUDIT_SESSION s on s.audit_session_id=e.audit_session_id and s.application_id=105 and s.apex_session_id=e.apex_session_id and s.user_name=e.user_name
 group by s.audit_session_id,s.user_name,s.observed_at`};
reports.push({page:1109,title:'Exception Activity MIS',alias:'ACTIVITY-EXCEPTIONS',sql:`select ${eventProjection},${eventURL} detail_url from IMART_ACTIVITY_SCOPE_V where exception_reason is not null`,columns:[...eventColumns,'detail_url'],description:'Captured failures, deletions and administrative entity changes. These are descriptive categories; deletions are not classified as security incidents. No configured risk score was verified.'});
reports.push({page:1110,title:'Login and Session MIS',alias:'ACTIVITY-SESSIONS',sql:`select ${eventProjection},${eventURL} detail_url from IMART_ACTIVITY_SCOPE_V where event_type='AUTHENTICATION'`,columns:[...eventColumns,'detail_url'],description:'Actual authentication events permitted by the existing organizational grants. Missing organization context can exclude login events. Session observation and last activity are reported separately below; no inferred logout or duration.'});
reports.push({page:1111,title:'Master Data Change MIS',alias:'ACTIVITY-MASTERS',sql:`select ${eventProjection},${eventURL} detail_url from IMART_ACTIVITY_SCOPE_V where event_type='ROW_CHANGE' and master_mapping is not null`,columns:[...eventColumns,'detail_url'],description:'Row changes to entities identified by the current MODULE.MASTERTABLENAME directory mapping. Current classification is not an historical classification snapshot.'});
reports.push({page:1112,title:'Administrative Entity Audit',alias:'ACTIVITY-PRIVILEGED',sql:`select ${eventProjection},${eventURL} detail_url from IMART_ACTIVITY_SCOPE_V where event_type='ROW_CHANGE' and table_name in ('BOSSUSER','BOSSUSERROLE')`,columns:[...eventColumns,'detail_url'],description:'Captured changes to the verified user and role-assignment entities. Historical actor privileges were not recorded, so this report does not assert that each actor was privileged.'});
const dimColumn={USER:'user_name',COMPANY:'company_code',LOCATION:'location_code',MODULE:'module_code',PAGE:'page_id',ACTION:'operation',OUTCOME:'outcome',SOURCE:'source_type',TABLE:'table_name',RECORD:'record_key',EVENT:'audit_event_id',EXCEPTION:'exception_reason',ROW_SUCCESS:'successful_row_operation',KEYED:"case when record_identity is not null then '1' else '0' end",OTHEROPS:"case when operation not in ('INSERT','UPDATE','DELETE') then '1' else '0' end"};
const drillPreds=[1,2,3,4].map(i=>`and (:P1113_D${i} is null or case :P1113_D${i} ${Object.entries(dimColumn).map(([d,c])=>`when '${d}' then nvl(to_char(${c}),'~NULL~')`).join(' ')} when 'PERIOD' then to_char(local_timestamp,case length(:P1113_V${i}) when 7 then 'YYYY-MM' when 13 then 'YYYY-MM-DD HH24' else 'YYYY-MM-DD' end) end = replace(replace(:P1113_V${i},'%2C',','),'%25','%'))`).join('\n');
reports.push({page:1113,title:'User Activity Detail',alias:'ACTIVITY-DETAIL',sql:`select ${eventProjection},${eventURL} detail_url,apex_page.get_url(p_page=>1114,p_clear_cache=>'RP,1114',p_items=>'P1114_EVENT',p_values=>to_char(audit_event_id)) history_url from IMART_ACTIVITY_SCOPE_V where 1=1 ${drillPreds}`,columns:[...eventColumns,'detail_url','history_url'],description:'Event-level detail. Open an event for masked field comparisons, or Record history for the same entity and captured key. All drill filters narrow the shared authorized population.'});
reports.push({page:1114,title:'Record Audit History',alias:'ACTIVITY-RECORD-HISTORY',sql:`select ${eventProjection},${eventURL} detail_url from IMART_ACTIVITY_SCOPE_V e where exists(select 1 from IMART_ACTIVITY_EVENTS_V chosen where chosen.audit_event_id=to_number(:P1114_EVENT default null on conversion error) and chosen.table_name=e.table_name and chosen.record_identity is not null and chosen.record_identity=e.record_identity)`,columns:[...eventColumns,'detail_url'],description:'History for the exact authorized entity and recorded key, within the selected period. Deleted records are represented only by captured events and available historical values. No current-row reconstruction.'});

const header=`set define off verify off feedback off\nwhenever sqlerror exit sql.sqlcode rollback\nbegin\nwwv_flow_imp.import_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');\nend;\n/\n`;
let apex=header;
const codeSources=[];
function call(name,args){return `wwv_flow_imp_page.${name}(\n${Object.entries(args).filter(([,v])=>v!==undefined).map(([k,v])=>` p_${k}=>${v}`).join(',\n')});\n`;}
const text=s=>q(s),bool=v=>v?'true':'false';
function region(name,source,type='NATIVE_PLSQL',sequence=10,span=12,opts={}){const rid=id();if(type==='NATIVE_PLSQL')codeSources.push({name,source});const filters=name==='Common reporting filters';apex+=call('create_page_plug',{id:ref(rid),plug_name:q(name),static_id:q('activity-'+rid),plug_template:ref(filters?'2664334895415463485':'4072358936313175081'),region_template_options:q(filters?'#DEFAULT#:is-collapsed:t-Region--scrollBody':'#DEFAULT#:t-Region--scrollBody'),plug_display_sequence:sequence,plug_item_display_point:q('ABOVE'),plug_grid_column_span:span,plug_new_grid_row:bool(opts.newRow??(span===12||sequence%2===0)),parent_plug_id:opts.parent?ref(opts.parent):undefined,plug_display_point:opts.parent?q('SUB_REGIONS'):undefined,plug_source:expr(source),plug_source_type:q(type==='STATIC'?'NATIVE_STATIC':type)});return rid;}
function plsqlRegion(name,source,sequence=10){return region(name,source,'NATIVE_PLSQL',sequence);}
function createPage(page,title,alias){
 apex+=`begin\n`+call('create_page',{id:page,name:q(title),alias:q(alias),step_title:q(title),step_template:ref('95002006100926'),required_role:ref(auth),protection_level:q('C'),warn_on_unsaved_changes:q('N'),autocomplete_on_off:q('OFF'),javascript_code_onload:page===1100?expr(fs.readFileSync(path.join(root,'activity.js'),'utf8')):undefined,inline_css:expr(fs.readFileSync(path.join(root,'activity.css'),'utf8')),page_component_map:q(page===1100?'04':'18')});
 let html=`<div class="hspl-hero-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></div><div class="hspl-title-block"><h1 class="hspl-page-title">${title}</h1><p class="hspl-page-desc">ERP Activity &amp; Audit MIS</p></div>`;
 apex+=call('create_page_plug',{id:ref(id()),plug_name:q('Activity page identity'),region_attributes:q('style="display:contents"'),plug_template:ref('95001071000503'),plug_display_sequence:1,plug_display_point:q('REGION_POSITION_01'),plug_source:q(html)});
 plsqlRegion('Reporting scope',`begin
 htp.p('<div class="am-context"><p><strong>Reporting period:</strong> '||apex_escape.html(v('P1100_FROM'))||' to '||apex_escape.html(v('P1100_TO'))||' (Asia/Kolkata, inclusive dates). Organization: '||apex_escape.html(nvl(v('P1100_COMPANY'),'All permitted companies'))||' / '||apex_escape.html(nvl(v('P1100_LOCATION'),'All permitted locations'))||'.</p>');
 htp.p('<p>Refreshed '||to_char(systimestamp at time zone 'Asia/Kolkata','DD-MON-YYYY HH24:MI:SS TZR')||'. Counts describe captured activity, not productivity.</p>');
 htp.p('<p>User: '||apex_escape.html(nvl(v('P1100_USER'),'All permitted'))||'; module: '||apex_escape.html(nvl(v('P1100_MODULE'),'All available'))||'; operation: '||apex_escape.html(nvl(v('P1100_ACTION'),'All captured'))||'; outcome: '||apex_escape.html(nvl(v('P1100_OUTCOME'),'All recorded'))||'.</p>');
 htp.p('<nav class="am-actions" aria-label="Activity navigation">');
 ${[[1100,'Dashboard / filters'],[1113,'Activity detail'],[1115,'Definitions & coverage'],[826,'Dashboard hub']].map(([p,l])=>`htp.p('<a class="t-Button" href="'||apex_escape.html_attribute(apex_page.get_url(p_page=>${p},p_clear_cache=>${p===1113?"'RP,1113'":"null"}))||'">${l.replace('&','&amp;')}</a>');`).join('\n')}
 htp.p('<button type="button" class="t-Button" onclick="window.location.reload()">Refresh</button><button type="button" class="t-Button" onclick="window.print()">Print</button></nav></div>');
end;`,2);
 // Fail closed outside a sensible period, including direct report URLs.
 apex+=call('create_page_process',{id:ref(id()),process_sequence:1,process_point:q('BEFORE_HEADER'),process_type:q('NATIVE_PLSQL'),process_name:q('Initialize and validate shared reporting period'),process_sql_clob:expr(`declare f date;t date;begin
 if v('P1100_FROM') is null then apex_util.set_session_state('P1100_FROM',to_char(${currentDay},'YYYY-MM-DD'));end if;
 if v('P1100_TO') is null then apex_util.set_session_state('P1100_TO',to_char(${currentDay},'YYYY-MM-DD'));end if;
 f:=${day('FROM',false)};t:=${day('TO',false)};
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,'Choose a valid period of at most 366 days.');end if;
end;`),process_clob_language:q('PLSQL')});
}
function finish(){apex+='end;\n/\n';}
function reportRegion(report,seq=30){const rid=id(),wid=id();
 apex+=call('create_page_plug',{id:ref(rid),plug_name:q(report.title),static_id:q('am-report-'+report.page+'-'+seq),plug_template:ref('4072358936313175081'),plug_display_sequence:seq,plug_source:expr(report.sql),plug_source_type:q('NATIVE_IR'),plug_query_options:q('DERIVED_REPORT_COLUMNS')});
 apex+=call('create_worksheet',{id:ref(wid),max_row_count:q('1000000'),max_row_count_message:q('More than 1,000,000 rows match. Narrow the reporting period or filters before reporting or exporting.'),max_rows_per_page:q('1000'),pagination_type:q('ROWS_X_TO_Y_OF_Z'),pagination_display_pos:q('BOTTOM_RIGHT'),report_list_mode:q('TABS'),lazy_loading:'false',show_detail_link:q(report.columns.includes('detail_url')?'C':'N'),detail_link:report.columns.includes('detail_url')?q(report.page===1113?'#HISTORY_URL#':'#DETAIL_URL#'):undefined,detail_link_text:report.columns.includes('detail_url')?q(report.page===1113?'Record history':'View details'):undefined,show_flashback:q('N'),show_download:q('Y'),download_auth_scheme:ref(exportAuth),download_formats:q('CSV:XLSX:HTML'),enable_mail_download:q('N'),show_notify:q('N'),no_data_found_message:q('No captured events match the selected filters and your permitted scope.'),internal_uid:wid});
 const identifiers=[];
 report.columns.forEach((c,i)=>{let ident=String.fromCharCode(65+Math.floor(i/26)-1).replace('@','')+String.fromCharCode(65+i%26);identifiers.push(ident);
 let isNum=numeric.includes(c.toUpperCase())||['audit_event_id','error_code','audit_session_id','session_minutes'].includes(c),isDate=c==='local_timestamp'||c.endsWith('_activity')||['session_started','session_end'].includes(c);
 const isURL=c.endsWith('_url');let label=c==='detail_url'?'Event / detail':c==='history_url'?'Record history':c.replace(/_/g,' ').replace(/\b\w/g,x=>x.toUpperCase());
 apex+=call('create_worksheet_column',{id:ref(id()),db_column_name:q(c.toUpperCase()),display_order:(i+1)*10,column_identifier:q(ident),column_label:q(label),column_type:q(isNum?'NUMBER':isDate?'DATE':'STRING'),column_alignment:q(isNum?'RIGHT':'LEFT'),format_mask:c==='session_minutes'?q('999G999G990D00'):isNum?q('999G999G999G990'):isDate?q('DD-MON-YYYY HH24:MI:SS'):undefined,column_link:c==='audit_event_id'?q('#DETAIL_URL#'):undefined,column_linktext:c==='audit_event_id'?q('#AUDIT_EVENT_ID#'):undefined,use_as_row_header:q('N'),available_clientside:q('N'),display_text_as:q(isURL?'HIDDEN':'ESCAPE_SC')});
 });
 apex+=call('create_worksheet_rpt',{id:ref(id()),application_user:q('APXWS_DEFAULT'),report_seq:10,report_alias:q('AM'+report.page+seq),status:q('PUBLIC'),is_default:q('Y'),report_columns:q(report.columns.filter(c=>!c.endsWith('_url')).map(c=>c.toUpperCase()).join(':')),sort_column_1:q(report.columns[0].toUpperCase()),sort_direction_1:q(report.page>=1109?'DESC':'ASC')});
}

createPage(1100,'ERP Activity & Audit Dashboard','ACTIVITY-MONITORING');
const filterRid=region('Common reporting filters','', 'STATIC',5);
const lovQueries=[];
function item(name,label,type,opts={}){if(opts.lov&&!opts.lov.startsWith('STATIC:')){opts.lov=opts.lov.replace(' where ',` where ${lovBounds} and `);lovQueries.push({name,sql:opts.lov});}apex+=call('create_page_item',{id:ref(id()),name:q('P1100_'+name),item_sequence:opts.seq||10,item_plug_id:ref(filterRid),prompt:q(label),display_as:q(type),source_type:q('ALWAYS_NULL'),field_template:ref('2318601014859922299'),item_template_options:q('#DEFAULT#:t-Form-fieldContainer--stretchInputs'),colspan:3,begin_on_new_line:q([10,50,85,120].includes(opts.seq||10)?'Y':'N'),item_default:opts.default?q(opts.default):undefined,item_default_type:opts.defaultType?q(opts.defaultType):undefined,item_default_language:opts.defaultType==='EXPRESSION'?q('PLSQL'):undefined,lov:opts.lov?expr(opts.lov):undefined,lov_display_null:opts.lov?q('YES'):undefined,lov_null_text:opts.lov?q('All permitted / available'):undefined,lov_display_extra:opts.lov?q('NO'):undefined,lov_cascade_parent_items:opts.parent?q(opts.parent):undefined,ajax_items_to_submit:opts.parent?q(opts.parent):undefined,format_mask:opts.format?q(opts.format):undefined,attributes:opts.attrs?`wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(${Object.entries(opts.attrs).flatMap(([k,v])=>[q(k),q(v)]).join(',')})).to_clob`:undefined});}
item('QUICK','Quick date selection','NATIVE_SELECT_LIST',{seq:10,default:'TODAY',lov:'STATIC:Today;TODAY,Yesterday;YESTERDAY,This Week;WEEK,This Month;MONTH,Previous Month;PREVIOUS,Custom;CUSTOM',attrs:{page_action_on_selection:'NONE'}});
for(const[n,l,s]of [['FROM','Start date',20],['TO','End date',30]])item(n,l,'NATIVE_DATE_PICKER_APEX',{seq:s,format:'YYYY-MM-DD',attrs:{display_as:'POPUP',max_date:'NONE',min_date:'NONE',multiple_months:'N',show_time:'N',use_defaults:'Y'}});
item('GRAIN','Time grouping','NATIVE_SELECT_LIST',{seq:40,default:'DAY',lov:'STATIC:Hour;HOUR,Day;DAY,Month;MONTH',attrs:{page_action_on_selection:'NONE'}});
const lovs=[['COMPANY','Company','company_code',"company_code||' - '||company_name"],['LOCATION','Location','location_code',"location_code||' - '||location_name"],['USER','ERP user','user_name','user_name'],['EMPLOYEE','Recorded employee code','employee_code','employee_code'],['MODULE','Module','module_code',"module_code||' - '||module_name"],['PAGE','Screen','to_char(page_id)',"to_char(page_id)||' - '||page_name"],['ACTION','Operation','operation','operation'],['OUTCOME','Outcome','outcome','outcome'],['SOURCE','Source','source_type','source_type'],['TABLE','Entity','table_name','table_name'],['RECORD','Exact record key','record_key','record_key']];
lovs.forEach(([n,l,c,d],i)=>{const conditional=n==='LOCATION'?` and (${state('COMPANY')} is null or company_code=${state('COMPANY')})`:n==='PAGE'?` and (${state('MODULE')} is null or module_code=${state('MODULE')})`:'';item(n,l,n==='RECORD'?'NATIVE_TEXT_FIELD':'NATIVE_SELECT_LIST',{seq:50+i*10,lov:n==='RECORD'?undefined:`select distinct ${d} d,${c} r from IMART_ACTIVITY_EVENTS_V where ${c} is not null${conditional} order by 1`,parent:n==='LOCATION'?'P1100_COMPANY':n==='PAGE'?'P1100_MODULE':undefined,attrs:n==='RECORD'?{trim_spaces:'BOTH'}:{page_action_on_selection:'NONE'}});});
item('DEPARTMENT','Current department','NATIVE_SELECT_LIST',{seq:85,lov:'select distinct current_department_name d,current_department_code r from IMART_ACTIVITY_EVENTS_V where current_department_code is not null order by 1',attrs:{page_action_on_selection:'NONE'}});
const applyId=id(),clearId=id();
for(const [bid,name,label,pos]of [[applyId,'APPLY','Apply / refresh','CHANGE'],[clearId,'CLEAR','Clear filters','CLOSE']])apex+=call('create_page_button',{id:ref(bid),button_sequence:10,button_plug_id:ref(filterRid),button_name:q(name),button_action:q('SUBMIT'),button_template_id:ref('4072362960822175091'),button_image_alt:q(label),button_position:q(pos),button_is_hot:q(name==='APPLY'?'Y':'N')});
const applyCode=`declare f date;t date;d date:=${currentDay};begin
 if :REQUEST='CLEAR' then
 ${filterNames.map(n=>`apex_util.set_session_state('P1100_${n}',null);`).join('\n')}
 :P1100_QUICK:='TODAY';:P1100_GRAIN:='DAY';end if;
 case nvl(:P1100_QUICK,'CUSTOM') when 'TODAY' then f:=d;t:=d;when 'YESTERDAY' then f:=d-1;t:=d-1;when 'WEEK' then f:=trunc(d,'IW');t:=d;when 'MONTH' then f:=trunc(d,'MM');t:=d;when 'PREVIOUS' then f:=add_months(trunc(d,'MM'),-1);t:=trunc(d,'MM')-1;when 'CUSTOM' then f:=to_date(:P1100_FROM default null on conversion error,'FXYYYY-MM-DD');t:=to_date(:P1100_TO default null on conversion error,'FXYYYY-MM-DD');else raise_application_error(-20840,'Invalid quick date selection');end case;
 if f is null or t is null or t<f or t-f>365 then raise_application_error(-20840,'Choose a valid period of at most 366 days.');end if;
 if :P1100_GRAIN not in ('HOUR','DAY','MONTH') or :P1100_GRAIN is null then raise_application_error(-20840,'Choose Hour, Day or Month.');end if;
 :P1100_FROM:=to_char(f,'YYYY-MM-DD');:P1100_TO:=to_char(t,'YYYY-MM-DD');
end;`;
apex+=call('create_page_process',{id:ref(id()),process_sequence:1,process_point:q('ON_SUBMIT_BEFORE_COMPUTATION'),process_type:q('NATIVE_PLSQL'),process_name:q('Validate and apply common scope'),process_sql_clob:expr(applyCode),process_clob_language:q('PLSQL')});
// POST/redirect/GET resets IR pagination; canonical filters remain in session.
apex+=call('create_page_branch',{id:ref(id()),branch_name:q('Applied reporting scope'),branch_action:q('f?p=&APP_ID.:1100:&APP_SESSION.::&DEBUG.:RP'),branch_point:q('AFTER_PROCESSING'),branch_type:q('REDIRECT_URL'),branch_sequence:10});
const kpiSQL=`select ${metrics},sum(case when original_action='LOGIN' and outcome='FAILURE' then 1 else 0 end) failed_logins from IMART_ACTIVITY_SCOPE_V`;
const kpiFilters={'Successful row operations':['ROW_SUCCESS','1'],'Captured failure events':['OUTCOME','FAILURE'],'Distinct records affected':['KEYED','1'],'Active ERP users':['SOURCE','APEX_USER'],'Insert events':['ACTION','INSERT'],'Update events':['ACTION','UPDATE'],'Delete events':['ACTION','DELETE'],'Observed events':['OUTCOME','OBSERVED'],'Successful events':['OUTCOME','SUCCESS'],'Other operation events':['OTHEROPS','1']};
plsqlRegion('Activity KPIs',`declare r sys_refcursor;begin
 for r in (${kpiSQL}) loop
 htp.p('<div class="am-kpis">');
 ${[['Total activity events','total_events',1113],['Successful row operations','successful_row_operations',1113],['Captured failure events','failed_events',1109],['Distinct records affected','distinct_records',1113],['Active ERP users','active_users',1102],['Insert events','inserts',1108],['Update events','updates',1108],['Delete events','deletes',1109],['Observed events','observed_events',1113],['Failed login events','failed_logins',1110],['Successful events','successful_events',1113],['Other operation events','other_events',1108]].map(([label,c,p])=>{let filter=kpiFilters[label];let u=label==='Failed login events'?`apex_page.get_url(p_page=>1113,p_clear_cache=>'RP,1113',p_items=>'P1113_D1,P1113_V1,P1113_D2,P1113_V2',p_values=>'ACTION,LOGIN,OUTCOME,FAILURE')`:filter?`apex_page.get_url(p_page=>1113,p_clear_cache=>'RP,1113',p_items=>'P1113_D1,P1113_V1',p_values=>'${filter.join(',')}')`:`apex_page.get_url(p_page=>${p},p_clear_cache=>'RP,${p}')`;return `htp.p('<a class="am-kpi" href="'||apex_escape.html_attribute(${u})||'"><span>${label}</span><strong>'||to_char(nvl(r.${c},0),'FM999G999G999G990')||'</strong><small>View captured activity <span class="fa fa-arrow-right" aria-hidden="true"></span></small></a>');`;}).join('\n')}
 htp.p('</div><p class="am-note">Successful row operations count only successful ROW_CHANGE events. Total events also include observed page access, authentication, errors and high-level business events. Missing history is not inactivity. <a href="'||apex_escape.html_attribute(apex_page.get_url(p_page=>1115))||'">Counting rules and coverage</a></p>');
 end loop;
end;`,10);
const moduleChart=`select case when r.rn<=12 then e.module_name else 'Other modules' end label,e.operation series,count(*) value,case when r.rn<=12 then e.module_code else '~OTHER~' end drill_key
 from IMART_ACTIVITY_SCOPE_V e join (select module_code,row_number() over(order by count(*) desc,module_code) rn from IMART_ACTIVITY_SCOPE_V group by module_code) r on r.module_code=e.module_code
 group by case when r.rn<=12 then e.module_name else 'Other modules' end,e.operation,case when r.rn<=12 then e.module_code else '~OTHER~' end`;
const trend=require('./trend-design.cjs')({day,grainBind,drill});
const trendParent='92002610208000000',trendTable='92002610208000001';
const chartSpecs=[
 ['Activity trend',trend.sql,'line','vertical','PERIOD','label'],
 ['Operation distribution',`select operation label,operation series,count(*) value from IMART_ACTIVITY_SCOPE_V group by operation`,'donut','vertical','ACTION','label'],
 ['Module activity (top 12 plus others)',moduleChart,'bar','horizontal','MODULE','drill_key'],
 ['Top active ERP users',`select user_name label,'Events' series,count(*) value from IMART_ACTIVITY_SCOPE_V where source_type='APEX_USER' and user_name is not null group by user_name order by value desc,user_name fetch first 10 rows only`,'bar','horizontal','USER','label'],
 ['Company and location comparison',`select company_name||' / '||location_name label,'Events' series,count(*) value,company_code drill_key,location_code drill_location from IMART_ACTIVITY_SCOPE_V group by company_name,location_name,company_code,location_code`,'bar','horizontal','COMPANY','drill_key'],
 ['Exception categories',`select exception_reason label,'Events' series,count(*) value from IMART_ACTIVITY_SCOPE_V where exception_reason is not null group by exception_reason`,'bar','horizontal',null,null]
];
const seriesQueries=[];
for(let i=0;i<chartSpecs.length;i++){let[name,sql,type,orientation,dimension,key]=chartSpecs[i];
 if(i===0){codeSources.push({name:'Activity trend introduction',source:trend.introSource});apex+=call('create_page_plug',{id:ref(trendParent),plug_name:q('Activity trend'),plug_template:ref('4072358936313175081'),region_template_options:q('#DEFAULT#:js-showMaximizeButton'),plug_display_sequence:20,plug_grid_column_span:12,plug_new_grid_row:'true',region_css_classes:q('am-trend-panel'),plug_source:expr(trend.introSource),plug_source_type:q('NATIVE_PLSQL')});}
 let cid=id(),rid=region(i===0?'Activity trend chart':name,'','NATIVE_JET_CHART',i===0?10:20+i,i===0?12:6,{newRow:i%2===1,parent:i===0?trendParent:undefined});
 apex+=call('create_jet_chart',{id:ref(cid),region_id:ref(rid),chart_type:q(type),height:q(i===0?'360':'330'),animation_on_display:q('none'),animation_on_data_change:q('none'),orientation:q(orientation),stack:q(i===2?'on':'off'),legend_rendered:q(['line','donut'].includes(type)||i===2?'on':'off'),legend_position:q('bottom'),tooltip_rendered:q('Y'),show_series_name:'true',show_group_name:'true',show_value:'true',no_data_found_message:q('No captured events in this scope.')});
 const url=i===0?drill(['PERIOD','ACTION'],['label','series']):i===2?`case when drill_key='~OTHER~' then apex_page.get_url(p_page=>1103,p_clear_cache=>'RP') else ${drill(['MODULE','ACTION'],['drill_key','series'])} end`:i===4?drill(['COMPANY','LOCATION'],['drill_key','drill_location']):i===5?drill(['EXCEPTION'],['label']):dimension?drill([dimension],[key]):"apex_page.get_url(p_page=>1109)";
 seriesQueries.push({name,sql:`select x.label,x.series,x.value,${url} drill_url from (${sql}) x`});
 const seriesId=id();
 const chartSeries=i===0?[['INSERT','#1688ff',seriesId],['UPDATE','#00a884','92002610208000002'],['DELETE','#a855f7','92002610208000003']]:[[name,null,seriesId]];
 for(const [seriesName,color,sid] of chartSeries)apex+=call('create_jet_chart_series',{id:ref(sid),chart_id:ref(cid),seq:i===0?10+chartSeries.findIndex(s=>s[0]===seriesName)*10:10,name:q(seriesName),data_source_type:q('SQL'),data_source:expr(`select x.label,x.series,x.value,${i===0?`case length(x.label) when 13 then case when ${day('FROM')}=${day('TO')} then substr(x.label,12,2)||':00' else to_char(to_date(substr(x.label,1,10),'YYYY-MM-DD'),'DD Mon','NLS_DATE_LANGUAGE=English')||' '||substr(x.label,12,2)||':00' end when 10 then to_char(to_date(x.label,'YYYY-MM-DD'),'Dy DD Mon','NLS_DATE_LANGUAGE=English') else to_char(to_date(x.label||'-01','YYYY-MM-DD'),'Mon YYYY','NLS_DATE_LANGUAGE=English') end display_label,`:''}${url} drill_url from (${sql}) x${i===0?` where x.series=${q(seriesName)}`:''}`),series_type:q(type),series_name_column_name:q('SERIES'),items_label_column_name:q(i===0?'DISPLAY_LABEL':'LABEL'),items_value_column_name:q('VALUE'),color:color?q(color):undefined,line_width:i===0?2:undefined,marker_rendered:i===0?q('on'):undefined,marker_shape:i===0?q('circle'):undefined,link_target:q('&DRILL_URL.'),link_target_type:q('REDIRECT_URL'),items_label_rendered:'false'});
 if(type!=='donut')for(const axis of ['x','y'])apex+=call('create_jet_chart_axis',{id:ref(id()),chart_id:ref(cid),axis:q(axis),is_rendered:q('on'),format_scaling:q('none'),decimal_places:0,tick_label_rendered:q('on')});
 if(i===0){codeSources.push({name:'Activity trend data table',source:trend.tableSource});apex+=call('create_page_plug',{id:ref(trendTable),plug_name:q('Activity trend data'),parent_plug_id:ref(trendParent),plug_display_point:q('SUB_REGIONS'),plug_template:ref('3371237801798025892'),region_template_options:q('#DEFAULT#:t-Region--noUI'),plug_display_sequence:20,plug_grid_column_span:12,plug_new_grid_row:'true',plug_source:expr(trend.tableSource),plug_source_type:q('NATIVE_PLSQL')});}
}
plsqlRegion('MIS reports',`begin htp.p('<div class="hspl-directory-grid am-directory">');
${reports.filter(r=>r.page<1113).map((r,i)=>`htp.p('<a class="hspl-directory-card hspl-directory-tone-${i%8}" href="'||apex_escape.html_attribute(apex_page.get_url(p_page=>${r.page},p_clear_cache=>'RP'))||'"><span class="hspl-directory-icon"><span class="fa fa-table" aria-hidden="true"></span></span><span class="hspl-directory-title">${r.title.replace('&','&amp;')}</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span></a>');`).join('\n')}
htp.p('</div>');end;`,40);
finish();
for(const r of reports){createPage(r.page,r.title,r.alias);region('Report definition',`<p>${r.description}</p>`,'STATIC',10);
 if(r.page===1113)for(let i=1;i<=4;i++)for(const suffix of ['D','V'])apex+=call('create_page_item',{id:ref(id()),name:q(`P1113_${suffix}${i}`),item_sequence:i,display_as:q('NATIVE_HIDDEN'),protection_level:q('S'),attributes:"wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob"});
 if(r.page===1114)apex+=call('create_page_item',{id:ref(id()),name:q('P1114_EVENT'),item_sequence:1,display_as:q('NATIVE_HIDDEN'),protection_level:q('S'),attributes:"wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected','Y')).to_clob"});
 reportRegion(r);if(r.page===1110)reportRegion(sessionReport,40);finish();}
const coverage=`<div class="am-coverage"><h2>What this dashboard measures</h2><p>Canonical captured audit events, filtered by recorded organization and your existing access grants. All pages share the Dashboard filters. Event outcomes SUCCESS, FAILURE and OBSERVED remain separate; observed approvals, page views and session ends are not successful transaction claims.</p><h3>Available</h3><ul><li>Event, user, module, company, location and operation summaries.</li><li>Searchable user × module and company × location matrices with separate total rows.</li><li>Failures, deletions, current mapped master changes and user/role-entity changes.</li><li>Event detail and masked historical field comparisons using existing audit dialogs.</li><li>Authorized native CSV, XLSX and HTML export; browser Print. Strings that could become spreadsheet formulas receive an apostrophe prefix.</li></ul><h3>Historical limits</h3><p>Capture observed from 4 October 2026. Missing company/location context remains excluded for company-only viewers. Current company, location and module labels are directory enrichment, not historical snapshots. High-level business events and row changes are distinct units; use Successful row operations for successful database row changes. Active ERP users means distinct recorded APEX_USER usernames, not database jobs.</p><h3>Unavailable until verified</h3><ul><li>Registered/inactive users: a complete user-to-organization membership relationship has not been verified. No activity does not prove inactivity.</li><li>Historical employee names, department and actor role: no verified snapshots. Recorded employee codes and explicitly labeled current employee/department names are available.</li><li>Submodule hierarchy and policy risk classifications: no verified mapping or configured risk/working-hour thresholds.</li><li>Privileged actor assertions: user and role-entity changes are shown; historical role membership is not inferred from username.</li><li>Failed logins lacking permitted organization context remain restricted. Session duration and concurrency are not inferred from ordinary page views.</li><li>Scheduled delivery: no verified authorized audit-report subscription/recipient service. Needs an approved recipient directory, per-recipient scope, credential-safe mail/print configuration, job ownership and retention policy. Existing task jobs are not audit delivery jobs.</li><li>Server PDF generation is not claimed; use browser Print unless approved print infrastructure is configured.</li></ul><h3>Security</h3><p>Audit Inquiry Access controls these pages. Central IMART_AUDIT.can_read controls all events; filters only narrow that scope. Downloads additionally require can_export for every organization in the selected population. No new grants, business records, audit policies or capture triggers are introduced. Application-wide Session State Protection is currently disabled in the existing ERP. Page/item checksum settings are configured, but do not enforce URL integrity until the application setting is reviewed separately. Central server-side organization checks remain enforced.</p><h3>Counting and boundaries</h3><p>Total events counts event IDs once. Failure events are recorded failures, not asserted unique attempts. Distinct records include table and key. Field rows never multiply event totals. Start date is inclusive; end date ends at the next midnight in Asia/Kolkata. Maximum period: 366 days. Matrix totals are not additional detail events. Top users shows ten actors by volume and does not measure productivity.</p></div>`;
createPage(1115,'Activity Definitions & Coverage','ACTIVITY-COVERAGE');region('Coverage and counting rules',coverage,'STATIC',10);finish();
apex+=`begin\nwwv_flow_imp_shared.create_security_scheme(p_id=>${ref(exportAuth)},p_name=>'Activity export permitted scope',p_scheme_type=>'NATIVE_FUNCTION_BODY',p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('plsql_function_body',${expr(`declare n number;begin if not imart_audit.can_inquire then return false;end if;select count(*) into n from (select distinct company_code,location_code from IMART_ACTIVITY_SCOPE_V) where imart_audit.can_export(company_code,location_code)<>1;return n=0;end;`)})).to_clob,p_caching=>'NOCACHE',p_error_message=>'Your audit grants do not permit export for this reporting scope.');\nwwv_flow_imp.import_end;\ncommit;\nend;\n/\n`;
write('02_apex_pages.sql',apex);
const hubSource=`begin
 if imart_audit.can_inquire then
 htp.p('<section class="hspl-directory-grid" aria-label="Activity Monitoring dashboard shortcut"><a class="hspl-directory-card hspl-directory-tone-4 hspl-dashboard-card" data-hspl-card-index="5" href="'||apex_escape.html_attribute(apex_page.get_url(p_page=>1100))||'"><span class="hspl-directory-icon"><span class="fa fa-bar-chart" aria-hidden="true"></span></span><span class="hspl-directory-title">Activity Monitoring</span><span class="hspl-directory-arrow fa fa-arrow-right-alt" aria-hidden="true"></span><span class="hspl-dashboard-description">Review recorded ERP activity, audit changes and management reports.</span><span class="hspl-dashboard-meta">ACTIVITY · AUDIT · MIS</span></a></section>');
 end if;
end;`;
write('03_dashboard_hub_card.sql',header+`begin\n`+call('create_page_plug',{id:ref('92002610209999000'),flow_id:105,page_id:826,plug_name:q('Activity Monitoring shortcut'),static_id:q('activity-monitoring-shortcut'),plug_template:ref('3371237801798025892'),region_template_options:q('#DEFAULT#:t-Region--noUI'),plug_display_sequence:20,plug_source:expr(hubSource),plug_source_type:q('NATIVE_PLSQL')})+`wwv_flow_imp.import_end;\ncommit;\nend;\n/\n`);
codeSources.push({name:'Hub fifth card',source:hubSource});
write('report_queries.json',JSON.stringify([...reports,sessionReport],null,2));
write('chart_queries.json',JSON.stringify(chartSpecs.map(([name,sql])=>({name,sql})),null,2));
write('source_queries.json',JSON.stringify({base,scoped,kpiSQL,applyCode,codeSources,seriesQueries,lovQueries,securityPredicate},null,2));
console.log(`Generated ${reports.length+2} pages, ${reports.length} reports, ${chartSpecs.length} charts; no database changes made.`);
