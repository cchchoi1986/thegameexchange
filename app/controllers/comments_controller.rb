class CommentsController < ApplicationController
  def create
    # params([:comment][:content]) ---> dog
    # params([:comment][:post_id]) ---> 3
    # binding.pry
    comment = current_user.comments.new(comment_params)
    if comment.save
      redirect_to comment.user
    else
      redirect_to :back
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :title, :user_id, :wall_id)
    end
end
