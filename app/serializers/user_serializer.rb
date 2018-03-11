class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :is_admin

  has_many :slacks
end
