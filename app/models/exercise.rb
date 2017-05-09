class Exercise < ApplicationRecord
  belongs_to :user
  has_many :attempts, dependent: :destroy

  validates :title, presence: true
end
