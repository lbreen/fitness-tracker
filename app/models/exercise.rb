class Exercise < ApplicationRecord
  belongs_to :user
  has_many :activity, dependent: :destroy

  validates :title, presence: true
end
