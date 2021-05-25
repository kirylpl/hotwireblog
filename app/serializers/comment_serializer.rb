# frozen_string_literal: true

class CommentSerializer
  include JSONAPI::Serializer
  attributes :body
  belongs_to :user

  attribute :comment_reactions do |record|
    record.comment_reactions.as_json
  end

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
