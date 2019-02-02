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
end
