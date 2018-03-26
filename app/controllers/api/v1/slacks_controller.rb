class Api::V1::SlacksController < Api::ApplicationController
  # before_action :authenticate_user!, only: [:create]

  def index
    # slacks = Slack.where(user: current_user)
    # @all_slacks = Slack.where(user: current_user)
    # @slacks = S.where(student_id: 25, class_id: 123).pluck('avg(accuracy), avg(time)').first
    # slacks_array = Slack.where(user: current_user).pluck('avg(prod_time), avg(unprod_time), avg(sleep_time), avg(happy) ').first
    slacks = Slack.where(user: current_user).order(created_at: :desc)

    # slacks = [
    #   { metric: 'Productive Time',
    #     value: user_data.average(:prod_time)
    #   },
    #   { metric: 'Unproductive Time',
    #     value: user_data.average(:unprod_time)
    #   },
    #   { metric: 'Sleep Time',
    #     value: user_data.average(:sleep_time)
    #   },
    #   { metric: 'Happy Level',
    #     value: user_data.average(:happy)
    #   }
    # ]
    #
    # slacks = {
    #   "prod avg": slacks_array[0],
    #   "unprod avg": slacks_array[1],
    #   "sleep avg": slacks_array[2],
    #   "happy avg": slacks_array[3],
    # }
    #
    # slack = Slack.where(user: current_user).average(:prod_time)
    # @unprod_avg = Slack.where(user: current_user).average(:unprod_time)
    # @sleep_avg = Slack.where(user: current_user).average(:sleep_time)
    # @happy_avg = Slack.where(user: current_user).average(:happy)

    render json: slacks
  end
  def trends
    slacks = Slack.where(user: current_user).order(created_at: :desc)

    render json: slacks
  end

  def averages
    slacks = Slack.where(user: current_user).pluck('avg(prod_time), avg(unprod_time), avg(sleep_time), avg(happy) ').first
    averages = {
      prod_time: slacks.first,
      unprod_time: slacks.second,
      sleep_time: slacks.third,
      happy: slacks.last
    }

    render json: averages
  end

  def create
    slack = Slack.new slack_params
    slack.user = current_user
    if slack.save
      render json: slacks
    else
      head :conflict
    end
  end

  private

  def find_slack
    @slack = Slack.find params[:id]
  end

  def slack_params
    params.require(:slacks).permit(:prod_time, :unprod_time, :sleep_time, :happy)
  end
end
