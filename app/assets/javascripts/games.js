$(document).ready(function(){
  {
    $(document).on('submit','#new_user_game',function(event){
      event.preventDefault();
      console.log('hihi');
      $.ajax({
        type: 'post',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {
          user_game: {
          'condition': $('.user_game_condition').val(),
          'game_id': $('.user_game_game_id').val(),
          'wantgive': $('.user_game_wantgive').val()
          }
        },
        url: '/user_games',
        success: function(response){
          $('#myModal').modal('hide')
          // $('#add_user_games_button').hide();
          console.log(response);
          if (response.data.wantgive == "w") {
            var new_wanted_row = '<tr class="row wantrow"><td class="col-xs-1"><a href="/users/'+response.data.user_id+'"><img class="avatar" height="25" src="'+response.avatar+'" width="25"></a></td><td class="col-xs-3"><a href="/users/'+response.data.user_id+'">'+response.user_id+'</a></td><td class="col-xs-4"><a href="/users/'+response.data.user_id+'">'+response.email+'</td><td class="col-xs-4">'+response.location+'</td></tr>';
            $('.user_game_wanted_list').prepend(new_wanted_row);
            $('.emptywantedmessage').html("");
            console.log('hihi1');
          }
          else if (response.data.wantgive == "g") {
            var new_given_row = '<tr class="row giverow"><td class="col-xs-1"><a href="/users/'+response.data.user_id+'"><img class="avatar" height="25" src="'+response.avatar+'" width="25"></a></td><td class="col-xs-3"><a href="/users/'+response.data.user_id+'">'+response.user_id+'</a></td><td class="col-xs-4"><a href="/users/'+response.data.user_id+'">'+response.email+'</td><td class="col-xs-4">'+response.location+'</td></tr>';
            $('.user_game_given_list').prepend(new_given_row);
            $('.emptygivenmessage').html("");
            console.log('hihi2');
          };
        }
      });
    });
  }
  {
    $(document).on('click','.removebutton',function(event){
      event.preventDefault();
      console.log($(this));
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
