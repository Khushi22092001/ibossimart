/* Lightweight SVG chart renderer for optimized dashboards.
 * Server regions emit a .ds-fast-chart host with one escaped JSON payload:
 * { unit, series:[...], rows:[{l, values:[...], u?, item?, key?, display?, target?}] }
 * No Oracle JET dependency is required for these regions.
 */
(function (window, document) {
  'use strict';

  if (!window.apex || !apex.jQuery) return;

  var pageId = Number((apex.env && apex.env.APP_PAGE_ID) ||
    (document.getElementById('pFlowStepId') || {}).value || 0);
  if (pageId === 668 || pageId === 120 || pageId === 102 || pageId === 113) return;
  var compact360Pages = { 669:1, 679:1, 680:1, 681:1, 682:1, 686:1, 687:1,
    693:1, 713:1, 731:1, 732:1, 733:1, 734:1 };

  var $ = apex.jQuery;
  var NS = 'http://www.w3.org/2000/svg';
  var palette = [
    '#2E73C4', '#26A69A', '#4CAF7D', '#F5A623', '#8B5CF6', '#D95763',
    '#4FA9D2', '#173B64', '#EC8B3A', '#6C7A91', '#9B6FD3', '#2F8F83'
  ];
  var paintSequence = 0;
  var labelMeasure = document.createElement('canvas').getContext('2d');

  // Match Page 668's paint, without touching its renderer or loading Oracle JET.
  function shade(hex, amount) {
    return '#' + hex.slice(1).match(/../g).map(function (channel) {
      return Math.max(0, Math.min(255, parseInt(channel, 16) + amount)).toString(16).padStart(2, '0');
    }).join('');
  }

  function gradient(svg, base, kind, singleSeries) {
    var defs = svg.querySelector('defs');
    if (!defs) { defs = svgElement('defs'); svg.appendChild(defs); }
    var id = 'ds-fc-paint-' + (++paintSequence);
    var paint = svgElement('linearGradient', { id: id, x1: '0', y1: '0', x2: kind === 'pie' ? '.35' : '0', y2: '1' });
    var stops = kind === 'pie' ? [['0%', shade(base, 46)], ['50%', base], ['100%', shade(base, -40)]] :
      kind === 'area' ? [['0%', base], ['100%', '#fff']] :
      [['0%', base], ['100%', singleSeries ? '#26A69A' : shade(base, -28)]];
    stops.forEach(function (stop) { paint.appendChild(svgElement('stop', { offset: stop[0], 'stop-color': stop[1] })); });
    defs.appendChild(paint);
    return 'url(#' + id + ')';
  }

  // Decode only display labels; never decode URLs/keys or interpret data as HTML.
  function displayText(value) {
    var entities = { amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ' };
    return String(value == null ? '' : value).replace(/&(#x[0-9a-f]+|#\d+|amp|lt|gt|quot|apos|nbsp);/gi, function (entity, code) {
      if (code[0] !== '#') return entities[code.toLowerCase()] || entity;
      var n = code[1].toLowerCase() === 'x' ? parseInt(code.slice(2), 16) : Number(code.slice(1));
      return n > 0 && n <= 0x10ffff ? String.fromCodePoint(n) : entity;
    });
  }

  function wrappedLabel(svg, label, x, y, width, maxLines) {
    var rest = displayText(label).trim(), lines = [];
    while (rest && lines.length < maxLines) {
      var capacity = Math.min(rest.length, Math.max(3, Math.floor(width / 6)));
      while (capacity > 1 && labelMeasure.measureText(rest.slice(0, capacity) + (rest.length > capacity ? '…' : '')).width > width) capacity--;
      if (rest.length <= capacity) { lines.push(rest); rest = ''; break; }
      if (lines.length === maxLines - 1) { lines.push(rest.slice(0, capacity - 1) + '…'); break; }
      var cut = rest.lastIndexOf(' ', capacity);
      if (cut < capacity / 2) cut = capacity;
      lines.push(rest.slice(0, cut)); rest = rest.slice(cut).trim();
    }
    var node = textNode(svg, '', { x: x, y: y, 'text-anchor': 'middle', 'class': 'ds-fc-axis ds-fc-category' });
    lines.forEach(function (line, index) {
      var span = svgElement('tspan', { x: x, dy: index ? 15 : 0 }); span.textContent = line; node.appendChild(span);
    });
    var title = svgElement('title'); title.textContent = displayText(label); node.appendChild(title);
  }

  function diagonalLabel(svg, label, x, y, width) {
    var full = displayText(label), shown = full;
    while (shown.length > 1 && labelMeasure.measureText(shown + (shown.length < full.length ? '…' : '')).width > width) shown = shown.slice(0, -1);
    var node = textNode(svg, shown + (shown.length < full.length ? '…' : ''), {
      x: x, y: y, transform: 'rotate(-45 ' + x + ' ' + y + ')',
      'text-anchor': 'end', 'class': 'ds-fc-axis ds-fc-category ds-fc-category--diagonal'
    });
    var title = svgElement('title'); title.textContent = full; node.appendChild(title);
  }

  function svgElement(tag, attrs) {
    var node = document.createElementNS(NS, tag);
    Object.keys(attrs || {}).forEach(function (key) {
      node.setAttribute(key, attrs[key]);
    });
    return node;
  }

  function textNode(svg, value, attrs) {
    var node = svgElement('text', attrs);
    node.textContent = value == null ? '' : String(value);
    svg.appendChild(node);
    return node;
  }

  function number(value) {
    var n = Number(value);
    return Number.isFinite(n) ? n : 0;
  }

  function displayNumber(value) {
    var n = number(value);
    if (n !== 0 && Math.abs(n) < .01) return n.toLocaleString('en-IN', { maximumSignificantDigits: 3 });
    return Math.abs(n) >= 1000
      ? n.toLocaleString('en-IN', { maximumFractionDigits: 0 })
      : n.toLocaleString('en-IN', { maximumFractionDigits: 2 });
  }

  function valueLabel(value, unit) {
    return displayNumber(value) + (unit ? ' ' + unit : '');
  }

  function polar(cx, cy, radius, angle) {
    return [cx + radius * Math.cos(angle), cy + radius * Math.sin(angle)];
  }

  function arcPath(cx, cy, inner, outer, start, end) {
    var outerStart = polar(cx, cy, outer, start);
    var outerEnd = polar(cx, cy, outer, end);
    var innerEnd = polar(cx, cy, inner, end);
    var innerStart = polar(cx, cy, inner, start);
    var large = end - start > Math.PI ? 1 : 0;
    if (!inner) {
      return 'M' + cx + ' ' + cy + ' L' + outerStart[0] + ' ' + outerStart[1] +
        ' A' + outer + ' ' + outer + ' 0 ' + large + ' 1 ' + outerEnd[0] + ' ' + outerEnd[1] + ' Z';
    }
    return 'M' + outerStart[0] + ' ' + outerStart[1] +
      ' A' + outer + ' ' + outer + ' 0 ' + large + ' 1 ' + outerEnd[0] + ' ' + outerEnd[1] +
      ' L' + innerEnd[0] + ' ' + innerEnd[1] +
      ' A' + inner + ' ' + inner + ' 0 ' + large + ' 0 ' + innerStart[0] + ' ' + innerStart[1] + ' Z';
  }

  function installStyle() {
    if (document.getElementById('dashboard-fast-chart-css')) return;
    var style = document.createElement('style');
    style.id = 'dashboard-fast-chart-css';
    style.textContent =
      '.ds-fast-chart{position:relative;box-sizing:border-box;width:100%;min-height:0;padding:8px;background:transparent!important;filter:none!important;overflow-x:hidden;overflow-y:hidden}' +
      'table.ds-fc-report{width:100%!important;max-width:100%!important;table-layout:fixed!important}.ds-fc-report>tbody>tr>td{min-width:0;white-space:normal!important}.ds-fc-report>tbody>tr:hover>td{background:transparent!important}' +
      '.ds-fast-chart svg{display:block;width:100%;height:auto;overflow:hidden;font-family:inherit;text-rendering:geometricPrecision;shape-rendering:geometricPrecision}' +
      '.ds-fast-chart.ds-fast-chart--360 svg{max-height:320px}' +
      '.ds-fast-chart.ds-fast-chart--360 .ds-fc-legend{max-height:74px;overflow-y:auto;align-content:flex-start}' +
      '.ds-fc-grid{stroke:rgba(30,58,95,.12);stroke-width:1;pointer-events:none}' +
      '.ds-fc-axis-line{stroke:#64748b;stroke-width:1.2;pointer-events:none}' +
      '.ds-fc-axis{fill:#53657d;font-size:12px;font-weight:600;pointer-events:none}' +
      '.ds-fc-axis-title{fill:#263b57;font-size:13px;font-weight:800;pointer-events:none}' +
      '.ds-fc-label{fill:#26315f;font-size:12px;font-weight:650;pointer-events:none}' +
      '.ds-fc-value{fill:#172554;font-size:12px;font-weight:800;paint-order:stroke;stroke:#fff;stroke-width:3px;stroke-linejoin:round;pointer-events:none}' +
      '.ds-fast-chart[data-chart-type="line"] .ds-fc-value{font-weight:650}' +
      '.ds-fc-mark{cursor:default;transition:filter .12s ease,opacity .12s ease}' +
      '.ds-fc-mark[data-action="true"]{cursor:pointer}' +
      '.ds-fc-mark:hover,.ds-fc-mark:focus-visible{filter:brightness(.92);outline:none}' +
      '.ds-fc-mark:focus-visible{stroke:#172554;stroke-width:2}' +
      '.ds-fc-line{fill:none;stroke-width:4;stroke-linecap:round;stroke-linejoin:round;pointer-events:none}' +
      '.ds-fc-area{opacity:.18;pointer-events:none}' +
      '.ds-fast-chart--round svg{max-width:280px;margin:0 auto}' +
      '.ds-fast-chart--round .ds-fc-mark{transition:opacity 140ms ease}' +
      '.ds-fast-chart--round.ds-fc-hovering .ds-fc-mark:not(.ds-fc-active){opacity:.38}' +
      '.ds-fc-legend{display:flex;flex-wrap:wrap;justify-content:center;gap:8px 16px;margin:8px 8px 0;color:#60708a;font-size:12px}' +
      '.ds-fc-legend--dense{max-height:82px;overflow-y:auto;align-content:flex-start;padding:2px 6px 5px;scrollbar-gutter:stable}' +
      '.ds-fc-legend-item{display:inline-flex;align-items:center;gap:7px}' +
      '.ds-fc-legend button{font:inherit;color:inherit;background:transparent;border:1px solid transparent;border-radius:5px;padding:5px 7px;cursor:pointer;text-align:left}' +
      '.ds-fc-legend button:hover{background:#f2f5fb}.ds-fc-legend button:focus-visible{outline:2px solid #2e73c4;outline-offset:2px}' +
      '.ds-fc-legend button[aria-pressed="false"]{color:#778397;text-decoration:line-through}.ds-fc-legend button[aria-pressed="false"] .ds-fc-legend-dot{opacity:.3}' +
      '.ds-fc-legend-help{text-align:center;font-size:11px;color:#64748b;margin:6px 0 0}' +
      '.ds-fc-legend-dot{width:10px;height:10px;border-radius:3px;flex:0 0 auto}' +
      '.ds-fc-tip{position:absolute;z-index:20;display:none;width:220px;max-width:min(260px,calc(100% - 16px));padding:13px 15px;border:1px solid #e3e8f2;border-radius:14px;background:#fff;color:#172554;font-size:12px;line-height:1.35;box-shadow:0 10px 28px rgba(15,23,42,.18);pointer-events:none;white-space:normal;overflow-wrap:anywhere}' +
      '.ds-fc-tip-title{display:flex;align-items:flex-start;gap:8px;padding-bottom:9px;margin-bottom:8px;border-bottom:1px solid #e7ebf3;font-size:13px;font-weight:800}' +
      '.ds-fc-tip-dot{width:11px;height:11px;margin-top:3px;border-radius:3px;flex:0 0 auto}' +
      '.ds-fc-tip-row{display:flex;justify-content:space-between;gap:14px;margin-top:5px;color:#5b6780}' +
      '.ds-fc-tip-row strong{color:#172554;font-size:14px}' +
      '.ds-fc-tip-row:last-child strong{color:#2e73c4}' +
      '.ds-fc-tip--compact{width:max-content;max-width:min(320px,calc(100% - 16px));padding:8px 11px;border:0;border-radius:8px;background:#172554;color:#fff;font-size:13px;font-weight:600;box-shadow:0 6px 20px rgba(15,23,42,.25)}' +
      '.ds-fc-heat-wrap{min-width:720px;overflow:auto;border:1px solid #e1e7f0;border-radius:10px}' +
      '.ds-fc-heat{width:100%;border-collapse:separate;border-spacing:0;font-size:12px}' +
      '.ds-fc-heat th,.ds-fc-heat td{padding:9px 10px;border-right:1px solid #e6eaf1;border-bottom:1px solid #e6eaf1;text-align:center}' +
      '.ds-fc-heat th{background:#f8fafc;color:#334155;font-weight:800}' +
      '.ds-fc-heat th:first-child,.ds-fc-heat td:first-child{text-align:left;min-width:180px;font-weight:750}' +
      '.ds-fc-heat tr:hover td{opacity:1!important}' +
      '.ds-fc-heat td.ds-fc-mark:hover,.ds-fc-heat td.ds-fc-mark:focus-visible{filter:brightness(.92)!important;box-shadow:inset 0 0 0 2px rgba(23,37,84,.24)}' +
      '.ds-fc-heat tr:last-child td{font-weight:800;background:#f8fafc}' +
      '.ds-fc-heat tr:last-child td:last-child{background:#172554;color:#fff}' +
      '.ds-fc-heat-note{margin:9px 4px 0;color:#68758e;font-size:12px}' +
      '.ds-fc-empty{display:grid;place-items:center;min-height:260px;color:#6b7890;font-weight:600}';
    document.head.appendChild(style);
  }

  function flatAction(row) {
    if (row.i) return { item: row.i, key: row.k, display: row.d,
      item2: row.i2, key2: row.k2, item3: row.i3, key3: row.k3, target: row.t };
    if (row.w) return { url: row.w, newWindow: true };
    return row.u || null;
  }

  function payloadFor(host, rawOverride) {
    try {
      var dataNode = host.querySelector('.ds-fast-chart-data');
      var raw = rawOverride !== undefined ? rawOverride :
        (host.getAttribute('data-json') || (dataNode && dataNode.textContent) || '');
      if (!raw && host.__dashboardFastPayload) return host.__dashboardFastPayload;
      var payload = JSON.parse(raw || '{}');
      payload.rows = Array.isArray(payload.rows) ? payload.rows : [];
      var round = /^(pie|donut)$/.test(host.getAttribute('data-chart-type') || '');
      if (payload.dynamicSeries && round) {
        // A dynamic pie row is a slice, not a sparse Cartesian series row.
        // Matrix conversion placed every slice in a different value column;
        // the pie then read column zero and silently omitted the other slices.
        payload.rows = payload.rows.map(function (row) {
          return { l: row.l == null ? row.s : row.l, values: [number(row.v)], actions: [flatAction(row)] };
        });
        payload.series = ['Value'];
      } else if (payload.dynamicSeries) {
        var series = [];
        var labels = [];
        var rowMap = Object.create(null);
        payload.rows.forEach(function (flatRow) {
          var seriesName = String(flatRow.s == null ? 'Value' : flatRow.s);
          var label = String(flatRow.l == null ? '' : flatRow.l);
          if (series.indexOf(seriesName) < 0) series.push(seriesName);
          if (!rowMap[label]) {
            rowMap[label] = { l: label, valueMap: Object.create(null), actionMap: Object.create(null) };
            labels.push(label);
          }
          rowMap[label].valueMap[seriesName] = number(flatRow.v);
          rowMap[label].actionMap[seriesName] = flatAction(flatRow);
        });
        payload.series = series;
        payload.rows = labels.map(function (label) {
          var source = rowMap[label];
          return {
            l: label,
            values: series.map(function (name) { return number(source.valueMap[name]); }),
            actions: series.map(function (name) { return source.actionMap[name] || null; })
          };
        });
      }
      payload.series = Array.isArray(payload.series) && payload.series.length ? payload.series : ['Value'];
      payload.series = payload.series.map(displayText);
      payload.rows.forEach(function (row) { row.l = displayText(row.l); });
      payload.unit = payload.unit || host.getAttribute('data-unit') || '';
      return payload;
    } catch (error) {
      return { series: ['Value'], rows: [], unit: '' };
    }
  }

  function hasAction(row, seriesIndex) {
    return !!(row && (row.u || row.item || (row.actions || [])[seriesIndex]));
  }

  function markAttrs(row, rowIndex, seriesIndex, label) {
    return {
      'class': 'ds-fc-mark',
      'tabindex': '0',
      'data-row': rowIndex,
      'data-series': seriesIndex,
      'data-action': hasAction(row, seriesIndex) ? 'true' : 'false',
      'aria-label': label
    };
  }

  function legendHidden(host, kind, name) {
    return !!(host.__dashboardFastHidden || {})[kind + ':' + name];
  }
  function legendButton(host, kind, name, color) {
    var item=document.createElement('button'),hidden=legendHidden(host,kind,name);
    item.type='button';item.className='ds-fc-legend-item';
    item.setAttribute('data-legend-kind',kind);item.setAttribute('data-legend-name',name);
    item.setAttribute('aria-pressed',String(!hidden));item.title=(hidden?'Show ':'Hide ')+name;
    var dot=document.createElement('i');dot.className='ds-fc-legend-dot';dot.style.background=color;dot.setAttribute('aria-hidden','true');
    item.appendChild(dot);item.appendChild(document.createTextNode(name));return item;
  }
  function legendHelp(host) {var help=document.createElement('p');help.className='ds-fc-legend-help';help.textContent='Click a legend item to hide or show it. Chart values open records where available.';host.appendChild(help);}
  function addLegend(host, series, colors) {
    var legend=document.createElement('div');legend.className='ds-fc-legend';
    series.forEach(function(name,index){legend.appendChild(legendButton(host,'series',name,colors[index%colors.length]));});
    host.appendChild(legend);legendHelp(host);
  }
  function toggleLegend(item) {
    var host=item.closest('.ds-fast-chart'),kind=item.getAttribute('data-legend-kind'),name=item.getAttribute('data-legend-name'),key=kind+':'+name;
    var hidden=host.__dashboardFastHidden || (host.__dashboardFastHidden=Object.create(null));hidden[key]=!hidden[key];
    host.__dashboardFastRendered=false;draw(host);
    Array.prototype.find.call(host.querySelectorAll('[data-legend-kind]'),function(button){return button.getAttribute('data-legend-kind')===kind&&button.getAttribute('data-legend-name')===name;}).focus({preventScroll:true});
  }

  function prepareReportHost(host) {
    var reportTable = host.closest('table.t-Report-report');
    if (!reportTable) return;
    reportTable.classList.add('ds-fc-report');
    var head = reportTable.querySelector('thead');
    if (head) head.style.display = 'none';
    var cell = host.closest('td');
    if (cell) cell.style.padding = '0';
  }

  function niceScale(maxValue, exactStep) {
    var rawMax = Math.max(0, number(maxValue));
    var requested = number(exactStep);
    var step;
    if (requested > 0) {
      step = requested;
    } else {
      var rough = Math.max(rawMax / 5, 1);
      var magnitude = Math.pow(10, Math.floor(Math.log(rough) / Math.LN10));
      var fraction = rough / magnitude;
      step = (fraction <= 1 ? 1 : fraction <= 2 ? 2 : fraction <= 5 ? 5 : 10) * magnitude;
    }
    var axisMax = Math.max(step, Math.ceil(rawMax / step) * step);
    var ticks = [];
    for (var value = 0; value <= axisMax + step / 2; value += step) ticks.push(value);
    return { max: axisMax, ticks: ticks };
  }

  function drawPie(host, payload, donut) {
    host.classList.add('ds-fast-chart--round');
    // Keep source indices: excluding zero slices must not shift drill targets.
    var rows = payload.rows.map(function (row, index) { return { row: row, index: index }; })
      .filter(function (entry) { return number((entry.row.values || [])[0]) > 0; });
    var allRows=rows; rows=allRows.filter(function(entry){return !legendHidden(host,'slice',entry.row.l);});
    var total = rows.reduce(function (sum, entry) { return sum + number(entry.row.values[0]); }, 0);
    var svg = svgElement('svg', { viewBox: '0 0 250 250', role: 'img', 'aria-label': host.getAttribute('aria-label') || 'Chart' });
    var cx = 125, cy = 125;
    var angle = -Math.PI / 2;
    rows.forEach(function (entry, index) {
      var row = entry.row;
      var value = number(row.values[0]);
      var next = angle + value / total * Math.PI * 2;
      var label = row.l + ': ' + valueLabel(value, payload.unit);
      var attrs = markAttrs(row, entry.index, 0, label);
      // No fixed angular gap: it erases small but legitimate values.
      attrs.d = arcPath(cx, cy, donut ? 68 : 0, 112, angle, next - (rows.length === 1 ? .000001 : 0));
      attrs.fill = gradient(svg, palette[allRows.indexOf(entry) % palette.length], 'pie');
      attrs['data-color'] = palette[allRows.indexOf(entry) % palette.length];
      attrs.stroke = '#fff';
      attrs['stroke-width'] = value / total > .01 ? '1.5' : '.2';
      svg.appendChild(svgElement('path', attrs));
      angle = next;
    });
    if (donut) {
      textNode(svg, rows.length===allRows.length?'TOTAL':'VISIBLE TOTAL', { x: cx, y: cy - 10, 'text-anchor': 'middle', 'class': 'ds-fc-axis' });
      textNode(svg, displayNumber(total), { x: cx, y: cy + 15, 'text-anchor': 'middle', 'class': 'ds-fc-value', style: 'font-size:22px' });
      if (payload.unit) textNode(svg, payload.unit, { x: cx, y: cy + 35, 'text-anchor': 'middle', 'class': 'ds-fc-axis' });
    }
    host.appendChild(svg);
    var legend=document.createElement('div');legend.className='ds-fc-legend';
    if(allRows.length>12)legend.classList.add('ds-fc-legend--dense');
    allRows.forEach(function(entry,index){legend.appendChild(legendButton(host,'slice',entry.row.l,palette[index%palette.length]));});
    if(!rows.length)textNode(svg,'All segments hidden',{x:125,y:45,'text-anchor':'middle','class':'ds-fc-axis'});
    host.appendChild(legend);legendHelp(host);
  }

  function drawHorizontalBars(host, payload) {
    var rows = payload.rows;
    var series = payload.series;
    var requestedHeight = number(host.getAttribute('data-chart-height'));
    var height = Math.max(280, requestedHeight || (rows.length * (series.length * 20 + 18) + 76));
    /*
     * Keep one SVG unit equal to roughly one rendered CSS pixel.  The earlier
     * fixed 700px viewBox was being scaled into 350-450px APEX grid columns,
     * which also scaled 12px labels down to 6-8px and made the chart look like
     * a low-resolution pasted image.  A small minimum width keeps narrow/mobile
     * layouts usable without turning a horizontal bar chart into a horizontally
     * scrollable surface.
     */
    var availableWidth = Math.max(240, Math.floor(host.clientWidth || host.getBoundingClientRect().width || 0) - 16);
    var chartWidth = availableWidth;
    var svg = svgElement('svg', { viewBox: '0 0 ' + chartWidth + ' ' + height, role: 'img', 'aria-label': 'Horizontal bar chart' });
    var paints = series.map(function (_, index) { return gradient(svg, palette[index % palette.length], 'bar', series.length === 1); });
    svg.style.height = height + 'px';
    svg.style.maxHeight = 'none';
    var longestLabel = rows.reduce(function (longest, row) {
      return Math.max(longest, String(row.l || '').length);
    }, 0);
    var longestValue = rows.reduce(function (longest, row) {
      return Math.max(longest, (row.values || []).reduce(function (seriesLongest, value) {
        return Math.max(seriesLongest, valueLabel(number(value), payload.unit).length);
      }, 0));
    }, 0);
    var labelSpace = Math.min(180, Math.max(88, Math.min(chartWidth * .34, longestLabel * 6.4 + 18)));
    var valueSpace = Math.min(118, Math.max(payload.unit ? 78 : 60, longestValue * 6.5 + 12));
    var x0 = labelSpace, x1 = Math.max(x0 + 70, chartWidth - valueSpace), top = 36, bottom = height - 40;
    var max = Math.max.apply(null, rows.reduce(function (all, row) { return all.concat(row.values || []); }, [0]).map(number)) || 1;
    textNode(svg, payload.unit ? 'Value (' + payload.unit + ')' : 'Value', { x: x0, y: 18, 'class': 'ds-fc-axis-title' });
    svg.appendChild(svgElement('line', { x1: x0, y1: top, x2: x0, y2: bottom, 'class': 'ds-fc-axis-line' }));
    svg.appendChild(svgElement('line', { x1: x0, y1: bottom, x2: x1, y2: bottom, 'class': 'ds-fc-axis-line' }));
    var plotWidth = x1 - x0;
    var tickFractions = plotWidth < 220 ? [0, .5, 1] : plotWidth < 320 ? [0, 1 / 3, 2 / 3, 1] : [0, .25, .5, .75, 1];
    tickFractions.forEach(function (fraction) {
      var x = x0 + (x1 - x0) * fraction;
      svg.appendChild(svgElement('line', { x1: x, y1: top, x2: x, y2: bottom, 'class': 'ds-fc-grid' }));
      textNode(svg, displayNumber(max * fraction), { x: x, y: bottom + 18, 'text-anchor': 'middle', 'class': 'ds-fc-axis' });
    });
    var groupHeight = (bottom - top) / Math.max(rows.length, 1);
    rows.forEach(function (row, rowIndex) {
      var labelY = top + groupHeight * rowIndex + groupHeight / 2 + 4;
      var shown = String(row.l || '');
      var labelLimit = Math.max(8, Math.min(28, Math.floor((x0 - 18) / 7)));
      textNode(svg, shown.length > labelLimit ? shown.slice(0, labelLimit - 1) + '…' : shown, { x: x0 - 10, y: labelY, 'text-anchor': 'end', 'class': 'ds-fc-label' });
      var requestedBarHeight = number(host.getAttribute('data-bar-height'));
      var barHeight = Math.min(requestedBarHeight || 42, Math.max(8, (groupHeight * .55 - 4) / series.length));
      var barBlockHeight = series.length * barHeight + Math.max(0, series.length - 1) * 2;
      var barBlockTop = top + groupHeight * rowIndex + Math.max(2, (groupHeight - barBlockHeight) / 2);
      series.forEach(function (seriesName, seriesIndex) {
        if(legendHidden(host,'series',seriesName))return;
        var value = number((row.values || [])[seriesIndex]);
        var y = barBlockTop + seriesIndex * (barHeight + 2);
        var width = value / max * (x1 - x0);
        var label = row.l + ' · ' + seriesName + ': ' + valueLabel(value, payload.unit);
        var attrs = markAttrs(row, rowIndex, seriesIndex, label);
        attrs.x = x0; attrs.y = y; attrs.width = Math.max(width, value ? 2 : 0); attrs.height = barHeight;
        attrs.rx = 5; attrs.fill = paints[seriesIndex]; attrs['data-color'] = palette[seriesIndex % palette.length];
        svg.appendChild(svgElement('rect', attrs));
        if (series.length === 1) {
          textNode(svg, valueLabel(value, payload.unit), { x: chartWidth - 8, y: y + barHeight / 2 + 4, 'text-anchor': 'end', 'class': 'ds-fc-value' });
        }
      });
    });
    host.appendChild(svg);
    addLegend(host, series, palette);
  }

  function drawCartesian(host, payload, lineChart) {
    var rows = payload.rows;
    var series = payload.series;
    labelMeasure.font = '600 12px ' + window.getComputedStyle(host).fontFamily;
    var width = Math.max(240, Math.floor(host.clientWidth || host.getBoundingClientRect().width || 0) - 16);
    var diagonal = !lineChart && rows.length > 5 && rows.some(function (row) { return labelMeasure.measureText(row.l || '').width > (width - 90) / rows.length * 2; });
    var chartHeight = Math.max(diagonal ? 420 : 320, Math.min(520, number(host.getAttribute('data-chart-height')) || (diagonal ? 420 : 360)));
    var svg = svgElement('svg', { viewBox: '0 0 ' + width + ' ' + chartHeight, role: 'img', 'aria-label': lineChart ? 'Line chart' : 'Bar chart' });
    svg.style.height = chartHeight + 'px';
    svg.style.maxHeight = 'none';
    var paints = series.map(function (_, index) { return gradient(svg, palette[index % palette.length], 'bar', series.length === 1); });
    var x0 = 72, x1 = width - 18, top = 48, bottom = chartHeight - (diagonal ? 135 : 78);
    var dataMax = Math.max.apply(null, rows.reduce(function (all, row) { return all.concat(row.values || []); }, [0]).map(number)) || 1;
    var scale = niceScale(dataMax, host.getAttribute('data-y-tick-step'));
    var max = scale.max;
    textNode(svg, payload.unit ? 'Value (' + payload.unit + ')' : 'Value', { x: x0, y: 20, 'class': 'ds-fc-axis-title' });
    svg.appendChild(svgElement('line', { x1: x0, y1: top, x2: x0, y2: bottom, 'class': 'ds-fc-axis-line' }));
    svg.appendChild(svgElement('line', { x1: x0, y1: bottom, x2: x1, y2: bottom, 'class': 'ds-fc-axis-line' }));
    scale.ticks.forEach(function (tick) {
      var y = bottom - (bottom - top) * tick / max;
      svg.appendChild(svgElement('line', { x1: x0, y1: y, x2: x1, y2: y, 'class': 'ds-fc-grid' }));
      textNode(svg, displayNumber(tick), { x: x0 - 8, y: y + 4, 'text-anchor': 'end', 'class': 'ds-fc-axis' });
    });
    var slot = (x1 - x0) / Math.max(rows.length, 1);
    var declaredTypes = Array.isArray(payload.seriesTypes) ? payload.seriesTypes : [];
    var lineIndices = [];
    var barIndices = [];
    series.forEach(function (seriesName, seriesIndex) {
      if(legendHidden(host,'series',seriesName))return;
      if (lineChart || declaredTypes[seriesIndex] === 'line') lineIndices.push(seriesIndex);
      else barIndices.push(seriesIndex);
    });
    if (barIndices.length) {
      var groupWidth = Math.min(slot * .74, 78);
      var barWidth = groupWidth / barIndices.length;
      rows.forEach(function (row, rowIndex) {
        barIndices.forEach(function (seriesIndex, barIndex) {
          var seriesName = series[seriesIndex];
          var value = number((row.values || [])[seriesIndex]);
          var height = value / max * (bottom - top);
          var x = x0 + slot * rowIndex + (slot - groupWidth) / 2 + barIndex * barWidth;
          var label = row.l + ' · ' + seriesName + ': ' + valueLabel(value, payload.unit);
          var attrs = markAttrs(row, rowIndex, seriesIndex, label);
          attrs.x = x; attrs.y = bottom - height; attrs.width = Math.max(2, barWidth - 2); attrs.height = height;
          attrs.rx = 5; attrs.fill = paints[seriesIndex]; attrs['data-color'] = palette[seriesIndex % palette.length];
          svg.appendChild(svgElement('rect', attrs));
          if (series.length === 1 && slot >= displayNumber(value).length * 7 + 8) {
            textNode(svg, displayNumber(value), { x: x + Math.max(2, barWidth - 2) / 2, y: Math.max(top + 11, bottom - height - 8), 'text-anchor': 'middle', 'class': 'ds-fc-value' });
          }
        });
      });
    }
    if (lineIndices.length) {
      lineIndices.forEach(function (seriesIndex) {
        var seriesName = series[seriesIndex];
        var points = rows.map(function (row, rowIndex) {
          return [x0 + slot * rowIndex + slot / 2, bottom - number((row.values || [])[seriesIndex]) / max * (bottom - top)];
        });
        var area = 'M' + points[0][0] + ' ' + bottom + ' L' + points.map(function (point) { return point.join(' '); }).join(' L') + ' L' + points[points.length - 1][0] + ' ' + bottom + ' Z';
        svg.appendChild(svgElement('path', { d: area, 'class': 'ds-fc-area', fill: gradient(svg, series.length === 1 ? '#57B6E0' : palette[seriesIndex % palette.length], 'area') }));
        svg.appendChild(svgElement('polyline', {
          points: points.map(function (point) { return point.join(','); }).join(' '),
          'class': 'ds-fc-line', stroke: palette[seriesIndex % palette.length]
        }));
        points.forEach(function (point, rowIndex) {
          var row = rows[rowIndex];
          var value = number((row.values || [])[seriesIndex]);
          var label = row.l + ' · ' + seriesName + ': ' + valueLabel(value, payload.unit);
          var attrs = markAttrs(row, rowIndex, seriesIndex, label);
          attrs.cx = point[0]; attrs.cy = point[1]; attrs.r = Math.min(4, Math.max(2.5, slot / 8));
          attrs['data-color'] = palette[seriesIndex % palette.length];
          attrs.fill = '#fff'; attrs.stroke = palette[seriesIndex % palette.length]; attrs['stroke-width'] = 2.5;
          svg.appendChild(svgElement('circle', attrs));
          if (series.length === 1 && slot >= displayNumber(value).length * 7 + 8) textNode(svg, displayNumber(value), {
            x: point[0], y: Math.max(top - 8, point[1] - 12), 'text-anchor': 'middle', 'class': 'ds-fc-value'
          });
        });
      });
    }
    rows.forEach(function (row, rowIndex) {
      // Every mark remains available; only extremely dense axis ticks are thinned.
      var stride = Math.max(1, Math.ceil(38 / slot));
      if (rowIndex % stride === 0) {
        var labelX = x0 + slot * rowIndex + slot / 2;
        if (diagonal) diagonalLabel(svg, row.l, labelX, bottom + 18, Math.min(140, (labelX - 6) / Math.SQRT1_2));
        else wrappedLabel(svg, row.l, labelX, bottom + 20, slot * stride - 6, 3);
      }
    });
    host.appendChild(svg);
    addLegend(host, series, palette);
  }

  function heatCell(text, className) {
    var cell = document.createElement('td');
    if (className) cell.className = className;
    cell.textContent = text;
    return cell;
  }

  function drawHeatmap(host, payload) {
    var months = payload.rows;
    var departments = payload.series;
    var wrapper = document.createElement('div');
    var table = document.createElement('table');
    wrapper.className = 'ds-fc-heat-wrap';
    table.className = 'ds-fc-heat';
    table.setAttribute('aria-label', host.getAttribute('aria-label') || 'Monthly trend heatmap');
    var head = document.createElement('tr');
    ['Department'].concat(months.map(function (row) { return row.l; }), ['Total (' + (payload.unit || 'Value') + ')']).forEach(function (label) {
      var th = document.createElement('th'); th.textContent = label; head.appendChild(th);
    });
    table.appendChild(head);
    departments.forEach(function (department, seriesIndex) {
      var tr = document.createElement('tr');
      var name = heatCell(department); var dot = document.createElement('i');
      dot.className = 'ds-fc-legend-dot'; dot.style.background = palette[seriesIndex % palette.length];
      name.insertBefore(dot, name.firstChild); name.style.display = 'flex'; name.style.alignItems = 'center'; name.style.gap = '8px'; tr.appendChild(name);
      var values = months.map(function (row) { return number((row.values || [])[seriesIndex]); });
      var max = Math.max.apply(null, values.concat([1]));
      values.forEach(function (value, monthIndex) {
        var td = heatCell(displayNumber(value));
        var alpha = .12 + .7 * value / max;
        var color = palette[seriesIndex % palette.length] + Math.round(alpha * 255).toString(16).padStart(2, '0');
        var attrs = markAttrs(months[monthIndex], monthIndex, seriesIndex,
          department + ' · ' + months[monthIndex].l + ': ' + valueLabel(value, payload.unit));
        Object.keys(attrs).forEach(function (name) { td.setAttribute(name, attrs[name]); });
        td.style.setProperty('background-color', color, 'important');
        tr.appendChild(td);
      });
      tr.appendChild(heatCell(displayNumber(values.reduce(function (sum, value) { return sum + value; }, 0))));
      table.appendChild(tr);
    });
    var totals = document.createElement('tr');
    totals.appendChild(heatCell('Total by Month'));
    var grand = 0;
    months.forEach(function (row) {
      var total = (row.values || []).reduce(function (sum, value) { return sum + number(value); }, 0);
      grand += total; totals.appendChild(heatCell(displayNumber(total)));
    });
    totals.appendChild(heatCell(displayNumber(grand)));
    table.appendChild(totals); wrapper.appendChild(table); host.appendChild(wrapper);
    var note = document.createElement('div'); note.className = 'ds-fc-heat-note'; note.textContent = 'Values are in ' + (payload.unit || 'the selected unit'); host.appendChild(note);
  }

  function draw(host) {
    prepareReportHost(host);
    if (compact360Pages[pageId]) host.classList.add('ds-fast-chart--360');
    var dataNode = host.querySelector('.ds-fast-chart-data');
    var incoming = host.getAttribute('data-json') || (dataNode && dataNode.textContent) || '';
    var raw = incoming || host.__dashboardFastRaw || '';
    var renderedWidth = Math.round(host.getBoundingClientRect().width || 0);
    if (host.__dashboardFastRendered && host.__dashboardFastRaw === raw && host.__dashboardFastWidth === renderedWidth) return;
    var payload = payloadFor(host, raw);
    host.__dashboardFastRaw = raw;
    host.__dashboardFastPayload = payload;
    host.__dashboardFastRendered = true;
    host.__dashboardFastWidth = renderedWidth;
    host.innerHTML = '';
    host.classList.remove('ds-fast-chart--round', 'ds-fc-hovering');
    if (!payload.rows.length) {
      host.innerHTML = '<div class="ds-fc-empty">No data for the current filters.</div>';
      return;
    }
    var type = (host.getAttribute('data-chart-type') || 'bar').toLowerCase();
    if (type === 'donut') drawPie(host, payload, true);
    else if (type === 'pie') drawPie(host, payload, false);
    else if (type === 'heatmap') drawHeatmap(host, payload);
    else if (type === 'hbar') drawHorizontalBars(host, payload);
    else drawCartesian(host, payload, type === 'line');
    var tip = document.createElement('div');
    tip.className = 'ds-fc-tip';
    tip.setAttribute('role', 'tooltip');
    host.appendChild(tip);
  }

  function rowFor(mark) {
    var host = mark.closest('.ds-fast-chart');
    var payload = host.__dashboardFastPayload || payloadFor(host);
    return { host: host, payload: payload, row: payload.rows[Number(mark.getAttribute('data-row'))] };
  }

  function positionTip(host, tip, event) {
    var bounds = host.getBoundingClientRect();
    var leftEdge = host.scrollLeft + 8;
    var topEdge = host.scrollTop + 8;
    var x = event.clientX - bounds.left + host.scrollLeft + 14;
    var y = event.clientY - bounds.top + host.scrollTop + 14;
    var width = tip.offsetWidth || 180;
    var height = tip.offsetHeight || 60;
    var rightEdge = host.scrollLeft + host.clientWidth - 8;
    var bottomEdge = host.scrollTop + host.clientHeight - 8;
    if (x + width > rightEdge) x = event.clientX - bounds.left + host.scrollLeft - width - 14;
    if (y + height > bottomEdge) y = event.clientY - bounds.top + host.scrollTop - height - 14;
    tip.style.left = Math.max(leftEdge, Math.min(x, rightEdge - width)) + 'px';
    tip.style.top = Math.max(topEdge, Math.min(y, bottomEdge - height)) + 'px';
  }

  function showTip(mark, event) {
    var host = mark.closest('.ds-fast-chart');
    var tip = host.querySelector('.ds-fc-tip');
    var context = rowFor(mark);
    var row = context.row || {};
    if (host.__activeMark === mark && tip.style.display === 'block') { positionTip(host, tip, event); return; }
    if (host.__activeMark) host.__activeMark.classList.remove('ds-fc-active');
    host.__activeMark = mark;
    mark.classList.add('ds-fc-active');
    host.classList.add('ds-fc-hovering');
    var round = host.classList.contains('ds-fast-chart--round');
    tip.classList.toggle('ds-fc-tip--compact', !round);
    if (!round) {
      tip.textContent = mark.getAttribute('aria-label') || '';
      tip.style.display = 'block'; positionTip(host, tip, event); return;
    }
    var seriesIndex = Number(mark.getAttribute('data-series') || 0);
    var value = number((row.values || [])[seriesIndex]);
    var seriesName = (context.payload.series || [])[seriesIndex] || 'Value';
    var total = (context.payload.rows || []).reduce(function (sum, item) {
      return sum + (legendHidden(host,'slice',item.l)?0:Math.max(0,number((item.values || [])[seriesIndex])));
    }, 0);
    var title = String(row.l || '');
    if ((context.payload.series || []).length > 1) title += ' · ' + seriesName;
    var color = mark.getAttribute('data-color') || '#2E73C4';
    tip.innerHTML = '';
    var titleRow = document.createElement('div'); titleRow.className = 'ds-fc-tip-title';
    var dot = document.createElement('i'); dot.className = 'ds-fc-tip-dot'; dot.style.background = color;
    var titleText = document.createElement('span'); titleText.textContent = title;
    titleRow.appendChild(dot); titleRow.appendChild(titleText); tip.appendChild(titleRow);
    [['Value', valueLabel(value, context.payload.unit)], ['Share of visible total', total ? (value / total * 100).toFixed(1) + '%' : '0%']].forEach(function (pair) {
      var line = document.createElement('div'); line.className = 'ds-fc-tip-row';
      var label = document.createElement('span'); label.textContent = pair[0];
      var strong = document.createElement('strong'); strong.textContent = pair[1];
      line.appendChild(label); line.appendChild(strong); tip.appendChild(line);
    });
    tip.style.display = title ? 'block' : 'none';
    if (title) positionTip(host, tip, event);
  }

  function hideTip(mark) {
    var host = mark.closest('.ds-fast-chart');
    var tip = host && host.querySelector('.ds-fc-tip');
    if (tip) tip.style.display = 'none';
    if (host) { host.classList.remove('ds-fc-hovering'); host.__activeMark = null; }
    mark.classList.remove('ds-fc-active');
  }

  function activate(mark) {
    var context = rowFor(mark);
    var row = context.row || {};
    var seriesIndex = Number(mark.getAttribute('data-series') || 0);
    var seriesAction = (row.actions || [])[seriesIndex];
    var action = seriesAction && typeof seriesAction === 'object' ? seriesAction : row;
    var seriesUrl = typeof seriesAction === 'string' ? seriesAction : null;
    if (action.item) {
      try {
        apex.item(action.item).setValue(action.key == null ? '' : action.key, action.display || row.l || action.key);
        if (action.item2) apex.item(action.item2).setValue(action.key2 == null ? '' : action.key2);
        if (action.item3) apex.item(action.item3).setValue(action.key3 == null ? '' : action.key3);
        if (action.target) apex.region(action.target).refresh();
        var target = action.target && document.getElementById(action.target);
        if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      } catch (error) {
        return;
      }
    } else if (action.url) {
      window.open(action.url, '_blank', 'noopener');
    } else if (seriesUrl || row.u) {
      apex.navigation.redirect(seriesUrl || row.u);
    }
  }

  function scan() {
    document.querySelectorAll('.ds-fast-chart').forEach(draw);
  }

  installStyle();
  scan();
  var resizeTimer = 0;
  window.addEventListener('resize', function () {
    window.clearTimeout(resizeTimer);
    resizeTimer = window.setTimeout(scan, 120);
  });
  $(document)
    .off('apexafterrefresh.dashboardFastCharts')
    .on('apexafterrefresh.dashboardFastCharts', function () { window.setTimeout(scan, 20); })
    .off('.dashboardFastChartEvents')
    .on('click.dashboardFastChartEvents','.ds-fast-chart button[data-legend-kind]',function(event){event.preventDefault();event.stopPropagation();toggleLegend(this);})
    .on('mouseenter.dashboardFastChartEvents', '.ds-fast-chart .ds-fc-mark', function (event) { showTip(this, event); })
    .on('mousemove.dashboardFastChartEvents', '.ds-fast-chart .ds-fc-mark', function (event) { showTip(this, event); })
    .on('mouseleave.dashboardFastChartEvents', '.ds-fast-chart .ds-fc-mark', function () { hideTip(this); })
    .on('focusin.dashboardFastChartEvents', '.ds-fast-chart .ds-fc-mark', function () {
      var rect = this.getBoundingClientRect(); showTip(this, { clientX: rect.left + rect.width / 2, clientY: rect.top + rect.height / 2 });
    })
    .on('focusout.dashboardFastChartEvents', '.ds-fast-chart .ds-fc-mark', function () { hideTip(this); })
    .on('click.dashboardFastChartEvents', '.ds-fast-chart .ds-fc-mark[data-action="true"]', function (event) {
      event.preventDefault(); activate(this);
    })
    .on('keydown.dashboardFastChartEvents', '.ds-fast-chart .ds-fc-mark[data-action="true"]', function (event) {
      if (event.which === 13 || event.which === 32) { event.preventDefault(); activate(this); }
    });
}(window, document));
