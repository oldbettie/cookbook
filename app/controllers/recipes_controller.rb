class RecipesController < ApplicationController
  before_action :check_for_owner_recipe, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find params[:id]
    ingredients = @recipe.ingredients
    @ingredients_as_arr = ingredients.split(', ', -1)
    @comment = Comment.all
  end

  def new
    @recipe = Recipe.new
  end
  def create
    @current_user.recipes.create recipe_params
    redirect_to recipes_path

    # mixtape = Mixtape.create mixtape_params
    # @current_user.mixtapes << mixtape
  end

  def edit
    @recipe = Recipe.find params[:id]
  end
  def update
    recipe = Recipe.find params[:id]
    recipe.update recipe_params
    redirect_to recipe
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :image, :video, :category, :region)
  end
end



