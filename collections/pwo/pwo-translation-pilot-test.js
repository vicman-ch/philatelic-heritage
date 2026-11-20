/* Shared PWO translator: uses the same reload-and-cookie approach as the working homepage. */
(function(){
'use strict';
var sel=document.getElementById('pwo-test-language'); if(!sel)return;
var key='pwo-test-site-language', allowed=['en','fr','de','es','it','pt','ro','ru','zh-CN'];
var saved='en';try{saved=localStorage.getItem(key)||'en'}catch(e){}
if(allowed.indexOf(saved)<0)saved='en';sel.value=saved;
var widgetId='google_translate_element_pwo_test';
var target=document.getElementById(widgetId);
if(!target){target=document.createElement('div');target.id=widgetId;document.body.appendChild(target)}
target.style.cssText='position:absolute!important;left:-9999px!important;top:0!important;width:1px!important;height:1px!important;overflow:hidden!important';
function setCookie(lang){
  var value=lang==='en'?'':'/en/'+lang;
  ['/','/philatelic-heritage/','/philatelic-heritage/collections/pwo/','/philatelic-heritage/collections/PWO/'].forEach(function(path){
    document.cookie='googtrans='+value+';path='+path+';SameSite=Lax'+(lang==='en'?';max-age=0':';max-age=2592000');
  });
}
sel.addEventListener('change',function(){
 var lang=sel.value;try{localStorage.setItem(key,lang)}catch(e){}
 setCookie(lang);window.location.reload();
});
window.pwoTestTranslateInit=function(){
 if(!(window.google&&google.translate&&google.translate.TranslateElement))return;
 new google.translate.TranslateElement({pageLanguage:'en',autoDisplay:false,includedLanguages:'fr,de,es,it,pt,ro,ru,zh-CN'},widgetId);
 if(saved!=='en'){
   var n=0,t=setInterval(function(){
    var combo=target.querySelector('.goog-te-combo');
    if(combo){combo.value=saved;combo.dispatchEvent(new Event('change',{bubbles:true}));clearInterval(t)}
    else if(++n>50)clearInterval(t);
   },200);
 }
};
var script=document.createElement('script');
script.src='https://translate.google.com/translate_a/element.js?cb=pwoTestTranslateInit';script.async=true;
script.onerror=function(){sel.title='Google Translate could not load. Check content blocking.'};
document.head.appendChild(script);
})();
