#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
# Product Website : http://cachevideos.com/
#
require File.expand_path('../webapp/webapp', __FILE__)

def app
  WebApp::Application
end

run WebApp::Application
