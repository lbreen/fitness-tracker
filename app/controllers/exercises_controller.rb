class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :create, :update, :destroy]

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise.save!
    redirect_to dashboard_path
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.permit(:exercise).permit(:title, :description)
  end
end
