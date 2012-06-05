// request-gcf.js
if ( navigator.userAgent.indexOf('chromeframe') < 0 )
  document.body.innerHTML='<div id="installBar"><div><a class="button" href="http://www.google.com/chromeframe">Install Google Chrome Frame</a> &#160; <a class="X" href="#" onclick="javascript:document.getElementById(\'installBar\').style.display=\'none\';return false;">X</a></div>Please install <strong>Google Chrome Frame</strong> for a better user experience.</div>';
