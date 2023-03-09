# frozen_string_literal: true

require "test_helper"

module Liega
  module Persistence
    class ProjectRepositoryTest < ActiveSupport::TestCase
      test "save project" do
        user_code = users(:normal).code

        project = Domain::Model::Project.create(name: "hoge", members: [{ user_code:, role: "leader" }])
        project_repo.save(project)

        project = project_repo.find(project.code)
        assert_equal [{ user_code:, role: "leader" }], project.serialize[:members]
      end

      test "save added member" do
        user1_code = users(:normal).code
        user2_code = users(:independent).code

        project = Domain::Model::Project.create(name: "hoge", members: [{ user_code: user1_code, role: "leader" }])
        project_repo.save(project)

        project = project_repo.find(project.code)
        project.add_member(user2_code, "normal")
        project_repo.save(project)

        project = project_repo.find(project.code)
        assert_equal [{ user_code: user1_code, role: "leader" }, { user_code: user2_code, role: "normal" }],
                     project.serialize[:members]
      end

      test "save removed member" do
        user1_code = users(:normal).code
        user2_code = users(:independent).code

        project = Domain::Model::Project.create(name: "hoge", members: [{ user_code: user1_code, role: "leader" }])
        project_repo.save(project)

        project = project_repo.find(project.code)
        project.add_member(user2_code, "normal")
        project_repo.save(project)

        project = project_repo.find(project.code)
        project.remove_member(user2_code)
        project_repo.save(project)

        project = project_repo.find(project.code)
        assert_equal [{ user_code: user1_code, role: "leader" }], project.serialize[:members]
      end
    end
  end
end
