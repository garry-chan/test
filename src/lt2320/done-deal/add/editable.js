$(function(){

  $('#details').hide();
  $('#editor').removeClass('accessiblyHidden');
  $('#bold').click( function(e){
    document.execCommand('bold',false,null);
  } );
  $('#italic').click( function(e){
    document.execCommand('italic',false,null);
  } );
  $('#underline').click( function(e){
    document.execCommand('underline',false,null);
  } );
  $('#addForm').submit( function(e) {
    $('#details').val( $('#editorText').html() );
  } );

});
