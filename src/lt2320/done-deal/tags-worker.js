//  tags-worker.js runs in a web worker

//  tags-builder.js contains TagsBuilder()

importScripts('tags-builder.js');

//  When the worker receive a messages, assume it is a URL to pass to
//  TagsBuilder().  Along with the URL, pass a callback function, which
//  sends the results to the main script.

addEventListener( 'message',
  function(e)
  {
    TagsBuilder( e.data, function(obj) { postMessage( obj ); } );
  } );
