# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    current_user.follow(params[:follow_id])
    redirect_to user_path(user)
  end

  def destroy
    current_user.followers.find_by!(following_id: params[:id]).destroy
    redirect_to user_path
  end
end
aw
