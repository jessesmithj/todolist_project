require "rake/testtask"
require 'find'
require "bundler/gem_tasks"

desc 'Say hello'
task :hello do 
  puts "Hello. This is the 'hello' task."
end

desc 'Run tests'
task :test do
  sh 'ruby ./test/todolist_project_test.rb'
end

desc 'Run tests'
task :default => :test

desc 'List all files' 
task :inventory do 
  Find.find('.') do |name| 
    puts name if File.file?(name) && !name.include?('/.')
  end 
end 


Rake::TestTask.new(:test) do |t| 
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end