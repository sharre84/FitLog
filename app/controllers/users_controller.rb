class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


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
      flash[:success] = 'You have successfully created a new account!'
      redirect_to new_session_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'You have updated your profile!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit

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

def set_user
  @user = User.find(params[:id])
end
def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
end
