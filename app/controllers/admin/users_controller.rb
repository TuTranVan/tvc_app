module Admin
  class UsersController < AdminController

    def index
      respond_to do |format|
        format.html
        format.json do
          users = User.all
          render json: { users: serializer(users, each_serializer: Admin::Users::IndexSerializer) }, status: 200
        end
      end
    end
  end
end
