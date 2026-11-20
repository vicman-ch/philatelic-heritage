(function(){'use strict';
var picker=document.getElementById('pwo-test-language');if(!picker)return;
var languages=['en','fr','de','es','it','pt','ro','ru','zh-CN'];
var key='pwo-iphla-language';var chosen='en';
try{chosen=sessionStorage.getItem(key)||'en';}catch(e){}
if(languages.indexOf(chosen)<0)chosen='en';picker.value=chosen;
function translateTo(lang){
 var combo=document.querySelector('#google_translate_element_pwo_test select.goog-te-combo');
 if(!combo)return false;
 combo.value=lang==='en'?'':lang;
 combo.dispatchEvent(new Event('change',{bubbles:true}));return true;
}
picker.addEventListener('change',function(){chosen=picker.value;try{sessionStorage.setItem(key,chosen)}catch(e){}
 if(!translateTo(chosen)){var attempts=0;var timer=setInterval(function(){if(translateTo(chosen)||++attempts>40)clearInterval(timer)},200)}
});
window.pwoTestTranslateInit=function(){
 new google.translate.TranslateElement({pageLanguage:'en',autoDisplay:false,includedLanguages:'fr,de,ro,es,it,pt,ru,zh-CN'},'google_translate_element_pwo_test');
 if(chosen!=='en'){var attempts=0;var timer=setInterval(function(){if(translateTo(chosen)||++attempts>40)clearInterval(timer)},200)}
};
var script=document.createElement('script');script.src='https://translate.google.com/translate_a/element.js?cb=pwoTestTranslateInit';script.async=true;document.head.appendChild(script);
})();