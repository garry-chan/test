$(function(){

  //  If the user has previously selected a market, don't try to replace it
  //  with the current location.

  if ( ! localStorage.getItem('SavedMarket') )
  {
    //  If the browser can estimate the user's current location,
    //  set it as their market preference.

    navigator.geolocation.getCurrentPosition(
      function(pos)
      {
        //  Initialize some variables to compute the distance between the
        //  user's location and the closest market.  We'll start by saying
        //  that the nearest market is impossibly-far away, and doesn't exist.

        var shortestDistance = 999999999;
        var closestOption = null;

        //  Loop through all available markets.  The <select> element contains
        //  <option> elements, where the value attribute of each option is a
        //  string containing the approximate "latitude,longitude" of the center
        //  of the market.

        var marketSelector = document.getElementById('marketSelector');
        for ( var i = 0 ; i < marketSelector.options.length ; i++ )
        {
          //  Split the <option>'s value attribute into latitude and longitude,
          //  then use the haversine formula to approximate the distance from
          //  the user.
        
          var coords = marketSelector.options[i].value.split(',');
          var distMiles = HaversineMiles(
                            pos.coords.latitude, pos.coords.longitude,
                            coords[0], coords[1] );

          //  If this market is closer than the market that was previously
          //  remembered as the closest, then remember this one instead.

          if ( distMiles < shortestDistance )
          {
            closestOption = marketSelector.options[i];
            shortestDistance = distMiles;
          }

        } // end for

        //  Now that we know which market is closest, select it.

        closestOption.selected = true;
        $(marketSelector).change();
      },
      function(e)
      {
        if ( e.code != 1 ) // PERMISSION_DENIED
          alert('Unfortunately, your location could not be determined at this time.');
        try { console.error('geolocation error: '+e.code+': '+e.message); }
        catch(e2){}
      } );

  } // end if

});
