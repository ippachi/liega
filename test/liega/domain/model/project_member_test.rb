# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectMemberTest < ActiveSupport::TestCase
        test "star project" do
          project_member = ProjectMember.new(user_code: "user_code", project_code: "project_code", role: "normal")
          assert_equal StarredProject, project_member.star_project.class
        end
      end
    end
  end
end
