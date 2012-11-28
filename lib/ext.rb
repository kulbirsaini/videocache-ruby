#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#

class NilClass
  def integer?
    false
  end
end

class String
  def integer?
    !!(self =~ /\A(0(?![0-9]+)|[1-9]+[0-9]*)\Z/)
  end
end
