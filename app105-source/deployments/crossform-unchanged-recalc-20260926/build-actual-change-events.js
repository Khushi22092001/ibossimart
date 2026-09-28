const fs = require("fs");
const path = require("path");

const root = __dirname;

const targets = {
  69: [
    "Set Net Weight"
  ],
  108: [
    "Set HSN",
    "Set Primary Stock Qty",
    "Set Quantity1",
    "Set Quantity2",
    "Set Quantity2_1",
    "Set Quantity2_1_1",
    "Set Quantity2_1_2",
    "Set Sanctioned",
    "Set Sanctioned2",
    "Set Unit1",
    "Set Unit2",
    "check Indent and sanction qty",
    "set decimal for ind_qty1",
    "set decimal for ind_qty2",
    "set decimal for qty1",
    "set decimal for qty2"
  ],
  118: [
    "Calculate Detail Footer Amount",
    "Calculate Detail Footer Total Amount value ",
    "Calculate Detail Footer Total Amount value on loose focus",
    "Set Quantity2",
    "Set Value- Final value of Detail footer on Loose Focus",
    "check balance",
    "set amount",
    "set balance qty",
    "set decimal on qty2",
    "set hsn code"
  ],
  140: [
    "set amount and amount entered"
  ],
  143: [
    "Calculate Detail Footer Total Amount value on get focus",
    "Calculate Detail Footer Total Amount value on loose focus",
    "Calculate Sum of Amount Value on Loose focus",
    "Set Value- Final value of Detail footer on Loose Focus",
    "set decimal qty1",
    "set footer"
  ],
  146: [
    "Set Detail Storage RejectedQty1",
    "Set itemcode and specs",
    "Set rate on basis of stock tno page item",
    "set balance qty "
  ],
  152: [
    "Calculate Detail Footer Amount",
    "Calculate Detail Footer Total Amount value on get focus",
    "Calculate Detail Footer Total Amount value on loose focus",
    "Calculate Sum of Amount Value on Loose focus",
    "Set Bill Amount",
    "Set Value- Final value of Detail footer on Loose Focus",
    "set footer"
  ],
  155: [
    "Check Pending Qty",
    "Set Quantity2",
    "set decimal qty1",
    "set decimal qty1_1"
  ]
};

function eventBlocks(source) {
  const marker = "wwv_flow_imp_page.create_page_da_event(";
  const starts = [];
  let position = 0;
  while ((position = source.indexOf(marker, position)) >= 0) {
    starts.push(position);
    position += marker.length;
  }
  return starts.map((start, index) => ({
    start,
    end: index + 1 < starts.length ? starts[index + 1] : source.length
  }));
}

function patchPage(page, names) {
  const file = path.join(root, `f105_page_${page}.sql`);
  let source = fs.readFileSync(file, "utf8");
  const found = new Set();
  const blocks = eventBlocks(source).reverse();

  for (const { start, end } of blocks) {
    const block = source.slice(start, end);
    const definitionEnd = block.indexOf("\n);");
    if (definitionEnd < 0) continue;
    const head = block.slice(0, definitionEnd);
    const nameMatch = head.match(/,p_name=>'((?:''|[^'])*)'/);
    if (!nameMatch) continue;
    const name = nameMatch[1].replace(/''/g, "'");
    if (!names.includes(name)) continue;
    if (!/,p_bind_event_type=>'(?:focusout|focusin)'/.test(head)) {
      throw new Error(`Page ${page} / ${name}: expected focusout or focusin trigger`);
    }
    const changedHead = head.replace(/,p_bind_event_type=>'(?:focusout|focusin)'/, ",p_bind_event_type=>'change'");
    source = source.slice(0, start) + changedHead + block.slice(definitionEnd) + source.slice(end);
    found.add(name);
  }

  const missing = names.filter(name => !found.has(name));
  if (missing.length) throw new Error(`Page ${page}: missing events: ${missing.join(", ")}`);
  fs.writeFileSync(file, source, "utf8");
  console.log(`Page ${page}: ${found.size} events changed to actual value change`);
}

for (const [page, names] of Object.entries(targets)) patchPage(page, names);
