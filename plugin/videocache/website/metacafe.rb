#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
# Product Website : http://cachevideos.com/
#

require File.expand_path('../common_website_functions', __FILE__)

module Videocache
  module Website
    class Metacafe
      include CommonWebsiteFunctions

      private
      def parse_url
        return if @parse_url
        super
        @matched = @host =~ /(mccont.com|akvideos.metacafe.com)\Z/ and @path =~ /ItemFiles/ and @path =~ /\.(flv|mp4|avi|mkv|mp3|rm|rmvb|m4v|mov|wmv|3gp|mpg|mpeg)/
        unescaped_video_id = URI.unescape(@path).strip.split(' ').last
        @video_id = URI.escape(unescaped_video_id) if unescaped_video_id.present?
        @video = Video.new(:video_id => @video_id, :domain_id => domain.id, :ext => @video_id.scan(/\.(flv|mp4|avi|mkv|mp3|rm|rmvb|m4v|mov|wmv|3gp|mpg|mpeg)/).first.try(:first) || '') if @video_id.present?
        @parse_url = true
      end
    end
  end
end
