require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:anny)
    @micropost = microposts(:apple)
    @comment = @micropost.comments.build(content: "haha", user_id: @user.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "micropost id should be present" do
    @comment.micropost_id = nil
    assert_not @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 140 characters" do
    @comment.content = "a" * 141
    assert_not @comment.valid?
  end

  test "associated likes should be destroyed" do
    @comment.save
    @comment.likes.create!(user_id: @user.id)
    assert_difference 'Like.count', -1 do
      @comment.destroy
    end
  end
end
