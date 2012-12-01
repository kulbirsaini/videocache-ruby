#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#

module CommonWebsiteFunctions
  attr_reader :url, :website_id, :scheme, :host, :path, :query
  module ClassMethods
    def domain
      Domain.where(:key => self.name.demodulize.downcase).first
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def domain
    @domain ||= self.class.domain
  end

  def valid_scheme?
    @valid_scheme ||= @scheme.downcase == 'http'
  end
end
