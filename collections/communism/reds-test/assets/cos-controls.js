(function(){
'use strict';
if(document.getElementById('cos-language'))return;
var root=document.createElement('div');root.id='cos-tools';root.innerHTML=`<label id="cos-language-wrap" for="cos-language"><span>Language</span><select id="cos-language" aria-label="Select translation language">
    <option value="en">English</option>
    <option value="fr">Français</option>
    <option value="de">Deutsch</option>
    <option value="ru">Русский</option>
    <option value="es">Español</option>
    <option value="pt">Português</option>
    <option value="ro">Română</option>
    <option value="pl">Polski</option>
    <option value="cs">Čeština</option>
    <option value="sk">Slovenčina</option>
    <option value="hu">Magyar</option>
    <option value="bg">Български</option>
    <option value="sr">Српски</option>
    <option value="hr">Hrvatski</option>
    <option value="sl">Slovenščina</option>
    <option value="sq">Shqip</option>
    <option value="zh-CN">中文</option>
    <option value="ko">한국어</option>
    <option value="vi">Tiếng Việt</option>
    <option value="km">ខ្មែរ</option>
    <option value="lo">ລາວ</option>
    <option value="mn">Монгол</option>
</select></label><button id="cos-to-top" type="button" aria-label="Back to top" title="Back to top">↑</button><div id="cos-google-translate" aria-hidden="true"></div>`;
document.body.appendChild(root);
var select=document.getElementById('cos-language'),up=document.getElementById('cos-to-top');
up.addEventListener('click',function(){window.scrollTo({top:0,behavior:'smooth'});});
var saved='en';try{saved=localStorage.getItem('cos-language')||'en'}catch(e){}
if(!Array.from(select.options).some(function(o){return o.value===saved}))saved='en';select.value=saved;
function cookie(name,value,domain){
 var line=name+'='+value+';path=/;SameSite=Lax';
 if(domain)line+=';domain='+domain;
 document.cookie=line;
}
function domains(){var h=location.hostname.split('.'),a=[''];for(var i=0;i<h.length-1;i++){if(h.length-i>=2)a.push('.'+h.slice(i).join('.'));}return a;}
function setTranslation(lang){domains().forEach(function(d){cookie('googtrans','/en/'+lang,d);});}
function clearTranslation(){domains().forEach(function(d){document.cookie='googtrans=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/;SameSite=Lax'+(d?';domain='+d:'');});}
function apply(lang){var combo=document.querySelector('#cos-google-translate .goog-te-combo');if(!combo)return false;combo.value=lang;combo.dispatchEvent(new Event('change',{bubbles:true}));return true;}
select.addEventListener('change',function(){
 var lang=select.value;
 try{localStorage.setItem('cos-language',lang)}catch(e){}
 if(lang==='en'){clearTranslation();location.reload();return;}
 setTranslation(lang);
 // Reload between languages to prevent Google Translate from keeping a stale translated DOM.
 location.reload();
});
window.cosGoogleTranslateInit=function(){new google.translate.TranslateElement({pageLanguage:'en',autoDisplay:false,includedLanguages:select.options.length?Array.from(select.options).map(function(o){return o.value}).filter(function(v){return v!=='en'}).join(','):''},'cos-google-translate');
 if(saved!=='en'){var tries=0,handle=setInterval(function(){if(apply(saved)||++tries>25)clearInterval(handle)},200);}
};
var s=document.createElement('script');s.src='https://translate.google.com/translate_a/element.js?cb=cosGoogleTranslateInit';s.async=true;document.head.appendChild(s);
})();