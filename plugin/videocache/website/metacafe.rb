#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#

require File.expand_path('../common_website_functions', __FILE__)

module Videocache
  module Website
    class Metacafe
      include CommonWebsiteFunctions

      def initialize(url)
        @url = url
        @website_id = domain.key
        parse_url
      end

      def parse_url
        return if @parse_url
        uri = URI.parse(@url)
        @scheme, @host, @path, @query = uri.scheme, uri.host, uri.path, uri.query
        @matched = valid_scheme? and @host =~ /(mccont.com|akvideos.metacafe.com)\Z/ and @path =~ /ItemFiles/ and @path =~ /\.(flv|mp4|avi|mkv|mp3|rm|rmvb|m4v|mov|wmv|3gp|mpg|mpeg)/
      end

      def matched?
        parse_url
        @matched
      end
    end
  end
end
