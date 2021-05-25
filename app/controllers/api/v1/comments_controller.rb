# frozen_string_literal: true

module Api
  module V1
    class CommentsController < Api::ApiController
      before_action :set_api_v1_comment, only: %i[show edit update destroy]

      # Fetch / list all comments for a post together with the reactions on these comments
      # GET /api/v1/comments
      def index
        options = {}
        options[:is_collection] = true
        options[:meta] = { total: post_comments.size }
        # options[:include] = [:comment, :'comments.comment_reactions']
        serialized_comments = CommentSerializer.new(post_comments, options).serializable_hash
        render json: serialized_comments, status: :ok
      end

      # Create, update and delete comments on one post
      # GET /api/v1/comments/new
      def new
        @api_v1_comment = Comment.new
      end

      # POST /api/v1/comments
      def create
        @api_v1_comment = Comment.new(permitted_params)

        render json: @api_v1_comment, status: :ok if @api_v1_comment.save!
      end

      # PATCH/PUT /api/v1/comments/1
      def update
        render json: @api_v1_comment, status: :ok if @api_v1_comment.update!(permitted_params)
      end

      # DELETE /api/v1/comments/1
      def destroy
        render json: { message: 'Comment was successfully destroyed.' }, status: :ok if @api_v1_comment.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_comment
        @api_v1_comment = Comment.find(params[:id])
      end

      def post_comments
        @post_comments ||= Comment.where(post: current_post).includes(:comment_reactions)
      end

      def current_post
        # binding.irb
        @current_post ||= Post.find_by!(id: permitted_params[:post_id])
      end

      # Only allow a list of trusted parameters through.

      def permitted_params
        params.require(:comment_attributes).permit(
          :user_id,
          :post_id,
          :body
        )
      end
    end
  end
end
