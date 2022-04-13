class ApplicationController < ActionController::Base
    before_action :fetch_user
    before_action :set_theme
    before_action :set_query
    
    def set_query
        @q = Recipe.ransack(params[:q])
    end
    private
    def set_theme
        if params[:theme].present?
            theme = params[:theme].to_sym
            # session[:theme] = theme
            cookies[:theme] = theme
            redirect_to(request.referrer || root_path)
        end
    end

    def fetch_user
        @current_user = User.find_by id: session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present?
    end

    def check_for_login
        redirect_to login_path unless @current_user.present?
    end
    def check_for_admin
        redirect_to login_path unless (@current_user.present? && @current_user.admin?)
    end

    # 
    def check_for_owner_recipe
        @current_recipe = Recipe.find(params[:id])
        redirect_to recipe_path(params[:id]) unless (@current_user.present? && @current_user.username == @current_recipe.user.username || @current_user.admin?)
    end

end
