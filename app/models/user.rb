class User < ApplicationRecord
  # frozen_string_literal: true
  attr_accessor :user_token
  has_many :posts
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def produce_token
    self.user_token = SecureRandom.urlsafe_base64
  end

  def update_token
    update_attribute(:user_token, user_token)
  end

  def authenticated?(token)
    token == user_token
  end
end
