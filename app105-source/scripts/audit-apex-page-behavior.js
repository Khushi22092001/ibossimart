const fs = require("fs");

const file = process.argv[2];
if (!file) throw new Error("Usage: node audit-apex-page-behavior.js <page.sql> [name-pattern]");
const pattern = new RegExp(process.argv[3] || ".", "i");
const source = fs.readFileSync(file, "utf8");
const marker = "wwv_flow_imp_page.create_page_da_event(";
const starts = [];
let at = 0;
while ((at = source.indexOf(marker, at)) >= 0) {
  starts.push(at);
  at += marker.length;
}

function value(block, property) {
  const match = block.match(new RegExp("," + property + "=>'((?:''|[^'])*)'"));
  return match ? match[1].replace(/''/g, "'") : "";
}

for (let i = 0; i < starts.length; i++) {
  const block = source.slice(starts[i], i + 1 < starts.length ? starts[i + 1] : source.length);
  const headEnd = block.indexOf("\n);");
  if (headEnd < 0) continue;
  const head = block.slice(0, headEnd);
  const name = value(head, "p_name");
  if (!pattern.test(name)) continue;
  const actions = [...block.matchAll(/wwv_flow_imp_page\.create_page_da_action\(([\s\S]*?)(?=\n\);)/g)].map((match) => ({
    action: value(match[1], "p_action"),
    affected: value(match[1], "p_affected_elements"),
    executeOnInit: value(match[1], "p_execute_on_page_init"),
    wait: value(match[1], "p_wait_for_result"),
    code: value(match[1], "p_attribute_01").slice(0, 220),
  }));
  console.log(JSON.stringify({
    name,
    event: value(head, "p_bind_event_type"),
    selection: value(head, "p_triggering_element_type"),
    elements: value(head, "p_triggering_element"),
    condition: value(head, "p_display_when_type"),
    actions,
  }));
}
