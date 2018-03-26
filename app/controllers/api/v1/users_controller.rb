class Api::V1::UsersController < ApplicationController

  def show
    @user = User.find params[:id]
    @slacks = Slack.where(user: current_user.id)
  end

end
