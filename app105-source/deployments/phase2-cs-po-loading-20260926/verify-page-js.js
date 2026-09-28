const fs = require("fs");

for (const path of process.argv.slice(2)) {
  const source = fs.readFileSync(path, "utf8");
  const start = source.indexOf(",p_javascript_code=>");
  let end = source.indexOf(",p_javascript_code_onload=>", start);
  if (end < 0) {
    end = source.indexOf(",p_css_file_urls=>", start);
  }
  if (start < 0 || end < 0) {
    throw new Error(`Page JavaScript block not found in ${path}`);
  }
  const segment = source.slice(start, end);
  const matches = [...segment.matchAll(/'(?:''|[^'])*'/g)];
  let javascript = "";
  let previousEnd = 0;
  for (const match of matches) {
    const separator = segment.slice(previousEnd, match.index);
    if (javascript && !separator.includes("||")) {
      javascript += "\n";
    }
    javascript += match[0].slice(1, -1).replace(/''/g, "'");
    previousEnd = match.index + match[0].length;
  }
  new Function(javascript);
  console.log(`${path}: JavaScript syntax OK (${javascript.length} chars)`);
}
