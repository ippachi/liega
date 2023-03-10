# frozen_string_literal: true

require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "login" do
    visit projects_url
    assert_title "index"

    click_on "Login"

    fill_in "Name", with: "user001"
    fill_in "Email", with: developer_users(:normal).code

    click_on "Sign In"

    assert_title "Projects"
  end

  test "first login" do
    visit root_url
    click_on "Login"

    fill_in "Name", with: "user001"
    fill_in "Email", with: "independent@example.com"

    click_on "Sign In"

    fill_in "Name", with: "user001"
    click_on "Sign Up"

    assert_title "Projects"
  end
end
