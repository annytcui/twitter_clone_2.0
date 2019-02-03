require 'test_helper'

class LikeTest < ActiveSupport::TestCase

  def setup
    @user = users(:anny)
    @micropost = microposts(:apple)
    @like = @micropost.likes.build(user_id: @user.id)
  end

  test "should be valid" do
    assert @like.valid?
  end

  test "user id should be present" do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test "likeable id should be present" do
    @like.likeable_id = nil
    assert_not @like.valid?
  end

  test "likeable type should be present" do
    @like.likeable_type = nil
    assert_not @like.valid?
  end

  test "user should only like one likeable once" do
    @like.save
    assert has_liked?(@user, @micropost)
    new_like = @micropost.likes.build(user_id: @user.id)
    assert_no_difference 'Like.count' do
      new_like.save
    end
  end
end
