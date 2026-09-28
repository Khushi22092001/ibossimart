const fs = require("fs");
const path = require("path");

const root = path.join(__dirname, "staged");
const pages = [69,118,140,143,146,152,155,171,175,190,191,274,710];
const riskName = /amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency|hsn|item|record/i;
const riskyEvent = /focusout|focusin|blur|keyup|keydown|keypress/i;

function value(block, property) {
  const match = block.match(new RegExp("," + property + "=>'((?:''|[^'])*)'"));
  return match ? match[1].replace(/''/g, "'") : "";
}

function blocks(source, marker) {
  const starts = [];
  let at = 0;
  while ((at = source.indexOf(marker, at)) >= 0) {
    starts.push(at);
    at += marker.length;
  }
  return starts.map((start, i) => source.slice(start, i + 1 < starts.length ? starts[i + 1] : source.length));
}

for (const page of pages) {
  const file = path.join(root, `f105_page_${page}.sql`);
  const source = fs.readFileSync(file, "utf8");
  const events = blocks(source, "wwv_flow_imp_page.create_page_da_event(");
  const risks = [];
  for (const event of events) {
    const headEnd = event.indexOf("\n);");
    const head = headEnd >= 0 ? event.slice(0, headEnd) : event;
    const name = value(head, "p_name");
    const eventType = value(head, "p_bind_event_type");
    const trigger = value(head, "p_triggering_element");
    const disabled = value(head, "p_display_when_type") === "NEVER";
    if (disabled || !riskName.test(name)) continue;
    const actions = blocks(event.slice(headEnd + 3), "wwv_flow_imp_page.create_page_da_action(");
    const noWait = actions.filter(a => /NATIVE_EXECUTE_PLSQL_CODE|NATIVE_SET_VALUE/.test(value(a,"p_action")) && value(a,"p_wait_for_result") !== "Y").length;
    const commits = actions.filter(a => /commit\s*;/i.test(a)).length;
    const timers = actions.filter(a => /setTimeout/i.test(a)).length;
    const noStop = actions.filter(a => /NATIVE_EXECUTE_PLSQL_CODE|NATIVE_SET_VALUE/.test(value(a,"p_action")) && value(a,"p_stop_execution_on_error") !== "Y").length;
    if (riskyEvent.test(eventType) || noWait || commits || timers || /footer/i.test(name)) {
      risks.push({name,eventType,trigger,noWait,noStop,commits,timers,actions:actions.length});
    }
  }
  const fdLinks = (source.match(/javascript:[^'"\r\n]*(?:FD|Footer|footer)[^'"\r\n]*/g) || []).slice(0,12);
  const footerRegions = blocks(source,"wwv_flow_imp_page.create_page_plug(")
    .map(b => ({name:value(b,"p_plug_name"),id:value(b,"p_static_id")}))
    .filter(r => /footer|tax/i.test(r.name + " " + r.id));
  const markers = [...source.matchAll(/HSPL_[A-Z0-9_]+/g)].map(m=>m[0]).filter((v,i,a)=>a.indexOf(v)===i);
  console.log(JSON.stringify({page,risks,fdLinks,footerRegions,markers},null,2));
}
