$.webshims.polyfill('forms');

Modernizr.load( [
    'editable.js',
    {
      test: Modernizr.draganddrop && (!!window.FileReader),
      yep: 'dropimage.js'
    }
  ] );

