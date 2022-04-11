class CommentsController < ApplicationController
  # check for owner implementation needed
  
 
  def new
    @comment = Comment.new
  end
  def create  
      comment = Comment.new comment_params
      comment.user_id = @current_user.id
      comment.recipe_id = params[:recipe_id]
      comment.save 
      redirect_to root_path
  end



  def edit
    @comment = Comment.find params[:id]
  end
  def update
    comment = Comment.find params[:id]
    comment.update comment_params
    redirect_back(fallback_location: '/')
  end
  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_back(fallback_location: '/')
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :recipe_id)
  end
end
