class UsersController < ApplicationController
  before_action :check_for_admin, only: [:index]

  #-----users display-----
  def index
    @users = User.all
  end
  def show
    @user = User.find params[:id]
    
  end

  #-----create new user-----
  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  #-----edit user this is where u can add user picture and description (utilizes cloudinary)-----
  def edit
    @user = User.find params[:id]
  end
  def update
    user = User.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      user.image = req["public_id"]
    end
    user.update user_params
    user.save
    redirect_to user
  end

  #-----delete user-----
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :about)
  end
end



