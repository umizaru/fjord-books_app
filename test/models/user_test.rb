# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name_or_email" do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'foo bar'
    assert_equal 'foo bar', user.name_or_email
  end

  test 'フォローできるか' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me.follow(she.id)
    assert me.following?(she)
  end

  test 'フォロー解除できるか' do
  end

end
