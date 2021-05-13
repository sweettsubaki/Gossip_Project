require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  has_many :gossips
  has_many :likes
  has_many :comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  belongs_to :city, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :city, presence: true
  validates :age, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }, presence: true
  validates :description, presence: true
  validates :password_digest; 

end
