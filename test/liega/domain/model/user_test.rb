# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class UserTest < ActiveSupport::TestCase
        test "validation with nil id" do
          assert_raises ValidationError do
            User.new(id: nil)
          end
        end

        test "create project" do
          user = User.new
          project = user.create_project(name: "test project")
          assert_equal Project, project.class
          assert_enqueued_with(job: ProjectCreated, args: [{ project:, author_id: user.id }])
        end
      end
    end
  end
end
