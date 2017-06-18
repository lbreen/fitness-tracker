class Api::V1::ExercisesController < Api::V1::BaseController
  before_action :find_exercise, only: [ :show ]

  def show
  end

  private

  def find_exercise
    @exercise = Exercise.find(params[:id])
    authorize @exercise  # For Pundit
  end
end
