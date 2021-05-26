# frozen_string_literal: true

class Post < ApplicationRecord
  # after_create_commit {broadcast_to 'posts'}
  # after_update_commit {}
  broadcasts_to ->(post) {:posts}

  belongs_to :user
  has_many :comments
  validates :body, presence: true
  validates :title, presence: true
end
