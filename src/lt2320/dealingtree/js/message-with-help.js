$(function(){

  //  Remember what host we came from.  We only want to accept messages
  //  from a window that came from the same host!

  var okHost = window.location.protocol + '//' + window.location.host;

  //  Listen for messages.

  window.addEventListener( 'message',
    function(e)
    {
      //  If the message is from our approved host, assume it is
      //  a URL that we should display in this window.

      if ( e.origin == okHost )
        window.location.href = e.data;
    } );

});
