require File.expand_path('../default', __FILE__)

module Videocache
  class Application < Default
    use Videocache::Authenticator

    before do
      redirect to('/login') if request.path_info.split(%r|/login|).present? and !authenticated?
    end

    get '/' do
      website = Website.first
      erb "<a href='/'>Website name</a>"
    end
  end
end
