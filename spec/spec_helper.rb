ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Default

  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  # use poltergeist instead of :webkit below
  Capybara.javascript_driver = :webkit

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  
end
