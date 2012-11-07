#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#

require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)

def generate_migration(options = {})
  raise "No model name specified. Example: script/create_migration create_migration_name [fields]" if options[:model].blank?

  migration_name = 'Create' + options[:model].camelize.pluralize
  table_name = options[:model].tableize
  migration = ActiveRecord::Migrator.migrations(MIGRATIONS_DIR).select{ |m| m.name == migration_name }.first
  raise "Migration already exists at #{APP_ROOT + migration.filename}" if migration

  filepath = APP_ROOT + MIGRATIONS_DIR + (Time.now.utc.strftime('%Y%m%d%H%M%S') + '_create_' + table_name + '.rb')
  puts "Generating migration file #{filepath}"

  File.open(filepath, 'w') do |file|
    file.write <<-MIGRATION
class #{migration_name} < ActiveRecord::Migration
  def up
    create_table :#{table_name} do |t|
      #{options[:fields].map{ |k, v| "t.#{v} :#{k}" }.join("\n      ")}
    end
  end

  def down
    drop_table :#{table_name}
  end
end
    MIGRATION
  end
end

def generate_model(options = {})
  raise "No model name specified. Example: script/create_migration create_migration_name [fields]" if options[:model].blank?
  filepath = APP_ROOT + 'app/models' + (options[:model].downcase.singularize + '.rb')

  puts "Generating model #{filepath}"

  File.open(filepath, 'w') do |file|
    file.write <<-MODEL.strip_heredoc
      class #{options[:model].camelize} < ActiveRecord::Base
      end
    MODEL
  end
end

def parse_options(array)
  options = { :fields => {} }
  options[:model] = ARGV[0].strip if ARGV[0] =~ /^[a-z0-9_]+$/i
  ARGV.shift
  ARGV.each do |arg|
    next unless arg =~ /^[a-z0-9_]+:[a-z0-9_]+$/i
    k, v = arg.split(':').map(&:strip)
    options[:fields][k] = v
  end
  options
end

if __FILE__ == $0
  options = parse_options(ARGV)
  generate_model(options)
  generate_migration(options)
end
