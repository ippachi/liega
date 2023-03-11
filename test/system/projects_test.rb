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

  test "star project" do
    login
    visit projects_url
    assert_no_selector "[data-testid=star]"
    find("[data-testid=nostar]").click
    assert_selector "[data-testid=star]"
    find("[data-testid=star]").click
    assert_selector "[data-testid=nostar]"
  end
end
