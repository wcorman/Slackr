class Api::V1::UsersController < Api::ApplicationController


  def index
    @users = User.order(created_at: :desc)
    render json: @users
  end
end
