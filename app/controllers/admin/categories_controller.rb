#encoding: utf-8

module Admin
  class CategoriesController < Admin::BaseController
    
    def index
      respond_with @categories = Category.all
    end 

    def new
      respond_with category
    end 

    def edit
      respond_with category
    end

    def create
      @category = Category.new(category_parameters)
      return render :new if params[:_no_save].present?
      @category.save
      respond_with @category, location: admin_categories_path
    end

    def update
      category.assign_attributes category_parameters
      return render :edit if params[:_no_save].present?
      category.save
      if params[:category].has_key? :bundle_attributes
        redirect_to request.referrer
      else
        respond_with category, :location => edit_admin_category_path
      end
    end

    def destroy
      category.destroy
      respond_with category, location: admin_categories_path 
    end

    private 

    def category
      @category ||= build_resource Category
    end

    def category_parameters
      params.require(:category).permit!
    end
  end
end
