#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
# Product Website : http://cachevideos.com/
#
require File.expand_path('../webapp/default', __FILE__)
require File.expand_path('../webapp/authenticator', __FILE__)
require File.expand_path('../webapp/application', __FILE__)

WebApp::Application.run! if __FILE__ == $0
