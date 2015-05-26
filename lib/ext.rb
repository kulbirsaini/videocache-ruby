#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
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
