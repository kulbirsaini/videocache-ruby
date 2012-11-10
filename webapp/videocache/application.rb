require File.expand_path('../default', __FILE__)
require 'action_view'
require File.expand_path('../overrides', __FILE__)

module Videocache
  class Application < Default
    use Videocache::Authenticator

    helpers ActionView::Helpers::FormHelper
    helpers ActionView::Helpers::FormTagHelper
    helpers ActionView::Helpers::FormOptionsHelper
    helpers ActionView::Helpers::UrlHelper

    before do
      redirect to('/login') if request.path_info.split(%r|/login|).present? and !authenticated?
    end

    get '/' do
      erb :index
    end

    get '/options' do
      @options = Option.all
      erb :options
    end

    get '/options/new' do
      @option = Option.new
      erb :option_new
    end

    get '/option/:id' do
      @option = Option.find_by_id(params[:id])
      erb :option
    end

    post '/options' do
      @option = Option.new(params[:option])
      if @option.save
        redirect to("/option/#{@option.id}")
      else
        redirect back
      end
    end
  end
end
