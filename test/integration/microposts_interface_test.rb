require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anny)
    @other_user = users(:mark)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'ul.pagination'
    # Invalid submission
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "" } }
    end
    assert_not flash.empty?
    # Valid submission
    content = "A micropost"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # Visit difference user (no delete links)
    get user_path(@other_user)
    assert_select 'a', text: 'delete', count: 0
  end

  test "micropost sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "#{@user.microposts.count} microposts", response.body
    # User with zero microposts
    log_in_as(users(:baozi))
    get root_path
    assert_match "0 microposts", response.body
    users(:baozi).microposts.create!(content: "A micropost")
    get root_path
    assert_match "1 micropost", response.body
  end
end
