class Tag < ApplicationRecord
  has_many :gossips, through: :tag_join_gossip

  validates :title, presence: true
end