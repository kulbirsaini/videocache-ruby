require File.expand_path('../config/boot', __FILE__)

Bundler.require if defined?(Bundler)

APP_ROOT = Pathname.new(File.dirname(File.expand_path('.', __FILE__)))

Dir.glob(APP_ROOT + "app/models/*.rb").each{ |f| require f }

namespace :db do
  desc 'Establiish fake connection to database'
  task :fake_connect do
    $connection_info = YAML::load(File.open(APP_ROOT + 'config/database.yml'))
    fake_connection_info = $connection_info.merge({ 'database' => 'test', 'schema_search_path' => 'public' })
    ActiveRecord::Base.establish_connection(fake_connection_info)
  end

  desc 'Connect to database'
  task :connect do
    connection_info = YAML::load(File.open(APP_ROOT + 'config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_info)
  end

  desc 'Migrate database'
  task :migrate => [ :connect ] do
    version = ENV['VERSION'].present? ? ENV['VERSION'].to_i : nil
    if version
      max_version = ActiveRecord::Migrator.migrations('db/migrate').map(&:version).max
      if max_version && version > max_version
        version = max_version
      end
      version = nil unless max_version
    end
    ActiveRecord::Migrator.migrate('db/migrate', version)
  end

  namespace :migrate do
    desc 'One migration up'
    task :up => [ :connect ] do
      ActiveRecord::Migrator.up('db/migrate')
    end

    desc 'One migration down'
    task :down => [ :connect ] do
      ActiveRecord::Migrator.down('db/migrate')
    end

    desc 'Rollback migrations'
    task :rollback => [ :connect ] do
      ActiveRecord::Migrator.rollback('db/migrate')
    end
  end

  desc 'Create database'
  task :create => [ :fake_connect ] do
    ActiveRecord::Base.connection.create_database($connection_info.fetch('database'))
  end

  desc 'Drop database'
  task :drop => [ :fake_connect ] do
    ActiveRecord::Base.connection.drop_database($connection_info.fetch('database'))
  end
end
