require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "redirect root when not authorized" do
    get projects_url
    assert_redirected_to root_url
  end
end
