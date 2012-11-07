require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/environment', __FILE__)

namespace :db do
  desc 'Establiish fake connection to database'
  task :fake_connect do
    fake_connection_info = DB_CONNECTION_INFO.merge({ 'database' => 'test', 'schema_search_path' => 'public' })
    ActiveRecord::Base.establish_connection(fake_connection_info)
  end

  desc 'Connect to database'
  task :connect do
    ActiveRecord::Base.establish_connection(DB_CONNECTION_INFO)
  end

  desc 'Migrate database'
  task :migrate => [ :connect ] do
    version = ENV['VERSION'].present? ? ENV['VERSION'].to_i : nil
    ActiveRecord::Migrator.migrate(MIGRATIONS_DIR, version)
  end

  namespace :migrate do
    desc 'One migration up'
    task :up => [ :connect ] do
      step = ENV['STEP'].present? ? ENV['STEP'].to_i : 1
      ActiveRecord::Migrator.up(MIGRATIONS_DIR, get_next_version(step))
    end

    desc 'One migration down'
    task :down => [ :connect ] do
      step = ENV['STEP'].present? ? ENV['STEP'].to_i : 1
      ActiveRecord::Migrator.down(MIGRATIONS_DIR, get_previous_version(step))
    end

    desc 'Rollback migrations'
    task :rollback => [ :connect ] do
      ActiveRecord::Migrator.rollback(MIGRATIONS_DIR)
    end
  end

  desc 'Create database'
  task :create => [ :fake_connect ] do
    ActiveRecord::Base.connection.create_database(DB_CONNECTION_INFO.fetch('database'))
  end

  desc 'Drop database'
  task :drop => [ :fake_connect ] do
    ActiveRecord::Base.connection.drop_database(DB_CONNECTION_INFO.fetch('database'))
  end
end

def get_next_version(step = 1)
  version = ActiveRecord::Migrator.current_version
  versions = ActiveRecord::Migrator.migrations(MIGRATIONS_DIR).map(&:version).sort
  next_version = versions.select{ |v| v > version }[step - 1]
  next_version ? next_version : versions.max
end

def get_previous_version(step = 1)
  version = ActiveRecord::Migrator.current_version
  versions = ActiveRecord::Migrator.migrations(MIGRATIONS_DIR).map(&:version).sort
  versions.select{ |v| v < version }[-step]
end
