//  InventoryManager adds deals to an inventory.
var InventoryManager = {};
(function()
{
  var inventory = {};

  function addDealToInventory(deal)
  {
    var sku = null;
    var obj = {};
    // Submit the purchase back to the server using Ajax
    $.post('/',$('form',deal).serialize());
    // Create an object to represent the purchase in the inventory.
    // The hidden SKU from the form is used as the associative index for an object.
    // The other form fields become properties of the object.
    $('input[type="hidden"]',deal).each(
      function()
      {
        if ( this.name == 'sku' )
          sku = $(this).val();
        else
          obj[this.name] = $(this).val();
      } );
    // Add the image to the object and store the object in the inventory
    obj['image'] = $('img',deal)[0].src;
    inventory[sku] = obj;
  }

  function moveDealToYourDeals(deal)
  {
    // Convert the deal element to a jQuery collection of one.
    deal = $(deal);
    // Move only the deal's image to the #inventory <article>.
    $('a',deal).has('img').appendTo('#inventory');
    // Remove deal itself from the originating <article>
    deal.remove();
  }

  function moveInventoryDealsToYourDeals()
  {
    // Find the hidden sku field for each deal on the page.
    $('input[name="sku"]').each(
        function()
        {
          // If the inventory contains a member for the sku, 
          // move the deal to the #inventory <article>.
          if ( !! inventory[$(this).val()] )
            $(this).parents('section').each( function() { moveDealToYourDeals(this); } );
        } );
  }

  InventoryManager.purchaseDeal =
    function(deal)
    {
      addDealToInventory(deal);
      moveDealToYourDeals(deal);
      //  If the method to save the inventory to client storage has been created,
      //  then pass the inventory to that method.
      if ( !! this.saveInventory )
        this.saveInventory(inventory);
    };

  InventoryManager.loadInventory =
    function(inv)
    {
      //  Initialize (or potentially replace) the current inventory
      //  with the object that was passed in.  This is invoked
      //  if the inventory is loaded from the client storage.
      inventory = inv;
      //  Update the main page to reflect the new inventory.
      moveInventoryDealsToYourDeals();
    };

  InventoryManager.syncWithServer =
    function()
    {
      //  Use AJAX to synchronize the current inventory with the server.
      //  For this overly-simplified version, the server expects a list
      //  of SKUs, each surrounded by vertical bars.
      var sync = '';
      for ( sku in inventory )
        sync += '|' + sku + '|';
      $.post('/','sync='+encodeURIComponent(sync));
    };

  //  Setup handlers for all of the buy buttons.
  $(function(){
    $('form.buy-form').submit(
      function(e)
      {
        // When a Buy button is pressed, find the parent <section> and
        // use it to purchase the deal.
        $(this).parents('section').each(
          function() { InventoryManager.purchaseDeal(this) } );
        e.preventDefault();
      } );
  });

})();
