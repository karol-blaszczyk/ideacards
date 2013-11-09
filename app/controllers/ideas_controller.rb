class IdeasController < ApplicationController

	def index
		respond_with @ideas = Idea.all
	end
	
	def show
		respond_with @idea = Idea.friendly.find(params[:id])
	end
end