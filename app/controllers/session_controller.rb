class SessionController < ApplicationController
  #-----creating new session-----
  def new
  end
  def create
    user = User.find_by username: params[:username]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
  #-----ending session/logging out-----
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
