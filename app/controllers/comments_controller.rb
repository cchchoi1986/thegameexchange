class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
       # puts '>>>>>>>PARAMS :', params
       comment = Comment.new(
         :content => params[:comment][:content], 
         :wall_id => params[:comment][:wall_id],
         :user => current_user
       )

      # comment.save will talk to the database for us AND  return either TRUE or FALSE
      if comment.save
       #display
       render json: {data: comment, user_name: current_user.username, user_avatar: current_user.avatar, has_avatar: current_user.avatar_file_name, success: true }, status: 201
       # puts '>>>> SO FAR SO GOOD'
      else
       #display
       puts '>>>>>>>> HIHI'
      end
  end

  def destroy
    comment = Comment.find(params[:id])
    puts '>>>>> PARAMS', params
    if comment.destroy
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

  private
    def comment_params
      params.require(:comment).permit(:content, :wall_id)
    end
end
