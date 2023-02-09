# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectTest < ActiveSupport::TestCase
        {
          "with empty name": { name: "" }
        }.each do |name, data|
          test "validation #{name}" do
            assert_raises ValidationError do
              Project.new(**data)
            end
          end
        end

        test "create backlog" do
          project = Project.new(name: "project")
          backlog = project.create_backlog
          assert_equal project.id, backlog.project_id
        end
      end
    end
  end
end
