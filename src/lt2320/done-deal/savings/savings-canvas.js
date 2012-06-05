$(function(){

  //  Get the context and draw the blank canvas

  var canvas = $('#savings');
  var context = canvas.getContext('2d');
  context.fillStyle='#EEE';
  context.fillRect(0,0,canvas.width(),canvas.height());

  // Create a rudimentary text polyfill

  if ( ! Modernizr.canvastext )
  {
    //  Set the body to relative positioning so we can absolutely position
    //  the text over it. Determine the top of the canvas (including the
    //  margin) so we know where to position any text.

    var body = $('body').css('position','relative');
    var bOffset = body.offset();
    var cOffset = canvas.offset();
    var top = cOffset.top -
      ( bOffset.top + Number(canvas.css('marginTop').replace(/[^0-9]/g,'')) );

    //  Add the missing fillText method to the context.

    context.fillText =
      function( text, x, y )
      {
        //  Create a <span> containing the text, add it to the body, and
        //  style it according to the context. The element is positioned
        //  over the canvas.

        var span = $('<span>'+text+'</span>').appendTo(body).css( {
          color: context.fillStyle,
          font: context.font,
          position: 'absolute',
          textAlign: context.textAlign,
          top: (y+top)+'px',
          zIndex: 1+canvas.css('zIndex') } );

        //  The "x" (left) offset of the <span> is determined by the
        //  text alignment.  Position the text accordingly.

        if ( context.textAlign == "right" )
          x -= span.width();
        else if ( context.textAlign == "center" )
          x -= (span.width()/2);
        span.css( {
          left: (x+cOffset.left)+'px',
          width: canvas.width()-x } );
      }
  }
      
  //  Pull the items from the inventory.
  //  If nothing has been purchased, display a message.
  //  Otherwise, loop through the inventory items.

  var inv = localStorage.getItem('inventory');

  if ( ! inv ) 
  {
    context.font = '32px bold sans-serif';
    context.textAlign = 'center';
    context.textBaseline = 'middle';
    context.fillStyle='#252525';
    context.fillText( 'Buy your first deal, and watch your savings grow!',
                        canvas.width()/2, canvas.height()/2 );
  }
  else
  {
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

    // legend background
    context.fillStyle='#CCC';
    context.fillRect( xHalf+8, 10, 128, 64 );
    // legend line
    context.moveTo( xHalf+16, 22 );
    context.lineTo( xHalf+32, 22 );
    // legend blue square
    context.fillStyle='#4CE';
    context.fillRect( xHalf+16, 32, 16, 16 );
    // legend orange square
    context.fillStyle='#E9B928';
    context.fillRect( xHalf+16, 52, 16, 16 );

    // legend text
    context.font = '16px sans-serif';
    context.textBaseline = 'middle';
    context.fillStyle = '#252525';
    context.fillText('total savings',xHalf+36,22);
    context.fillText('deal value',xHalf+36,42);
    context.fillText('deal price',xHalf+36,62);
   
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
      (function(){
        var x1 = x-(xHalf/2), y1 = base+10;
        var img = new Image();
        img.onload =
          function()
          {
            context.drawImage(img, x1, y1, xHalf, (xHalf/2) );
          };
        img.src = inv[key].image;
      })();
    }
  }
  // stroke the lines
  context.stroke();
});
