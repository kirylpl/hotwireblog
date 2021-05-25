# frozen_string_literal: true

class PostSerializer
  include JSONAPI::Serializer
  attributes :title, :body
  belongs_to :user

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
