(function(){
 'use strict';
 function init(){
  var pageId=document.getElementById('pFlowStepId');
  var isPage69=(pageId&&pageId.value==='69')||/\/material-in(?:\?|$)/i.test(location.pathname+location.search);
  if(!document.body||!isPage69||document.body.classList.contains('hspl-mi'))return;
  document.body.classList.add('hspl-po','hspl-mi');
  var tabs=document.getElementById('tabcontainer');
  if(!tabs)return;
  var hero=document.createElement('section');
  hero.className='hspl-po-hero';
  hero.setAttribute('aria-labelledby','hspl-mi-title');
  hero.innerHTML='<div class="hspl-mi-identity"><div class="hspl-mi-hero-icon"><span class="fa fa-sign-in" aria-hidden="true"></span></div><div><div class="hspl-po-titleline"><h1 id="hspl-mi-title" class="hspl-po-title">Material In</h1><span class="hspl-po-status">Draft</span></div><p class="hspl-po-subtitle">Receive, verify and record incoming material</p></div></div><div class="hspl-mi-hero-side"><div class="hspl-po-breadcrumb">Transaction <span>/</span> <b>Material Receipt</b></div></div>';
  tabs.parentElement.insertBefore(hero,tabs);
  var flow=document.getElementById('R704281634892143949');
  if(flow){
   var side=hero.querySelector('.hspl-mi-hero-side');side.appendChild(flow);
   flow.querySelectorAll('.t-Button').forEach(function(btn){
    btn.classList.remove('t-Button--noLabel','t-Button--pill','t-Button--pillEnd');
    if(!btn.querySelector('.hspl-mi-button-label')){var label=document.createElement('span');label.className='hspl-mi-button-label';label.textContent=btn.getAttribute('aria-label')||btn.title;btn.appendChild(label);}
   });
  }
  var status=document.getElementById('P69_STATUS');
  function syncStatus(){var value=(status&&status.value||'Draft').trim();if(!value||/^status$/i.test(value))value='Draft';hero.querySelector('.hspl-po-status').textContent=value;}
  syncStatus();if(status)status.addEventListener('change',syncStatus);
  var subtitles=['Basic Information','Material Details','Personnel & Ownership','Documents & Files'];
  tabs.querySelectorAll('.t-TabsRegion-items a').forEach(function(a,i){a.setAttribute('title',a.textContent.trim());if(!a.querySelector('.hspl-mi-tab-copy')){var label=a.querySelector('span');if(label){var wrap=document.createElement('span');wrap.className='hspl-mi-tab-copy';label.parentNode.insertBefore(wrap,label);wrap.appendChild(label);var small=document.createElement('small');small.textContent=subtitles[i]||'';wrap.appendChild(small);}}});
  var generalTitle=document.querySelector('#R591362183063800708 .t-Region-title');if(generalTitle)generalTitle.textContent='General Information';
  var placeholders={P69_DOCTYPECODE:'Select document type',P69_MATERIALINNO:'Enter material in number',P69_PARTYCODE:'Select party',P69_DELIVERYINTIMATIONTNO:'Select or enter',P69_LOADINGADVICETNO:'Select or enter',P69_PURCHASEORDERTNO:'Select or enter',P69_JOBORDERTNO:'Select or enter',P69_CCINVOICETNO:'Select or enter',P69_GATEPASSTNO:'Select or enter',P69_REFDOCTYPECODE:'Select document type',P69_REFDOCNO:'Enter reference number',P69_REFDOCAMOUNT:'Enter amount'};
  Object.keys(placeholders).forEach(function(id){var el=document.getElementById(id);if(el&&!el.value)el.setAttribute('placeholder',placeholders[id]);});
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);else init();
 document.addEventListener('apexreadyend',init);
})();
