/* Romania on Stamps: one translation method on home, galleries and articles. */
(function(){
 'use strict';
 var host='www.marci-postale.com';
 if(location.hostname.endsWith('.translate.goog')){
   var clean='https://'+host+location.pathname+location.hash;
   location.replace(clean);return;
 }
 function cookie(lang){
   var value=lang&&lang!=='en'?'/en/'+lang:'/en/en';
   document.cookie='googtrans='+encodeURIComponent(value)+';path=/;SameSite=Lax';
   /* Also set host-wide cookie for all sections. */
   if(location.hostname.endsWith('marci-postale.com'))
     document.cookie='googtrans='+encodeURIComponent(value)+';path=/;domain=.marci-postale.com;SameSite=Lax';
 }
 function init(){
   var selects=[].slice.call(document.querySelectorAll('.article-language, select.language'));
   if(!selects.length)return;
   var holder=document.getElementById('google_translate_element');
   if(!holder){holder=document.createElement('div');holder.id='google_translate_element';
     holder.style.cssText='position:absolute;left:-9999px;top:-9999px;width:1px;height:1px;overflow:hidden';
     document.body.appendChild(holder);}
   var match=document.cookie.match(/(?:^|;\s*)googtrans=([^;]+)/);
   var current=match?decodeURIComponent(match[1]).split('/').pop():'en';
   selects.forEach(function(sel){
     if(sel.querySelector('option[value="'+current+'"]'))sel.value=current;
     sel.addEventListener('change',function(){
       var lang=sel.value||'en';cookie(lang);
       if(lang==='en'){location.reload();return;}
       var combo=document.querySelector('.goog-te-combo');
       if(combo){combo.value=lang;combo.dispatchEvent(new Event('change',{bubbles:true}));}
       else{location.reload();}
     });
   });
   window.googleTranslateElementInit=function(){
     new google.translate.TranslateElement({pageLanguage:'en',includedLanguages:'ro,fr,de,es,it,ru,zh-CN',autoDisplay:false},'google_translate_element');
   };
   if(!document.querySelector('script[data-rs-google-translate]')){
     var s=document.createElement('script');s.dataset.rsGoogleTranslate='1';
     s.src='https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit';s.async=true;
     document.head.appendChild(s);
   }
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);
 else init();
})();

/* LOT 39: only legacy tables actually wider than the reading area get
   a horizontal-scroll container; no stamp is upscaled or rearranged. */
(function(){
 function enhance(){
  var main=document.querySelector('body.rs-refined-article .rs-reading-layout');
  if(!main)return;
  var tables=Array.prototype.slice.call(main.querySelectorAll('table'));
  tables.forEach(function(table){
   if(table.closest('.rs-wide-table')||table.parentElement.closest('table'))return;
   var available=main.clientWidth-20;
   if(available<200)return;
   var measured=Math.max(table.scrollWidth,table.getBoundingClientRect().width);
   if(measured<=available+10)return;
   var wrap=document.createElement('div');
   wrap.className='rs-wide-table';
   wrap.setAttribute('role','region');
   wrap.setAttribute('aria-label','Scrollable original stamp table');
   wrap.setAttribute('tabindex','0');
   var hint=document.createElement('span');
   hint.className='rs-wide-table-hint';
   hint.textContent='Scroll sideways to view the complete stamp arrangement';
   wrap.appendChild(hint);
   table.parentNode.insertBefore(wrap,table);
   wrap.appendChild(table);
  });
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',enhance);
 else enhance();
})();

/* LOT 50: identify existing publication metadata, without moving or rewriting it. */
(function(){
 function init(){
  var root=document.querySelector('body.rs-refined-article .rs-reading-layout');
  if(!root)return;
  var candidates=root.querySelectorAll('p,blockquote');
  for(var i=0;i<candidates.length;i++){
   var el=candidates[i];
   if(el.querySelector('img,table,iframe'))continue;
   var txt=(el.textContent||'').replace(/\s+/g,' ').trim();
   if(txt.length>350)continue;
   if(/(?:published|revised|copyright|all rights reserved)/i.test(txt) &&
      /(?:copyright|all rights reserved|published)/i.test(txt) &&
      /(?:19\d{2}|20\d{2})/.test(txt)){
     el.classList.add('rs-publication-note');
   }
  }
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);
 else init();
})();

/* Keep language names readable even after Google Translate updates the DOM. */
(function(){
 function init(){
  var names={'en':'English','ro':'Română','fr':'Français','de':'Deutsch','es':'Español','it':'Italiano','ru':'Русский','zh-CN':'简体中文'};
  var selectors=document.querySelectorAll('.article-language, select.language');
  Array.prototype.forEach.call(selectors,function(sel){
   sel.classList.add('notranslate');sel.setAttribute('translate','no');
   var restoring=false;
   function restore(){
    if(restoring)return;
    restoring=true;
    Array.prototype.forEach.call(sel.options,function(opt){
     opt.setAttribute('translate','no');opt.classList.add('notranslate');
     var original=names[opt.value];
     if(original && opt.textContent!==original)opt.textContent=original;
    });
    restoring=false;
   }
   restore();
   var observer=new MutationObserver(restore);
   observer.observe(sel,{subtree:true,childList:true,characterData:true});
   sel.addEventListener('pointerdown',restore,true);
   sel.addEventListener('focus',restore,true);
  });
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);
 else init();
})();
