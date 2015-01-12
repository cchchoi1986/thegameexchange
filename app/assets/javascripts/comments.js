$(document).ready(function(){
  {
    $(document).on('ajax:success', "#new_comment", function(e,response){
      console.log(e);
      console.log(response);
      if (response.success){
        var avatar = response.has_avatar ? response.user_avatar : '/assets/' + response.user_avatar;

        var new_comment = '<tr class="row-fluid"><td class="col-xs-1"><a href="/users/'+response.data.user_id+'"><img height="30" src="'+avatar+'" width="30"></a></td><td class="col-xs-2 gamelisttext"><a href="/users/'+response.data.user_id+'">'+response.user_name+'</a></td><td class="col-xs-6 gamelisttext">'+response.data.content+'</td><td class="col-xs-2 gamelisttext">'+moment(response.data.created_at).fromNow()+'</td><td class="col-xs-1"><button class="removebutton removecomment" data-id="'+response.data.id+'">X</button></td></tr>';
        $("#comments-body").prepend(new_comment);
        $('#comment_content').val("");
      }
    });
    // $(document).on('submit','#new_comment',function(event){
    //   event.preventDefault();
    //   $.ajax({
    //     type: 'post',
    //     beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    //     data: {
    //       'wall_id': $('#comment_wall_id').val(),
    //       'content': $('#comment_content').val()
    //     },
    //     url: '/comments',
    //     success: function(response){
    //       console.log(response);

    //       // if (response.has_avatar) {
    //       //   var avatar = response.user_avatar;
    //       // } else {
    //       //   var avatar = '/assets/' + response.user_avatar;
    //       // }

    //       var avatar = response.has_avatar ? response.user_avatar : '/assets/' + response.user_avatar;

    //       var new_comment = '<tr class="row-fluid"><td class="col-xs-1"><a href="/users/'+response.data.user_id+'"><img height="30" src="'+avatar+'" width="30"></a></td><td class="col-xs-2 gamelisttext"><a href="/users/'+response.data.user_id+'">'+response.user_name+'</a></td><td class="col-xs-6 gamelisttext">'+response.data.content+'</td><td class="col-xs-2 gamelisttext">'+moment(response.data.created_at).fromNow()+'</td><td class="col-xs-1"><button class="removebutton removecomment" data-id="'+response.data.id+'">X</button></td></tr>';
    //       $("#comments-body").prepend(new_comment);
    //       $('#comment_content').val("");
    //     }
    //   });
    // })
  }
  {
    $(document).on('click','.removecomment',function(event){
      event.preventDefault();
      var messageRow = $(this).parent().parent();
      var messageId = $(this)[0].dataset.id;
      // console.log(messageRow+","+messageId)
      $.ajax({
        type: 'delete',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/comments/' + messageId,
        success: function(){
          // console.log(response);
          messageRow.html("");
        }
      });
    });
  }
});
