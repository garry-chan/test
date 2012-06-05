// /js/INIT.js
Modernizr.load(
    {
      test: ( !! window.addEventListener ) && Modernizr.postmessage,
      yep: '/js/message-with-help.js'
    } );
