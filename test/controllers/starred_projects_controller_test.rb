require "test_helper"

class StarredProjectsControllerTest < ActiveSupport::ControllerTestCase
  test "star project" do
    login
    project = projects(:default)
    put starred_projects_url, params: { project_code: project.code }
    assert_response :redirect
  end

  test "unstar project" do
    login
    project_member = create(:project_member, user: users(:normal))
    starred_project = create(:starred_project, project_member:)
    delete starred_projects_url, params: { project_code: starred_project.project.code }
    assert_response :redirect
  end
end
