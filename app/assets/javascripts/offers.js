$(document).ready(function(){
  {
    $(document).on('click','.myofferrow',function(e){
      e.preventDefault();
      $(this).remove();
      $.ajax({
        type: 'get',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/catalogue/'+$(this).data('id'),
        datatype: 'json',
        success: function(response){
          console.log(response);
          // $('#mygrid').remove();
          $('.mytradesquares').prepend("<img class='grid mygrid' src='"+response.image+"' height='72px' width='72px' data-id='"+response.id+"'>")
        }
      })
    });
  }
  {
    $(document).on('click','.yourofferrow',function(e){
      e.preventDefault();
      $(this).remove();
      $.ajax({
        type: 'get',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/catalogue/'+$(this).data('id'),
        datatype: 'json',
        success: function(response){
          console.log(response);
          // $('#yourgrid').remove();
          $('.yourtradesquares').prepend("<img class='grid yourgrid' src='"+response.image+"' height='72px' width='72px' data-id='"+response.id+"'>")
        }
      })
    });
  }
  {
    $(document).on('click','.mygrid',function(e){
      e.preventDefault();
      console.log($(this));
      $(this).remove();
      $.ajax({
        type: 'get',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/catalogue/'+$(this).data('id'),
        datatype: 'json',
        success: function(response){
          console.log(response);
          $('.wants').prepend('<tr class="row offerrow myofferrow" data-id="'+response.id+'"><td class="col-xs-1"><form action="#" class="button_to" method="get"><div><input class="font-black" type="submit" value="+"></div></form></td><td class="col-xs-2"><img height="30" src="'+response.image+'" width="40"></td><td class="col-xs-6 gamelisttext"><a href="/games/'+response.id+'">'+response.name+'</a></td><td class="col-xs-3 gamelisttext">'+response.compatible+'</td></tr>');
        }
      })
    });
  }
  {
    $(document).on('click','.yourgrid',function(e){
      e.preventDefault();
      console.log($(this));
      $(this).remove();
      $.ajax({
        type: 'get',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/catalogue/'+$(this).data('id'),
        datatype: 'json',
        success: function(response){
          console.log(response);
          $('.gives').prepend('<tr class="row offerrow yourofferrow" data-id="'+response.id+'"><td class="col-xs-1"><form action="#" class="button_to" method="get"><div><input class="font-black" type="submit" value="+"></div></form></td><td class="col-xs-2"><img height="30" src="'+response.image+'" width="40"></td><td class="col-xs-6 gamelisttext"><a href="/games/'+response.id+'">'+response.name+'</a></td><td class="col-xs-3 gamelisttext">'+response.compatible+'</td></tr>');
        }
      })
    });
  }
  {
    $(document).on('click','#offer_button',function(e){
      e.preventDefault();
      var i = 0;
      var sendGames = [];
      var receiveGames = [];
      var gather = function(x,y){
        var i = 0;
        while (i < x.length) {
          y.push($(x[i]).data('id'))+"//";
          i++;
        }
      };
      gather($('.mygrid'),sendGames);
      gather($('.yourgrid'),receiveGames);
      $.ajax({
        type: 'POST',
        url: '/offers',
        data: {
          send_id: $('#offerer').data('id'),
          received_id: $('#offeree').data('id'),
          send_games: sendGames,
          receive_games: receiveGames,
          status: "pending"
        },
        success: function(response){
          console.log(response);
          window.location = "/users"
        }
      });
    });
  }
  {
    $(document).on('click','.cancel_offer',function(event){
      event.preventDefault();
      $(this).parent().parent().parent().parent().hide();
      console.log($(this).data('id'));
      var offerRow = $(this).parent().parent().parent().parent();
      var offerId = $(this).data('id');
      $.ajax({
        type: 'delete',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/offers/' + offerId,
        success: function(){
          // console.log(response);
          offerRow.html("");
        }
      });
    });
  }
  {
    $(document).on('click','.accept_offer',function(event){
      event.preventDefault();
      console.log($(this).data('id'));
      var offerRow = $(this).parent().parent().parent().parent();
      var offerId = $(this).data('id');
      $.ajax({
        type: 'PUT',
        url: '/offers/'+offerId,
        data: {
            id: offerId,
            status: "Accepted"
        },
        dataType: 'json',
        success: function(response){
          console.log(response);
          $(this).removeClass('offerrow');
          $(this).addClass('wantrow');
          $('.ccbutton').hide();
        }
      });
    });
  }
  {
    $(document).on('click','.decline_offer',function(event){
      event.preventDefault();
      console.log($(this).data('id'));
      var offerRow = $(this).parent().parent().parent().parent();
      var offerId = $(this).data('id');
      $.ajax({
        type: 'PUT',
        url: '/offers/'+offerId,
        data: {
            id: offerId,
            status: "Declined"
        },
        dataType: 'json',
        success: function(response){
          console.log(response);
          offerRow.removeClass('offerrow');
          offerRow.addClass('giverow');
          $('.ccbutton').hide();
        }
      });
    });
  }
});