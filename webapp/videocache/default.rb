require 'rubygems'
require 'sinatra/base'
require 'sinatra/config_file'
require File.expand_path('../../../config/application', __FILE__)

module Videocache
  class Default < Sinatra::Base
    register Sinatra::ConfigFile
    config_file App.root + 'config/webapp.yml'

    # Set App Wide Env for database connection
    App.env = environment
    App.connect()

    set :views, App.views_dir

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    def authenticated?
      session[:username].present?
    end
  end
end
