// Add a method to the existing InventoryManager that receives
// the current inventory object, converts it to a single string
// of JSON data and saves it in localStorage.

InventoryManager.saveInventory =
  function( inv )
  {
    localStorage.setItem( 'inventory', JSON.stringify(inv) );
  }

//  When the HTML has loaded, see if the inventory was previously
//  saved to localStorage.  If it was, then convert the value from
//  JSON to a native object, then tell the InventoryManager to load it.

$(function(){
  var inv = localStorage.getItem('inventory');
  if ( !! inv )
    InventoryManager.loadInventory( JSON.parse(inv) );
});
