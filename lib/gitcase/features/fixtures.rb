
require 'fileutils'

module GitCase
  module Fixtures

    # Extract all tarballs in the features/fixtures directory
    def self.unzip
      FileUtils.cd("features/fixtures")
      Dir["*.tar.gz"].each do |tarred_repo|
        puts %x{tar xzvf #{tarred_repo}}
      end
      FileUtils.cd("../../")
    end

    # Remove everything that isn't a tarball in the features/fixtures dir.
    def self.rezip
      Dir["features/fixtures/*"].each do |thing|
        unless thing.include?(".tar.gz")
          FileUtils.rm_rf(thing)
        end
      end
    end
  end
end
