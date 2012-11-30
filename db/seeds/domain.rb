# Domain seed file
domain_desc = {}
domains = [
  { :key => :youtube, :name => 'YouTube', :url => 'http://www.youtube.com/' },
  { :key => :aol, :name => 'AOL', :url => 'http://www.aol.com/' },
  { :key => :bing, :name => 'Bing', :url => 'http://www.bing.com/videos/browse' },
  { :key => :bliptv, :name => 'Blip.TV', :url => 'http://blip.tv/' },
  { :key => :breakcom, :name => 'Break.com', :url => 'http://www.break.com/' },
  { :key => :cnn, :name => 'CNN', :url => 'http://edition.cnn.com/video/' },
  { :key => :dailymotion, :name => 'Dailymotion', :url => 'http://www.dailymotion.com/' },
  { :key => :facebook, :name => 'Facebook', :url => 'http://www.facebook.com/' },
  { :key => :metacafe, :name => 'Metacafe', :url => 'http://www.metacafe.com/' },
  { :key => :myspace, :name => 'MySpace', :url => 'http://www.myspace.com/video' },
  { :key => :vimeo, :name => 'Vimeo', :url => 'http://vimeo.com/' },
  { :key => :weather, :name => 'Weather.com', :url => 'http://www.weather.com/' },
  { :key => :wrzuta, :name => 'Wrzuta Polish', :url => 'http://www.wrzuta.pl/' },
  { :key => :youku, :name => 'Youku Chinese', :url => 'http://www.youku.com/' },
  { :key => :extremetube, :name => 'Extreme Tube', :url => 'http://www.extremetube.com/' },
  { :key => :hardsextube, :name => 'Hard Sex Tube', :url => 'http://hardsextube.com/' },
  { :key => :keezmovies, :name => 'Keez Movies', :url => 'http://www.keezmovies.com/' },
  { :key => :pornhub, :name => 'Porn Hub', :url => 'http://www.pornhub.com/' },
  { :key => :redtube, :name => 'Red Tube', :url => 'http://www.redtube.com/' },
  { :key => :slutload, :name => 'Slut Load', :url => 'http://www.slutload.com/' },
  { :key => :spankwire, :name => 'Spank Wire', :url => 'http://www.spankwire.com/' },
  { :key => :tube8, :name => 'Tube8', :url => 'http://www.tube8.com/' },
  { :key => :xhamster, :name => 'X Hamster', :url => 'http://xhamster.com/' },
  { :key => :xtube, :name => 'X Tube', :url => 'http://www.xtube.com/' },
  { :key => :xvideos, :name => 'X Videos', :url => 'http://www.xvideos.com/' },
  { :key => :youporn, :name => 'You Porn', :url => 'http://www.youporn.com/' },
]
Domain.destroy_all
Domain.create(domains)
