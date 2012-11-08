Bundler.require if defined?(Bundler)

APP_ROOT = Pathname.new(File.dirname(File.expand_path('../', __FILE__)))
MIGRATIONS_DIR = APP_ROOT + 'db/migrate'
DB_CONNECTION_INFO = YAML::load(File.open(APP_ROOT + 'config/database.yml'))
VIEWS_DIR = APP_ROOT + 'app/views'

Dir.glob(APP_ROOT + "app/models/*.rb").each{ |f| require f }
