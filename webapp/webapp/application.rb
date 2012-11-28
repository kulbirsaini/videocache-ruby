#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#
require File.expand_path('../default', __FILE__)

module WebApp
  class Application < Default
    use WebApp::Authenticator

    before do
      redirect to(login_path) if request.path_info.split(%r|/login|).present? and !authenticated?
    end

    get '/' do
      erb :'shared/welcome'
    end

    # All
    get '/options' do
      @options = Option.all
      erb :'options/index'
    end

    # New
    get '/options/new' do
      @option = Option.new
      erb :'options/new'
    end

    # Show
    get '/options/:id' do
      @option = Option.find_by_id(params[:id])
      erb :'options/show'
    end

    # Create
    post '/options' do
      @option = Option.new(params[:option])
      if @option.save
        redirect to(option_path(@option))
      else
        redirect back
      end
    end

    # Edit
    get '/options/:id/edit' do
      @option = Option.find_by_id(params[:id])
      erb :'options/edit'
    end

    # Update
    put '/options/:id' do
      @option = Option.find_by_id(params[:id])
      if @option && @option.update_attributes(params[:option])
        redirect to(option_path(@option))
      else
        redirect back
      end
    end

    delete '/options/:id' do
      @option = Option.find_by_id(params[:id])
      if @option && @option.destroy
        redirect to(options_path)
      else
        redirect back
      end
    end
  end
end
