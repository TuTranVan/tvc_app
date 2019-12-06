class UsersController < ApplicationController
  def create
    user = User.new user_params
    if user.save
      render json: { user: serializer(user, serializer: UserSerializer) }, status: 200
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit :full_name, :email, :password, :password_confirmation, :phone, :address
  end
end
