$(function(){

  var svgns = 'http://www.w3.org/2000/svg';

  //  Returns a new element in the SVG namespace,
  //  with the specified name and list of attributes
  
  function makeElem( name, attributes )
  {
    var e = document.createElementNS(svgns,name);
    for ( var k in attributes )
      e.setAttribute( k, attributes[k] );
    return e;
  }
 
  //  Draw the blank SVG element

  var e = null;
  var canvas = document.getElementById('savings');
  var svgHeight = canvas.height;
  var svgWidth = canvas.width;

  var svg = makeElem( 'svg',
    {
      'width':svgWidth,
      'height':svgHeight
    } );

  svg.appendChild( makeElem( 'rect',
    {
      'x': 0,
      'y': 0,
      'width': '100%',
      'height': '100%',
      'fill': '#EEE'
    } ) );

  //  Retrieve the inventory from localStorage.
  //  If nothing has been purchased, display a message;
  //  Otherwise, generate the graph from the inventory.

  var inv = localStorage['inventory'];

  if ( ! inv ) 
  {
    e = makeElem( 'text',
          {
            'x': svgWidth/2,
            'y': svgHeight/2,
            'style': 'font:32px bold sans-serif',
            'fill': '#252525',
            'text-anchor': 'middle'
          } );
    e.appendChild( document.createTextNode('Buy your first deal, and watch your savings grow!') );
    svg.appendChild(e);
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

    var xStep = svgWidth / ( len + 2 );
    var yStep = ( svgHeight - 70 ) /
                  ((totalSavings>highestValue)?totalSavings:highestValue);
    var base = svgHeight - 60;
    var xHalf = Math.floor(xStep/2);

    //  Draw axis lines
    svg.appendChild( makeElem('polyline',
      {
        'fill': 'none',
        'stroke': '#252525',
        'stroke-width': '1px',
        'points': xHalf+',10 '+xHalf+','+base+' '+Math.floor(xStep*(len+1)+xHalf)+','+base
      } ) );

    //  Draw the legend
    // legend background
    svg.appendChild( makeElem('rect',
      { 
        fill: '#CCC',
        x: xHalf+8,
        y: 10,
        width: 128,
        height: 64
      } ) );
    // line
    svg.appendChild( makeElem('polyline',
      {
        'fill': 'none',
        'stroke': '#252525',
        'stroke-width': '1px',
        'points': (xHalf+16)+',22 '+(xHalf+32)+',22'
      } ) );
    // blue square
    svg.appendChild( makeElem( 'rect',
      {
        'x': xHalf+16,
        'y': 32,
        'width': 16,
        'height': 16,
        'fill': '#4CE'
      } ) );
    // orange square
    svg.appendChild( makeElem( 'rect',
      {
        'x': xHalf+16,
        'y': 52,
        'width': 16,
        'height': 16,
        'fill': '#E9B928'
      } ) );
    // text
    e = makeElem( 'text',
      {
        'x': xHalf+36,
        'y': 26,
        'style': 'font: 16px sans-serif',
        'fill': '#252525'
      } );
    e.appendChild( document.createTextNode('total savings') );
    svg.appendChild(e);
    e = makeElem( 'text',
      {
        'x': xHalf+36,
        'y': 46,
        'style': 'font: 16px sans-serif',
        'fill': '#252525'
      } );
    e.appendChild( document.createTextNode('deal value') );
    svg.appendChild(e);
    e = makeElem( 'text',
      {
        'x': xHalf+36,
        'y': 66,
        'style': 'font: 16px sans-serif',
        'fill': '#252525'
      } );
    e.appendChild( document.createTextNode('deal price') );
    svg.appendChild(e);

    //  Draw the line showing total savings, and
    //  bars showing value vs. price of each deal,
    //  plus the deal icon below each bar

    var i = 0;
    var x = xHalf;
    var y = base;
    var x1, y1;
    for ( key in inv )
    {
      // compute line
      x1 = x;
      y1 = y;
      x += xStep;
      y -= ( yStep * ( inv[key].value - inv[key].price ) );
      // value
      var high = yStep * inv[key].value;
      svg.appendChild( makeElem( 'rect',
        {
          'x': x-(xStep/4),
          'y': base-high,
          'width': xHalf,
          'height': high,
          'fill': '#4CE'
        } ) );
      // price
      high = yStep * inv[key].price;
      svg.appendChild( makeElem( 'rect',
        {
          'x': x-(xStep/4)+4,
          'y': base-high,
          'width': xHalf-8,
          'height': high,
          'fill': '#E9B928'
        } ) );
      // draw line here so the bar doesn't cover it
      svg.appendChild( makeElem( 'line',
        {
          x1: x1,
          y1: y1,
          x2: x,
          y2: y,
          'stroke': '#252525',
          'stroke-width': '1px'
        } ) );
      // icon
      x1 = x-30, y1 = base+10;
      e = makeElem( 'image',
        {
          x: x1,
          y: y1,
          width: 60,
          height: 30
        } );
      e.setAttributeNS( 'http://www.w3.org/1999/xlink', 'href', inv[key].image );
      svg.appendChild(e);
    }
  }
  //  Replace the canvas element with the SVG element
  
  var par = canvas.parentNode;
  par.replaceChild( svg, canvas );
});
