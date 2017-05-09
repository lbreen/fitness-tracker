class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update, :destroy]

  def show
    @exercises = Exercise.where(user_id: current_user.id)

    @attempts = @exercise.attempts.sort { |x, y| x.date <=> y.date }
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    if @exercise.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @exercise.delete
    redirect_to dashboard_path
  end


  private

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:title, :description)
  end
end
