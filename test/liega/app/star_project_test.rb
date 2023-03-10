# frozen_string_literal: true

require "test_helper"

module Liega
  module App
    class StarProjectTest < ActiveSupport::TestCase
      test "star project" do
        user_code = users(:normal).code
        project_code = projects(:default).code
        starred_project = StarProject.new.call(user_code, project_code)
        assert starred_project_repo.find(starred_project.code)
      end

      test "star same project" do
        user_code = users(:normal).code
        project_code = projects(:default).code
        assert_nothing_raised do
          StarProject.new.call(user_code, project_code)
          StarProject.new.call(user_code, project_code)
        end
      end
    end
  end
end
