# frozen_string_literal: true

module AppErrors
  class AuthorizationException < StandardError; end

  class PermissionDenied < StandardError; end
end
