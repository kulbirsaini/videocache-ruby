#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#
require File.expand_path('../webapp/webapp', __FILE__)

def app
  WebApp::Application
end

run WebApp::Application
