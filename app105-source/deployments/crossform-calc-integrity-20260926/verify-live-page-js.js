const fs = require("fs");

const source = fs.readFileSync(process.argv[2], "utf8");

function property(name) {
  const marker = `,${name}=>wwv_flow_string.join(wwv_flow_t_varchar2(`;
  const start = source.indexOf(marker);
  if (start < 0) return "";
  const valueStart = start + marker.length;
  const nextProperty = source.indexOf("\n,p_", valueStart);
  if (nextProperty < 0) throw new Error(`${name} closing property boundary not found`);
  const fragment = source.slice(valueStart, nextProperty);
  const matches = [...fragment.matchAll(/'((?:''|[^'])*)'/g)];
  let value = "";
  matches.forEach((match, index) => {
    value += match[1].replace(/''/g, "'");
    const next = matches[index + 1];
    if (next) {
      const between = fragment.slice(match.index + match[0].length, next.index);
      if (between.includes(",")) value += "\n";
    }
  });
  return value;
}

const pageJs = property("p_javascript_code");
const onloadJs = property("p_javascript_code_onload");

new Function(pageJs);
new Function(onloadJs);

if (!(pageJs + onloadJs).includes("HSPL_CROSSFORM_DETAIL_INTEGRITY_V1")) {
  throw new Error("Cross-form integrity marker missing");
}

console.log(`JavaScript syntax OK; page=${pageJs.length}, onload=${onloadJs.length}`);
