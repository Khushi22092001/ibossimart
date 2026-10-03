whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_text         clob := q'~/* App105 Login Page 9999 presentation only. Keep native authentication and item nodes. */
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
 /* The file is emitted after Login markup: run before APEX ready handlers,
    not after DOMContentLoaded, to avoid a separate native-login paint. */
 if(document.querySelector('.t-Login-region'))init();else document.addEventListener('DOMContentLoaded',init,{once:true});
})();
~';
  l_blob         blob;
  l_dest_offset  integer := 1;
  l_src_offset   integer := 1;
  l_lang_context integer := dbms_lob.default_lang_ctx;
  l_warning      integer;
begin
  apex_util.set_security_group_id(4744311978888504);
  dbms_lob.createtemporary(l_blob, true);
  dbms_lob.converttoblob(l_blob, l_text, dbms_lob.lobmaxsize, l_dest_offset,
    l_src_offset, nls_charset_id('AL32UTF8'), l_lang_context, l_warning);
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.create_app_static_file(
    p_id=>wwv_flow_imp.id(7711712855328832), p_file_name=>'hspl-login.js',
    p_mime_type=>'application/javascript', p_file_charset=>'utf-8',
    p_file_content=>l_blob);
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_blob);
  commit;
end;
/
exit
