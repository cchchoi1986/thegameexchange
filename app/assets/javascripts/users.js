$(document).ready(function(){

  $(document).on("click",".avatar",function(event){
    event.preventDefault();
    $('.avatar').removeClass('highlight');
    $('#avatar_id').val("");

    $(this).addClass('highlight');
    $('#avatar_id').val($(this).data('id'))
    // console.log($(this).data('id'));
  });

});