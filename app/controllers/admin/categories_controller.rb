module Admin
  class CategoriesController < ApplicationController
    before_action :load_category, only: :destroy

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

    def destroy
      @category.destroy
      render json: {}, status: 200
    end

    private

    def category_params
      params.permit :name, :parent_id
    end

    def load_category
      @category = Category.find_by id: params[:id]
      return if @category
      
      render json: { error: "Category is invalid" }, status: 422
    end
  end
end
