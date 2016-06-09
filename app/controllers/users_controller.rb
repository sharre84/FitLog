class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    @users = User.all
    redirect_to current_user if logged_in?
  end

  def show
    @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    end
  end

  def update
  end

  def edit
    if @user.update(user_params[:id])
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      redirect_to current_user
    else
      render :edit
    end
  end
end

private
def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
end
