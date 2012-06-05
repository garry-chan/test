$(function(){

  //  Keep track of what's being dragged

  var draggedElement = null;

  //  Enable drag on each deal

  var sections = document.getElementsByTagName('section');
  for ( var i = 0 ; i < sections.length ; i++ )
  {
    var sect = sections[i];
    var c = sect.getAttribute('class');
    if ( c && ( c.indexOf('deal') >= 0 ) )
      sect.addEventListener( 'dragstart',
        function (e)
        {
          e.dataTransfer.setData('Text','dummy');
          draggedElement = e.target;
          while ( draggedElement.nodeName.toLowerCase() != 'section' )
            draggedElement = draggedElement.parentNode;
        } );
  }

  //  Generic function to allow an element to be dropped

  function PreventDefault(e)
  {
    e.preventDefault();
  }

  //  Enable drop on the inventory
  //  When an element is dragged there, add it to the inventory

  var inv = document.getElementById('inventory');
  inv.addEventListener('dragenter', PreventDefault );
  inv.addEventListener('dragover', PreventDefault );
  inv.addEventListener( 'drop',
    function(e)
    {
      e.preventDefault();
      InventoryManager.purchaseDeal( draggedElement );
    } );

});
