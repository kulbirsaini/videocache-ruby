#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#
require File.expand_path('../webapp/videocache', __FILE__)

def app
  Videocache::WebApp
end

run Videocache::WebApp
