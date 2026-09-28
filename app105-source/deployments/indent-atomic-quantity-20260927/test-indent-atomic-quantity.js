const fs = require("fs");

const sql = fs.readFileSync(process.argv[2], "utf8");

function pageJavascript() {
  const marker = ",p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(";
  const start = sql.indexOf(marker);
  const end = sql.indexOf("\n,p_javascript_code_onload=>", start);
  if (start < 0 || end < 0) throw new Error("Page JavaScript block not found");
  const fragment = sql.slice(start + marker.length, end);
  const matches = [...fragment.matchAll(/'((?:''|[^'])*)'/g)];
  let value = "";
  matches.forEach((match, index) => {
    value += match[1].replace(/''/g, "'");
    const next = matches[index + 1];
    if (next && fragment.slice(match.index + match[0].length, next.index).includes(",")) value += "\n";
  });
  return value;
}

const pageJs = pageJavascript();
const start = pageJs.indexOf("/* HSPL_INDENT_ATOMIC_QUANTITY_V1 */");
const end = pageJs.indexOf("/* HSPL_INDENT_PENDING_EDIT_V8 */", start);
if (start < 0 || end < 0) throw new Error("Atomic quantity block not found");
const atomicJs = pageJs.slice(start, end);

const listeners = {};
const fakeDocument = {
  addEventListener(name, handler) { listeners[name] = handler; },
};
const record = {
  INDENTQUANTITY1: "",
  INDENTQUANTITY2: "",
  QUANTITY1: "",
  QUANTITY2: "",
  QOH1: "",
  QOH2: "",
  MULTIPLYINGFACTOR: "2",
  RATE: "100",
  AMOUNT: "0",
};
const validities = {};
let writes = 0;
let activeCommitCalls = 0;
const model = {
  getRecord() { return record; },
  getRecordId() { return "R1"; },
  getValue(row, field) { return row[field]; },
  setValue(row, field, value) { row[field] = value; writes += 1; return "SET"; },
  setValidity(validity, id, field, message) { validities[field] = { validity, message }; },
};
const grid = {
  model,
  view$: {
    grid(command) {
      if (command === "getActiveRecord") return record;
      if (command === "setActiveRecordValue") { activeCommitCalls += 1; return this; }
      throw new Error(`Unexpected grid command ${command}`);
    },
  },
};
const apex = {
  env: { APP_PAGE_ID: 108 },
  region() { return { widget() { return { interactiveGrid() { return grid; } }; } }; },
};
const fakeWindow = {};
new Function("apex", "window", "document", atomicJs)(apex, fakeWindow, fakeDocument);

function element(field, value) {
  return {
    id: field,
    value: String(value),
    dataset: {},
    getAttribute() { return field; },
    closest(selector) {
      if (selector === "#Detail") return {};
      if (selector === "tr[data-id]") return { getAttribute() { return "R1"; } };
      return null;
    },
  };
}

function edit(field, from, to) {
  record[field] = String(from);
  const target = element(field, from);
  listeners.focusin({ target });
  target.value = String(to);
  listeners.input({ target });
  listeners.keydown({ target, key: "Tab" });
}

function assertNumber(actual, expected, label) {
  if (Math.abs(Number(actual) - Number(expected)) > 0.0000001) {
    throw new Error(`${label}: expected ${expected}, got ${actual}`);
  }
}

edit("INDENTQUANTITY1", "", "10");
assertNumber(record.INDENTQUANTITY1, 10, "Primary indent");
assertNumber(record.QUANTITY1, 10, "Primary sanction copy");
assertNumber(record.INDENTQUANTITY2, 20, "Secondary indent");
assertNumber(record.QUANTITY2, 20, "Secondary sanction");
assertNumber(record.AMOUNT, 1000, "Amount");

edit("QUANTITY1", "10", "8");
assertNumber(record.QUANTITY2, 16, "Secondary sanction after primary sanction edit");
if (validities.QUANTITY1.validity !== "valid") throw new Error("Valid sanction was marked invalid");

edit("QUANTITY1", "8", "11");
if (validities.QUANTITY1.validity !== "error") throw new Error("Sanction > indent was not blocked");

edit("QOH1", "", "5");
assertNumber(record.QOH2, 10, "Secondary stock");

const beforeUnchanged = writes;
const unchanged = element("INDENTQUANTITY1", "10");
listeners.focusin({ target: unchanged });
listeners.keydown({ target: unchanged, key: "Tab" });
assertNumber(writes, beforeUnchanged, "Unchanged Tab write count");

if (activeCommitCalls !== 4) throw new Error(`Expected 4 active record commits, got ${activeCommitCalls}`);

console.log("Indent atomic quantity tests passed");
console.log(JSON.stringify({ writes, activeCommitCalls, record, validities }, null, 2));
