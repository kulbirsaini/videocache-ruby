#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
# Product Website : http://cachevideos.com/
#
module ActionView
  module Helpers
    module UrlHelper
      def url_for(options = {})
        options ||= {}
        case options
        when String
          options
        when Hash
          options = options.symbolize_keys.reverse_merge!(:only_path => options[:host].nil?)
          super
        when :back
          controller.request.env["HTTP_REFERER"] || 'javascript:history.back()'
        else
          return url("#{options.class.name.downcase}/#{options.to_param}") if options.respond_to?(:to_param) && options.to_param
          return url("#{options.class.name.tableize}") if options.respond_to?(:persisted?) && options.persisted?
        end
      end
    end
  end
end
