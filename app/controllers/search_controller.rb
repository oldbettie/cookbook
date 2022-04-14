class SearchController < ApplicationController
  #-----ransack gem controller also used in application controller-----
  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
  end
end
