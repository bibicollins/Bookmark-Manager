require 'capybara/rspec'
require './app/app.rb'
require 'simplecov'
require_relative 'setup_test_database'
Capybara.app = BookmarkManager


RSpec.configure do |config|
  config.before(:each) do
    load 'setup_test_database.rb'
  end


  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
ENV['RACK ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
