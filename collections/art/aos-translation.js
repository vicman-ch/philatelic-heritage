/* Art on Stamps: one shared language mechanism, adapted from Communism on Stamps. */
(function(){
'use strict';
if(window.__aosTranslateInitialized)return;
var select=document.getElementById('lang');if(!select)return;
window.__aosTranslateInitialized=true;
var langs=[['en','English'],['fr','Français'],['de','Deutsch'],['es','Español'],['it','Italiano'],['pt','Português'],['ro','Română'],['ru','Русский'],['zh-CN','中文']];
select.innerHTML='';langs.forEach(function(x){var o=document.createElement('option');o.value=x[0];o.textContent=x[1];select.appendChild(o)});
select.classList.add('notranslate');select.setAttribute('translate','no');
var saved='en';try{saved=localStorage.getItem('aos-language')||'en'}catch(e){}
if(!langs.some(function(x){return x[0]===saved}))saved='en';select.value=saved;
function domains(){var h=location.hostname.split('.'),a=[''];for(var i=0;i<h.length-1;i++)if(h.length-i>=2)a.push('.'+h.slice(i).join('.'));return a;}
function cookie(v,d,remove){var line='googtrans='+v+';path=/;SameSite=Lax';if(d)line+=';domain='+d;if(remove)line+=';expires=Thu, 01 Jan 1970 00:00:00 GMT';document.cookie=line;}
function setTranslation(lang){domains().forEach(function(d){cookie('/en/'+lang,d,false)})}
function clearTranslation(){domains().forEach(function(d){cookie('',d,true)})}
select.addEventListener('change',function(){var lang=select.value;try{localStorage.setItem('aos-language',lang)}catch(e){}if(lang==='en')clearTranslation();else setTranslation(lang);location.reload()});
var mount=document.createElement('div');mount.id='aos-google-translate';mount.setAttribute('aria-hidden','true');mount.style.cssText='position:absolute;width:1px;height:1px;overflow:hidden;left:-10000px;top:0';document.body.appendChild(mount);
window.aosGoogleTranslateInit=function(){new google.translate.TranslateElement({pageLanguage:'en',autoDisplay:false,includedLanguages:langs.filter(function(x){return x[0]!=='en'}).map(function(x){return x[0]}).join(',')},'aos-google-translate');if(saved!=='en'){var tries=0,t=setInterval(function(){var combo=mount.querySelector('.goog-te-combo');if(combo){combo.value=saved;combo.dispatchEvent(new Event('change',{bubbles:true}));clearInterval(t)}else if(++tries>25)clearInterval(t)},200)}};
var s=document.createElement('script');s.src='https://translate.google.com/translate_a/element.js?cb=aosGoogleTranslateInit';s.async=true;document.head.appendChild(s);
})();
