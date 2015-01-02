require 'rake/testtask'
require 'active_record'
require 'yaml'

task :default => :migrate

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"

task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
end


Rake::TestTask.new do |t|
  # test for test_helper.rb
  # lib for main code being tested
  t.libs << %w(test)   #lib folder is automatically included
  # what to test?
  t.pattern = "test/test*.rb"
end

task :main do
  Dir[File.dirname(__FILE__) + '/lib/models/*.rb'].each {|file| require file }
  Dir[File.dirname(__FILE__) + '/lib/app.rb'].each {|file| require file }
  createSampleProducts
  sampleCart
  destroyProduct
  createAndDestroyProduct
end

task :default => :test
