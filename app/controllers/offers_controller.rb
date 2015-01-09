class OffersController < ApplicationController
  def index
    @receiver = User.find(params[:id])
    @sender_given_list = UserGame.where({user_id: current_user.id, wantgive: "g"})
    @receiver_given_list = UserGame.where({user_id: params[:id], wantgive: "g"})
  end

  def create
       # puts '>>>>>>>PARAMS :', params
       offer = Offer.new(
         :send_id => current_user.id,
         :received_id => params[:received_id],
         :send_games => params[:send_games],
         :receive_games => params[:receive_games],
         :status => params[:status]
       )

      # comment.save will talk to the database for us AND  return either TRUE or FALSE
      if offer.save
       #display
       render json: {data: offer}, status: 201
       # redirect_to current_user
       # puts '>>>> SO FAR SO GOOD'
      else
       render nothing: true
       puts '>>>>>>>> HIHI'
      end
  end

  def update
    offer = Offer.find(params[:id])
    offer.update(
      :status => params[:status]
    )
    render json: {data: offer}, status: 201
  end

  def destroy
    offer = Offer.find(params[:id])
    puts '>>>>> PARAMS', params
    if offer.destroy
      #display
      # render json: {}, status: 204
      # render  status: 204
      head :no_content
      
      # puts '>>>> SO FAR SO GOOD'
      else
      #display
      puts '>>>>>>>> HIHI'
       end
  end

end
