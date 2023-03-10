require "test_helper"

class StarredProjectsControllerTest < ActiveSupport::ControllerTestCase
  test "star project" do
    login
    project = projects(:default)
    put starred_projects_url, params: { project_code: project.code }
    assert_response :redirect
  end
end
