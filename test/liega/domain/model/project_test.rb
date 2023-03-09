# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectTest < ActiveSupport::TestCase
        {
          "with empty name": { name: "", members: [{ user_code: "user_code", role: "leader" }] },
          "with no leader": { name: "test", members: [{ user_code: "user_code", role: "normal" }] }
        }.each do |name, data|
          test "validation #{name}" do
            assert_raises ValidationError do
              Project.create(**data)
            end
          end
        end

        test "create backlog" do
          project = Project.create(name: "project", members: [{ user_code: "user_code", role: "leader" }])
          backlog = project.create_backlog
          assert_equal project.code, backlog.project_code
        end
      end
    end
  end
end
