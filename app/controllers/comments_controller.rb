class CommentsController < ApplicationController
  #-----new comment-----
  def new
    @recipe = Recipe.find params[:recipe_id]
    @comment = @recipe.comments.build
  end
  def create  
      comment = Comment.new
      comment.content = params[:comment][:content]
      comment.user_id = @current_user.id
      comment.recipe_id = params[:recipe_id]
      comment.save 
      redirect_to recipe_path(params[:recipe_id])
  end

  #------edit comment-----
  def edit
    @recipe = Recipe.find params[:recipe_id]
    @comment = Comment.find params[:id]
  end
  def update
    comment = Comment.find params[:id]
    comment.content = params[:comment][:content]
    comment.save 
    redirect_to comment.recipe
  end

  #-----delete comment------
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
