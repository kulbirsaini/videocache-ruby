require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

ActiveRecord::Base.establish_connection(DB_CONNECTION_INFO)
