$(document).ready(function(){
  {
    $(document).on('click','.myofferrow',function(){
      console.log($(this).children()[0]);
      $(this).hide();
      $('.mygrid').hide();
      
      $('.mytradesquares').prepend("<div class='grid mygrid'><%= %></div>")
    });
  }
});