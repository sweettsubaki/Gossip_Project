require 'bcrypt'

class User < ApplicationRecord
  
  has_many :gossips
  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  validates :age, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }, presence: true
  validates :description, presence: true
  
  has_secure_password
  validates :password, presence:true, length: {minimum:6}


  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end


end
