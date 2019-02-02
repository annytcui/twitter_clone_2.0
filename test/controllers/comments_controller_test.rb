require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anny)
    @micropost = microposts(:apple)
    @comment = comments(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post micropost_comments_path(@micropost.id), params: {
            comment: { content: "A comment", user_id: @user.id }}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete micropost_comment_path(@comment.micropost, @comment)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong comment" do
    log_in_as(@user)
    assert_no_difference 'Comment.count' do
      delete micropost_comment_path(@comment.micropost, @comment)
    end
    assert_redirected_to root_url
  end
end
