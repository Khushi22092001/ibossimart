const fs = require("fs");

function field(block, name) {
  const match = block.match(new RegExp("," + name.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + "=>(?:wwv_flow_imp\\.id\\()?('(?:''|[^'])*'|[0-9]+)", "m"));
  if (!match) return "";
  return match[1].startsWith("'") ? match[1].slice(1, -1).replace(/''/g, "'") : match[1];
}

for (const path of process.argv.slice(2)) {
  const source = fs.readFileSync(path, "utf8");
  const page = (source.match(/wwv_flow_imp_page\.create_page\([\s\S]*?\bp_id=>(\d+)/) || [])[1] || "?";
  const pageName = (source.match(/wwv_flow_imp_page\.create_page\([\s\S]*?,p_name=>'((?:''|[^'])*)'/) || [])[1]?.replace(/''/g, "'") || "?";
  console.log(`\n## ${page} ${pageName}`);
  console.log("### Dynamic Actions");
  for (const match of source.matchAll(/wwv_flow_imp_page\.create_page_da_event\(([\s\S]*?)\n\);/g)) {
    const b = match[1];
    console.log([field(b, "p_name"), field(b, "p_bind_event_type"), field(b, "p_triggering_element"), field(b, "p_display_when_type") || "ACTIVE", field(b, "p_client_condition_expression")].join(" | "));
  }
  console.log("### Submit Processes");
  for (const match of source.matchAll(/wwv_flow_imp_page\.create_page_process\(([\s\S]*?)\n\);/g)) {
    const b = match[1];
    const point = field(b, "p_process_point");
    if (point === "AFTER_SUBMIT" || point === "ON_SUBMIT_BEFORE_COMPUTATION") {
      console.log([field(b, "p_process_sequence"), point, field(b, "p_process_name"), field(b, "p_process_type")].join(" | "));
    }
  }
  console.log("### Validations");
  for (const match of source.matchAll(/wwv_flow_imp_page\.create_page_validation\(([\s\S]*?)\n\);/g)) {
    const b = match[1];
    console.log([field(b, "p_validation_sequence"), field(b, "p_validation_name"), field(b, "p_validation_type")].join(" | "));
  }
}
