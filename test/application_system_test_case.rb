# frozen_string_literal: true

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driver = ENV["CI"] ? :headless_chrome : :chrome
  driven_by :selenium, using: driver, screen_size: [1400, 1400]

  private

  def login
    visit root_url
    click_on "Login"

    fill_in "Name", with: "user001"
    fill_in "Email", with: developer_users(:normal).id

    click_on "Sign In"
  end
end
