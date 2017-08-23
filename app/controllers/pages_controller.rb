class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
  end

  def dashboard
    @exercises = Exercise.where(user_id: current_user.id)
    @exercise = @exercises.first
    @activities = @exercise.activities.sort { |x, y| x.date <=> y.date }
    @activity = Activity.new # Create a new activity from the new_activity_modal
    # @data = exercise.activities.map { |attempt| [attempt.date, Time.at(attempt.time_taken).strftime("%H:%M:%S")]}
  end
end
