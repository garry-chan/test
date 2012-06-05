function HaversineMiles( lat1, lon1, lat2, lon2 )
{
  var P = 0.0174532925;
  var lat1p = lat1 * P;
  var lon1p = lon1 * P;
  var lat2p = lat2 * P;
  var lon2p = lon2 * P;
  var dLat = lat2p - lat1p;
  var dLon = lon2p - lon1p;    
  return ( 7917.51174 *
      Math.asin( Math.sqrt(
                   Math.sin(dLat/2) * Math.sin(dLat/2) +  
                   Math.cos(lat1p) * Math.cos(lat2p) *   
                   Math.sin(dLon/2) * Math.sin(dLon/2)
                   )) );
}
