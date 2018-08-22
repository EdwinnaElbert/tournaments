# frozen_string_literal: true

require "rails_helper"
require "capybara-webkit"

include Warden::Test::Helpers # rubocop:disable Style/MixinUsage

Capybara.configure do |c|
  c.javascript_driver = :webkit #:poltergeist
  c.default_driver = :rack_test
end
