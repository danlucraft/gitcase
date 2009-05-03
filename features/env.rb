
puts "Loading env.rb"

GitCase::Fixtures.unzip

at_exit {
  GitCase::Fixtures.rezip
}
