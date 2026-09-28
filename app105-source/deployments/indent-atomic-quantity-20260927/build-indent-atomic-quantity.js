const fs = require("fs");

const file = process.argv[2];
if (!file) throw new Error("Usage: node build-indent-atomic-quantity.js <page-export.sql>");

let sql = fs.readFileSync(file, "utf8");
const marker = "/* HSPL_INDENT_ATOMIC_QUANTITY_V1 */";
if (sql.includes(marker)) throw new Error(`${marker} already exists`);

const javascript = [
  marker,
  "(function () {",
  "  \"use strict\";",
  "  if (Number(apex.env.APP_PAGE_ID || 0) !== 108 || window.hsplIndentAtomicQuantityV1) { return; }",
  "  window.hsplIndentAtomicQuantityV1 = true;",
  "  var pending = null;",
  "  var fields = [\"INDENTQUANTITY1\", \"INDENTQUANTITY2\", \"QUANTITY1\", \"QUANTITY2\", \"QOH1\"];",
  "",
  "  function scalar(value) {",
  "    return value && typeof value === \"object\" && \"v\" in value ? value.v : value;",
  "  }",
  "",
  "  function numeric(value) {",
  "    value = scalar(value);",
  "    if (value === null || value === undefined || String(value).trim() === \"\") { return null; }",
  "    var parsed = Number(String(value).replace(/,/g, \"\"));",
  "    return Number.isFinite(parsed) ? parsed : null;",
  "  }",
  "",
  "  function fieldName(element) {",
  "    var id = String(element && element.id || \"\").toUpperCase();",
  "    var label = String(element && element.getAttribute(\"aria-labelledby\") || \"\").toUpperCase();",
  "    if (id === \"INDENTQUANTITY1\" || label.indexOf(\"INDENTQUANTITY1\") >= 0) { return \"INDENTQUANTITY1\"; }",
  "    if (id === \"INDENTQUANTITY2\" || label.indexOf(\"INDENTQUANTITY2\") >= 0) { return \"INDENTQUANTITY2\"; }",
  "    if (id === \"QUANTITY1\" || label.indexOf(\"QUANTITY1\") >= 0) { return \"QUANTITY1\"; }",
  "    if (id === \"QUANTITY2\" || label.indexOf(\"QUANTITY2\") >= 0) { return \"QUANTITY2\"; }",
  "    if (id === \"QOH1\" || id === \"C835772166892646796\" || label.indexOf(\"QOH1\") >= 0) { return \"QOH1\"; }",
  "    return null;",
  "  }",
  "",
  "  function context(element, field) {",
  "    try {",
  "      var region = apex.region(\"Detail\");",
  "      var grid = region.widget().interactiveGrid(\"getViews\", \"grid\");",
  "      var model = grid.model;",
  "      var row = element && element.closest && element.closest(\"tr[data-id]\");",
  "      var recordId = row && row.getAttribute(\"data-id\");",
  "      var record = recordId != null ? model.getRecord(recordId) : null;",
  "      if (!record && grid.view$ && typeof grid.view$.grid === \"function\") {",
  "        record = grid.view$.grid(\"getActiveRecord\");",
  "        recordId = record && model.getRecordId(record);",
  "      }",
  "      return record ? { region: region, grid: grid, model: model, record: record, recordId: recordId, field: field } : null;",
  "    } catch (ignore) { return null; }",
  "  }",
  "",
  "  function set(model, record, field, value) {",
  "    var oldValue = scalar(model.getValue(record, field));",
  "    var output = value === null || value === undefined ? \"\" : String(value);",
  "    var oldNumber = numeric(oldValue);",
  "    var newNumber = numeric(output);",
  "    if ((oldNumber === null) !== (newNumber === null) || (oldNumber !== null && Math.abs(oldNumber - newNumber) > 0.0000001)) {",
  "      model.setValue(record, field, output);",
  "    }",
  "  }",
  "",
  "  function validate(model, record) {",
  "    var id = model.getRecordId(record);",
  "    var indent1 = numeric(model.getValue(record, \"INDENTQUANTITY1\"));",
  "    var sanction1 = numeric(model.getValue(record, \"QUANTITY1\"));",
  "    var indent2 = numeric(model.getValue(record, \"INDENTQUANTITY2\"));",
  "    var sanction2 = numeric(model.getValue(record, \"QUANTITY2\"));",
  "    if (indent1 !== null && sanction1 !== null && sanction1 > indent1 + 0.0000001) {",
  "      model.setValidity(\"error\", id, \"QUANTITY1\", \"Sanction Qty cannot be greater than Indent Qty. Indent: \" + indent1 + \" Sanctioned: \" + sanction1 + \".\");",
  "    } else {",
  "      model.setValidity(\"valid\", id, \"QUANTITY1\");",
  "    }",
  "    if (indent2 !== null && sanction2 !== null && sanction2 > indent2 + 0.0000001) {",
  "      model.setValidity(\"error\", id, \"QUANTITY2\", \"Secondary Sanction Qty cannot be greater than Secondary Indent Qty.\");",
  "    } else {",
  "      model.setValidity(\"valid\", id, \"QUANTITY2\");",
  "    }",
  "  }",
  "",
  "  function apply(element) {",
  "    if (!pending || pending.element !== element) { return; }",
  "    var job = pending;",
  "    pending = null;",
  "    var raw = String(element.value == null ? \"\" : element.value);",
  "    if (raw === String(element.dataset.hsplIndentAtomicStart || \"\")) { return; }",
  "    var model = job.model;",
  "    var record = job.record;",
  "    try {",
  "      if (job.grid.view$ && typeof job.grid.view$.grid === \"function\") {",
  "        job.grid.view$.grid(\"setActiveRecordValue\", job.field);",
  "      }",
  "    } catch (ignoreCommit) {}",
  "    set(model, record, job.field, raw);",
  "    var value = numeric(raw);",
  "    var factor = numeric(model.getValue(record, \"MULTIPLYINGFACTOR\"));",
  "    var rate = numeric(model.getValue(record, \"RATE\")) || 0;",
  "    if (job.field === \"INDENTQUANTITY1\") {",
  "      set(model, record, \"QUANTITY1\", value);",
  "      set(model, record, \"AMOUNT\", value === null ? 0 : value * rate);",
  "      if (factor !== null && factor > 0) {",
  "        set(model, record, \"INDENTQUANTITY2\", value === null ? null : value * factor);",
  "        set(model, record, \"QUANTITY2\", value === null ? null : value * factor);",
  "      }",
  "    } else if (job.field === \"INDENTQUANTITY2\" && value !== null && value > 0 && factor !== null && factor > 0) {",
  "      set(model, record, \"INDENTQUANTITY1\", value / factor);",
  "      set(model, record, \"QUANTITY1\", value / factor);",
  "      set(model, record, \"QUANTITY2\", value);",
  "      set(model, record, \"AMOUNT\", value / factor * rate);",
  "    } else if (job.field === \"QUANTITY1\" && factor !== null && factor > 0) {",
  "      set(model, record, \"QUANTITY2\", value === null ? null : value * factor);",
  "    } else if (job.field === \"QUANTITY2\" && value !== null && value > 0 && factor !== null && factor > 0) {",
  "      set(model, record, \"QUANTITY1\", value / factor);",
  "    } else if (job.field === \"QOH1\" && factor !== null && factor > 0) {",
  "      set(model, record, \"QOH2\", value === null ? null : value * factor);",
  "    }",
  "    validate(model, record);",
  "  }",
  "",
  "  document.addEventListener(\"focusin\", function (event) {",
  "    var element = event.target;",
  "    if (!element || !element.closest || !element.closest(\"#Detail\")) { return; }",
  "    var field = fieldName(element);",
  "    if (!field || fields.indexOf(field) < 0) { return; }",
  "    element.dataset.hsplIndentAtomicStart = String(element.value == null ? \"\" : element.value);",
  "    pending = null;",
  "  }, true);",
  "",
  "  document.addEventListener(\"input\", function (event) {",
  "    var element = event.target;",
  "    if (!element || !element.closest || !element.closest(\"#Detail\")) { return; }",
  "    var field = fieldName(element);",
  "    if (!field || fields.indexOf(field) < 0) { return; }",
  "    if (String(element.value) === String(element.dataset.hsplIndentAtomicStart || \"\")) { pending = null; return; }",
  "    var ctx = context(element, field);",
  "    if (ctx) { ctx.element = element; pending = ctx; }",
  "  }, true);",
  "",
  "  document.addEventListener(\"keydown\", function (event) {",
  "    if (event.key === \"Tab\" || event.key === \"Enter\") { apply(event.target); }",
  "  }, true);",
  "  document.addEventListener(\"focusout\", function (event) { apply(event.target); }, true);",
  "  document.addEventListener(\"change\", function (event) { apply(event.target); }, true);",
  "})();",
  "",
];

function encode(lines) {
  return lines.map((line) => `'${line.replaceAll("'", "''")}',`).join("\n") + "\n";
}

const insertion = "'/* HSPL_INDENT_PENDING_EDIT_V8 */',";
if (!sql.includes(insertion)) throw new Error("Page JavaScript insertion point not found");
sql = sql.replace(insertion, encode(javascript) + insertion);

const removeOldQuantityDetection = [
  "'    if (id === \"INDENTQUANTITY1\") { return \"INDENTQUANTITY1\"; }',\n",
  "'    if (labelledBy.indexOf(\"INDENTQUANTITY1\") >= 0) { return \"INDENTQUANTITY1\"; }',\n",
];
for (const line of removeOldQuantityDetection) {
  if (!sql.includes(line)) throw new Error(`Old pending-edit quantity detection not found: ${line}`);
  sql = sql.replace(line, "");
}

const disabledEventIds = [
  "38674434078424870", // primary indent -> secondary indent
  "38675385466424870", // primary sanction -> secondary sanction
  "38676216658424870", // primary stock -> secondary stock
  "38677161981424870", // secondary sanction -> primary sanction
  "38685015215424872", // secondary indent -> primary indent
  "38685850495424873", // primary indent -> primary sanction
  "38686755567424873", // secondary indent -> secondary sanction
  "38693986569424875", // server decimal: primary indent
  "38697214257424876", // server decimal: secondary indent
  "38695799794424875", // server decimal + validation: primary sanction
  "38698059739424876", // server decimal: secondary sanction
];

for (const id of disabledEventIds) {
  const pattern = new RegExp(
    `(wwv_flow_imp_page\\.create_page_da_event\\(\\r?\\n p_id=>wwv_flow_imp\\.id\\(${id}\\)[\\s\\S]*?,p_bind_event_type=>'change'\\r?\\n)(\\);)`
  );
  const match = sql.match(pattern);
  if (!match) throw new Error(`Dynamic action event ${id} not found`);
  if (match[1].includes("p_display_when_type")) throw new Error(`Dynamic action event ${id} already has a display condition`);
  sql = sql.replace(pattern, `$1,p_display_when_type=>'NEVER'\n$2`);
}

fs.writeFileSync(file, sql, "utf8");
console.log(`Patched ${file}`);
console.log(`Disabled ${disabledEventIds.length} cyclic/server quantity events and installed one-pass quantity calculation.`);
