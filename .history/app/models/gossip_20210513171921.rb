class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes
  has_many :tags, through: :tags_join_gossips
  has_many :
  has_many :comments

  validates :title, presence: true, length: {minimum: 3, maximum: 14}
  validates :content, presence: true, length: {minimum: 1}

end
