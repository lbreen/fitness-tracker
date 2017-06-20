class Attempt < ApplicationRecord
  belongs_to :exercise
  validates :time_taken, presence: true # greater than 0
  validates :date, presence: true

  def user
    self.exercise.user
  end

  def time_taken_in_minutes
    Time.at(self.time_taken).utc.strftime("%M mins %S secs")
  end
end
