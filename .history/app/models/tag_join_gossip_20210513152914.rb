class TagJoinGossip < ApplicationRecord
  belongs_to :gossip, optional: true
  belongs_to :tag, optional: true
end
