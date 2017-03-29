class Attempt < ApplicationRecord
  belongs_to :exercise

  def user
    self.exercise.user
  end
end
