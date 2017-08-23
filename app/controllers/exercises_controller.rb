class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update, :destroy]

  def show
    @exercises = Exercise.where(user_id: current_user.id)

    @activities = @exercise.activities.sort { |x, y| x.date <=> y.date }
    @activity = Activity.new # Create a new activity from the new_activity_modal
  end

  def new
    @exercise = Exercise.new
    authorize @exercise
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    authorize @exercise
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
    @exercise.destroy
    redirect_to dashboard_path
  end


  private

  def find_exercise
    @exercise = Exercise.find(params[:id])
    authorize @exercise
  end

  def exercise_params
    params.require(:exercise).permit(:title, :description)
  end
end
