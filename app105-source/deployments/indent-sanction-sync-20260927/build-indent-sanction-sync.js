const fs = require("fs");

const file = process.argv[2];
if (!file) {
  throw new Error("Usage: node build-indent-sanction-sync.js <page-export.sql>");
}

let sql = fs.readFileSync(file, "utf8");

const marker = "/* HSPL_INDENT_QUANTITY_SYNC_V1 */";
if (sql.includes(marker)) {
  throw new Error(`${marker} already exists`);
}

const javascript = [
  marker,
  "(function () {",
  "  \"use strict\";",
  "  if (Number(apex.env.APP_PAGE_ID || 0) !== 108 || window.hsplIndentQuantitySyncV1) { return; }",
  "  window.hsplIndentQuantitySyncV1 = true;",
  "  var attempts = 0;",
  "",
  "  function scalar(value) {",
  "    return value && typeof value === \"object\" && \"v\" in value ? value.v : value;",
  "  }",
  "",
  "  function number(value) {",
  "    var parsed = Number(String(scalar(value) == null ? 0 : scalar(value)).replace(/,/g, \"\"));",
  "    return Number.isFinite(parsed) ? parsed : 0;",
  "  }",
  "",
  "  function setNumber(model, record, field, value) {",
  "    var oldValue = scalar(model.getValue(record, field));",
  "    var oldBlank = oldValue === null || oldValue === undefined || String(oldValue).trim() === \"\";",
  "    if (oldBlank || Math.abs(number(oldValue) - value) > 0.0000001) {",
  "      model.setValue(record, field, value);",
  "    }",
  "  }",
  "",
  "  function synchronize(model, record, field) {",
  "    if (!record || model.hsplIndentQuantitySyncBusyV1) { return; }",
  "    var factor = number(model.getValue(record, \"MULTIPLYINGFACTOR\"));",
  "    model.hsplIndentQuantitySyncBusyV1 = true;",
  "    try {",
  "      if (field === \"INDENTQUANTITY1\") {",
  "        var indent1 = number(model.getValue(record, \"INDENTQUANTITY1\"));",
  "        setNumber(model, record, \"QUANTITY1\", indent1);",
  "        if (factor > 0) {",
  "          setNumber(model, record, \"INDENTQUANTITY2\", indent1 * factor);",
  "          setNumber(model, record, \"QUANTITY2\", indent1 * factor);",
  "        }",
  "      } else if (field === \"INDENTQUANTITY2\" && factor > 0) {",
  "        var indent2 = number(model.getValue(record, \"INDENTQUANTITY2\"));",
  "        setNumber(model, record, \"INDENTQUANTITY1\", indent2 / factor);",
  "        setNumber(model, record, \"QUANTITY1\", indent2 / factor);",
  "        setNumber(model, record, \"QUANTITY2\", indent2);",
  "      } else if (field === \"QUANTITY1\" && factor > 0) {",
  "        setNumber(model, record, \"QUANTITY2\", number(model.getValue(record, \"QUANTITY1\")) * factor);",
  "      } else if (field === \"QUANTITY2\" && factor > 0) {",
  "        setNumber(model, record, \"QUANTITY1\", number(model.getValue(record, \"QUANTITY2\")) / factor);",
  "      } else if (field === \"QOH1\" && factor > 0) {",
  "        setNumber(model, record, \"QOH2\", number(model.getValue(record, \"QOH1\")) * factor);",
  "      } else if (field === \"MULTIPLYINGFACTOR\" && factor > 0) {",
  "        setNumber(model, record, \"INDENTQUANTITY2\", number(model.getValue(record, \"INDENTQUANTITY1\")) * factor);",
  "        setNumber(model, record, \"QUANTITY2\", number(model.getValue(record, \"QUANTITY1\")) * factor);",
  "        setNumber(model, record, \"QOH2\", number(model.getValue(record, \"QOH1\")) * factor);",
  "      }",
  "    } finally {",
  "      model.hsplIndentQuantitySyncBusyV1 = false;",
  "    }",
  "  }",
  "",
  "  function bind() {",
  "    try {",
  "      var model = apex.region(\"Detail\").widget().interactiveGrid(\"getViews\", \"grid\").model;",
  "      if (!model) { throw new Error(\"Detail model unavailable\"); }",
  "      if (model.hsplIndentQuantitySyncBoundV1) { return; }",
  "      model.hsplIndentQuantitySyncBoundV1 = true;",
  "      model.subscribe({",
  "        viewId: \"hsplIndentQuantitySyncV1\",",
  "        onChange: function (type, change) {",
  "          var field = change && (change.field || change.fieldName);",
  "          if (!field || !change.record) { return; }",
  "          if ([\"INDENTQUANTITY1\", \"INDENTQUANTITY2\", \"QUANTITY1\", \"QUANTITY2\", \"QOH1\", \"MULTIPLYINGFACTOR\"].indexOf(field) >= 0) {",
  "            synchronize(model, change.record, field);",
  "          }",
  "        }",
  "      });",
  "    } catch (ignore) {",
  "      if (attempts++ < 24) { setTimeout(bind, 250); }",
  "    }",
  "  }",
  "",
  "  apex.jQuery(bind);",
  "  apex.jQuery(document).on(\"apexafterrefresh.hsplIndentQuantitySyncV1\", \"#Detail\", function () {",
  "    attempts = 0;",
  "    setTimeout(bind, 0);",
  "  });",
  "})();",
  "",
];

function encodeApexLines(lines) {
  return lines.map((line) => `'${line.replaceAll("'", "''")}',`).join("\n") + "\n";
}

const insertBefore = "'/* HSPL_INDENT_PENDING_EDIT_V8 */',";
if (!sql.includes(insertBefore)) {
  throw new Error("Indent JavaScript insertion point not found");
}
sql = sql.replace(insertBefore, encodeApexLines(javascript) + insertBefore);

const disabledEventIds = [
  "38674434078424870", // Set Quantity2
  "38675385466424870", // Set Quantity2_1
  "38676216658424870", // Set Quantity2_1_2
  "38677161981424870", // Set Quantity2_1_1
  "38685015215424872", // Set Quantity1
  "38685850495424873", // Set Sanctioned
  "38686755567424873", // Set Sanctioned2
];

for (const id of disabledEventIds) {
  const pattern = new RegExp(
    `(wwv_flow_imp_page\\.create_page_da_event\\(\\r?\\n p_id=>wwv_flow_imp\\.id\\(${id}\\)[\\s\\S]*?,p_bind_event_type=>'change'\\r?\\n)(\\);)`
  );
  const matches = sql.match(pattern);
  if (!matches) {
    throw new Error(`Dynamic action event ${id} not found`);
  }
  if (matches[1].includes("p_display_when_type")) {
    throw new Error(`Dynamic action event ${id} already has a display condition`);
  }
  sql = sql.replace(pattern, `$1,p_display_when_type=>'NEVER'\n$2`);
}

fs.writeFileSync(file, sql, "utf8");
console.log(`Patched ${file}`);
console.log(`Disabled ${disabledEventIds.length} server quantity events and added synchronous row calculation.`);
