class Api::V1::SlacksController < Api::ApplicationController

before_action :authenticate_user!

  def index
    @slacks = Slack.order(created_at: :desc)
    render json: @slacks
  end
end
