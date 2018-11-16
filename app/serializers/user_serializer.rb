class UserSerializer < ActiveModel::Serializer
  attributes :id, :company, :name, :username, :role, :email, :birthdate, :gender, :created_at, :updated_at

  belongs_to :picture
  has_one :blocked_user
end