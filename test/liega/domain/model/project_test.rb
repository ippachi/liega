# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectTest < ActiveSupport::TestCase
        {
          "with empty name": { name: "", members: [{ user_id: "user_id", role: "leader" }] },
          "with no leader": { name: "test", members: [{ user_id: "user_id", role: "normal" }] }
        }.each do |name, data|
          test "validation #{name}" do
            assert_raises ValidationError do
              Project.new(**data)
            end
          end
        end

        test "create backlog" do
          project = Project.new(name: "project", members: [{ user_id: "user_id", role: "leader" }])
          backlog = project.create_backlog
          assert_equal project.id, backlog.project_id
        end
      end
    end
  end
end
