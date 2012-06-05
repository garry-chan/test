// Parameter "entries" must be a list of DOM nodes, each an <entry> element
function ChirpsToHtml5( entries )
{
  //  Construct a string of HTML5 markup by converting each <entry>
  var html5 = '';
  for ( var i = 0 ; i < entries.length ; i++ )
  {
    // Find the icon (avatar), user (author) and URL (link) for each entry.
    var avatar = '';
    var author = entries[i].getElementsByTagName('author')[0];
    var links = entries[i].getElementsByTagName('link');
    for ( var j = 0 ; j < links.length ; j++ )
      if ( links[j].getAttribute('rel')=='image' )
        avatar = links[j].getAttribute('href');
    //  Append a new <section> to the HTML for this entry.  The <section> contains
    //  an <img> for the icon, <p> for the content and <p> for the user info.
    html5 += '\n  <section>\n     <img src="' + avatar + '" alt="Profile image of '
          + author.getElementsByTagName('name')[0].firstChild.nodeValue
          + '" class="avatar"/>\n    <p class="quote">\n"'
          + entries[i].getElementsByTagName('content')[0].firstChild.nodeValue
          + '"\n    </p>\n    <p class="citation">\n      &#x2014; <a href="'
          + author.getElementsByTagName('uri')[0].firstChild.nodeValue + '">'
          + author.getElementsByTagName('name')[0].firstChild.nodeValue
          + '</a>\n    </p>\n  </section>';
  }
  //  Return the string so it can be added to the page.
  return html5;
}
