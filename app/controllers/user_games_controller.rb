class UserGamesController < ApplicationController
  def create
       puts '>>>>>>>PARAMS :', params
       user_game = UserGame.new(
        :condition => params[:user_game][:condition],
        :game_id => params[:user_game][:game_id],
        :wantgive => params[:user_game][:wantgive],
        :user => current_user
       )

      # comment.save will talk to the database for us AND  return either TRUE or FALSE
      if user_game.save
       #display
       render json: {data: user_game, user_id: current_user.username, avatar: current_user.avatar, email: current_user.email, location: current_user.location}, status: 201
       puts '>>>> SO FAR SO GOOD'
      else
       #display
       render nothing: true
       puts '>>>>>>>> HIHI'
      end
  end

  def destroy
    user_game = UserGame.find(params[:id])
    puts '>>>>> PARAMS', params
    if user_game.destroy
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
