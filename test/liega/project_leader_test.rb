require "test_helper"

module Liega
  class ProjectLeaderTest < Test::Unit::TestCase
    def test_create_project
      name = "Test project name"
      project_leader = ProjectLeader.new
      assert_equal Project, project_leader.create_project(name:).class
      assert_equal({ name:, leader_id: project_leader.id }, project_leader.create_project(name:).to_h)
    end
  end
end
