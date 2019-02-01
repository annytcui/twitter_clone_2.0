require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:anny)
    @microposts = @user.microposts
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @microposts.count.to_s, response.body
    @microposts.each do |micropost|
      assert_match micropost.comments.count.to_s, response.body
    end
    assert_select 'ul.pagination'
    @user.microposts.paginate(page: 1, per_page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
