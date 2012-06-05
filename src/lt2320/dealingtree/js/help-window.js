var helpWindow = null;
$(function()
{
  //  When the help link is clicked...
  $('#helpLink').click(
    function(e)
    {
      //  If the help window is not already opened, then open it.
      //  Otherwise, give it focus.
      if ( ( helpWindow == null ) || ( helpWindow.closed ) )
      {
        helpWindow = window.open(
          '/help/#FOR'+window.location.pathname.replace(/\//g,''),
          'dealsHelp',
          'top=0,left=0,width=300,height=400,location=no,status=no,resizable=yes,scrollbars=yes'
          );
      }
      else
        helpWindow.focus();
      // Don't display the help in this window also!
      e.preventDefault();
    } );
});
