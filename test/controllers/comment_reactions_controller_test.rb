require "test_helper"

class CommentReactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_reaction = comment_reactions(:one)
  end

  test "should get index" do
    get comment_reactions_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_reaction_url
    assert_response :success
  end

  test "should create comment_reaction" do
    assert_difference('CommentReaction.count') do
      post comment_reactions_url, params: { comment_reaction: { comment_id: @comment_reaction.comment_id, reaction: @comment_reaction.reaction } }
    end

    assert_redirected_to comment_reaction_url(CommentReaction.last)
  end

  test "should show comment_reaction" do
    get comment_reaction_url(@comment_reaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_reaction_url(@comment_reaction)
    assert_response :success
  end

  test "should update comment_reaction" do
    patch comment_reaction_url(@comment_reaction), params: { comment_reaction: { comment_id: @comment_reaction.comment_id, reaction: @comment_reaction.reaction } }
    assert_redirected_to comment_reaction_url(@comment_reaction)
  end

  test "should destroy comment_reaction" do
    assert_difference('CommentReaction.count', -1) do
      delete comment_reaction_url(@comment_reaction)
    end

    assert_redirected_to comment_reactions_url
  end
end
