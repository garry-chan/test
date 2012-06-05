/*****************************************************************************
 *  Creates a tag cloud from data passed in this format:                     *
 *  {                                                                        *
 *    highestFrequency: NNN, // #occurences of word with highest frequency   *
 *    tags:                                                                  * 
 *      [                                                                    *
 *        {                                                                  *
 *          word: 'XXX', // a word that appears frequently                   *
 *          frequency: NNN // the number of times that word appears          *
 *        },                                                                 *
 *        ...                                                                *
 *      ] // top 20, sorted alphabetically                                   *
 *  }                                                                        *
 *  Each word is sized and colored based on relative frequency.              *
 *****************************************************************************/

function TagsDataToHtml( data )
{
  //  Create a new <article> and append it to the right-aligned
  //  container (below the <aside> and #inventory <article>.
  var tc = $('<article class="tagcloud"><h1>Tag Cloud</h1></article>').appendTo('#rightContainer');

  //  Loop through the top 20 "tags" (words)...
  for ( var i = 0 ; ( i < 20 ) && ( i < data.tags.length ) ; i++ )
  {
    var t = data.tags[i];
    //  Create a <span> containing the "tag", choosing the size and color
    //  of the text based on the relative frequency of the word.
    var pct = t.frequency / data.highestFrequency;
    tc.append('<span style="color:#'
                  + ((pct>0.60)?'4CE':(pct>0.40)?'E9B928':'CCC')
                  + ';font-size:' + (4+Math.floor(pct*20)) + 'pt'
                  + '">' + t.word + '</span> ');
  }
}
