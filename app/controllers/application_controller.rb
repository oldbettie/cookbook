class ApplicationController < ActionController::Base
    before_action :fetch_user
    before_action :set_theme
    before_action :set_query
    
    #-----search functionality-----
    def set_query
        @q = Recipe.ransack(params[:q])
    end
    private

    #-----light/dark theme button------
    def set_theme
        if params[:theme].present?
            theme = params[:theme].to_sym
            # session[:theme] = theme
            cookies[:theme] = theme
            redirect_to(request.referrer || root_path)
        end
    end

    # -----creates session user-----
    def fetch_user
        @current_user = User.find_by id: session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present?
    end

    # -----backend to only allow buttons/url to work for set users-----
    # current user
    def check_for_login
        redirect_to login_path unless @current_user.present?
    end
    # admin
    def check_for_admin
        redirect_to login_path unless (@current_user.present? && @current_user.admin?)
    end
    # recipe owner
    def check_for_owner_recipe
        @current_recipe = Recipe.find(params[:id])
        redirect_to recipe_path(params[:id]) unless (@current_user.present? && @current_user.username == @current_recipe.user.username || @current_user.admin?)
    end
end
