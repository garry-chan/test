//  When the cache is stored, alert the user.
window.applicationCache.addEventListener( 'cached',
    function(e)
    {
      alert('This website has been downloaded to your browser cache, '+
        'and can now be used without a network connection. However, '+
        'some features can only be used while online.' );
    } );

window.applicationCache.addEventListener( 'error',
    function(e)
    {
      try { console.error('Appcache error!'); }
      catch(e2) {}
    } );

//  When the user goes offline, let them know.
window.addEventListener( 'offline',
    function(e)
    {
      alert('You are disconnected from the network. '+
        'Some features will not be available until you reconnect.');
    } );

//  When the browser goes online, call the InventoryManager's
//  method to sync the inventory back to the server.
window.addEventListener( 'online',
    function(e)
    {
      InventoryManager.syncWithServer();
      alert('You have reconnected to the network. '+
            'If you have purchased any deals while offline, '+
            'then they have been reported to DealingTree.' );
    } );
