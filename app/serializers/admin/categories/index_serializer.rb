class Admin::Categories::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent

  def parent
    object&.parent&.name
  end
end
