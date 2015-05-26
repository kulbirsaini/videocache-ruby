#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
# Product Website : http://cachevideos.com/
#
require 'rubygems'
require 'sinatra/base'
require 'sinatra/config_file'
require 'action_view'
require File.expand_path('../../../config/application', __FILE__)
require File.expand_path('../overrides', __FILE__)
require File.expand_path('../routes', __FILE__)

module WebApp
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

    helpers ActionView::Helpers::FormHelper
    helpers ActionView::Helpers::FormTagHelper
    helpers ActionView::Helpers::FormOptionsHelper
    helpers ActionView::Helpers::UrlHelper

    def authenticated?
      session[:username].present?
    end
  end
end
