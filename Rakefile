#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
# Product Website : http://cachevideos.com/
#
require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/environment', __FILE__)

namespace :db do
  desc 'Establiish fake connection to database'
  task :fake_connect do
    fake_connection_info = App.connection_info[App.env].merge({ 'database' => 'test', 'schema_search_path' => 'public' })
    ActiveRecord::Base.establish_connection(fake_connection_info)
  end

  desc 'Connect to database'
  task :connect do
    ActiveRecord::Base.establish_connection(App.connection_info[App.env])
  end

  desc 'Seed database'
  task :seed => [ :connect ] do
    require App.root + 'db/seed'
  end

  desc 'Migrate database'
  task :migrate => [ :connect ] do
    version = ENV['VERSION'].present? ? ENV['VERSION'].to_i : nil
    ActiveRecord::Migrator.migrate(App.migrations_dir, version)
    Rake::Task[:'db:seed'].invoke
  end

  namespace :migrate do
    desc 'One migration up'
    task :up => [ :connect ] do
      step = ENV['STEP'].present? ? ENV['STEP'].to_i : 1
      ActiveRecord::Migrator.up(App.migrations_dir, get_next_version(step))
    end

    desc 'One migration down'
    task :down => [ :connect ] do
      step = ENV['STEP'].present? ? ENV['STEP'].to_i : 1
      ActiveRecord::Migrator.down(App.migrations_dir, get_previous_version(step))
    end

    desc 'Rollback migrations'
    task :rollback => [ :connect ] do
      ActiveRecord::Migrator.rollback(App.migrations_dir)
    end
  end

  desc 'Create database'
  task :create => [ :fake_connect ] do
    ActiveRecord::Base.connection.create_database(App.connection_info[App.env].fetch('database'))
  end

  desc 'Drop database'
  task :drop => [ :fake_connect ] do
    ActiveRecord::Base.connection.drop_database(App.connection_info[App.env].fetch('database'))
  end
end

def get_next_version(step = 1)
  version = ActiveRecord::Migrator.current_version
  versions = ActiveRecord::Migrator.migrations(App.migrations_dir).map(&:version).sort
  next_version = versions.select{ |v| v > version }[step - 1]
  next_version ? next_version : versions.max
end

def get_previous_version(step = 1)
  version = ActiveRecord::Migrator.current_version
  versions = ActiveRecord::Migrator.migrations(App.migrations_dir).map(&:version).sort
  versions.select{ |v| v < version }[-step]
end
