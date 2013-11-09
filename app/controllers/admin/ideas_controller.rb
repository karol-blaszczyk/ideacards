#encoding: utf-8

module Admin
  class IdeasController < Admin::BaseController
    
    def index
      respond_with @ideas = Idea.all
    end 

    def new
      respond_with idea
    end 

    def edit
      respond_with idea
    end

    def create
      @idea = Idea.new(idea_parameters)
      return render :new if params[:_no_save].present?
      @idea.save
      respond_with @idea, location: admin_ideas_path
    end

    def update
      idea.assign_attributes idea_parameters
      return render :edit if params[:_no_save].present?
      idea.save
      if params[:idea].has_key? :bundle_attributes
        redirect_to request.referrer
      else
        respond_with idea, :location => edit_admin_idea_path
      end
    end

    def destroy
      idea.destroy
      respond_with idea, location: admin_ideas_path 
    end

    private 

    def idea
      @idea ||= build_resource Idea
    end

    def idea_parameters
      params.require(:idea).permit!
    end
  end
end
