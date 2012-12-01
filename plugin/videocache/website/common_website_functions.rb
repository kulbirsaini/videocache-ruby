#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#

module CommonWebsiteFunctions
  attr_reader :url, :domain_key, :scheme, :host, :path, :query, :video, :video_id
  module ClassMethods
    def domain_key
      domain.key
    end

    def domain
      Domain.where(:key => self.name.demodulize.downcase).first
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(url)
    @url = url
    @domain_key = domain.key
    @queue = true
    @search = true
    parse_url
  end

  def domain
    @domain ||= self.class.domain
  end

  def matched?
    @matched
  end

  def queueable?
    !!@queue
  end

  def searchable?
    !!@search
  end

  private
  def parse_url
    uri = URI.parse(@url)
    @scheme, @host, @path, @query = uri.scheme, uri.host, uri.path, uri.query
  end
end
