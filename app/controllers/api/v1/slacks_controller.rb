class Api::V1::SlacksController < Api::ApplicationController
  # before_action :authenticate_user!, only: [:create]
# before_action :check_timestamp, only: [:create]

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
    trends = Slack.where(user: current_user).order(created_at: :asc)

    render json: trends
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

  def dates
    slacks = Slack.where(user: current_user).order(created_at: :asc).select(:created_at, :id)

    dates = {
      created_at: slacks,

    }

    Rails.logger.info ">>>>>>>>>>>>>"
    Rails.logger.info current_user
    Rails.logger.info ">>>>>>>>>>>>>"
    Rails.logger.info slacks.inspect
    Rails.logger.info ">>>>>>>>>>>>>"
    Rails.logger.info slacks.to_json
    Rails.logger.info ">>>>>>>>>>>>>"

    render json: dates

  end

  # Slack.find_by_sql("select to_char(created_at,'Mon') as mon,
  #        extract(year from created_at) as yyyy,
  #        count(\"id\") as \"Count\"
  # from slacks
  # group by 1,2")


  def create
    slack = Slack.new slack_params
    slack.user = current_user
    if slack.save
      render json: slack
    else
      head :conflict
    end
  end
  #
  # def check_timestamp
  #   if Slack.where(user: current_user.id).last.created_at < 20.hour.ago
  #     puts 'APPROVED'
  #    else
  #      puts 'DENIED'
  #      head :not_found
  #    end
  # end



  private

  def find_slack
    @slack = Slack.find params[:id]
  end

  def slack_params
    params.require(:slacks).permit(:prod_time, :unprod_time, :sleep_time, :happy)
  end
end
