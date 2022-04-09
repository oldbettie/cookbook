class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def new
    @recipe = Recipe.new
  end
  def create
    recipe = Recipe.create recipe_params
    @current_user.recipe << recipe
    redirect_to recipe
  end

  def edit
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :image, :video, :category, :region)
  end
end
