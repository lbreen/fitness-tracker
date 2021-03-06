class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
  end

  def dashboard
    @exercises = Exercise.where(user_id: current_user.id)
    @exercise = @exercises.first
    @attempts = @exercise.attempts.sort { |x, y| x.date <=> y.date }
    # @data = exercise.attempts.map { |attempt| [attempt.date, Time.at(attempt.time_taken).strftime("%H:%M:%S")]}
  end
end
