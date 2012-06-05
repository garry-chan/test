// (home) /INIT.js
$.webshims.polyfill('geolocation json-storage');
Modernizr.load(
  [
    '/js/inventory-manager.js', //(incl)
    'market-selection.js', //Ex6.1
    'deal-storage.js', //Ex6.3
    {
      test: ( Modernizr.applicationcache &&
              ( typeof navigator.onLine == 'boolean' ) ),
      yep: '/js/appcache-management.js' //Ex7.1
    },
    'haversine-miles.js', //Ex7.2
    'market-geolocation.js', //Ex7.2
    {
      test: Modernizr.draganddrop,
      yep: 'deal-dragndrop.js' //Ex8.4(self)
    },
    {
      test: window.XMLHttpRequest,
      nope: '/js/xmlhttprequest.js' //Ex9.2(incl)
    },
    {
      test: (!!window.WebSocket) && // Modernizr.websockets is buggy!
            ( (typeof navigator.onLine != 'boolean' ) || navigator.onLine ),
      yep: 'websockets-counter.js' //Ex9.3
    },
    {
      test: Modernizr.webworkers,
      yep:
        [
          'tags-builder.js', //Ex9.4(incl)
          'tags-data-to-html.js', //Ex9.4(incl)
          'tags-launcher.js' //Ex9.4
        ]
    }
  ] );
