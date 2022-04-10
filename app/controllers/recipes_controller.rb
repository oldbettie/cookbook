class RecipesController < ApplicationController
  before_action :check_for_owner_recipe, only: [:edit, :update, :destroy]

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
    @current_user.recipes.create recipe_params
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find params[:id]
  end
  def update

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
