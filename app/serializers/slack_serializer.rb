class SlackSerializer < ActiveModel::Serializer
  attributes :id, :prod_time, :unprod_time, :sleep_time, :happy, :user_id, :created_at, :updated_at

  belongs_to :user
end
