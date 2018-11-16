class ProductPictureSerializer < ActiveModel::Serializer
  attributes :id, :picture, :created_at, :updated_at

  def picture
    object.picture
  end
end