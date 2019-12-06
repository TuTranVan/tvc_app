class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def create
    if @user.valid_password?(user_params[:password])
      render json: payload(@user), status: 200
    else
      render json: { error: "Password is invalid" }, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: user_params[:email])
    return if @user
    render json: { error: "Email is invalid" }, status: 422
  end

  def payload(user)
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      auth: serializer(user, serializer: UserSerializer)
    }
  end
end
