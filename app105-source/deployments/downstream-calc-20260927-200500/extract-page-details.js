const fs = require("fs");
const path = require("path");

const page = Number(process.argv[2]);
const pattern = new RegExp(process.argv[3] || ".", "i");
const file = path.join(__dirname, "staged", `f105_page_${page}.sql`);
const source = fs.readFileSync(file, "utf8");
const marker = "wwv_flow_imp_page.create_page_da_event(";
const starts = [];
let at = 0;
while ((at = source.indexOf(marker, at)) >= 0) {
  starts.push(at);
  at += marker.length;
}

for (let i = 0; i < starts.length; i++) {
  const block = source.slice(starts[i], i + 1 < starts.length ? starts[i + 1] : source.length);
  const headEnd = block.indexOf("\n);");
  const head = block.slice(0, headEnd);
  const name = (head.match(/,p_name=>'((?:''|[^'])*)'/) || [])[1];
  if (name && pattern.test(name.replace(/''/g, "'"))) {
    process.stdout.write(`\n===== ${name.replace(/''/g, "'")} =====\n${block}`);
  }
}
