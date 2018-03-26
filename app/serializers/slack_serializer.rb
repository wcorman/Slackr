class SlackSerializer < ActiveModel::Serializer
  attributes :id, :prod_time, :unprod_time, :sleep_time, :happy, :user_id, :created_at, :updated_at

  belongs_to :user

  class UserSerializer < ActiveModel::Serializer
    attributes :first_name, :last_name, :email
  end
end
