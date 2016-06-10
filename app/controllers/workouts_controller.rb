class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

def index
  @workouts = Workout.all.order('created_at DESC')
end

def show
end

def new
  @workout = Workout.new
end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    if @workout.save
      flash[:success] = 'You have created a new workout!'
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      flash[:success] = 'You have updated your workout!'
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    if @workout.destroy
      flash[:danger] = 'You have deleted the workout!'
      redirect_to current_user
    else
      render :edit
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :length, :comment)
  end

def find_workout
  @workout = Workout.find(params[:id])
  end
end
