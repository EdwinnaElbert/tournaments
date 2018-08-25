# frozen_string_literal: true

require "feature_helper"

feature "User signs up" do
  scenario "with valid email and password" do
    sign_up
  end
end
