require 'yaml'
require 'active_record'

def init_database
  dbconfig = YAML::load(File.open('database.yml'))
  ActiveRecord::Base.establish_connection(dbconfig)
end
