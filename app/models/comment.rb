# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_reactions, dependent: :destroy

  validates :body, presence: true
  validates :post_id, presence: true
end
