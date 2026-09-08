(function(){
 'use strict';
 function init(){
  if(!document.body||!document.body.classList.contains('page-118')||document.body.classList.contains('hspl-po'))return;
  document.body.classList.add('hspl-po');
  var tabs=document.getElementById('tabcontainer');
  if(!tabs)return;
  var host=tabs.parentElement;
  var hero=document.createElement('section');
  hero.className='hspl-po-hero';
  hero.setAttribute('aria-labelledby','hspl-po-title');
  hero.innerHTML='<div><div class="hspl-po-breadcrumb">Transactions <span>/</span> Purchase Order</div><div class="hspl-po-titleline"><h1 id="hspl-po-title" class="hspl-po-title">Purchase Order</h1><span class="hspl-po-status">Draft</span></div><p class="hspl-po-subtitle">Create and manage purchase orders</p></div><div class="hspl-po-meta"><span>Form</span><b>Purchase Order</b></div>';
  host.insertBefore(hero,tabs);
  var status=document.getElementById('P118_STATUS');
  function updateStatus(){var s=(status&&status.value||'Draft').trim();hero.querySelector('.hspl-po-status').textContent=s||'Draft';}
  updateStatus();
  if(status)status.addEventListener('change',updateStatus);
  var tabLinks=tabs.querySelectorAll('.t-TabsRegion-items a');
  tabLinks.forEach(function(a){a.setAttribute('title',a.textContent.trim());});
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);else init();
 document.addEventListener('apexreadyend',init);
})();
