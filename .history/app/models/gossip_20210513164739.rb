class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :tags, through: :tag_join_gossip, dependent: :destroy
  has_many :comments

  validates :title, presence: true, length: {minimum: 3, maximum: 14}
  validates :content, presence: true, length: {minimum: 1}

end
