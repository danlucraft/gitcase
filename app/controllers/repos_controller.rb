class ReposController < ApplicationController
	def index
		@repos = Repository.all
		@commits = @repos.map do |repo|
			repo.commits.map do |commit|
				[commit, repo, commit.date]
			end
		end.flatten(1).sort_by(&:last).reverse[0..10]
	end
	
	def show
		@repo = Repository.find_by_name(params[:id])
	end
end
