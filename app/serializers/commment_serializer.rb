class CommmentSerializer < ActiveModel::Serializer
  attributes :id, :commment, :product_id, :created_at, :updated_at

  belongs_to :user
end