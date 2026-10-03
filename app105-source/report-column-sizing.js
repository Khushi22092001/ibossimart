/* Presentation only. No query/model values, report order or report settings are saved. */
(function () {
  'use strict';
  if (window.IMARTReportSizing) return;
  var pending = false, grids = new WeakMap(), stickyHeaders = new Map(), canvas = document.createElement('canvas'), ctx = canvas.getContext('2d');
  function syncStickyHeader(wrapper) {
    var header=wrapper && wrapper.querySelector(':scope > .t-fht-thead');
    if(!header || !wrapper.querySelector(':scope > .js-stickyWidget-placeholder'))return;
    function update(){
      var height=header.getBoundingClientRect().height;
      if(height>0 && Math.abs(height-(Number(wrapper.dataset.imartHeaderHeight)||0))>.1){
        wrapper.dataset.imartHeaderHeight=String(height);
        wrapper.style.setProperty('--imart-header-height',height+'px');
        wrapper.classList.add('imart-synced-header');
      }
    }
    update();
    if(window.ResizeObserver && !stickyHeaders.has(header)){
      var observer=new ResizeObserver(update);observer.observe(header);stickyHeaders.set(header,observer);
    }
  }
  function text(el) { return (el.textContent || '').replace(/\s+/g, ' ').trim(); }
  function category(label, samples) {
    var s = label.replace(/([a-z])([A-Z])/g, '$1 $2').replace(/[_-]/g, ' ').toUpperCase();
    if (/ADDRESS|REMARK|DESCRIPTION|NARRATION|COMMENT|NOTES|REASON/.test(s)) return ['long',250,450];
    if (/STATUS|YES.?NO|FLAG|GST TYPE|STATE CODE/.test(s)) return ['small',90,140];
    if (/CREATION|TIMESTAMP|DATE.*TIME/.test(s)) return ['date',170,220];
    if (/DATE|TIME/.test(s)) return ['date',110,160];
    if (/GST.*(NO|NUMBER|IN)|GSTIN|PAN|AADHAAR|IFSC|PHONE|MOBILE|HSN|SKU/.test(s)) return ['code',130,220];
    if (/EMAIL|MAIL/.test(s)) return ['text',220,360];
    if (/CREATOR|CREATED BY|UPDATER/.test(s)) return ['name',220,400];
    if (/SHORT.?NAME/.test(s)) return ['text',140,220];
    if (/^(REFERENCE|REF)$/.test(s)) return ['text',150,240];
    if (/\b(NO|NUMBER|REF|REFERENCE)\b|(?:NO|NUMBER)$|BANK ACCOUNT/.test(s) && /GRN|ORDER|\bPO\b|\bSO\b|INDENT|QUOTATION|INVOICE|VOUCHER|CHALLAN|\bLR\b|BILTY|MATERIAL.?IN|LOADING.?ADVICE|ENQUIRY|REF|REFERENCE|BILL|DOCUMENT|DOC/.test(s)) return ['document',210,300];
    if (/\b(QTY|QUANTITY|UNIT|UOM|PIN|STATE|RATE|AMOUNT|TOTAL|VALUE|BALANCE|PERCENT|TAX|PRICE|SERIAL)\b/.test(s)) return ['small',90,160];
    if (/\b(NO|NUMBER|CODE)\b|(?:NO|CODE)$/.test(s)) return ['code',120,200];
    if (/LOCATION|CITY|DOCTYPE|DOC TYPE/.test(s)) return ['text',150,240];
    if (/NAME|PARTY|MATERIAL|ITEM|SPECIFICATION|VENDOR|CUSTOMER|EMPLOYEE|CONTACT/.test(s)) return ['name',220,400];
    if (samples.length && samples.every(function (v) { return /^[-+\d,.%()\s]+$/.test(v); })) return ['small',90,160];
    return ['text',140,300];
  }
  function measure(value, style) {
    if(style.textTransform==='uppercase')value=value.toUpperCase();
    else if(style.textTransform==='lowercase')value=value.toLowerCase();
    ctx.font=style.font || '12px sans-serif';
    return ctx.measureText(value.slice(0,500)).width + Math.max(0,value.length-1)*(parseFloat(style.letterSpacing)||0);
  }
  function headingWidth(label, header, font) {
    var inner=header && header.querySelector('a,.a-GV-headerLabel'), hs=header?getComputedStyle(header):{}, style=inner?getComputedStyle(inner):hs;
    if(!header)style={font:font};
    var padding=(parseFloat(hs.paddingLeft)||0)+(parseFloat(hs.paddingRight)||0);
    if(inner)padding+=(parseFloat(style.paddingLeft)||0)+(parseFloat(style.paddingRight)||0);
    var icons=0;
    if(header)header.querySelectorAll('.a-Icon,.fa').forEach(function(n){icons+=n.getBoundingClientRect().width;});
    return measure(label,style)+padding+icons+4;
  }
  function preferred(label, cells, font, header) {
    var values = cells.map(text).filter(Boolean), rule = category(label, values), widths;
    widths = cells.filter(function(c){return text(c);}).map(function(c) {
      var cs=getComputedStyle(c), width=measure(text(c),cs), chrome=0;
      // Badges/buttons include padding and icons that canvas text alone misses.
      c.querySelectorAll('.hspl-status-pill,button,img,.fa,.a-Icon').forEach(function(n){chrome=Math.max(chrome,n.getBoundingClientRect().width);});
      return Math.max(width,chrome)+ (parseFloat(cs.paddingLeft)||0)+(parseFloat(cs.paddingRight)||0)+4;
    }).sort(function(a,b){return a-b;});
    var representative = widths.length ? widths[widths.length<6?widths.length-1:Math.floor((widths.length-1)*.9)] : 0;
    var heading=headingWidth(label,header,font);
    var width=Math.ceil(Math.min(rule[2],Math.max(rule[1],heading,representative)));
    return {kind:rule[0],width:width,min:rule[1],max:rule[2]};
  }
  function decorate(cell, kind, width, grid) {
    cell.classList.add('imart-sized-cell'); cell.dataset.imartKind = kind;
    if (!grid) {
      // The colgroup owns one shared measured track. Do not turn cell MIN/MAX
      // into the same forced value, or let HTML-expression wrappers widen it.
      cell.style.setProperty('width',width+'px','important');
      cell.style.removeProperty('min-width');cell.style.removeProperty('max-width');
    }
    if (cell.tagName === 'TH') return;
    var value = text(cell);
    if (value && !cell.hasAttribute('title')) cell.title = value;
    // Preserve nodes/listeners. Clamp display text only, never editors/widgets.
    if (!grid && /^(long|name|text)$/.test(kind) && !cell.querySelector('input,select,textarea,button,img,.fa,.a-Icon') && value) {
      var className=kind==='long'?'imart-long-value':'imart-text-value';
      function containValue(node){
        node.classList.add(className);
        node.style.setProperty('display','-webkit-box','important');
        node.style.setProperty('white-space','normal','important');
        node.style.setProperty('-webkit-box-orient','vertical','important');
        node.style.setProperty('-webkit-line-clamp',kind==='long'?'3':'2','important');
        node.style.setProperty('overflow','hidden','important');
        node.style.setProperty('overflow-wrap',kind==='long'?'anywhere':'break-word','important');
      }
      if(cell.children.length===1 && /^(DIV|SPAN|A)$/.test(cell.firstElementChild.tagName)){
        containValue(cell.firstElementChild);return;
      }
      if(cell.children.length)return;
      var span = document.createElement('span'); span.className = className;
      while(cell.firstChild) span.appendChild(cell.firstChild);
      cell.appendChild(span);
      containValue(span);
    }
  }
  function isRegister(region) {
    if(!region)return false;
    if(/dashboard|analytics|insights|command centre/i.test(document.title))return false;
    var label=region.getAttribute('aria-label') || '';
    if(/dashboard|analytics|insights|command centre/i.test(label))return false;
    return Array.from(document.querySelectorAll('.mr-register-kpis,.tx-register-kpis')).some(function(k){return k.dataset.reportRegion===region.id || k.dataset.reportLabel===label;}) || /register|\blist\b|\bmaster\b/i.test(label) || /register|\blist\b|\bmaster\b/i.test(document.title);
  }
  function report(table) {
    if (table.closest('.a-IG,.imart-sizing-off') || table.closest('.t-fht-thead')) return;
    var region=table.closest('.js-apex-region'), register=isRegister(region);
    // Do not size dashboard/other global content merely because it is a table.
    if(!register)return;
    if(register)region.classList.add('imart-register-data');
    var wrapper = table.closest('.t-fht-wrapper'), clone = wrapper && wrapper.querySelector('.t-fht-thead table');
    var head = clone || table, rows = Array.from(table.rows), header = Array.from(head.rows).find(function(r){return r.querySelector('th') && !Array.from(r.cells).some(function(c){return c.colSpan>1;});});
    if (!header) return;
    var labels = Array.from(header.cells).map(text), dataRows = rows.filter(function(r){return r.querySelector('td') && r.cells.length===labels.length && !Array.from(r.cells).some(function(c){return c.colSpan>1;});});
    if (!dataRows.length) return;
    var widths = labels.map(function(label,i){
      var cells=dataRows.slice(0,30).map(function(r){return r.cells[i];});
      if (!label || /^(LINK|EDIT|PRINT|SELECT|DELETE|ACTION)$/.test(label.toUpperCase())) {
        var visibleHeading=header.cells[i].querySelector('a:not(.u-vh)');
        return {kind:'action',width:visibleHeading?Math.min(100,Math.max(48,Math.ceil(headingWidth(label,header.cells[i])))):48};
      }
      return preferred(label,cells,getComputedStyle(cells[0]).font,header.cells[i]);
    });
    var scroll=table.closest('.t-fht-tbody,.a-IRR-tableContainer,.t-Report-wrap');
    // Keep required widths even when their sum is wider than the viewport.
    // A few-column report can fill its viewport, but never exceed semantic MAX.
    var total=widths.reduce(function(sum,w){return sum+w.width;},0);
    if(register && scroll && scroll.clientWidth>total){
      var extra=scroll.clientWidth-total, flexible=widths.filter(function(w){return w.max>w.width;});
      var room=flexible.reduce(function(sum,w){return sum+w.max-w.width;},0);
      flexible.forEach(function(w){w.width+=Math.floor(Math.min(extra,room)*(w.max-w.width)/(room||1));});
    }
    [table,clone].filter(Boolean).forEach(function(t){
      t.classList.add('imart-sized-report');
      var total=widths.reduce(function(sum,w){return sum+w.width;},0);
      t.style.setProperty('width',total+'px','important');
      t.style.setProperty('min-width',total+'px','important');
      t.style.setProperty('table-layout','fixed','important');
      var cg=t.querySelector(':scope > colgroup');
      if(!cg){cg=document.createElement('colgroup');t.insertBefore(cg,t.firstChild);}
      if(cg.children.length!==widths.length){cg.replaceChildren();widths.forEach(function(){cg.appendChild(document.createElement('col'));});}
      Array.from(t.rows).forEach(function(r){
        if(r.cells.length!==widths.length || Array.from(r.cells).some(function(c){return c.colSpan>1;}))return;
        Array.from(r.cells).forEach(function(c,i){decorate(c,widths[i].kind,widths[i].width,false);});
      });
      t.querySelectorAll('colgroup col').forEach(function(c,i){if(widths[i])c.style.setProperty('width',widths[i].width+'px','important');});
    });
    if(scroll)scroll.classList.add('imart-report-scroll');
    // APEX reserved the old heading height before the column tracks changed.
    // Keep only its own placeholder in sync with the actual resized heading.
    syncStickyHeader(wrapper);
  }
  function grid(el) {
    if (!window.apex || !apex.jQuery || el.closest('.imart-sizing-off')) return;
    if(/dashboard|analytics|insights|command centre/i.test(document.title))return;
    var region=el.closest('.js-apex-region');
    if(region && /dashboard|analytics|insights|command centre/i.test(region.getAttribute('aria-label')||''))return;
    if(isRegister(region))region.classList.add('imart-register-data');
    var $=apex.jQuery, view=$(el), cols;
    try {cols=view.grid('getColumns');} catch(e){return;}
    if(!Array.isArray(cols) || !el.getBoundingClientRect().width)return;
    var state=grids.get(el); if(!state){state={sized:new Map(),manual:new Set(),applying:false};grids.set(el,state);
      view.on('gridcolumnresize.imartSizing',function(e,d){if(!state.applying && d && d.column)state.manual.add(typeof d.column==='string'?d.column:d.column.property);});
    }
    // Never resize while a user is actively editing.
    if(el.querySelector('.a-GV-columnItemContainer:not(.u-hidden) input:focus,.a-GV-columnItemContainer textarea:focus'))return;
    var byColumn=new Map();
    Array.from(el.querySelectorAll('td.a-GV-cell')).forEach(function(c){var found=view.grid('getColumnForCell',$(c));if(found){if(!byColumn.has(found.property))byColumn.set(found.property,[]);byColumn.get(found.property).push(c);}});
    state.applying=true;
    try {cols.forEach(function(col){
      if(col.hidden || !col.property || /^APEX\$/.test(col.property))return;
      var cells=byColumn.get(col.property)||[];
      var header=Array.from(el.querySelectorAll('th.a-GV-header[data-idx]')).find(function(h){return cols[Number(h.dataset.idx)]===col;});
      var label=header?text(header):String(col.heading || col.label || col.property).replace(/<[^>]*>/g,' '), plan=preferred(label,cells.slice(0,30),cells.length?getComputedStyle(cells[0]).font:'12px sans-serif',header);
      cells.forEach(function(c){decorate(c,plan.kind,plan.width,true);});
      if(!state.manual.has(col.property) && !state.skipResize){
        // Reconsider loaded samples after refresh/pagination; don't repeatedly
        // resize for virtual rows arriving during scroll. Preserve wider tracks.
        var width=Math.max(Number(col.width)||0,plan.width,state.sized.get(col.property)||0);
        state.sized.set(col.property,width);
        if(width>(Number(col.width)||0)+1)view.grid('setColumnWidth',col,width);
      }
    });
      el.classList.add('imart-sized-grid');
      if(!state.variableRows){view.grid('option','fixedRowHeight',false);state.variableRows=true;}
    } finally {state.applying=false;}
  }
  function scan(){pending=false;
    stickyHeaders.forEach(function(observer,header){if(!header.isConnected){observer.disconnect();stickyHeaders.delete(header);}});
    document.querySelectorAll('.a-IRR-table,.t-Report-report').forEach(report);
    document.querySelectorAll('.a-IG .a-GV').forEach(grid);
  }
  function schedule(e){
    // Continuous/virtual scrolling may emit pagechange: contain newly rendered
    // cells but leave established native tracks unchanged during that scroll.
    document.querySelectorAll('.a-IG .a-GV').forEach(function(el){
      var state=grids.get(el);if(!state)return;
      var scrollPaging=false;
      if(e && e.type==='gridpagechange')try{scrollPaging=!!apex.jQuery(el).grid('option','pagination').scroll;}catch(ignore){}
      state.skipResize=scrollPaging;
    });
    if(!pending){pending=true;requestAnimationFrame(scan);}
  }
  function start(){scan();
    if(window.apex && apex.jQuery)apex.jQuery(document).on('apexafterrefresh.imartSizing interactivegridviewchange.imartSizing interactivegridviewmodelcreate.imartSizing gridpagechange.imartSizing tabsactivate.imartSizing',schedule);
    document.addEventListener('click',function(e){if(e.target.closest('[role="tab"],.t-Tabs-link,.apex-rds a'))schedule();},true);
    // Child-list only, no style/attribute observer or resize feedback loop.
    new MutationObserver(function(records){if(records.some(function(r){return Array.from(r.addedNodes).some(function(n){return n.nodeType===1 && (n.matches('.a-IRR-table,.t-Report-report,.a-GV') || n.querySelector('.a-IRR-table,.t-Report-report,.a-GV'));});}))schedule();}).observe(document.body,{childList:true,subtree:true});
  }
  window.IMARTReportSizing={refresh:schedule};
  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start,{once:true});else start();
  window.addEventListener('load',schedule,{once:true});
  window.addEventListener('resize',schedule);
}());
