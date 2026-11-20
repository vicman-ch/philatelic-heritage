/* PWO heritage: shared Google Translate selector for homepage and historical pages. */
(function () {
  'use strict';
  var picker = document.getElementById('pwo-test-language');
  if (!picker) return;
  var storageKey = 'pwo-test-site-language';
  var allowed = ['en','fr','de','es','it','pt','ro','ru','zh-CN'];
  var desired = 'en', widgetId = 'google_translate_element_pwo_test';
  try { desired = localStorage.getItem(storageKey) || 'en'; } catch (_) {}
  if (allowed.indexOf(desired) < 0) desired = 'en';
  picker.value = desired;

  // Older pages did not have a translate widget container in the masthead.
  var target = document.getElementById(widgetId);
  if (!target) {
    target = document.createElement('div');
    target.id = widgetId;
    target.setAttribute('aria-hidden','true');
    document.body.appendChild(target);
  }
  target.style.cssText = 'position:absolute!important;left:-9999px!important;top:0!important;width:1px!important;height:1px!important;overflow:hidden!important;';

  function setCookie(lang) {
    // Google Translate checks googtrans across paths; set a site-wide cookie.
    var value = lang === 'en' ? '' : '/en/' + lang;
    var paths = ['/', '/philatelic-heritage/', '/philatelic-heritage/collections/pwo/'];
    paths.forEach(function (path) {
      document.cookie = 'googtrans=' + value + ';path=' + path + ';SameSite=Lax' +
        (lang === 'en' ? ';max-age=0' : ';max-age=2592000');
    });
  }
  function combo() {
    return target.querySelector('.goog-te-combo') || document.querySelector('.goog-te-combo');
  }
  function apply(lang, attempt) {
    var select = combo();
    if (select) {
      if (lang === 'en') {
        // Returning to the original language requires removing translated DOM.
        setCookie('en');
        window.location.reload();
        return;
      }
      select.value = lang;
      select.dispatchEvent(new Event('change', {bubbles:true}));
      return;
    }
    if (attempt < 50) {
      window.setTimeout(function () { apply(lang, attempt + 1); }, 200);
    } else {
      picker.title = 'Translation service could not load. Please check your connection or content blocker.';
    }
  }
  picker.addEventListener('change', function () {
    desired = picker.value;
    try { localStorage.setItem(storageKey, desired); } catch (_) {}
    setCookie(desired);
    if (desired === 'en') window.location.reload();
    else apply(desired, 0);
  });

  window.pwoTestTranslateInit = function () {
    if (!window.google || !google.translate || !google.translate.TranslateElement) return;
    new google.translate.TranslateElement({
      pageLanguage:'en',
      autoDisplay:false,
      includedLanguages:'fr,de,es,it,pt,ro,ru,zh-CN'
    }, widgetId);
    if (desired !== 'en') apply(desired, 0);
  };
  // Load the official translation widget only once.
  if (window.google && google.translate && google.translate.TranslateElement) {
    window.pwoTestTranslateInit();
  } else {
    var script = document.createElement('script');
    script.src = 'https://translate.google.com/translate_a/element.js?cb=pwoTestTranslateInit';
    script.async = true;
    script.onerror = function () {
      picker.title = 'Google Translate could not load (possibly blocked by browser settings).';
    };
    document.head.appendChild(script);
  }
})();
