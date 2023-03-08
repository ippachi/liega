# frozen_string_literal: true

require "test_helper"

module Liega
  module Persistence
    class ProjectRepositoryTest < ActiveSupport::TestCase
      test "save project" do
        user_id = users(:normal).id

        project = Domain::Model::Project.new(name: "hoge", members: [{ user_id:, role: "leader" }])
        project_repo.save(project)

        project = project_repo.find(project.code)
        assert_equal [{ user_id:, role: "leader" }], project.to_h[:members]
      end

      test "save added member" do
        user1_id = users(:normal).id
        user2_id = users(:independent).id

        project = Domain::Model::Project.new(name: "hoge", members: [{ user_id: user1_id, role: "leader" }])
        project_repo.save(project)

        project = project_repo.find(project.code)
        project.add_member(user2_id, "normal")
        project_repo.save(project)

        project = project_repo.find(project.code)
        assert_equal [{ user_id: user1_id, role: "leader" }, { user_id: user2_id, role: "normal" }],
                     project.to_h[:members]
      end

      test "save removed member" do
        user1_id = users(:normal).id
        user2_id = users(:independent).id

        project = Domain::Model::Project.new(name: "hoge", members: [{ user_id: user1_id, role: "leader" }])
        project_repo.save(project)

        project = project_repo.find(project.code)
        project.add_member(user2_id, "normal")
        project_repo.save(project)

        project = project_repo.find(project.code)
        project.remove_member(user2_id)
        project_repo.save(project)

        project = project_repo.find(project.code)
        assert_equal [{ user_id: user1_id, role: "leader" }], project.to_h[:members]
      end
    end
  end
end
