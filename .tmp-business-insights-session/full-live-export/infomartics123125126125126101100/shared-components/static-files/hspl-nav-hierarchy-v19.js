(function(){
 'use strict';
 function paint(){
  document.querySelectorAll('.t-Body-nav [aria-level]').forEach(function(item){
   var level=parseInt(item.getAttribute('aria-level'),10);
   if(!level)return;
   var node=item.classList.contains('a-TreeView-node')?item:item.closest('.a-TreeView-node')||item;
   for(var i=1;i<=5;i++)node.classList.remove('hspl-nav-level-'+i);
   node.classList.add('hspl-nav-level-'+Math.min(level,5));
   var content=item.matches('.a-TreeView-content')?item:node.querySelector(':scope>.a-TreeView-content')||item.parentElement&&item.parentElement.querySelector(':scope>.a-TreeView-content');
   if(content){for(var c=1;c<=5;c++)content.classList.remove('hspl-nav-content-level-'+c);content.classList.add('hspl-nav-content-level-'+Math.min(level,5));}
   var row=item.matches('.a-TreeView-row')?item:node.querySelector(':scope>.a-TreeView-row')||item.parentElement&&item.parentElement.querySelector(':scope>.a-TreeView-row');
   if(row){for(var r=1;r<=5;r++)row.classList.remove('hspl-nav-row-level-'+r);row.classList.add('hspl-nav-row-level-'+Math.min(level,5));}
   if(item.hasAttribute('aria-expanded')||node.querySelector(':scope>[aria-expanded]'))node.classList.add('hspl-nav-has-children');
  });
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',paint);else paint();
 document.addEventListener('apexreadyend',paint);
 new MutationObserver(paint).observe(document.documentElement,{childList:true,subtree:true,attributes:true,attributeFilter:['aria-level','aria-expanded']});

 /* APEX 26 can lose the nested toggle click after the navigation is visually
    repositioned. Route parent-row clicks through its reliable keyboard API. */
 document.addEventListener('click',function(event){
  var node=event.target.closest&&event.target.closest('.t-TreeNav .a-TreeView-node.hspl-nav-has-children');
  if(!node)return;
  var directToggle=node.querySelector(':scope>.a-TreeView-toggle');
  var directRow=node.querySelector(':scope>.a-TreeView-row');
  var directContent=node.querySelector(':scope>.a-TreeView-content');
  var hit=event.target===directToggle||directToggle&&directToggle.contains(event.target)||
          event.target===directRow||directRow&&directRow.contains(event.target)||
          event.target===directContent||directContent&&directContent.contains(event.target);
  if(!hit)return;
  var label=directContent&&directContent.querySelector(':scope>.a-TreeView-label[aria-expanded]');
  if(!label)return;
  event.preventDefault();
  event.stopImmediatePropagation();
  label.focus({preventScroll:true});
  var opening=label.getAttribute('aria-expanded')!=='true';
  var key=opening?'ArrowRight':'ArrowLeft';
  var code=opening?39:37;
  var jq=window.apex&&window.apex.jQuery||window.jQuery;
  if(jq){
   jq(label).trigger(jq.Event('keydown',{key:key,code:key,which:code,keyCode:code}));
  }else{
   label.dispatchEvent(new KeyboardEvent('keydown',{key:key,code:key,bubbles:true,cancelable:true}));
  }
 },true);
})();
