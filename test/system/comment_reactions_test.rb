require "application_system_test_case"

class CommentReactionsTest < ApplicationSystemTestCase
  setup do
    @comment_reaction = comment_reactions(:one)
  end

  test "visiting the index" do
    visit comment_reactions_url
    assert_selector "h1", text: "Comment Reactions"
  end

  test "creating a Comment reaction" do
    visit comment_reactions_url
    click_on "New Comment Reaction"

    fill_in "Comment", with: @comment_reaction.comment_id
    fill_in "Reaction", with: @comment_reaction.reaction
    click_on "Create Comment reaction"

    assert_text "Comment reaction was successfully created"
    click_on "Back"
  end

  test "updating a Comment reaction" do
    visit comment_reactions_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @comment_reaction.comment_id
    fill_in "Reaction", with: @comment_reaction.reaction
    click_on "Update Comment reaction"

    assert_text "Comment reaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment reaction" do
    visit comment_reactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment reaction was successfully destroyed"
  end
end
