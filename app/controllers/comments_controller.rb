class CommentsController < ApplicationController
  
 
  def new
    @comment = Comment.new
  end
  def create  
      comment = Comment.new
      comment.content = params[:comment][:content]
      comment.user_id = @current_user.id
      comment.recipe_id = params[:comment][:recipe_id]
      comment.save 

      redirect_back(fallback_location: '/')
  end

  def edit
    @comment = Comment.find params[:id]
  end
  def update
    comment.find 
    comment.content = params[:comment][:content]
    comment.user_id = @current_user.id
    comment.recipe_id = params[:comment][:recipe_id]
    comment.update 

    redirect_to recipe_path(params[:comment][:recipe_id])
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
