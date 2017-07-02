class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
  end

  def dashboard
    @exercises = Exercise.where(user_id: current_user.id)
    @exercise = @exercises.first
    @attempts = @exercise.attempts.sort { |x, y| x.date <=> y.date }
    @attempt = Attempt.new # Create a new attempt from the new_attempt_modal
    @data = @exercise.attempts.map { |attempt| {'date' => attempt.date, 'time_taken' => Time.at(attempt.time_taken).strftime("%H:%M:%S")}}
    binding.pry
  end
end
