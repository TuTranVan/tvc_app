class Admin::Users::IndexSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :phone, :address
end
