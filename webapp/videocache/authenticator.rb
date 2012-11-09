require File.expand_path('../default', __FILE__)

module Videocache
  class Authenticator < Default
    before '/login' do
      redirect to('/') if authenticated?
    end

    get '/login' do
      erb :login
    end

    post '/login' do
      if params[:username] == 'admin' && params[:password] == 'pass'
        session[:username] = params[:username]
        redirect to('/')
      else
        redirect to('/login')
      end
    end

    delete '/logout' do
      session[:username] = nil
      redirect to('/')
    end

    get '/logout' do
      session[:username] = nil
      redirect to('/')
    end

    post '/logout' do
      session[:username] = nil
      redirect to('/')
    end
  end
end
