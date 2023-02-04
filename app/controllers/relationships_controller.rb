# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user.id)
    redirect_to user_path(user)
  end

  def destroy
    current_user.followings.find_by!(follower_id: params[:id]).destroy
    redirect_to user_path
  end
end
