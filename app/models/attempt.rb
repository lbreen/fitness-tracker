class Attempt < ApplicationRecord
  belongs_to :exercise

  def user
    self.exercise.user
  end

  def time_taken_in_minutes
    Time.at(self.time_taken).utc.strftime("%M mins %S secs")
  end
end
