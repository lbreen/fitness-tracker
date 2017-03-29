class Exercise < ApplicationRecord
  belongs_to :user
  has_many :attemtps, dependent: :destroy

  validates :title, presence: true
end
