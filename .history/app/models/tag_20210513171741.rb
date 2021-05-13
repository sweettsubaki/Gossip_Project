class Tag < ApplicationRecord
  has_many :gossips, through: :tag_join_gossip, dependent: :destroy
  as_many :gossips, through: :join_table_gossip_tags

  validates :title, presence: true
end