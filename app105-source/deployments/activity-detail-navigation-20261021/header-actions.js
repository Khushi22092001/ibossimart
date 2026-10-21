(function () {
 var back=document.getElementById('am-detail-back'),nav=window.navigation;
 if(!back||!nav||!nav.currentEntry||!nav.entries)return;
 var current=new URL(location.href),entries=nav.entries();
 for(var i=entries.length-1;i>=0;i--){
  var entry=entries[i];if(entry.index>=nav.currentEntry.index||!entry.url)continue;
  var previous=new URL(entry.url);
  if(previous.origin!==current.origin)break;
  if(previous.pathname!==current.pathname&&previous.pathname.indexOf('/ords/r/')===0){back.href=previous.href;return;}
 }
})();
