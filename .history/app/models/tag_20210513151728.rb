class Tag < ApplicationRecord
  has_many :gossips, dependent: :destroy

  validates :title, presence: true
end