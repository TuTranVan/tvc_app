class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def authenticate_admin!
    redirect_to signin_path unless current_user.admin?
  end
end
