# frozen_string_literal: true

module Api
  module V1
    class CommentReactionsController < Api::ApiController
      before_action :set_api_v1_comment_reaction, only: %i[show edit update destroy]

      # Create, update and delete comment_reactions on one post
      # GET /api/v1/comment_reactions/new
      def new
        @api_v1_comment_reaction = CommentReaction.new
      end

      # POST /api/v1/comment_reactions
      def create
        @api_v1_comment_reaction = CommentReaction.new(permitted_params)

        render json: @api_v1_comment_reaction, status: :ok if @api_v1_comment_reaction.save!
      end

      # PATCH/PUT /api/v1/comment_reactions/1
      def update
        render json: @api_v1_comment_reaction, status: :ok if @api_v1_comment_reaction.update!(permitted_params)
      end

      # DELETE /api/v1/comment_reactions/1
      def destroy
        if @api_v1_comment_reaction.destroy!
          render json: { message: 'Comment Reaction was successfully destroyed.' },
                 status: :ok
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_comment_reaction
        @api_v1_comment_reaction = CommentReaction.find(params[:id])
      end

      def post_comment_reactions
        @post_comment_reactions ||= CommentReaction.where(comment: current_comment).includes(:comment_reactions)
      end

      def current_comment
        @current_post ||= Comment.find_by!(id: permitted_params[:comment_id])
      end

      # Only allow a list of trusted parameters through.

      def permitted_params
        params.require(:comment_reaction_attributes).permit(
          :user_id,
          :comment_id,
          :reaction
        )
      end
    end
  end
end
