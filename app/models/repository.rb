
class Repository
	attr_accessor :name, :path
	
	def self.all
		Dir[APP_CONFIG[:repos_path]+"/*"].select do |dir|
			File.exist?(dir + "/.git"	)
		end.map do |dir|
			Repository.new(dir)
		end
	end
	
	def self.find_by_name(name)
		all.detect{|r| r.name == name}
	end
	
	def initialize(dir)
		@name = dir.split("/").last
		@path = dir
		@grit = Grit::Repo.new(@path)
	end
	
	attr_reader :grit
	
	delegate :commits, :to => :grit
end
