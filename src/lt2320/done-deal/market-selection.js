$(function ()
{
  //   Hide the Go button since we're responding to select-change events
  //   instead of form submissions.

  $('#marketSubmit').hide();

  //  When the location changes, show deals in the same market
  //  and hide deals in other markets.  Also, notify the server of the
  //  new market selection using Ajax.

  var marketSelector = $('#marketSelector');

  marketSelector.change( 
    function(e)
    {
      $('option:selected',marketSelector).each(
        function()
        {
          var market = $(this).text();
          localStorage.setItem( 'SavedMarket', market );
          $('.market[data-market!="'+market+'"]').addClass('accessiblyHidden');
          $('.market[data-market="'+market+'"]').removeClass('accessiblyHidden');
          $.post('/','market='+$(this).val());
        } );
    } );

  //  If a location has previously been remembered, recall it
  //  and invoke the handler to show/hide the relevant deals.
 
  var market = localStorage.getItem('SavedMarket');
  if ( !! market )
  {
    $('option:contains("'+market+'")',marketSelector).attr('selected',true);
    marketSelector.change();
  }
});
