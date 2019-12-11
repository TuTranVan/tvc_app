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

    def create
      category = Category.new category_params
      if category.save
        render json: { category: serializer(category, serializer: Admin::Categories::IndexSerializer) }, status: 200
      else
        render json: { errors: category.errors }, status: 422
      end
    end

    private

    def category_params
      params.permit :name, :parent_id
    end
  end
end
