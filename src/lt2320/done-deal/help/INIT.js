// help/INIT.js
Modernizr.load(
  {
    test: (!!window.addEventListener) && Modernizr.postmessage,
    yep: 'message-with-main.js'
  } );
