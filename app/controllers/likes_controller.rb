class LikesController < ApplicationController
    #-----like-----
    def create
        @like = @current_user.likes.new(like_params)
        if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
        end

        redirect_to @like.recipe
    end
    
    #-----unlike-----
    def destroy
        @like = @current_user.likes.find(params[:id])
        recipe = @like.recipe
        @like.destroy
        redirect_to recipe
    end

    private
    def like_params
        params.require(:like).permit(:recipe_id)
    end
end
