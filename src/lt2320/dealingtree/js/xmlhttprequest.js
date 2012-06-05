// provides ActiveX fallback for native XHR in legacy IE
if ( ! window.XMLHttpRequest )
  window.XMLHttpRequest =
    function ()
    {
      try { return new ActiveXObject('MSXML2.XMLHTTP.6.0'); }
      catch(e)
      {
        try { return new ActiveXObject('MSXML2.XMLHTTP.3.0'); }
        catch(e) {}
      }
      return null;
    };
