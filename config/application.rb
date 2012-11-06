require File.expand_path('../boot', __FILE__)

Bundler.require if defined?(Bundler)

APP_ROOT = Pathname.new(File.dirname(File.expand_path('..', __FILE__)))

Dir.glob(APP_ROOT + "app/models/*.rb").each{ |f| require f }

connection_info = YAML::load(File.open(APP_ROOT + 'config/database.yml'))
ActiveRecord::Base.establish_connection(connection_info)
