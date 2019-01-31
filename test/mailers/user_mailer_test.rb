require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    user = users(:anny)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Activate Your Account - TRAILS Demo App", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@trailsdemoapp.com"], mail.from
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end
end
