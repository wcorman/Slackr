class Api::V1::UsersController < ApplicationController

  def index
     @users = Slack.all
     render json: @users, status: :ok
  end

  def show
    @user = User.find params[:id]
    @slacks = Slack.where(user: current_user.id)
  end

  def create
    user = User.new user_params
    if user.save
      render json: {
        jwt: encode_token({
            id: user.id,
            first_name: user.first_name,
            last_name: user.last_name,
        })
      }
    else
      p user.errors.full_messages
      head :bad_request
    end
  end

  def destroy
    @user = Auction.where(id: params[:id]).first
    if @user.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def find_user
    @user = Auction.find params[:id]
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
end
