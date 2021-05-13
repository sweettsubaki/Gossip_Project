class TagJoinGossip < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag, optional: true
end
© 2021 GitHub, Inc.