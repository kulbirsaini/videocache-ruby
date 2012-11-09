require File.expand_path('../webapp/videocache', __FILE__)

def app
  Videocache::Application
end

run Videocache::Application
