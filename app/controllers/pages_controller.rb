class PagesController < ApplicationController
  #-----shows a random recipe on the home page-----
  def home
    @recipe = Recipe.order('RANDOM()').first
  end
end
