require File.expand_path('../videocache/default', __FILE__)
require File.expand_path('../videocache/authenticator', __FILE__)
require File.expand_path('../videocache/application', __FILE__)

Videocache::Application.run! if __FILE__ == $0
