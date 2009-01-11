
class ReposController < ApplicationController
	def index
		@repos = Repository.all
		@commits = @repos.map(&:commits).flatten.sort_by(&:date).reverse[0..10]
	end
	
	def show
		@repo = Repository.find_by_name(params[:id])
	end
end
