# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class UserTest < Test::Unit::TestCase
        def test_create_project
          name = "Test project name"
          user = User.new
          project = user.create_project(name:)
          assert_equal Project, project.class
          assert_equal({ id: project.id, name:, members: [{ user_id: user.id, role: "leader" }] }, project.to_h)
        end
      end
    end
  end
end
