class SlacksController < ApplicationController
  before_action :authenticate_user!

  def index
    @slacks = Slack.order(created_at: :desc)
    if session[:user_id].present?
      @prod_avg = Slack.where(user: current_user.id).average(:prod_time)
      @unprod_avg = Slack.where(user: current_user.id).average(:unprod_time)
      @sleep_avg = Slack.where(user: current_user.id).average(:sleep_time)
      @happy_avg = Slack.where(user: current_user.id).average(:happy)

    end
    respond_to do |format|
      format.html { render }
      format.json { render json: @slacks }
    end
  end

  def new
    @slack = Slack.new
  end

  def create
    @slack = Slack.new slack_params
    @slack.user = @current_user
    if @slack.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def authorize_user!
    unless can?(:create, @slack)
      flash[:alert] = "Access Denied!"
      redirect_to slack_path(@slack)
    end
  end

  def slack_params
    params.require(:slack).permit(:prod_time, :unprod_time, :sleep_time, :happy)
  end
end
