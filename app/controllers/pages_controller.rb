class PagesController < ApplicationController
  def home
    @recipe = Recipe.order('RANDOM()').first
  end
end
