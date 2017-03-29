class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
  end
  def dashboard
    @exercises = Exercise.where(user_id: current_user.id)

    exercise = @exercises.first

    @data = exercise.attempts.map { |attempt| [attempt.date, attempt.time_taken]}
  end
end
