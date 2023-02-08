# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # def setup
  #   @alice = User.create!(email: 'alice@example.com', password: 'password')
  #   @bob = User.create!(email: 'bob@example.com', password: 'password')
  # end

  test 'following?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me.follow(she)
    assert me.following?(she)
  end

  test 'followed_by?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    she.follow(me)
    assert me.followed_by?(she)
  end

  test 'follow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    initial_count = me.active_relationships.count
    me.follow(she)
    assert initial_count + 1, me.active_relationships.count
  end

  test 'unfollow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me.follow(she)
    initial_count = me.active_relationships.count
    me.unfollow(she)
    assert initial_count - 1, me.active_relationships.count
  end

  test "name_or_email" do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'foo bar'
    assert_equal 'foo bar', user.name_or_email
  end

end
