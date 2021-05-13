class Tag < ApplicationRecord
  
  has_many :gossips, through: :tags_join_gossips, dependent: :destroy


  validates :title, presence: true
end