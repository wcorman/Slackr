class SlacksController < ApplicationController

  def index
    @slacks = Slack.order(created_at: :desc).take(7)
    if session[:user_id].present?
      @prod_avg = Slack.where(user: current_user.id).average(:prod_time)
      @unprod_avg = Slack.where(user: current_user.id).average(:unprod_time)
      @sleep_avg = Slack.where(user: current_user.id).average(:sleep_time)
    end
  end

def create
end

end
