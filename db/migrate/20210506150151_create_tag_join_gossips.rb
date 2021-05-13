class CreateTagJoinGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_join_gossips do |t|
      t.belongs_to :gossip, foreign_key: true
      t.belongs_to :tag, foreign_key: true
      t.timestamps
    end
  end
end
