/* App100 page9999 presentation only. Keep native authentication and item nodes. */
(function(){
 'use strict';
 var script=document.currentScript,assetBase=script?new URL('.',script.src).href:'';
 function init(){
  if(!document.documentElement.classList.contains('page-9999')||document.body.classList.contains('hspl-login'))return;
  var card=document.querySelector('.t-Login-region'),main=document.querySelector('.t-Login-containerBody'),header=document.querySelector('.t-Login-containerHeader');
  if(!card||!main||!header)return;
  document.body.classList.add('hspl-login');
  header.innerHTML='<div class="hspl-login-brand"><img alt="BOSS" width="74" height="74"><span>Business operations,<br><strong>beautifully connected.</strong></span></div><div class="hspl-login-capabilities" aria-label="Business capabilities"><span><i class="fa fa-industry" aria-hidden="true"></i> Manufacturing</span><span><i class="fa fa-truck" aria-hidden="true"></i> Supply Chain</span><span><i class="fa fa-shield" aria-hidden="true"></i> Quality</span><span><i class="fa fa-line-chart" aria-hidden="true"></i> Analytics</span></div>';
  header.querySelector('img').src=assetBase+'hspl-login-boss.png';
  var layout=document.createElement('div');layout.className='hspl-login-layout';
  var hero=document.createElement('section');hero.className='hspl-login-hero';
  hero.innerHTML='<h1>Run every operation<br>with <em>clarity.</em></h1><p class="hspl-login-intro">One workspace. Every part of your business.</p><img class="hspl-login-factory" alt="Connected manufacturing, logistics and business operations" width="1448" height="1086"><div class="hspl-login-benefits"><div><i class="fa fa-share-alt" aria-hidden="true"></i><span><strong>Connected</strong><small>Operations in one place.</small></span></div><div><i class="fa fa-line-chart" aria-hidden="true"></i><span><strong>Organized</strong><small>Clarity in every workflow.</small></span></div><div><i class="fa fa-shield" aria-hidden="true"></i><span><strong>Controlled</strong><small>Your workspace. Your access.</small></span></div></div>';
  hero.querySelector('img').src=assetBase+'hspl-login-factory.png';
  var pane=document.createElement('section');pane.className='hspl-login-pane';
  layout.appendChild(hero);layout.appendChild(pane);main.appendChild(layout);pane.appendChild(card);
  var title=card.querySelector('.t-Login-title');if(title)title.textContent='Welcome back';
  var cardHead=card.querySelector('.t-Login-header');
  if(cardHead){var intro=document.createElement('p');intro.className='hspl-login-subtitle';intro.textContent='Sign in to your workspace';cardHead.appendChild(intro);}
  card.querySelectorAll('.t-Form-label.u-VisuallyHidden').forEach(function(label){label.classList.remove('u-VisuallyHidden');});
  var note=document.createElement('p');note.className='hspl-login-access-note';note.innerHTML='<i class="fa fa-lock" aria-hidden="true"></i> Authorized workspace access';card.appendChild(note);
  var footer=document.createElement('p');footer.className='hspl-login-powered';footer.innerHTML='Powered by <strong>Infomatics Technologies</strong>';pane.appendChild(footer);
 }
 /* This file is emitted after the Login form markup. Run in this parser task,
    before APEX ready handlers and a possible first paint; waiting for
    DOMContentLoaded produced the visible native-login -> branded-login swap. */
 if(document.querySelector('.t-Login-region'))init();else document.addEventListener('DOMContentLoaded',init,{once:true});
})();
