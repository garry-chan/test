$(function()
{
  //  Create a worker.

  var worker = new Worker('tags-worker.js');

  //  When we receive a message from the worker, pass the
  //  data to the function that converts the object to HTML.

  worker.addEventListener( 'message',
    function (e)
    {
      TagsDataToHtml( e.data );
    } );

  //  Tell the worker where to find the words to count.

  worker.postMessage('/cloud-data.txt');

});
