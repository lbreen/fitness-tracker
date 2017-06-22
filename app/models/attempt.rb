class Attempt < ApplicationRecord
  belongs_to :exercise
  validates :time_taken, presence: true # greater than 0
  validates :date, presence: true
  before_create :cannot_be_in_the_future

  def user
    self.exercise.user
  end

  def time_taken_in_minutes
    Time.at(self.time_taken).utc.strftime("%M mins %S secs")
  end

  def cannot_be_in_the_future
    self.date < Date.today
  end
end
