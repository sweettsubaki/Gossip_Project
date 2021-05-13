class Tag < ApplicationRecord
  has_many :gossips, through: :tag_join_gossip, dependent: :destroy
  has_many :

  validates :title, presence: true
end