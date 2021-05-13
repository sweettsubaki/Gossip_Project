class Tag < ApplicationRecord
  has_many :join_table_gossip_tags
  has_many :gossips, through: :tag_join_gossip, dependent: :destroy


  validates :title, presence: true
end