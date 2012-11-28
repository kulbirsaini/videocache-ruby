#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#
require File.expand_path('../videocache/default', __FILE__)
require File.expand_path('../videocache/authenticator', __FILE__)
require File.expand_path('../videocache/application', __FILE__)

Videocache::WebApp.run! if __FILE__ == $0
