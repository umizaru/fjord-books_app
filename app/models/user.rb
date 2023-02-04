# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :followings,
           class_name: 'Relationship',
           foreign_key: 'following_id',
           dependent: :destroy,
           inverse_of: :following

  has_many :followers,
           class_name: 'Relationship',
           foreign_key: 'follower_id',
           dependent: :destroy,
           inverse_of: :follower

  has_many :following_users, through: :followings, source: :follower
  has_many :follower_users, through: :followers, source: :following

  def follow(other_user_id)
    followings.create(follower_id: other_user_id)
  end

  def following?(other_user)
    following_users.include?(other_user)
  end

  def unfollow(other_user_id)
    followings.destroy(following_id: other_user_id)
  end
end
