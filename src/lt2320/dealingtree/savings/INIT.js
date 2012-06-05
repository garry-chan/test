// savings/INIT.js
$.webshims.polyfill( 'canvas json-storage' );

Modernizr.load(
  [
    'savings-canvas.js',
    {
      test: ( Modernizr.applicationcache &&
              ( typeof navigator.onLine == 'boolean' ) ),
      yep: [
        '/js/inventory-manager.js',
        '/js/appcache-management.js'
        ]
    }
  ] );
