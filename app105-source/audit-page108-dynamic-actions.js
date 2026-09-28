const fs = require("fs");

const source = fs.readFileSync(process.argv[2], "utf8");

function value(block, name) {
  const stringMatch = block.match(new RegExp(`,?${name}=>'((?:''|[^'])*)'`));
  if (stringMatch) return stringMatch[1].replace(/''/g, "'");
  const idMatch = block.match(new RegExp(`,?${name}=>wwv_flow_imp\\.id\\((\\d+)\\)`));
  return idMatch ? idMatch[1] : "";
}

const events = new Map();
for (const match of source.matchAll(/wwv_flow_imp_page\.create_page_da_event\(([\s\S]*?)\n\);/g)) {
  const block = match[1];
  const id = value(block, "p_id");
  events.set(id, {
    id,
    name: value(block, "p_name"),
    trigger: value(block, "p_triggering_element"),
    event: value(block, "p_bind_event_type"),
    disabled: value(block, "p_display_when_type") === "NEVER",
    actions: [],
  });
}

for (const match of source.matchAll(/wwv_flow_imp_page\.create_page_da_action\(([\s\S]*?)\n\);/g)) {
  const block = match[1];
  const eventId = value(block, "p_event_id");
  const event = events.get(eventId);
  if (!event) continue;
  const wait = value(block, "p_wait_for_result");
  const affected = value(block, "p_affected_elements");
  const action = value(block, "p_action");
  const attrs = block.match(/p_attributes=>wwv_flow_t_plugin_attributes\(wwv_flow_t_varchar2\(([\s\S]*?)\)\)\.to_clob/);
  const type = attrs ? value(attrs[1], "type") : "";
  const suppress = attrs ? value(attrs[1], "suppress_change_event") : "";
  event.actions.push({ action, affected, wait, type, suppress });
}

for (const event of events.values()) {
  if (event.disabled) continue;
  const rows = event.actions.map((a) =>
    `${a.action}${a.affected ? ` -> ${a.affected}` : ""}${a.type ? ` [${a.type}]` : ""}${a.wait ? ` wait=${a.wait}` : ""}${a.suppress ? ` suppress=${a.suppress}` : ""}`
  );
  console.log(`${event.id}\t${event.name}\t${event.trigger}\t${event.event}\t${rows.join(" | ")}`);
}
