class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.order(:id).page(params[:page]).per(3)
  end
end
