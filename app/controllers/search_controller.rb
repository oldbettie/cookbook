class SearchController < ApplicationController
  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
  end
end
