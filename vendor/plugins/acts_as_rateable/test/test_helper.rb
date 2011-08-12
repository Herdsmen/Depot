$:.unshift(File.join(File.dirname(__FILE__), '../lib'))
$:.unshift(File.join(File.dirname(__FILE__), 'models'))

ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.expand_path(File.join(File.dirname(__FILE__), '../../../..'))

require File.join(ENV['RAILS_ROOT'], 'config/environment.rb')
require 'test_help'

config = YAML::load(IO.read(File.join(File.dirname(__FILE__), 'config/database.yml')))
ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "log/debug.log"))
ActiveRecord::Base.establish_connection(config[ENV['DB'] || 'splite3'])

load(File.join(File.dirname(__FILE__), "db/schema.rb"))

ActiveSupport::TestCase.fixture_path = File.join(File.dirname(__FILE__), "fixtures")
$LOAD_PATH.unshift(ActiveSupport::TestCase.fixture_path)

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  fixtures :all
end
