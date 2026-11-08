(function(){
 var top=document.querySelector('.sna-modern-top');if(!top)return;
 top.querySelectorAll('.sna-group>button').forEach(function(b){b.addEventListener('click',function(e){e.stopPropagation();var g=b.parentElement;top.querySelectorAll('.sna-group.open').forEach(function(x){if(x!==g){x.classList.remove('open');x.querySelector('button').setAttribute('aria-expanded','false')}});var open=g.classList.toggle('open');b.setAttribute('aria-expanded',String(open));});});
 document.addEventListener('click',function(e){if(!e.target.closest('.sna-modern-top .sna-group'))top.querySelectorAll('.sna-group.open').forEach(function(x){x.classList.remove('open');x.querySelector('button').setAttribute('aria-expanded','false')})});
 document.addEventListener('keydown',function(e){if(e.key==='Escape')top.querySelectorAll('.sna-group.open').forEach(function(x){x.classList.remove('open');x.querySelector('button').setAttribute('aria-expanded','false')})});
 var holder=top.querySelector('.sna-lang');
 if(!holder)return;
 holder.innerHTML='<div class="gtranslate_wrapper"></div>';
 window.gtranslateSettings={default_language:'en',languages:['en','es','fr','de','ro','ru','zh-CN','it','pt'],wrapper_selector:'.sna-modern-top .gtranslate_wrapper',native_language_names:true};
 var script=document.createElement('script');script.src='https://cdn.gtranslate.net/widgets/latest/dropdown.js';script.defer=true;document.head.appendChild(script);
})();
