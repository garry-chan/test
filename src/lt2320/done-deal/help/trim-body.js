$(function()
{
  // Remove everything but the JS and help (nav, header, footer, etc)
  // from the body, if this was invoked with JavaScript.
  $('body > *').not('script').not('#coreHelp').remove();
  //  Remove the margins and padding from the body so it fills the window
  $('body').css({
    marginTop: 0,
    marginRight: 0,
    marginBottom: 0,
    marginLeft: 0,
    paddingTop: 0,
    paddingRight: 0,
    paddingBottom: 0,
    paddingLeft: 0
    });
  //  Adjust the margins and padding of the help so it fills the body
  $('#coreHelp').css({
    marginTop: 0,
    marginRight: 0,
    marginBottom: 0,
    marginLeft: 0,
    paddingTop: '0.5em',
    paddingRight: '0.5em',
    paddingBottom: '0.5em',
    paddingLeft: '0.5em'
    });
  // Disable clicking on helpTarget links.
  // This will be reversed if cross-window messaging is successful.
  $('.helpTarget').addClass('deactivated').click(
        function(e) { e.preventDefault(); } );
});
