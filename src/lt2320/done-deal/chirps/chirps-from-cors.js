$(function(){

  //  If we're working in IE, the window will have a member named XDomainRequest,
  //  which we should instantiate to make our Ajax call.  Otherwise, we'll use an
  //  XMLHttpRequest (which we will know supports CORS because the INIT.js file
  //  already detected it).

  var cors = window.XDomainRequest ? new XDomainRequest() : new XMLHttpRequest();

  //  Open the connection to the third-party server.  This code uses chirpinator.com
  //  for the Internet version, or the local chirpinator when in-class.

  cors.open( 'GET', 'http://chirpinator' +
                ( ( window.location.href.indexOf('.com') < 0 ) ? '' : '.com' ) +
                '/search/?q=dealingtree');

  //  When the response comes back from the server, process it!
  //  IE cannot use addEventListener for the load event.

  cors.onload =
    function()
    {
      //  If the CORS object has a responseXML property, grab it.
      //  Otherwise, we're working in IE, so create a DOM object and
      //  load it with the XML data from the responseText property.

      var dom = cors.responseXML;
      if ( ! dom )
      {
        dom = new ActiveXObject('Microsoft.XMLDOM');
        dom.async = false;
        dom.loadXML(cors.responseText );
      }

      //  Now that we have a DOM object (either from responseXML
      //  or loaded by ActiveX), pass the <entry> elements to our
      //  external function, and add the results to our #chirps
      //  element.

      document.getElementById("chirps").innerHTML += 
        ChirpsToHtml5( dom.getElementsByTagName('entry') );
    };

  //  Send the request to the third-party server over the
  //  previously-established connection.

  cors.send();

});
