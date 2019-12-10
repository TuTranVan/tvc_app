class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :load_user, only: :create

  def create
    if @user.valid_password?(user_params[:password])
      sign_in @user
      render json: { auth: serializer(@user, serializer: UserSerializer) }, status: 200
    else
      render json: { error: "Password is invalid" }, status: 401
    end
  end

  def destroy
    sign_out current_user
    render json: {}, status: 200
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
end
