class AttemptsController < ApplicationController
  #before_action :find_attempt, only: [:show]

  def new
    @attempt = Attempt.new
    @exercise = Exercise.find(params[:exercise_id])
    authorize @attempt
  end

  def create
    @attempt = Attempt.new(attempt_params)
    @attempt.exercise = Exercise.find(params[:exercise_id])
    authorize @attempt
    if @attempt.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/attempts/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/attempts/create.js.erb`
      end
    end
  end

  private

  def find_attempt
    @attempt = Attempt.find(params[:id])
  end

  def attempt_params
    params.require(:attempt).permit(:date, :time_taken, :comments)
  end
end
