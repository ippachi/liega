# frozen_string_literal: true

require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  test "create project" do
    login
    visit projects_url
    find_by_id("new_project_icon").click
    fill_in "Name", with: "test project"
    click_on "Submit"
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

  test "search projects" do
    project1 = create(:project, name: "test1")
    project2 = create(:project, name: "test2")
    create(:project_member, user: users(:normal), project: project1)
    create(:project_member, user: users(:normal), project: project2)

    login
    visit projects_url
    fill_in "Search Projects", with: "test2"
    assert_no_text "test1"
    assert_text "test2"
  end
end
