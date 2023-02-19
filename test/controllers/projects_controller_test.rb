# frozen_string_literal: true

require "test_helper"

class ProjectsControllerTest < ActiveSupport::ControllerTestCase
  test "redirect root when not authorized" do
    get projects_url
    assert_redirected_to root_url
  end

  test "create project" do
    login
    post projects_url, params: { project: { name: "test project" } }
    assert_response :redirect
  end
end
