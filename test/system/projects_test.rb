# frozen_string_literal: true

require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  test "create project" do
    login
    visit new_project_url
    fill_in "Name", with: "test project"
    click_on "Create"
    assert_title "test project"
  end
end
