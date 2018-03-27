class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:destroy]
  before_action :find_exercise, only: [:new, :create]

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.exercise = @exercise
    authorize @activity
    if @activity.save
      @activities = @exercise.activities
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/activities/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/activities/create.js.erb`
      end
    end
  end

  def destroy
    @activity.destroy
  end

  private

  def find_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def find_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end

  def activity_params
    params.require(:activity).permit(:date, :time_taken, :comments)
  end
end
