/* SNA homepage: preserve existing artwork and click-to-open menu. */
(function(){
  var groups=document.querySelectorAll('.nav-group');
  groups.forEach(function(group){
    var button=group.querySelector('button');
    if(!button)return;
    button.addEventListener('click',function(event){
      event.stopPropagation();
      var opening=!group.classList.contains('open');
      groups.forEach(function(other){other.classList.remove('open');var b=other.querySelector('button');if(b)b.setAttribute('aria-expanded','false');});
      if(opening){group.classList.add('open');button.setAttribute('aria-expanded','true');}
    });
  });
  document.addEventListener('click',function(event){
    if(!event.target.closest('.nav-group'))groups.forEach(function(group){group.classList.remove('open');var b=group.querySelector('button');if(b)b.setAttribute('aria-expanded','false');});
  });
  document.addEventListener('keydown',function(event){
    if(event.key==='Escape')groups.forEach(function(group){group.classList.remove('open');var b=group.querySelector('button');if(b)b.setAttribute('aria-expanded','false');});
  });
  var language=document.querySelector('.hero .language');
  if(!language)return;
  /* Replace the old select to avoid its translate.google.com navigation. */
  language.innerHTML='<div class="gtranslate_wrapper"></div>';
  var style=document.createElement('style');
  style.textContent = `
    /* Desktop: show the real native language selector over the fixed JPEG label.
       The native selector automatically displays its selected option; no observers. */
    @media (min-width:901px) {
      .approved-visual .hero .language,
      .approved-visual .hero .language .gtranslate_wrapper {
        background:transparent !important; border:0 !important;
        box-shadow:none !important; isolation:auto !important;
      }
      .approved-visual .hero .language .gt_selector {
        display:block !important; position:relative !important;
        width:100% !important; height:100% !important;
        min-width:0 !important; max-width:none !important;
        opacity:1 !important; color:#102044 !important;
        background:#f6f5f3 !important; border:1px solid #d5d6dc !important;
        border-radius:7px !important; appearance:auto !important;
        font:600 15px Georgia,serif !important; padding:0 4px !important;
        box-shadow:none !important; cursor:pointer !important;
      }
      .approved-visual .hero .language .gtranslate_wrapper {
        width:100%; height:100%;
      }
    }
    /* On narrow screens, show the real, usable translator. */
    @media (max-width:900px) {
      .hero .language {z-index:80;background:#fffdf2 !important;}
      .hero .language .gt_selector {display:block;max-width:120px;background:#fffdf2 !important;opacity:1 !important;}
    }
    .hero .language .gtranslate_wrapper select:not(.gt_selector){display:none !important}
    .hero .language .gtranslate_wrapper .gt_selector~.gt_selector{display:none !important}
  `;
  document.head.appendChild(style);
  window.gtranslateSettings={default_language:'en',languages:['en','es','fr','de','ro','ru','zh-CN','it','pt'],wrapper_selector:'.hero .language .gtranslate_wrapper',native_language_names:true};
  var script=document.createElement('script');
  script.src='https://cdn.gtranslate.net/widgets/latest/dropdown.js';
  script.defer=true;
  document.head.appendChild(script);
})();
