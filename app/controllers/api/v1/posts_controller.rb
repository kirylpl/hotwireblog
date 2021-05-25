# frozen_string_literal: true

module Api
  module V1
    class PostsController < Api::ApiController
      before_action :set_api_v1_post, only: %i[show edit update destroy]

      # Fetch / list all posts made by one user
      # GET /api/v1/posts
      def index
        options = {}
        options[:meta] = { total: user_posts.size }
        options[:links] = {
          self: '...',
          next: '...',
          prev: '...'
        }
        serialized_posts = PostSerializer.new(user_posts, options).serializable_hash
        render json: serialized_posts, status: :ok
      end

      # Fetch / display a single post
      # GET /api/v1/posts/1
      def show
        serialized_post = PostSerializer.new(@api_v1_post).serializable_hash

        render json: serialized_post, status: :ok
      end

      # Create, update, and delete posts
      # GET /api/v1/posts/new
      def new
        @api_v1_post = Post.new
      end

      # POST /api/v1/posts
      def create
        @api_v1_post = Post.new(permitted_params)

        render json: @api_v1_post, status: :ok if @api_v1_post.save!
      end

      # PATCH/PUT /api/v1/posts/1
      def update
        render json: @api_v1_post, status: :ok if @api_v1_post.update!(permitted_params)
      end

      # DELETE /api/v1/posts/1
      def destroy
        render json: { message: 'Post was successfully destroyed.' }, status: :ok if @api_v1_post.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_post
        @api_v1_post = Post.find(params[:id])
      end

      def user_posts
        @user_posts ||= Post.where(user: single_user)
      end

      def single_user
        @single_user ||= User.find_by!(email: permitted_params[:user_email])
      end

      # Only allow a list of trusted parameters through.

      def permitted_params
        params.require(:post_attributes).permit(
          :user_id,
          :user_email,
          :title,
          :body
        )
      end
    end
  end
end
