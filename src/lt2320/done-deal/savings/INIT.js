// savings/INIT.js
$.webshims.polyfill(
  Modernizr.inlinesvg ? 'json-storage' : 'canvas json-storage' );

Modernizr.load(
  [
    {
      test: Modernizr.inlinesvg,
      yep: 'savings-svg.js',
      nope: 'savings-canvas.js'
    },
    {
      test: ( Modernizr.applicationcache &&
              ( typeof navigator.onLine == 'boolean' ) ),
      yep: [
        '/js/inventory-manager.js',
        '/js/appcache-management.js'
        ]
    }
  ] );
