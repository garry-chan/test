$( function(){

  function FileHandler(e)
  {
    DragHandler(e);
    var file = (e.target.files || e.dataTransfer.files)[0];
    if ( file.type == 'image/jpeg' )
    {
      var fr = new FileReader;
      fr.onload =
        function(e2)
        {
          $('#imageData').val( e.target.files ? '' : e2.target.result );
          $('#photoThumb').attr('src',e2.target.result);
        };
      fr.readAsDataURL(file);
    }
    else
      alert("Sorry, only JPEG images are permitted.");
  }

  $('#photo').change( FileHandler );
  $('#photoArea').removeClass('accessiblyHidden').css('position','relative');

  function DragHandler(e)
  {  
    e.preventDefault();  
    if ( e.type == 'dragover' )
      $(e.target).addClass( 'dragover' );
    else
      $(e.target).removeClass( 'dragover' );
  }  

 var photoDrop = document.getElementById('photoDrop');
  photoDrop.addEventListener( 'dragover', DragHandler );
  photoDrop.addEventListener( 'dragleave', DragHandler );
  photoDrop.addEventListener( 'drop', FileHandler );
 
});
