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
          $('.market[data-market!="'+market+'"]').addClass('accessiblyHidden');
          $('.market[data-market="'+market+'"]').removeClass('accessiblyHidden');
          $.post('/','market='+$(this).val());
        } );
    } );
});
