class Post < ApplicationRecord
  # frozen_string_literal: true
  belongs_to :user

  validates :content, presence: true
end
