class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def serializer(object, option)
    ActiveModelSerializers::SerializableResource.new(object, option)
  end

  def authenticate_user!
    redirect_to signin_path unless user_signed_in?
  end
end
