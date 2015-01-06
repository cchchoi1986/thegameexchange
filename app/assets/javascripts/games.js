$(document).ready(function(){
  {
    $(document).on('click','.selectwant',function(){
      $('.selectwant').removeClass('btn-success');
      $('.selectgive').removeClass('btn-success');
      $('.selectwant').addClass('btn-success');
      $('.user_game_wantgive').val('w');
    });
  }
  {
    $(document).on('click','.selectgive',function(){
      $('.selectgive').removeClass('btn-success');
      $('.selectwant').removeClass('btn-success');
      $('.selectgive').addClass('btn-success');
      $('.user_game_wantgive').val('g');
    });
  }
  {
    // $(document).on('submit','#add_user_game',function(event){
    //   event.preventDefault();
    //   console.log('hihi');
    //   $.ajax({
    //     type: 'post',
    //     beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    //     data: {
    //       'condition': $('.user_game_condition').val(),
    //       'game_id': $('.user_game_game_id').val(),
    //       'wantgive': $('.user_game_wantgive').val(),
    //     },
    //     url: '/user_games',
    //     success: function(response){
    //       console.log(response);
    //     }
    //   });
    // });
  }
  {
    $(document).on('click','.removebutton',function(event){
      event.preventDefault();
      // console.log($(this));
      // $(this).parent().parent().hide();
      var userGameRow = $(this).parent().parent();
      var userGameId = $(this)[0].dataset.id;
      console.log(userGameRow+","+userGameId)
      $.ajax({
        type: 'delete',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/user_games/' + userGameId,
        success: function(){
          // console.log(response);
          userGameRow.html("");
        }
      });
    });
  }
});
