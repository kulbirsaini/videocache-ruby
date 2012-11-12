require File.expand_path('../default', __FILE__)

module Videocache
  class Authenticator < Default
    before '/login' do
      redirect to(root_path) if authenticated?
    end

    get '/login' do
      erb :'shared/login'
    end

    post '/login' do
      if params[:username] == 'admin' && params[:password] == 'pass'
        session[:username] = params[:username]
        redirect to(root_path)
      else
        redirect to(login_path)
      end
    end

    delete '/logout' do
      session[:username] = nil
      redirect to(root_path)
    end

    get '/logout' do
      session[:username] = nil
      redirect to(root_path)
    end

    post '/logout' do
      session[:username] = nil
      redirect to(root_path)
    end
  end
end
