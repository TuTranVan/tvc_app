class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_request!
    payload = decode_auth_token
    if payload && payload['user_id']
      @current_user = User.find(payload['user_id'])
    else
      render_not_auth 
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render_not_auth
  end

  private

  def render_not_auth
    render json: { error: 'Not Authenticated' }, status: 401
  end 

  def serializer(object, option)
    ActiveModelSerializers::SerializableResource.new(object, option)
  end

  def decode_auth_token
    JsonWebToken.decode(request.headers['Authorization']&.split(' ')&.last)
  end
end
