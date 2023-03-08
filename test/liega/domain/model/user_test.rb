# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class UserTest < ActiveSupport::TestCase
        test "validation with nil code" do
          assert_raises ValidationError do
            User.new(code: nil)
          end
        end

        test "create project" do
          user = User.new
          project = user.create_project(name: "test project")
          assert_equal Project, project.class
        end
      end
    end
  end
end
