require "test_helper"

module Liega::Domain::Model
  class ProjectLeaderTest < Test::Unit::TestCase
    def test_create_project
      name = "Test project name"
      user = User.new
      project = user.create_project(name:)
      assert_equal Project, project.class
      assert_equal({ id: project.id, name:, leader_id: user.id }, project.to_h)
    end
  end
end
