function TagsBuilder( url, callback )
{
  //  Retrieve the contents of the URL using Ajax.
  var xhr = new XMLHttpRequest();
  xhr.open('GET',url,false);
  xhr.onreadystatechange =
    function()
    {
      //  Initialize some variables.
      var i, w;
      var start = 0;
      var resp, words = [], byFreq = [], byAlpha = [];
      var highestFrequency = 0;

      //  When the request completes successfully, process the results.
      if ( ( xhr.readyState == 4 ) && ( xhr.status == 200 ) )
      {
        //  Convert the response to all-lowercase.
        resp = xhr.responseText.toLowerCase();
        //  Process the string one character at a time.
        for ( i = 0 ; i < resp.length ; i++ )
        {
          //  If we have reached a non-letter...
          if ( ( resp.charAt(i) < 'A' ) ||
              ( ( resp.charAt(i) > 'Z' ) && ( resp.charAt(i) < 'a' ) ) ||
                ( resp.charAt(i) > 'z' ) )
          {
            //  And we're more than 3 letters into a word...
            if ( i - start > 3 )
            {
              //  Get the word.
              w = resp.substring(start,i);
              //  If this is a new word, add it to an array of word counts
              //  indexed by the word itself.
              if ( ! words[w] )
                words[w] = { word: w, frequency: 0 };
              //  Count the word.  If this word appears more than any
              //  other, remember it as the most-frequent word.
              if ( ++words[w].frequency > highestFrequency )
                highestFrequency = words[w].frequency;
            }
            //  Assume for now that a word starts at the next character.
            start = i+1;
          }
        }

        //  Do something ridiculously-slow and completely-unnecessary,
        //  just to slow down the processing enough to show that a web
        //  worker will improve responsiveness.
        for ( w = 0 ; w < 100000000 ; w++ )
          Math.sqrt(Number.MAX_VALUE);

        //  Copy the words to a new array, indexed by frequency
        //  instead of by words, and sort the new array.
        i = 0;
        for ( w in words )
          byFreq[i++] = words[w];
        byFreq.sort( function( a, b ) {
          return ( a.frequency > b.frequency ) ? -1 : ( ( a.frequency == b.frequency ) ? 0 : 1 ); } );

        //  Copy the top-twenty words to a new array, and sort the new
        //  array alphabetically.
        for ( i = 0 ; ( i < byFreq.length ) && ( i < 20 ) ; i++ )
          byAlpha[i] = byFreq[i];
        byAlpha.sort( function( a, b ) {
          return ( a.word < b.word ) ? -1 : ( ( a.word == b.word ) ? 0 : 1 ); } );

        //  Invoke the callback function, passing it the results.
        callback( { highestFrequency: highestFrequency, tags: byAlpha } );
      }
    }
  xhr.send();
} // function TagsBuilder
