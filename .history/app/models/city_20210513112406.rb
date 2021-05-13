class City < ApplicationRecord
  has_many :users

  validate :city_name
  validates :zip_code, presence: true 
end
