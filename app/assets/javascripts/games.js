$(document).ready(function(){
  {
    $(document).on('click','.selectwant',function(){
      $('.selectwant').removeClass('btn-success');
      $('.selectgive').removeClass('btn-success');
      $('.selectwant').addClass('btn-success');
      $('.wantgiveform').val('w');
    });
  }
  {
    $(document).on('click','.selectgive',function(){
      $('.selectgive').removeClass('btn-success');
      $('.selectwant').removeClass('btn-success');
      $('.selectgive').addClass('btn-success');
      $('.wantgiveform').val('g');
    });
  }
  

});