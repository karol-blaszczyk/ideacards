#encoding: utf-8

module Admin
  class SocialCategoriesController < Admin::BaseController
    
    def index
      respond_with @social_categories = SocialCategory.all
    end 

    def new
      respond_with social_category
    end 

    def edit
      respond_with social_category
    end

    def create
      @social_category = SocialCategory.new(social_category_parameters)
      return render :new if params[:_no_save].present?
      @social_category.save
      respond_with @social_category, location: admin_social_categories_path
    end

    def update
      social_category.assign_attributes social_category_parameters
      return render :edit if params[:_no_save].present?
      social_category.save
      if params[:social_category].has_key? :bundle_attributes
        redirect_to request.referrer
      else
        respond_with social_category, :location => edit_admin_social_category_path
      end
    end

    def destroy
      social_category.destroy
      respond_with social_category, location: admin_social_categories_path 
    end

    private 

    def social_category
      @social_category ||= build_resource SocialCategory
    end

    def social_category_parameters
      params.require(:social_category).permit!
    end
  end
end
