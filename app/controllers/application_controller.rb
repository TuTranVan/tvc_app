class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def serializer(object, option)
    ActiveModelSerializers::SerializableResource.new(object, option)
  end
end
