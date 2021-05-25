# frozen_string_literal: true

class CommentReactionSerializer
  include JSONAPI::Serializer

  belongs_to :comment

  attributes :reaction

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
