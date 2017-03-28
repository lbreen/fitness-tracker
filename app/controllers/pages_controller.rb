class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
  end
  def dashboard
    @exercises = Exercise.where(user_id: current_user.id)
  end
end
