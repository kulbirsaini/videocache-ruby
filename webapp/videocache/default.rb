require 'rubygems'
require 'sinatra/base'
require File.expand_path('../../../config/application', __FILE__)

module Videocache
  class Default < Sinatra::Base
    set :raise_errors, Proc.new{ test? }
    set :dump_errors, false
    set :logging, Proc.new{ !test? }
    set :methodoverride, true
    set :static, true
    set :run, Proc.new{ !test? }
    set :port, 4567

    set :views, VIEWS_DIR
    set :sessions, true
    set :layout => :layout

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    def authenticated?
      session[:username].present?
    end
  end
end
