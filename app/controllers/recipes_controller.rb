class RecipesController < ApplicationController
  before_action :check_for_owner_recipe, only: [:edit, :update, :destroy]
  #-----show recipes-----
  def index
    @recipes = Recipe.all
  end
  def show
    @recipe = Recipe.find params[:id]
    ingredients = @recipe.ingredients
    #-----splits ingredients sentence into array for use in show view page can cause issues if other chars are used couldnt find an easy fix other then just removing it so make sure ingredients are seperated by comma-----
    @ingredients_as_arr = ingredients.split(', ', -1)
    @comment = Comment.all
  end

  #-----create recipe-----
  def new
    @recipe = Recipe.new
  end
  def create
    @current_user.recipes.create recipe_params
    redirect_to recipes_path
  end

  #-----edit recipe-----
  def edit
    @recipe = Recipe.find params[:id]
  end
  def update
    recipe = Recipe.find params[:id]
    recipe.update recipe_params
    redirect_to recipe
  end

  #-----delete recipe-----
  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :image, :category, :region)
  end
end



