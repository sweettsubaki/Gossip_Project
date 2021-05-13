class TagJoinGossip < ApplicationRecord
  belongs_to :gossip, dependent: :destroy
  belongs_to :tag, optional: true
end
