module Admin
  class CategoriesController < ApplicationController
    def index
      respond_to do |format|
        format.html
        format.json do
          categories = Category.all
          render json: { categories: serializer(categories, each_serializer: Admin::Categories::IndexSerializer) }, status: 200
        end
      end
    end
  end
end
