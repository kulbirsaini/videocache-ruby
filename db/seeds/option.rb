# Option seed file
option_desc = Hash.new{ |k, v| v = '' }
option_help = Hash.new{ |k, v| v = '' }
options = [
  { :key => 'client_email', :name => 'Client Email', :help => option_help[:client_email], :value => '', :option_type => 'email', :description => option_desc[:client_email], :default => '' },
  { :key => 'cache_host', :name => 'Cache Host With Port', :help => option_help[:cache_host], :value => '127.0.0.1', :option_type => 'host_with_port', :description => option_desc[:cache_host], :default => '127.0.0.1' },
  { :key => 'cache_user', :name => 'Cache Proxy User', :help => option_help[:cache_user], :value => 'proxy', :option_type => 'username', :description => option_desc[:cache_user], :default => 'proxy' },
  { :key => 'cache_dir', :name => 'Cache Directories', :help => option_help[:cache_dir], :value => '', :option_type => 'array', :description => option_desc[:cache_dir], :default => '' },
  { :key => 'disk_threshold', :name => 'Disk Threshold', :help => option_help[:disk_threshold], :value => '15000', :option_type => 'integer', :description => option_desc[:disk_threshold], :default => '15000' },
  { :key => 'cleanup_policy', :name => 'Cleanup Policy', :help => option_help[:cleanup_policy], :value => '1', :option_type => 'integer', :description => option_desc[:cleanup_policy], :default => '1' },
  { :key => 'videocache', :name => 'Videocache', :help => option_help[:videocache], :value => 'true', :option_type => 'boolean', :description => option_desc[:videocache], :default => 'true' },
  { :key => 'offline_mode', :name => 'Offline Mode', :help => option_help[:offline_mode], :value => 'false', :option_type => 'boolean', :description => option_desc[:offline_mode], :default => 'false' },
  { :key => 'disk_selection_policy', :name => 'Disk Selection Policy', :help => option_help[:disk_selection_policy], :value => '2', :option_type => 'integer', :description => option_desc[:disk_selection_policy], :default => '2' },
  { :key => 'store_log_monitoring', :name => 'Store Log Monitoring', :help => option_help[:store_log_monitoring], :value => 'true', :option_type => 'boolean', :description => option_desc[:store_log_monitoring], :default => 'false' },
  { :key => 'store_log_path', :name => 'Store Log Path', :help => option_help[:store_log_path], :value => '/var/spool/squid/store.log', :option_type => 'path', :description => option_desc[:store_log_path], :default => '/var/log/squid/store.log' },
  { :key => 'our_proxy', :name => 'Our Proxy', :help => option_help[:our_proxy], :value => '127.0.0.1:3128', :option_type => 'host_with_port', :description => option_desc[:our_proxy], :default => '127.0.0.1:3128' },
  { :key => 'miss_threshold', :name => 'Miss Threshold', :help => option_help[:miss_threshold], :value => '1', :option_type => 'integer', :description => option_desc[:miss_threshold], :default => '1' },
  { :key => 'cache_threads', :name => 'Cache Threads', :help => option_help[:cache_threads], :value => '5', :option_type => 'integer', :description => option_desc[:cache_threads], :default => '5' },
  { :key => 'cache_speed', :name => 'Cache Speed', :help => option_help[:cache_speed], :value => '0', :option_type => 'integer', :description => option_desc[:cache_speed], :default => '0' },
  { :key => 'cache_queue_size', :name => 'Cache Queue Size', :help => option_help[:cache_queue_size], :value => '5000', :option_type => 'integer', :description => option_desc[:cache_queue_size], :default => '5000' },
  { :key => 'cache_period', :name => 'Cache Period', :help => option_help[:cache_period], :value => '', :option_type => 'string', :description => option_desc[:cache_period], :default => '' },
  { :key => 'proxy', :name => 'Proxy', :help => option_help[:proxy], :value => '', :option_type => 'host_with_port', :description => option_desc[:proxy], :default => '' },
  { :key => 'min_video_size', :name => 'Minimum Video Size', :help => option_help[:min_video_size], :value => '0', :option_type => 'integer', :description => option_desc[:min_video_size], :default => '0' },
  { :key => 'max_video_size', :name => 'Maximum Video Size', :help => option_help[:max_video_size], :value => '0', :option_type => 'integer', :description => option_desc[:max_video_size], :default => '0' },
  { :key => 'force_video_size', :name => 'Force Video Size', :help => option_help[:force_video_size], :value => 'true', :option_type => 'boolean', :description => option_desc[:force_video_size], :default => '' },
  { :key => 'pidfile', :name => 'PID File', :help => option_help[:pidfile], :value => '/var/run/videocache.pid', :option_type => 'path', :description => option_desc[:pidfile], :default => '/var/run/videocache.pid' },
  { :key => 'logdir', :name => 'Log Directory', :help => option_help[:logdir], :value => '/var/log/videocache/', :option_type => 'directory', :description => option_desc[:logdir], :default => '' },
  { :key => 'skip_apache_conf', :name => 'Skip Apache Configuration', :help => option_help[:skip_apache_conf], :value => 'false', :option_type => 'boolean', :description => option_desc[:skip_apache_conf], :default => 'false' },
  { :key => 'apache_conf_path', :name => 'Apache Configuration File Path', :help => option_help[:apache_conf_path], :value => '/etc/apache2/conf.d/videocache.conf', :option_type => 'path', :description => option_desc[:apache_conf_path], :default => '' },
  { :key => 'hide_cache_dirs', :name => 'Hide Cache Directories via HTTP', :help => option_help[:hide_cache_dirs], :value => 'true', :option_type => 'boolean', :description => option_desc[:hide_cache_dirs], :default => 'true' },
  { :key => 'youtube_format_support', :name => 'YouTube Format Support Policy', :help => option_help[:youtube_format_support], :value => '3', :option_type => 'integer', :description => option_desc[:youtube_format_support], :default => '3' },
  { :key => 'youtube_html5_cache', :name => 'YouTube HTML5 Video Caching', :help => option_help[:youtube_html5_cache], :value => 'true', :option_type => 'boolean', :description => option_desc[:youtube_html5_cache], :default => 'true' },
  { :key => 'youtube_3d_cache', :name => 'YouTube 3D Video Caching', :help => option_help[:youtube_3d_cache], :value => 'true', :option_type => 'boolean', :description => option_desc[:youtube_3d_cache], :default => 'true' },
  { :key => 'youtube_fragment_cache', :name => 'YouTube Video Fragment Caching', :help => option_help[:youtube_fragment_cache], :value => 'true', :option_type => 'boolean', :description => option_desc[:youtube_fragment_cache], :default => 'true' },
  { :key => 'min_youtube_views', :name => 'Minimum YouTube Video Views', :help => option_help[:min_youtube_views], :value => '100', :option_type => 'integer', :description => option_desc[:min_youtube_views], :default => '100' },
  { :key => 'max_youtube_quality', :name => 'Maximum YouTube Video Qaulity Cached', :help => option_help[:max_youtube_quality], :value => '720p', :option_type => 'string', :description => option_desc[:max_youtube_quality], :default => '720p' },
]
Domain.all.each do |domain|
  options << { :key => "enable_#{domain.key}_cache", :name => "Enable #{domain.name} Caching", :help => option_help[:"enable_#{domain.key}_cache"], :value => 'true', :option_type => 'boolean', :description => option_desc[:"enable_#{domain.key}_cache"], :default => 'true' }
end
Option.destroy_all
Option.create(options)
