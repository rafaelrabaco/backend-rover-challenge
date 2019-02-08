require 'rspec/core/rake_task'
require_relative './lib/app'

task :run do
  puts "-----------------------------"
  puts "  GetNinjas Rover Challenge"
  puts "-----------------------------"
  puts App.new.run
end

RSpec::Core::RakeTask.new :test do |t|
  t.pattern = 'test/**{,/*/**}/*.test.rb'
end

task default: [:test]
