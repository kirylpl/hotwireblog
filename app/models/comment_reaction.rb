# frozen_string_literal: true

class CommentReaction < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  enum reaction: {
    like: 0,
    smile: 1,
    thumbs_up: 2
  }
end
