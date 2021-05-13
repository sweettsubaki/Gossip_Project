class Tag < ApplicationRecord
  
  has_many :gossips, through: :tags_join_gossips
  has_many :tags_join_gossips


  validates :title, presence: true
end