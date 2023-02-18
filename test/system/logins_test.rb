require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    click_on "Login"

    fill_in "Name", with: "user001"
    fill_in "Email", with: "user001@example.com"

    click_on "Sign In"

    assert_text "index"
  end
end
