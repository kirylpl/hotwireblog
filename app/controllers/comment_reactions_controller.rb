class CommentReactionsController < ApplicationController
  before_action :set_comment_reaction, only: [:show, :edit, :update, :destroy]

  # GET /comment_reactions
  def index
    @comment_reactions = CommentReaction.all
  end

  # GET /comment_reactions/1
  def show
  end

  # GET /comment_reactions/new
  def new
    @comment_reaction = CommentReaction.new
  end

  # GET /comment_reactions/1/edit
  def edit
  end

  # POST /comment_reactions
  def create
    @comment_reaction = CommentReaction.new(comment_reaction_params)

    if @comment_reaction.save
      redirect_to @comment_reaction, notice: 'Comment reaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comment_reactions/1
  def update
    if @comment_reaction.update(comment_reaction_params)
      redirect_to @comment_reaction, notice: 'Comment reaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comment_reactions/1
  def destroy
    @comment_reaction.destroy
    redirect_to comment_reactions_url, notice: 'Comment reaction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_reaction
      @comment_reaction = CommentReaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_reaction_params
      params.require(:comment_reaction).permit(:comment_id, :reaction)
    end
end
