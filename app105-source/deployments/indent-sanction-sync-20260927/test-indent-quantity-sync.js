const fs = require("fs");

const sql = fs.readFileSync(process.argv[2], "utf8");

function property(name) {
  const marker = `,${name}=>wwv_flow_string.join(wwv_flow_t_varchar2(`;
  const start = sql.indexOf(marker);
  if (start < 0) throw new Error(`${name} not found`);
  const valueStart = start + marker.length;
  const nextProperty = sql.indexOf("\n,p_", valueStart);
  const fragment = sql.slice(valueStart, nextProperty);
  const matches = [...fragment.matchAll(/'((?:''|[^'])*)'/g)];
  let value = "";
  matches.forEach((match, index) => {
    value += match[1].replace(/''/g, "'");
    const next = matches[index + 1];
    if (next && fragment.slice(match.index + match[0].length, next.index).includes(",")) value += "\n";
  });
  return value;
}

const pageJs = property("p_javascript_code");
const start = pageJs.indexOf("/* HSPL_INDENT_QUANTITY_SYNC_V1 */");
const end = pageJs.indexOf("/* HSPL_INDENT_PENDING_EDIT_V8 */", start);
if (start < 0 || end < 0) throw new Error("Quantity sync block not found");
const syncJs = pageJs.slice(start, end);

const record = {
  INDENTQUANTITY1: 0,
  QUANTITY1: 0,
  INDENTQUANTITY2: 0,
  QUANTITY2: 0,
  QOH1: 0,
  QOH2: 0,
  MULTIPLYINGFACTOR: 2,
};
let subscriber;
let writes = 0;
const model = {
  getValue(row, field) { return row[field]; },
  setValue(row, field, value) {
    row[field] = value;
    writes += 1;
    if (subscriber) subscriber.onChange("set", { record: row, field });
  },
  subscribe(value) { subscriber = value; },
};
const chain = { model };
const apex = {
  env: { APP_PAGE_ID: 108 },
  region() { return { widget() { return { interactiveGrid() { return chain; } }; } }; },
  jQuery(arg) {
    if (typeof arg === "function") arg();
    return { on() {} };
  },
};
const fakeWindow = {};
const fakeDocument = {};
new Function("apex", "window", "document", "setTimeout", syncJs)(apex, fakeWindow, fakeDocument, setTimeout);

function change(field, value) {
  record[field] = value;
  subscriber.onChange("set", { record, field });
}

function assertEqual(actual, expected, label) {
  if (Math.abs(Number(actual) - Number(expected)) > 0.0000001) {
    throw new Error(`${label}: expected ${expected}, got ${actual}`);
  }
}

change("INDENTQUANTITY1", 10);
assertEqual(record.QUANTITY1, 10, "Primary sanction copy");
assertEqual(record.INDENTQUANTITY2, 20, "Secondary indent conversion");
assertEqual(record.QUANTITY2, 20, "Secondary sanction conversion");

change("QUANTITY1", 8);
assertEqual(record.QUANTITY2, 16, "Primary-to-secondary sanction conversion");

change("QUANTITY2", 30);
assertEqual(record.QUANTITY1, 15, "Secondary-to-primary sanction conversion");

change("QOH1", 5);
assertEqual(record.QOH2, 10, "Stock conversion");

record.INDENTQUANTITY1 = 10;
record.QUANTITY1 = 10;
record.INDENTQUANTITY2 = 20;
record.QUANTITY2 = 20;
const writesBeforeUnchanged = writes;
subscriber.onChange("set", { record, field: "INDENTQUANTITY1" });
assertEqual(writes, writesBeforeUnchanged, "Unchanged calculation write count");

console.log("Indent quantity sync regression tests passed");
console.log(JSON.stringify({ writes, record }, null, 2));
