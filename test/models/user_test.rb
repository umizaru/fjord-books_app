# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'following?' do
    alice = users(:alice)
    bob = users(:bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test 'followed_by?' do
    alice = users(:alice)
    bob = users(:bob)
    bob.follow(alice)
    assert alice.followed_by?(bob)
  end

  test 'follow' do
    alice = users(:alice)
    bob = users(:bob)
    initial_count = alice.active_relationships.count
    alice.follow(bob)
    assert initial_count + 1, alice.active_relationships.count
  end

  test 'unfollow' do
    alice = users(:alice)
    bob = users(:bob)
    alice.follow(bob)
    initial_count = alice.active_relationships.count
    alice.unfollow(bob)
    assert initial_count - 1, alice.active_relationships.count
  end

  test 'name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'foo bar'
    assert_equal 'foo bar', user.name_or_email
  end
end
