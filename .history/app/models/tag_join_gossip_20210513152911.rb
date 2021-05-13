class TagJoinGossip < ApplicationRecord
  belongs_to :gossip, opt
  belongs_to :tag, optional: true
end
