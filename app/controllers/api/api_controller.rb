# frozen_string_literal: true

module Api
  class ApiController < ActionController::API
    # before_action :authenticate_user!
    respond_to :json

    after_action -> { request.session_options[:skip] = true }

    rescue_from AppErrors::AuthorizationException do
      render json: { errors: 'Access Denied' }, status: :unauthorized
    end

    rescue_from AppErrors::PermissionDenied do
      render json: { errors: "It seems you've tried to perform unpermitted action" }, status: :forbidden
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { errors: "#{exception.model} not found!", message: exception.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: { errors: exception.record.errors }, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::InvalidForeignKey do |exception|
      render json: { errors: exception.message.humanize }, status: :unprocessable_entity
    end

    rescue_from JSON::ParserError do |e|
      render json: { errors: e.message }, status: :unprocessable_entity
    end

    rescue_from ActiveModel::UnknownAttributeError do |e|
      render json: { errors: e.message }, status: :unprocessable_entity
    end

    rescue_from StandardError do |e|
      render json: { errors: e.message }, status: :unprocessable_entity
    end

    # def authenticate_user_or_consultant!
    #   raise AppErrors::AuthorizationException unless user_signed_in?
    # end
  end
end
