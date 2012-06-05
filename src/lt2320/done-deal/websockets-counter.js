$(function(){

  //  Initialize a variable to remember the counter element.

  var memberCount = document.getElementById('memberCount');

  //  Open a web socket to the server.

  var ws = new WebSocket('ws://'+window.location.host+':8181/websock');
  ws.addEventListener('open',
    function(e)
    {
      //  When the connection is established,
      //  send a message to the server.
      ws.send('hello');
    });

  ws.addEventListener('message',
    function (e) 
    { 
      //  When a message is received from the server, 
      //  replace the existing membership counter with
      //  the contents of the message.
      memberCount.innerHTML = e.data;
    });
});
