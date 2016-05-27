require "bundler/gem_tasks"

task :default => [:test]

task :prep_test_data do

end
task :run_tests do
  ruby 'test/test.rb'
end
task :test => [:prep_test_data, :run_tests]

task :build do
  ruby '-S gem build elyan.gemspec'
end
task :deploy do
  ruby '-S gem install elyan'
end
task :install => [:build, :deploy]

