class IdeasController < ApplicationController

	def index
		respond_with @ideas ||= Idea.all
	end
	
	def show
		respond_with @idea = Idea.friendly.find(params[:id])
	end

	def search
	  # filter"=>{"placement"=>"", "cash"=>"", "group"=>"", "time"=>"< 30min"}
	  filters = params[:filter]
	  
	  ideas = Idea.all
	  ideas = ideas.where("placement LIKE ?" , filters[:placement]) unless filters[:placement].empty?
	  ideas = ideas.where("cash LIKE ?" , filters[:cash]) unless filters[:cash].empty?
	  ideas = ideas.where("group_type LIKE ?" , filters[:group_type]) unless filters[:group_type].empty?
	  ideas = ideas.where("time LIKE ?" , filters[:time])unless filters[:time].empty?

	  respond_with @ideas = ideas
	end
end