#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#

module CommonWebsiteFunctions
  module ClassMethods
    def domain
      Domain.where(:key => self.name.demodulize.downcase).first
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def domain
    self.class.domain
  end
end
