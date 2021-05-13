class Tag < ApplicationRecord
  has_many :tag_join_gossips
  has_many :gossips, through: :tag_join_gossips, dependent: :destroy


  validates :title, presence: true
end