$(function(){

  //  Get the context and draw the blank canvas

  var canvas = $('#savings');
  var context = canvas.getContext('2d');
  context.fillStyle='#EEE';
  context.fillRect(0,0,canvas.width(),canvas.height());

  // Create a rudimentary text polyfill
  // TO-BE-COMPLETED (Ex 9.2)

  //  Pull the items from the inventory.
  //  If nothing has been purchased, display a message.
  //  Otherwise, loop through the inventory items.

  var inv = localStorage.getItem('inventory');
  inv = JSON.parse(inv);

  // Compute values for charting:
  // xStep = distance between bar centers
  // yStep = pixels per unit of savings
  // base = vertical position (px) of the chart baseline

  var len = 0;
  var totalSavings = 0;
  var highestValue = 0;
  for ( key in inv )
  {
    len++;
    totalSavings += ( inv[key].value - inv[key].price );
    if ( Number(inv[key].value) > highestValue )
      highestValue = Number(inv[key].value);
  }

  var xStep = canvas.width() / ( len + 2 );
  var yStep = ( canvas.height() - 70 ) /
                ((totalSavings>highestValue)?totalSavings:highestValue);
  var base = canvas.height() - 60;
  var xHalf = Math.floor(xStep/2);

  // axis lines
  context.strokeStyle='#252525';
  context.moveTo(xHalf,10);
  context.lineTo(xHalf,base);
  context.lineTo(xStep*(len+1)+xHalf,base);

  // legend
  // TO-BE-COMPLETED (Ex 9.2)
 
  //  Draw the line showing total savings, and
  //  bars showing value vs. price of each deal,
  //  plus the deal icon below each bar

  var i = 0;
  var x = xHalf;
  var y = base;
  context.moveTo(x,y);
  for ( key in inv )
  {
    // line
    x += xStep;
    y -= ( yStep * ( inv[key].value - inv[key].price ) );
    context.lineTo(x,y);
    // value
    var high = yStep * inv[key].value;
    context.fillStyle='#4CE';
    context.fillRect( x-(xStep/4), base-high, xHalf, high );
    // price
    high = yStep * inv[key].price;
    context.fillStyle='#E9B928';
    context.fillRect( x-(xStep/4)+4, base-high, xHalf-8, high );
    // icon
    // TO-BE-COMPLETED (Do-Now 9a)
  }

  // stroke the lines
  context.stroke();
});
