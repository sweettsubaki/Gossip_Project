class City < ApplicationRecord
  has_many :users

  validates :city_name
  validates :zip_code, presence: true 
end
