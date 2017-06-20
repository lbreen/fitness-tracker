class AttemptsController < ApplicationController
  before_action :find_attempt, only: [:destroy]
  before_action :find_exercise, only: [:new, :create]

  def new
    @attempt = Attempt.new
    authorize @attempt
  end

  def create
    @attempt = Attempt.new(attempt_params)
    @attempt.exercise = @exercise
    authorize @attempt
    if @attempt.save
      @attempts = @exercise.attempts
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

  def destroy
    @attempt.destroy
  end

  private

  def find_attempt
    @attempt = Attempt.find(params[:id])
    authorize @attempt
  end

  def find_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end

  def attempt_params
    params.require(:attempt).permit(:date, :time_taken, :comments)
  end
end
